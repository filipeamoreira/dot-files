local hotkey = require "hs.hotkey"
local window = require "hs.window"
local screen = require "hs.screen"
local alert = require "hs.alert"

local hyper = {"shift", "cmd", "alt", "ctrl"}

window.animationDuration = 0

--[[ function factory that takes the multipliers of screen width
and height to produce the window's x pos, y pos, width, and height ]]
function baseMove(x, y, w, h)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.w * x
        f.y = max.h * y
        f.w = max.w * w
        f.h = max.h * h
        win:setFrame(f, 0)
    end
end

hs.hotkey.bind(hyper,'H', baseMove(0, 0, 0.5, 1))
hs.hotkey.bind(hyper, 'L', baseMove(0.5, 0, 0.5, 1))
hs.hotkey.bind(hyper, 'J', baseMove(0, 0.5, 1, 0.5))
hs.hotkey.bind(hyper, 'K', baseMove(0, 0, 1, 0.5))
hs.hotkey.bind(hyper, 'I', baseMove(0, 0, 1, 1))
hs.hotkey.bind(hyper, 'F', baseMove(0, 0, 1, 1))
