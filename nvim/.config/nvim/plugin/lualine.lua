local lualine_status_ok, lualine = pcall(require, 'lualine')
if not lualine_status_ok then
  print("Warning: lualine not available, skipping configuration.")
  return
end
lualine.setup{
  options = {
    theme = 'powerline',
	},
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  },
  inactive_sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
   }
}
