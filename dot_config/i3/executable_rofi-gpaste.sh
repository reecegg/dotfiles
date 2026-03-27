#!/usr/bin/env bash
# Rofi picker for GPaste clipboard history (text + image thumbnails with pet names)

count=$(gpaste-client history-size 2>/dev/null)
if [[ -z "$count" || "$count" -eq 0 ]]; then
    echo "" | rofi -dmenu -p "Clipboard"
    exit 0
fi

# Word lists for pet names (adjective-animal, seeded by file hash)
adjectives=(bold bright calm cool dark deep fast free glad gold hazy iron keen lazy loud mild neat pale pink plum quick rare rich rosy safe shy slim soft sure tame tiny vast warm wild wise zany)
animals=(bear bird cat crow deer dove duck elk fawn fish fox frog goat hawk hare ibis jay koi lark lion lynx mole moth newt orca owl puma rook seal slug swan toad vole wasp wolf wren yak)

pet_name() {
    # Deterministic name from file path hash
    local hash
    hash=$(echo "$1" | cksum | cut -d' ' -f1)
    local adj_idx=$(( hash % ${#adjectives[@]} ))
    local ani_idx=$(( (hash / ${#adjectives[@]}) % ${#animals[@]} ))
    echo "${adjectives[$adj_idx]}-${animals[$ani_idx]}"
}

# Build rofi entries
entries=""
for (( i=0; i<count; i++ )); do
    line=$(gpaste-client --use-index --oneline get "$i" 2>/dev/null)
    raw=$(gpaste-client --use-index --raw get "$i" 2>/dev/null)

    if [[ "$line" == "[Image,"* ]]; then
        name=$(pet_name "$raw")
        # Extract dimensions and timestamp from GPaste label: [Image, WxH (date)]
        dims=$(echo "$line" | sed 's/.*Image, \([0-9]*\) x \([0-9]*\).*/\1x\2/')
        timestamp=$(echo "$line" | sed 's/.*(\(.*\)).*/\1/')
        entries+="${name} ${dims} ${timestamp}\0icon\x1f${raw}\n"
    else
        text=$(echo "$line" | tr '\n\t' '  ' | head -c 200)
        entries+="${text}\n"
    fi
done

chosen=$(echo -en "$entries" | rofi -dmenu -i -show-icons -p "Clipboard" -format i \
    -theme-str 'element-icon { size: 32px; margin: 0 8px 0 0; } element-text { vertical-align: 0.5; }')

if [[ -n "$chosen" ]]; then
    gpaste-client --use-index select "$chosen"
fi
