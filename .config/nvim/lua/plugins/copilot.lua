return function()
  require('copilot').setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<A-l>",
        debounce = 100,
        enable = true,
      },
    }
  })
end
