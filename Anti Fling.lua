--Anti fling thing idk

function SendNotifcation(Title, Text, Duration, Button1, Button2)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Duration = Duration;
		Button1 = Button1;
		Button2 = Button2;
	})
end
local active = true
local IsTyping = false

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if active == true then
        if msg == "/e stop" then
            active = false
            SendNotifcation("Script ended", ":3", 5, nil, nil)
            warn("Script ended :3")
        end
    end
end)

local UIS = game:GetService("UserInputService")

UIS.TextBoxFocused:Connect(function()
	IsTyping = true
end)

UIS.TextBoxFocusReleased:Connect(function()
	IsTyping = false
end)

local enabled = false
UIS.InputBegan:Connect(function(input)
    if active == true and IsTyping == false then
       if input.KeyCode == Enum.KeyCode.Q then
            if enabled == true then
               enabled = false
               SendNotifcation("False", "so false", 5, nil, nil)
            else
                enabled = true
                SendNotifcation("True", "so true", 5, nil, nil)
            end
            pcall(function()
                while enabled == true and active == true do
                    wait()
                    local char = game.Players.LocalPlayer.Character
                    print(char.HumanoidRootPart.Orientation)
                    if char.HumanoidRootPart.Orientation.X ~= 0 then
                        char.Humanoid.Sit = true
                        wait()
                        char.Humanoid.Sit = false
                    end
                end
            end)
        end 
    end
end)
-- end