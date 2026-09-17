--Auto coin farm

local enabled = true

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e end" then
        enabled = false
    end
end)

keycodeMap = {
	["1"] = 0x31,
}

function Sell(itemName)
    local args = {
        [1] = itemName,
        [2] = false,
        [3] = false
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
end

function Buy(itemName)
    local args = {
        [1] = itemName,
        [2] = false,
        [3] = true
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
end

function FindTrees(model)
    local C = model:GetChildren()
    for _, item in pairs(C) do
        if enabled == true then
            local ItemC = item:GetChildren()
		    local Number = 0
		    for i=1,#ItemC do Number=Number+1 end
		    if Number ~= 0 then
		        FindTrees(item)
		    end
		    if item.Name == "CargoShip" then
		        while enabled == true do wait()
		        local CargoHold = item:FindFirstChild("CargoHold")
		        Buy("iron")
		        keypress(keycodeMap["1"])
                wait()
                keyrelease(keycodeMap["1"])
		        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CargoHold.Position)
		        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
		        wait(5)
		        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CargoHold.Position)
		        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
		        Sell("iron")
		        end
            end
        end
	end
end

FindTrees(workspace)