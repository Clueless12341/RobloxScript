local replicatedStorage = game:GetService("ReplicatedStorage")
local ConfigModule = replicatedStorage:WaitForChild("Configuration").Paste
local Config = require(ConfigModule)
local cooldown = 2
local Inner = script.Parent.Paste

local Player = game.Players.LocalPlayer
if Player:GetRankInGroup(Config.GroupId) >= Config.MinRank then
	script.Parent.Button.Visible = true
else
	script.Parent:Destroy()
end

Inner.Exit.BackgroundColor3 = Config.EmbedColor
Inner.Holder.TemplateHolder.Template.Button.BackgroundColor3 = Config.EmbedColor
Inner.BackgroundColor3 = Config.SecondaryColor
Inner.Holder.TemplateHolder.Template.BackgroundColor3 = Config.SecondaryColor

--// Services
local replicatedStorage = game:GetService("ReplicatedStorage")
local playerService = game:GetService("Players")

--// Variables
local Config = require(replicatedStorage.Configuration.Paste)
local eventsFolder = replicatedStorage:WaitForChild("Events")
local pasteEvent = eventsFolder:FindFirstChild("PasteEvent")
local Base = script.Parent
local Button = Base:WaitForChild("Button")
local pasteFrame = Base:WaitForChild("Paste")
local Holder = pasteFrame.Holder
local ScrollingFrame = Holder.ScrollingFrame
local Template = Holder.TemplateHolder.Template

--// Constants
local cooldown = 2
local InPosition = UDim2.fromScale(.5, .5)
local OutPosition = UDim2.fromScale(.5, 1.5)

--// Flags
local Debounce = false
local framesCreated = false
local canClick = true

--// Main Code 

local function createFrame()
    if not framesCreated then
        for _, messageData in ipairs(Config.Messages) do
            local messageName = messageData[1]
            local messageText = messageData[2]

            local messageFrame = Template:Clone()
            messageFrame.Visible = true
            messageFrame.Name = messageName
            messageFrame.Title.Text = messageName
            messageFrame.Message.Text = string.format(messageText, playerService.LocalPlayer.Name)
            messageFrame.Parent = ScrollingFrame

            local textButton = messageFrame:FindFirstChild("Button")
            if textButton then
                textButton.MouseButton1Up:Connect(function()
                    if pasteEvent and canClick then
                        canClick = false
                        pasteEvent:FireServer(messageText)
                        wait(cooldown)
                        canClick = true
                    end
                end)
            end
        end
        framesCreated = true
    end
end

createFrame()

Button.MouseButton1Up:Connect(function()
    Debounce = not Debounce
    pasteFrame:TweenPosition(Debounce and InPosition or OutPosition, "In", Debounce and "Linear" or "Back", 0.6, true)
end)

pasteFrame.Exit.MouseButton1Up:Connect(function()
    pasteFrame:TweenPosition(OutPosition, "In", "Back", 0.6, true)
end)

--// Check if player has required rank
local function checkRank()
    if not playerService.LocalPlayer then return end
    if playerService.LocalPlayer:GetRankInGroup(Config.GroupId) >= Config.MinRank then
        Button.Visible = true
    else
        Base:Destroy()
    end
end

checkRank()
