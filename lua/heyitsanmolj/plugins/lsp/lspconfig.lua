local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}

	local clients = vim.lsp.get_clients({ name = "ts_ls" })
	if #clients == 0 then
		vim.notify("No ts_ls client found", vim.log.levels.ERROR)
		return
	end
	local client = clients[1]
	client:exec_cmd(params)
	vim.notify("Imports sorted", vim.log.levels.INFO)
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local util = require("lspconfig/util")

		local on_attach = function(_, bufnr)
			local clients = vim.lsp.get_clients()
			local seen = {}
			for _, client in ipairs(clients) do
				local key = client.name .. client.root_dir
				if seen[key] then
					client:stop(true) -- forcibly stop duplicate client
				else
					seen[key] = true
				end
			end

			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap("n", "<leader>gd", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap("n", "<leader>gds", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
			keymap({ "n", "v" }, "<A-.>", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
			keymap("n", "<F2>", vim.lsp.buf.rename, opts) -- smart rename

			-- Global diagnostic keymaps
			keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
			keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
			keymap("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts)
			keymap("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap("n", "<leader>K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			opts.desc = "LSP Info"
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		vim.diagnostic.config({
			signs = {
				active = {
					{ name = "DiagnosticSignError", text = " " },
					{ name = "DiagnosticSignWarn", text = " " },
					{ name = "DiagnosticSignHint", text = "󰠠 " },
					{ name = "DiagnosticSignInfo", text = " " },
				},
			},
		})

		lspconfig["docker_compose_language_service"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "yaml", "yaml.docker-compose" }, -- Matches Docker Compose files
			settings = {
				dockerComposeLanguageService = {
					format = { enabled = true }, -- Optional: Enable formatting
				},
			},
		})

		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure java server
		lspconfig["jdtls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "ejs" },
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "rust" },
			root_dir = util.root_pattern("Cargo.toml"),
			settings = {
				["rust_analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})

		-- configure typescript server with plugin
		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
			settings = {},
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "ejs" },
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"css",
				"scss",
				"sass",
				"rasi",
			},
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"html",
				"typescriptreact",
				"javascriptreact",
			},
		})

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		-- configure prisma orm server
		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure graphql language server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "cpp", "c" },
		})

		-- configure php lsp
		lspconfig["intelephense"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = require("lspconfig").util.root_pattern("pyrightconfig.json", "requirements.txt", ".git"),
		})

		-- configure arduino_language_server server
		lspconfig["arduino_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			-- cmd = {
			-- 	"/home/anmol/go/bin/arduino-language-server",
			-- 	-- ">",
			-- 	-- "~/logfile.log",
			-- 	-- "2>&1",
			--
			-- 	-- "-clangd",
			-- 	-- "/usr/bin/clangd",
			-- 	-- "-cli",
			-- 	-- "/home/anmol/bin/arduino-cli",
			-- 	-- "-cli-config",
			-- 	-- "$HOME/.arduino15/arduino-cli.yaml",
			-- 	-- "-fqbn",
			-- 	-- "esp32:esp32:esp32doit-devkit-v1",
			-- },
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		local dartExcludedFolders = {
			-- vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
			-- vim.fn.expand("$HOME/.pub-cache"),
			-- vim.fn.expand("/opt/homebrew/"),
			-- vim.fn.expand("$HOME/tools/flutter/"),
		}

		lspconfig["dartls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = {
				"dart",
				"language-server",
				"--protocol=lsp",
				-- "--port=8123",
				-- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
			},
			filetypes = { "dart" },
			init_options = {
				onlyAnalyzeProjectsWithOpenFiles = false,
				suggestFromUnimportedLibraries = true,
				closingLabels = true,
				outline = false,
				flutterOutline = false,
			},
			settings = {
				dart = {
					analysisExcludedFolders = dartExcludedFolders,
					updateImportsOnRename = true,
					completeFunctionCalls = true,
					showTodos = true,
				},
			},
		})
	end,
}
