return {
	"mfussenegger/nvim-dap",

	config = function()
		local dap = require("dap")

		-- codelldb adapter
		dap.adapters.codelldb = {
			type = "server",

			port = "${port}",

			executable = {
				command = "codelldb",

				args = {
					"--port",
					"${port}",
				},
			},
		}

		-- C++ 调试配置
		dap.configurations.cpp = {
			{
				name = "Launch",

				type = "codelldb",

				request = "launch",

				-- 可执行文件
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,

				-- 工作目录
				cwd = "${workspaceFolder}",

				-- 启动后停在 main
				stopOnEntry = false,
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

		-- Terminate
		vim.keymap.set("n", "<F6>", function()
			dap.terminate()
		end, {
			desc = "Terminate debug session",
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

		-- Step out
		vim.keymap.set("n", "<F12>", function()
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
