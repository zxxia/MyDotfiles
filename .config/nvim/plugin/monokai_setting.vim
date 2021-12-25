lua <<EOF
local monokai = require('monokai')
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
