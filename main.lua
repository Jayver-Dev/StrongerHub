local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()


local Window = Library:CreateWindow({
    Title = "StrongerHub",
    SubTitle = "By j4y11",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic= true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

Library:Notify({
        Title = "Welcome",
        Content = "Welcome to StrongerHub",
        SubContent = "By j4y11", 
        Duration = 5 
})

local Options = Library.Options

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "gavel" }),
    Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "crosshair"}),
    Misc = Window:AddTab({ Title = "Misc", Icon = "briefcase"}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings-2" })
}

SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Tabs.Misc:AddButton({
    Title = "Set Creator ID",
    Description = "Sets your user ID to the creators ID",
    Callback = function()
        local player = game.Players.LocalPlayer
        local creatorId = game.creatorId
        player.UserId = creatorId
        Library:Notify({
        Title = "Finished",
        Content = "Set UserId to CreatorId",
        Duration = 5
})
    end
})

Tabs.Aimbot:AddButton({
    Title = "Launch Aimbot",
    Description = "Launch Camlock",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Jayver-Dev/camlock/refs/heads/main/lock.lua"))()
    end
})

Tabs.Main:AddButton({
    Title = "fling",
    Description = "Fling player",
    Callback = function(Value)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Jayver-Dev/kill-all/refs/heads/main/fling.lua"))()
    end
})
