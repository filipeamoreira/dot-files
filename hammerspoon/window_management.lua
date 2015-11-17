local hotkey = require "hs.hotkey"
local window = require "hs.window"
local screen = require "hs.screen"
local alert = require "hs.alert"

local hyper = {"⌘", "⌥", "⌃", "⇧"}

window.animationDuration = 0

function alertCannotManipulateWindow()
  alert.show("Can't move window")
end

-- Make window full screen
hotkey.bind(hyper, "f", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local screen = win:screen()
  local max = screen:frame()

  win:setFrame(max)
end)

-- Align window to left 50% of the screen
hotkey.bind(hyper, "[", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 0
  f.y = 0
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Align window to right 50% of the screen
hotkey.bind(hyper, "]", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 2
  f.y = max.y
  f.x2 = max.x2
  f.y2 = max.y2
  win:setFrame(f)
end)

-- -- Move window to the display on the left
-- hotkey.bind(hyper, "-", function()
--   local win = hs.window.focusedWindow()
--   if not win then
--     alertCannotManipulateWindow()
--     return
--   end
--   win:moveOneScreenWest()
-- end)

-- -- Move window to the display on the right
-- hotkey.bind(hyper, "=", function()
--   local win = hs.window.focusedWindow()
--   if not win then
--     alertCannotManipulateWindow()
--     return
--   end
--   win:moveOneScreenEast()
-- end)

-- hs.hotkey.bind(hyper, "J", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.y = f.y + 10
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind(hyper, "K", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.y = f.y - 10
--   win:setFrame(f)
-- end)
