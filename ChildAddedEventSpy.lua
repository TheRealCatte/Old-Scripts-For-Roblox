local enabled = true
local function Search(item)
    if enabled == true then
    for i,instance in pairs(item:GetChildren()) do
        instance.ChildAdded:Connect(function(addedItem)
            if enabled == true then
            print(addedItem:GetFullName())
            Search(addedItem)
            end
        end)
        local hasItems = false
        for i,v in pairs(instance:GetChildren()) do
            if enabled == true then
            Search(v)
            end
        end
    end 
    end
end

Search(game.Players.LocalPlayer.PlayerGui)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e stop" then
        enabled = false
    end
end)