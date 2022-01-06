lua <<EOF
local monokai_status_ok, monokai = pcall(require, 'monokai')
if not monokai_status_ok then
  return
end
local palette = monokai.classic
monokai.setup {
    palette = {
        base2 = '#272822'
    },
    custom_hlgroups = {
        TSConstructor = {
            fg=palette.aqua
        }
    }
}
EOF
