# todo:
# - snapback window
# - send window space [dir]

# Make Window Full Screen
bind "M", ["cmd", "alt", "ctrl"], -> moveWindow null

# Center Window
bind "C", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  # in SizeUp, this feature has a few options.. they're easy to emulate
  # by altering this function.. 'frame' starts out as the full screen's
  # size so you can just do calculations on it and you're done.
  frame.x += frame.w / 4
  frame.y += frame.h / 4
  frame.w /= 2
  frame.h /= 2


# Send Window Left
bind "left", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.w /= 2

# Send Window Right
bind "right", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.x += frame.w / 2
  frame.w /= 2

# Send Window Up
bind "up", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.h /= 2

# Send Window Down
bind "down", ["cmd", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.y += frame.h / 2
  frame.h /= 2

# Send Window Upper Left
bind "left", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.w /= 2
  frame.h /= 2

# Send Window Upper Right
bind "up", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.y += frame.h / 2
  frame.w /= 2
  frame.h /= 2

# Send Window Lower Left
bind "down", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.x += frame.w / 2
  frame.w /= 2
  frame.h /= 2

# Send Window Lower Right
bind "right", ["shift", "alt", "ctrl"], -> moveWindow (frame) ->
  frame.x += frame.w / 2
  frame.y += frame.h / 2
  frame.w /= 2
  frame.h /= 2

# Send Window to Next Display
bind "right", ['ctrl', 'alt'], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().nextScreen()

# Send Window to Previous Display
bind "left", ['ctrl', 'alt'], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().previousScreen()

moveToScreen = (win, screen) ->
  return if screen.null?

  frame = win.frame()
  oldScreenRect = win.screen().frameWithoutDockOrMenu()
  newScreenRect = screen.frameWithoutDockOrMenu()

  xRatio = newScreenRect.w  / oldScreenRect.w
  yRatio = newScreenRect.h / oldScreenRect.h

  win.setFrame {
    x: Math.round((frame.x - oldScreenRect.x) * xRatio) + newScreenRect.x
    y: Math.round((frame.y - oldScreenRect.y) * yRatio) + newScreenRect.y
    w: Math.round(frame.w * xRatio)
    h: Math.round(frame.h * yRatio)
  }

moveWindow = (fn) ->
  win = api.focusedWindow()
  frame = win.screen().frameWithoutDockOrMenu()
  fn frame if fn
  win.setFrame frame
