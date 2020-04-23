hs.loadSpoon("WindowScreenLeftAndRight")
hs.loadSpoon("WinWin")
local hotkey = require "hs.hotkey"
local window = require "hs.window"
local screen = require "hs.screen"
local alert = require "hs.alert"

local hyper = {"shift", "cmd", "alt", "ctrl"}

window.animationDuration = 0

-- hs.screen.allScreens()[1]:name()

mbp_monitor = 'Color LCD'
main_monitor = 'BenQ EL2870U'
vertical_monitor = 'Display'


--[[ function factory that takes the multipliers of screen width
and height to produce the window's x pos, y pos, width, and height ]]
function baseMove(x, y, w, h)
    return function()
       if  hs.window.focusedWindow() then
          local win = hs.window.frontmostWindow()
          local f = win:frame()
          local screen = win:screen()
          local max = screen:frame()

          f.x = max.w * x + max.x -- add `max.x` to keep in the same screen (i.e. monitor)
          f.y = max.h * y
          f.w = max.w * w
          f.h = max.h * h
          win:setFrame(f, 0)
       end
    end
end

-- All screens
hs.hotkey.bind(hyper, 'H', baseMove(0, 0, 0.5, 1))
hs.hotkey.bind(hyper, 'J', baseMove(0, 0.5, 1, 0.5))
hs.hotkey.bind(hyper, 'K', baseMove(0, 0, 1, 0.5))
hs.hotkey.bind(hyper, 'L', baseMove(0.5, 0, 0.5, 1))

hs.hotkey.bind(hyper, 'I', hs.grid.maximizeWindow)

hs.hotkey.bind(hyper, 'A', baseMove(0, 0, 0.5, 0.5))
hs.hotkey.bind(hyper, 'S', baseMove(0, 0.5, 0.5, 0.5))
hs.hotkey.bind(hyper, 'D', baseMove(0.5, 0, 0.5, 0.5))
hs.hotkey.bind(hyper, 'F', baseMove(0.5, 0.5, 0.5, 0.5))

-- monitor 2: mpb
-- hs.hotkey.bind(hyper, 'Q', baseMove(-1, -1, 0.5, 1))
-- hs.hotkey.bind(hyper, 'W', baseMove(-1, -0.5, 1, 0.5))
-- hs.hotkey.bind(hyper, 'E', baseMove(-1, 1, 1, 1))
-- hs.hotkey.bind(hyper, 'R', baseMove(-0.5, -0.5, 0.5, 1))

-- hs.hotkey.bind(hyper, 'T', baseMove(-1, -1, 1, 1))


spoon.WindowScreenLeftAndRight:bindHotkeys({
  screen_left = { hyper, '-' }, -- move current app to left screen (i.e. monitor)
  screen_right= { hyper, '=' },
})
