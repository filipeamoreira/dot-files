-- local application = require "hs.application"
-- local window = require "hs.window"
--local hotkey = require "hs.hotkey"
--local screen = require "hs.screen"
--local alert = require "hs.alert"

-- local hyper = {"shift", "ctrl", "opt", "cmd"}
local hyper = {"shift", "cmd", "alt", "ctrl"}
--local hyper = {"⌘", "⌥", "⌃", "⇧"}

require "window_management"

hs.hotkey.bind(hyper, "s", function()
  hs.reload()
end)

hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)
