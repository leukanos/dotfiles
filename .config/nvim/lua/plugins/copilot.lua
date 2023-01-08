return function()
  require('copilot').setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
        debounce = 100,
      },
    }
  })
end
