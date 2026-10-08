return {
	"mfussenegger/nvim-dap",

	config = function()
		local dap = require("dap")

		-- gdb adapter
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = {
				"-i",
				"dap",
			},
		}

		-- C++ 调试配置
		dap.configurations.cpp = {
			{
				name = "Launch",

				type = "gdb",

				request = "launch",

				-- 可执行文件
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,

				-- 工作目录
				cwd = "${workspaceFolder}",

				-- 启动后停在 main
				stopAtBeginningOfMainSubprogram = false,
			},
		}

		-- C 使用同一套配置
		dap.configurations.c = dap.configurations.cpp

		-- Start / Continue
		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end, {
			desc = "Debug continue",
		})

		-- Terminate (Shift+F5 -> F17)
		vim.keymap.set("n", "<F17>", function()
			dap.terminate()
		end, {
			desc = "Terminate debug session",
		})

		-- Toggle breakpoint
		vim.keymap.set("n", "<F9>", function()
			dap.toggle_breakpoint()
		end, {
			desc = "Toggle breakpoint",
		})

		-- Step over
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, {
			desc = "Debug step over",
		})

		-- Step into
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, {
			desc = "Debug step into",
		})

		-- Step out (Shift+F11 -> F23)
		vim.keymap.set("n", "<F23>", function()
			dap.step_out()
		end, {
			desc = "Debug step out",
		})

		-- Breakpoint
		vim.keymap.set("n", "<leader>b", function()
			dap.toggle_breakpoint()
		end, {
			desc = "Toggle breakpoint",
		})

		-- Conditional breakpoint
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, {
			desc = "Conditional breakpoint",
		})
	end,
}
