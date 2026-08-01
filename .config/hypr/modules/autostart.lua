-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	-- hl.exec_cmd(terminal)
	-- hl.exec_cmd("nm-applet")
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("waypaper --restore")
	hl.exec_cmd("hyprpolkitagent")
	hl.exec_cmd("wl-copy")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("v2rayn")
	hl.exec_cmd("echo 'Xft.dpi:144' | xrdb -merge")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
	-- uses a blocking exec function and sleeps a bit to give things time to close
	-- you might also want to kill troublesome/crashing non-systemd background services here:
	-- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")
end)
