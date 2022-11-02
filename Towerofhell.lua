local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Clue Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "Clueless Hub", IntroEnabled = false})

local Tab = Window:MakeTab({
	Name = "Character",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Character"
})


Tab:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(225,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab:AddSlider({
	Name = "Jump",
	Min = 50,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

Tab:AddButton({
	Name = "Reset options",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
  	end    
})

local Tab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Game"
})


Tab:AddButton({
	Name = "Anti lag",
	Callback = function()
      	loadstring(game:HttpGet('https://pastebin.com/raw/eVHmQQvQ'))()
  	end    
})

Tab:AddButton({
	Name = "Anti cheat bypass",
	Callback = function()
        local reg = getreg()
 
        for i, Function in next, reg do
            if type(Function) == 'function' then
                local info = getinfo(Function)
     
                if info.name == 'kick' then
                    if (hookfunction(info.func, function(...)end)) then
                        print'succesfully hooked kick'
                    else
                        print'failed to hook kick'
                    end
                end
            end
        end
        local playerscripts = game:GetService'Players'.LocalPlayer.PlayerScripts
     
        local script1 = playerscripts.LocalScript
        local script2 = playerscripts.LocalScript2
     
        local script1signal = script1.Changed
        local script2signal = script2.Changed
     
        for i, connection in next, getconnections(script1signal) do
            connection:Disable()
        end
        for i, connection in next, getconnections(script2signal) do
            connection:Disable()
        end
     
        script1:Destroy()
        script2:Destroy()    
  	end    
})

Tab:AddButton({
	Name = "Give all items",
	Callback = function()
        for _,e in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
            if e:IsA("Tool") then
            e:Destroy()
            end
            end
            wait() 
            for _,v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
            if v:IsA("Tool") then
            local CloneThings = v:Clone()
            wait()
            CloneThings.Parent = game.Players.LocalPlayer.Backpack
     
            end
            end
  	end    
})

Tab:AddButton({
	Name = "TP to end",
	Callback = function()
        local endzone = game.Workspace.tower.sections.finish.FinishGlow.CFrame
 
        local player = game.Players.LocalPlayer.Character
        player.HumanoidRootPart.CFrame = endzone
  	end    
})

Tab:AddButton({
	Name = "God mode",
	Callback = function()
        for i,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
            if v:IsA("BoolValue") and v.Name == "kills" then
                v.Parent:Destroy()
            end
        end
  	end    
})

local Tab = Window:MakeTab({
	Name = "Other",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Other"
})


Tab:AddButton({
	Name = "Infinite yield",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

Tab:AddButton({
	Name = "Anti AFK",
	Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
           vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           wait(1)
           vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
  	end    
})

local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Other"
})


Tab:AddLabel("Made by: Clueless#4971")  