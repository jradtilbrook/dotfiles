require("helpers")
apps = require("apps")
local summon = require("summon")

--
-- Modal bindings
--
-- map table of apps to key binding -> bundle ID
local summonModalBindings = tableFlip(hs.fnutils.map(apps, function(app)
    return app.summonModal
end))
summonModalBindings = hs.fnutils.map(summonModalBindings, function(app)
    return function()
        summon(app)
    end
end)

summonModalBindings["a"] = hs.spaces.toggleLaunchPad
summonModalBindings["d"] = hs.spaces.toggleShowDesktop
summonModalBindings["r"] = hs.reload

registerModalBindings({ "alt" }, "space", summonModalBindings, true, "switcher")

-- TODO: add modal binding for switching chrome profiles

--
-- Window management
--
hs.window.animationDuration = 0
hs.grid.setGrid("60x20")
hs.grid.setMargins("15x15")
hs.screen.watcher.new(hs.reload):start()

-- start a watcher to automatically reload on changes
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()

hs.notify.show("Hammerspoon", "", "Reloaded")
