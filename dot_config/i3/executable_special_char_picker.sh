#!/bin/bash

# Special character picker using rofi
# Characters are typed directly into the focused window via xdotool

CHARS="§ section
° degree
± plus-minus
× multiplication
÷ division
µ micro
¶ pilcrow
© copyright
® registered
™ trademark
£ pound
€ euro
¥ yen
¢ cent
¤ currency
¬ not
¦ broken bar
ß eszett
æ ae ligature
ø o-stroke
å a-ring
ð eth
þ thorn
« left guillemet
» right guillemet
… ellipsis
— em dash
– en dash
• bullet
· middle dot
† dagger
‡ double dagger
‰ per mille
′ prime
″ double prime
∞ infinity
∅ empty set
∈ element of
∉ not element of
∑ summation
∏ product
√ square root
∆ delta
∇ nabla
∂ partial
∫ integral
≈ approximately
≠ not equal
≤ less or equal
≥ greater or equal
← left arrow
→ right arrow
↑ up arrow
↓ down arrow
↔ left-right arrow
⇒ double right arrow
⇐ double left arrow
λ lambda
π pi
α alpha
β beta
γ gamma
δ delta
ε epsilon
θ theta
φ phi
ψ psi
ω omega
Ω capital omega
✓ check mark
✗ ballot x
★ black star
☆ white star
♠ spade
♣ club
♥ heart
♦ diamond"

SELECTION=$(echo "$CHARS" | rofi -dmenu -p "Special char" -i)

[ -z "$SELECTION" ] && exit

CHAR=$(echo "$SELECTION" | awk '{print $1}')

# Copy to clipboard and type it
echo -n "$CHAR" | xclip -selection clipboard
xdotool type --clearmodifiers "$CHAR"
