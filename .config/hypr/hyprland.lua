-- Hyprland configuration

local modules = {
	"monitors",
	"my_programs",
	"autostart",
	"environment_variables",
	"permissions",
	"look_and_feel",
	"misc",
	"input",
	"keybindings",
	"windows_and_workspaces",
}

for _, module in ipairs(modules) do
	local status, value = pcall(require, "modules." .. module)

	if status then
		print("successfully loaded module: " .. module)
	else
		print("failed to load module: " .. module)
		print(value)
	end
end
