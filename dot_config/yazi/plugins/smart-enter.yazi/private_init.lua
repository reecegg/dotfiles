return {
    entry = function()
        local h = cx.active.current.hovered
        if h then
            if h.cha.is_dir then
                ya.manager_emit("enter", {})
            elseif h.mime and h.mime:find("^text/") or
                   h.mime == "application/json" or
                   h.mime == "application/javascript" or
                   h.mime == "application/typescript" or
                   h.mime == "application/x-sh" or
                   h.mime == "application/xml" or
                   h.mime == "application/toml" or
                   h.mime == "application/x-yaml" or
                   h.mime == "inode/x-empty" then
                ya.manager_emit("open", {})
            end
        end
    end,
}
