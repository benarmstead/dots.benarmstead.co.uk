local M = {}

M.general = {
  n = {
    ["<C-P>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<C-f>"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<C-d>"] = { "<cmd> t. <CR>", "duplicate line" },
    ["<M-up>"] = { "<cmd> m -2 <CR>", "Move line up" },
    ["<M-down>"] = { "<cmd> m +1 <CR>", "Move line up" },
  },
}

return M
