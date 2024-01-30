local hyper = { "cmd", "ctrl", "alt", "shift" }
-- used as a nested modal
-- local webModal = hs.hotkey.modal.new(nil, nil, nil)

require("helpers")
apps = require("apps")
local summon = require("summon")

-- map table of apps to key binding -> bundle ID
local summonModalBindings = tableFlip(hs.fnutils.map(apps, function(app)
    return app.summonModal
end))
summonModalBindings = hs.fnutils.map(summonModalBindings, function(app)
    return function()
        summon(app)
    end
end)

summonModalBindings["r"] = hs.reload
summonModalBindings["a"] = hs.spaces.toggleLaunchPad
summonModalBindings["d"] = hs.spaces.toggleShowDesktop

registerModalBindings(hyper, "return", summonModalBindings, true)

-- modal:bind(nil, "b", nil, function()
--     webModal:enter()
--     modal:exit()
-- end)
--
-- -- a sub modal to focus a specific instance of google chrome
-- -- TODO: switch to the specific chrome profile for work/home
-- webModal:bind(nil, "h", nil, function()
--     local name = "google chrome"
--     local app = hs.application(name)
--     if app == nil then
--         -- launch it if not running
--         hs.application.open(name)
--     else
--         -- otherwise if its focused, hide it
--         if app:isFrontmost() then
--             app:hide()
--         else
--             -- or focus profile window
--             -- TODO
--             app:activate()
--         end
--     end
--     webModal:exit()
-- end)

-- start a watcher to automatically reload on changes
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()

hs.notify.show("Hammerspoon", "", "Reloaded")
