--Auto bred/caik farm

local Running = true
local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local keycodeMap = {
	["1"] = 0x31,
	["f"] = 0x46,
}

function SendNotifcation(Title, Text, Duration, Button1, Button2)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Duration = Duration;
		Button1 = Button1;
		Button2 = Button2;
	})
end

function Sell(itemName)
    local args = {
        [1] = itemName,
        [2] = false,
        [3] = false
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
end

plr.Chatted:Connect(function(msg)
    if msg == "/e end" then
        Running = false
        warn("Stopped AutoFarm :3")
    end
end)

for i,item in next, plr.Backpack:GetChildren() do
    if item.Name == "bred" or item.Name == "caik" then
        if item:FindFirstChild("DoNotSell") then
            item.Name = "hi"
        end
    end
end

local active = false
UIS.InputBegan:Connect(function(input)
    if Running == true then
        if input.KeyCode == Enum.KeyCode.P then
            if active == false then
                active = true
                SendNotifcation("Enabled", "Press 'P' again to disable", 5, nil, nil)
            else
                active = false
                SendNotifcation("Disabled", "Press 'P' again to enable", 5, nil, nil)
            end
        
            while active == true and Running == true do
                local char = plr.Character
                char.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(9,21,-1893))
                wait(0.5)
                keypress(keycodeMap["f"])
                wait()
                keyrelease(keycodeMap["f"])
                if char.Humanoid.WalkSpeed ~= 0 then
                    wait(0.5)
                    keypress(keycodeMap["f"])
                    wait()
                    keyrelease(keycodeMap["f"])
                end
                repeat wait() until plr.Backpack:FindFirstChild("uncooked bred")
                wait(0.5)
                keypress(keycodeMap["1"])
                wait()
                keyrelease(keycodeMap["1"])
                wait()
                keypress(keycodeMap["1"])
                wait()
                keyrelease(keycodeMap["1"])
                wait()
                keypress(keycodeMap["1"])
                wait()
                keyrelease(keycodeMap["1"])
                char.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(7,21,-1881))
                repeat wait() until char:FindFirstChild("uncooked bred").Handle:FindFirstChildOfClass("Fire")
                char.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(8,21,-1873))
                keypress(keycodeMap["1"])
                wait()
                keyrelease(keycodeMap["1"])
                keypress(keycodeMap["f"])
                wait()
                keyrelease(keycodeMap["f"])
                if char.Humanoid.WalkSpeed ~= 0 then
                    wait(0.5)
                    keypress(keycodeMap["f"])
                    wait()
                    keyrelease(keycodeMap["f"])
                end
                repeat wait() until plr.Backpack:FindFirstChild("caik")
                wait()
                pcall(function() Sell("caik") wait() Sell("bred") wait() Sell("caik") wait() Sell("bred") end)
            end
        end 
    end
end)