local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

local blamer_enabled = 1

-- autocmd("BufWritePre", {
--   pattern = "*",
--   command = "%s/\\s\\+$//g",
-- })
--

