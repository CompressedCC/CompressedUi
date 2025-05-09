
getgenv().Compressed = {
    Aimbot = {
        Enabled = true,
    },
    Main = {
        MenuKey = Enum.KeyCode.Insert,
    },
    SilentAim = {
        Enabled = true,
    },
}

local libary = loadstring(game:HttpGet("https://raw.githubusercontent.com/CompressedCC/CompressedUi/refs/heads/main/Library.lua"))()
local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/imagoodpersond/puppyware/main/notify"))()
local Notify = NotifyLibrary.Notify

makefolder("Example")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Window = libary:new({
    name = "Menu Example",
    accent = Color3.fromRGB(175, 252, 149),
    textsize = 13
})

local Legit = Window:page({name = "Legit"})
local Trigga = Window:page({name = "Triggerbot"})

local Silentaim = Legit:section({name = "Silent Assist", side = "left", size = 510})
local Camlock = Legit:section({name = "AimBot", side = "right", size = 445})

local function AnimateTitle(targetText, callback)
    local currentText = ""
    for i = 1, #targetText do
        currentText = string.sub(targetText, 1, i)
        callback(currentText)
        task.wait(0.05)
    end
end

AnimateTitle("Menu Example", function(partial)
    pcall(function()
        Window:SetTitle(partial)
    end)
end)

Silentaim:toggle({
    name     = "Enabled",
    def      = getgenv().Compressed.SilentAim.Enabled,
    callback = function(v)
        getgenv().Compressed.SilentAim.Enabled = v
    end
})
