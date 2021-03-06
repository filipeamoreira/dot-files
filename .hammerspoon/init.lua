local hyper = {"shift", "cmd", "alt", "ctrl"}

require "window_management"

hs.hotkey.bind(hyper, "R", function()
                  hs.reload()
end)

-- lock screen shortcut
hs.hotkey.bind(hyper, 'P', function() hs.caffeinate.startScreensaver() end)

hs.grid.setMargins({0, 0})
-- Shortcut to commonly used applications
hs.hotkey.bind(hyper, 'E', function () hs.application.launchOrFocus("Emacs") end)
hs.hotkey.bind(hyper, 'T', function () hs.application.launchOrFocus("Alacritty") end)
hs.hotkey.bind(hyper, 'A', function () hs.application.launchOrFocus("Firefox") end)
hs.hotkey.bind(hyper, 'B', function () hs.application.launchOrFocus("Firefox Developer Edition") end)
hs.hotkey.bind(hyper, 'N', function () hs.application.launchOrFocus("Firefox Nightly") end)
hs.hotkey.bind(hyper, 'O', function () hs.application.launchOrFocus("Chromium") end)
hs.hotkey.bind(hyper, 'C', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(hyper, 'K', function () hs.application.launchOrFocus("Slack") end)
hs.hotkey.bind(hyper, 'V', function () hs.application.launchOrFocus("VSCodium") end)
hs.hotkey.bind(hyper, 'S', function () hs.application.launchOrFocus("Sublime Text") end)

-- Notify the config has been loaded
hs.alert.show('Hammerspoon config loaded')
