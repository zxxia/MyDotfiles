local gitsigns_status_ok, gitsigns = pcall(require, 'gitsigns')

if not gitsigns_status_ok then
    print("Warning: gitsigns not available, skipping configuration.")
  return
end
gitsigns.setup()
