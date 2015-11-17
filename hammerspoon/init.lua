-- local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local screen = require "hs.screen"
local alert = require "hs.alert"

-- local hyper = {"shift", "ctrl", "opt", "cmd"}
local hyper = {"⌘", "⌥", "⌃", "⇧"}

-- require "triggers"
require "window_management"
-- require "auto_muter"
-- require "application_watcher"

hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

alert.show("Hammerspoon loaded!")
