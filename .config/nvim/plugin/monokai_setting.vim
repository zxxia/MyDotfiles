lua <<EOF
local monokai_status_ok, monokai = pcall(require, 'monokai')
if not monokai_status_ok then
    print("Warning: monokai not available, skipping configuration.")
  return
end
local palette = monokai.classic
-- monokai.setup {
--     palette = {
--         base2 = '#272822'
--     }
-- }
EOF
