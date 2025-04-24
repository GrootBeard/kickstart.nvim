return {
  -- Other plugins...

  {
    'lervag/vimtex',
    config = function()
      vim.g.vimtex_view_method = 'zathura' -- or your preferred PDF viewer
      vim.g.vimtex_compiler_method = 'latexmk'
      -- vim.g.vimtex_syntax_enabled = 1
      -- Additional vimtex settings if needed
    end,
    ft = { 'tex', 'latex' }, -- Load only for TeX files
  },
}
