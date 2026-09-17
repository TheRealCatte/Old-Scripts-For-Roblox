--Pmebge BackToChoosing Force

local UIS = game:GetService("UserInputService")
local IsTyping = false
local active = true

UIS.TextBoxFocused:Connect(function()
	IsTyping = true
end)

UIS.TextBoxFocusReleased:Connect(function()
	IsTyping = false
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e stop" then
        active = false
    end
end)

UIS.InputBegan:Connect(function(input)
    if active == true and IsTyping == false then
       if input.KeyCode == Enum.KeyCode.P then
            game:GetService("ReplicatedStorage").Remotes.BackToChoosing:FireServer()
        end 
    end
end)