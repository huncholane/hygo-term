local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.SpawnMaximizedCommandInNewWindow(args)
	return wezterm.action_callback(function(win, pane)
		local cwd_uri = pane:get_current_working_dir()
		local cwd = cwd_uri and cwd_uri.file_path or nil
		_, _, win = mux.spawn_window({ args = args, cwd = cwd })
		win:gui_window():maximize()
	end)
end

return M
