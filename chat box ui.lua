-- Get the player's GUI
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a ScreenGui to hold the UI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GreetingUI"
screenGui.Parent = playerGui

-- Create a TextBox for entering the greeting message
local textBox = Instance.new("TextBox")
textBox.Name = "GreetingTextBox"
textBox.Size = UDim2.new(0.5, 0, 0.1, 0)
textBox.Position = UDim2.new(0.25, 0, 0.4, 0)
textBox.Text = "Enter your greeting here..."
textBox.Parent = screenGui

-- Create a TextButton to display the greeting
local button = Instance.new("TextButton")
button.Name = "DisplayButton"
button.Size = UDim2.new(0.2, 0, 0.1, 0)
button.Position = UDim2.new(0.4, 0, 0.6, 0)
button.Text = "Display Greeting"
button.Parent = screenGui

-- Function to handle button click
local function onButtonClick()
    local greeting = textBox.Text
    print("Greeting:", greeting)
    -- Display the greeting however you want (e.g., in the output, in a chat message, etc.)
    -- For demonstration purposes, let's just print it to the output
    print(greeting)
end

-- Connect the button click event
button.MouseButton1Click:Connect(onButtonClick)
