require("helpers")

--
-- Modal bindings
--
-- map table of apps to key binding -> bundle ID
local summonModalBindings = {}
summonModalBindings["a"] = hs.spaces.toggleLaunchPad
summonModalBindings["d"] = hs.spaces.toggleShowDesktop
summonModalBindings["r"] = hs.reload

registerModalBindings({ "alt" }, "space", summonModalBindings, true, "switcher")

hs.notify.show("Hammerspoon", "", "Reloaded")
