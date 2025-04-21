-- Load KeyGuard Library
local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "3b729ac9eb97470a9c470182a79e39de"
local falseData = "c89196c0041d429a85b48fd508510244"

KeyGuardLibrary.Set({
	publicToken = "b1646a9a3b93421d86794aeab18b1824",
	privateToken = "e7225d7d4b1048b88c67827baa2372ba",
	trueData = trueData,
	falseData = falseData,
})

-- Load Fluent UI Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local key = ""

-- Create Main Window
local Window = Fluent:CreateWindow({
	Title = "Key System",
	SubTitle = "StrongerHub",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 340),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tabs
local Tabs = {
	KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
}

-- Key Input
local Entkey = Tabs.KeySys:AddInput("Input", {
	Title = "Enter Key",
	Description = "Enter Key Here",
	Default = "",
	Placeholder = "Enter key…",
	Numeric = false,
	Finished = false,
	Callback = function(Value)
		key = Value
	end
})

-- Key Validation
local Checkkey = Tabs.KeySys:AddButton({
	Title = "Check Key",
	Description = "Enter Key before pressing this button",
	Callback = function()
		local response = KeyGuardLibrary.validateDefaultKey(key)
		if response == trueData then
			print("Key is valid")
				Fluent:Destroy()

			-- Load Full UI and Addons
			local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
            task.wait(1)
			local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
            task.wait(1)
			local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

			local Window = Library:CreateWindow({
				Title = "StrongerHub",
				SubTitle = "By j4y11",
				TabWidth = 160,
				Size = UDim2.fromOffset(580, 460),
				Acrylic = true,
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
				Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "crosshair" }),
				Misc = Window:AddTab({ Title = "Misc", Icon = "briefcase" }),
				Settings = Window:AddTab({ Title = "Settings", Icon = "settings-2" })
			}

			SaveManager:SetLibrary(Library)
			InterfaceManager:SetLibrary(Library)

			InterfaceManager:BuildInterfaceSection(Tabs.Settings)
			SaveManager:BuildConfigSection(Tabs.Settings)

			Window:SelectTab(1)

			-- Misc Button
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

			-- Aimbot Button
			Tabs.Aimbot:AddButton({
				Title = "Launch Aimbot",
				Description = "Launch Camlock",
				Callback = function()
					loadstring(game:HttpGet("https://raw.githubusercontent.com/Jayver-Dev/camlock/refs/heads/main/lock.lua"))()
				end
			})

			-- Fling Button
			Tabs.Main:AddButton({
				Title = "fling",
				Description = "Fling player",
				Callback = function()
					loadstring(game:HttpGet("https://raw.githubusercontent.com/Jayver-Dev/kill-all/refs/heads/main/fling.lua"))()
				end
			})

		else
        Fluent:Notify({
			Title = "Key Invalid",
			Content = "Key Invalid try again",
            Duration = 5
		})
		end
	end
})

-- Get Key Button
local Getkey = Tabs.KeySys:AddButton({
	Title = "Get Key",
	Description = "Get Key here",
	Callback = function()
		setclipboard(KeyGuardLibrary.getLink())
		Fluent:Notify({
			Title = "Copied",
			Content = "Key link copied",
            Duration = 5
		})
	end
})

-- Auto-select first tab
Window:SelectTab(1)
