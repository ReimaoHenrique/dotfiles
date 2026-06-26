-- -------------------
-- ---- AUTOSTART ----
-- -------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("colorshell")
    hl.exec_cmd("bash -lc 'nohup " .. os.getenv("HOME") .. "/.config/hypr/scripts/wallpaper-random.sh >/dev/null 2>&1 &'" )
end)
