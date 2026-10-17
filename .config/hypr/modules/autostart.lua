-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function () 
    hl.exec_cmd("qs")
    
    hl.exec_cmd("hyprctl reload")
    
    hl.exec_cmd("hypridle")
    
    hl.exec_cmd("hyprpaper")
    
    hl.exec_cmd("hyprsunset")
    
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
    
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    hl.exec_cmd("systemctl --user start elephant.service")
    hl.exec_cmd("walker --gapplication-service")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")

    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)