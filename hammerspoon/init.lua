local modal = hs.hotkey.modal.new({ "cmd", "ctrl", "alt", "shift" }, "return", nil)
-- used as a nested modal
local webModal = hs.hotkey.modal.new(nil, nil, nil)

local function bind(modal, name)
    return function()
        -- find a running app
        local app = hs.application(name)
        if app == nil then
            -- launch it if not running
            hs.application.open(name)
        else
            -- otherwise if its focused, hide it
            if app:isFrontmost() then
                app:hide()
            else
                -- or focus if not focused
                app:activate()
            end
        end
        modal:exit()
    end
end

-- automatically cancel the modal after a timeout
local timer = hs.timer.new(2, function()
    modal:exit()
end)
local webTimer = hs.timer.new(2, function()
    webModal:exit()
end)

function modal:entered()
    timer:start()
end

function webModal:entered()
    webTimer:start()
end

function modal:exited()
    timer:stop()
end

function webModal:exited()
    webTimer:stop()
end

modal:bind(nil, "escape", nil, function()
    modal:exit()
end)

modal:bind(nil, "r", nil, hs.reload)

modal:bind(nil, "a", nil, function()
    hs.spaces.toggleLaunchPad()
    modal:exit()
end)
modal:bind(nil, "c", nil, bind(modal, "messages"))
modal:bind(nil, "d", nil, function()
    hs.spaces.toggleShowDesktop()
    modal:exit()
end)
modal:bind(nil, "e", nil, bind(modal, "mimestream"))
modal:bind(nil, "l", nil, bind(modal, "linear"))
modal:bind(nil, "m", nil, bind(modal, "spotify"))
modal:bind(nil, "n", nil, bind(modal, "notion"))
modal:bind(nil, "s", nil, bind(modal, "slack"))
modal:bind(nil, "t", nil, bind(modal, "kitty"))
modal:bind(nil, "b", nil, function()
    webModal:enter()
    modal:exit()
end)

-- a sub modal to focus a specific instance of google chrome
-- TODO: switch to the specific chrome profile for work/home
webModal:bind(nil, "h", nil, bind(webModal, "google chrome"))
webModal:bind(nil, "w", nil, bind(webModal, "google chrome"))

-- start a watcher to automatically reload on changes
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()

hs.notify.show("Hammerspoon", "", "Reloaded")
