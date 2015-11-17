local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"
-- local battery = require "hs.battery"
-- local wifi_control = require "wifi_control"
-- local bluetooth_control = require "bluetooth_control"

function applicationRunning(name)
  apps = application.runningApplications()
  found = false
  for i = 1, #apps do
    app = apps[i]
    if app:title() == name and (#app:allWindows() > 0 or app:mainWindow()) then
      found = true
    end
  end

  return found
end

-- hotkey.bind(hyper, "R", function()
--   hs.reload()
-- end)
-- hotkey.bind(hyper, "A", function()
--   application.launchOrFocus("Activity Monitor")
-- end)

-- Show status
-- hotkey.bind(hyper, "S", function()
--   charging = battery.isCharging() or battery.isCharged()
--   timeRemaining = battery.timeRemaining()
--   alert.show(
--   "Wi-Fi: "..wifi_control.status()..
--   "\nBluetooth: "..bluetooth_control.status()..
--   "\nBattery: "..battery.percentage().."% - "..
--   (charging and "Charging" or "Not charging")..
--   "\nTime remaining: "..((timeRemaining == -1 or timeRemaining == -2) and "?" or timeRemaining).." minutes"
--   , 5)
-- end)
-- -- Toggle WiFi on and off
-- hotkey.bind(hyper, "W", function()
--   wifi_control.toggle()
-- end)
-- -- Toggle Bluetooth on and off
-- hotkey.bind(hyper, "E", function()
--   bluetooth_control.toggle()
-- end)

-- hotkey.bind(hyper, "1", function()
--   application.launchOrFocus("iTerm")
-- end)
-- hotkey.bind(hyper, "2", function()
--   application.launchOrFocus("Emacs")
-- end)
