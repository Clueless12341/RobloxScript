local debounce = false  -- Variable to track whether the chat message has been sent

-- Function to handle player chatting
local function onPlayerChatted(player, message)
    print(player.Name .. " said: " .. message)
    
    -- Check if the message is "hi" and the debounce is false
    if message:lower() == "hi" and not debounce then
        -- Broadcast the message to all players
        for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
            otherPlayer:Chat(message)
        end
        debounce = true  -- Set debounce to true to prevent sending the message again
    end
end

-- Connect the function to the PlayerChatted event
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onPlayerChatted(player, message)
    end)
end)
