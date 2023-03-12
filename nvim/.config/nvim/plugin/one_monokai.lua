local one_monokai_status_ok, one_monokai = pcall(require, 'one_monokai')
if not one_monokai_status_ok then
  print("Warning: one_monokai not available, skipping configuration.")
  return
end

one_monokai.setup({
    colors = {
        fg = "#E8E8E3", -- "#abb2bf",
        bg ="#272822", -- "#282c34",
        gray = "#676e7b",
        pink = "#F92772", -- "#e06c75",
        green = "#A6E22D", -- "#98c379",
        cyan = "#A1EFE4", --
        -- cyan = "#56b6c2",
        aqua = "#66D9EF", -- "#61afef",
        yellow = "#E6DB74", -- "#e5c07b",
        purple = "#AE81FF", -- "#c678dd",
        peanut = "#f6d5a4",
        orange = "#FD9720", -- "#d19a66",
        dark_pink = "#ff008c",
        dark_cyan = "#2b8db3",
        red = "#e73c50", -- "#f75f5f",
        dark_red = "#5f0000", -- "#d03770",
        white = "#E8E8E3", -- "#d7d7ff",
        light_gray = "#575b61", -- "#9ca3b2",
        dark_gray = "#64645e", -- "#4b5261",
        warm_gray = "#75715E",
        vulcan = "#383a3e",
        dark_green = "#2d2e27",
        dark_blue = "#26292f",
        black = "#272822", -- "#1e2024",
        none = "NONE",
    },
    themes = function(colors)
        return {
            -- Normal = { fg = colors.background },
            Comment = { fg = colors.warm_gray, italic = true },
            -- ErrorMsg = { fg = "black", bg = "#ec6075", standout = true },
            -- NormalFloat = { link = "Normal" },
            Visual = { bg = colors.light_gray }
        }
    end,
})
