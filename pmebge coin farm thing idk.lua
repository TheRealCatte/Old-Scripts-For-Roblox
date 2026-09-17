local enabled = true

game:GetService("UserInputService").InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Q then
                    enabled = false
                end
            end)

local keycodeMap = {
			["1"] = 0x31,
		}

local function Sell(itemName)
			local args = {
				[1] = itemName,
				[2] = false,
				[3] = false
			}

			game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
		end

		local function Buy(itemName)
			local args = {
				[1] = itemName,
				[2] = false,
				[3] = true
			}

			game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
		end

local function FindCargoBoats(model)
				local C = model:GetChildren()
				for _, item in pairs(C) do
						local ItemC = item:GetChildren()
						local Number = 0
						for i=1,#ItemC do Number=Number+1 end
						if Number ~= 0 then
							FindCargoBoats(item)
						end
						if item.Name == "CargoShip" then
							while enabled == true do wait()
								local CargoHold = item:FindFirstChild("CargoHold")
								Buy("iron")
								keypress(keycodeMap["1"])
								wait(4)
								keyrelease(keycodeMap["1"])
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CargoHold.Position)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
								wait(1)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CargoHold.Position)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
								Sell("iron")
							end
						end
				end
end
print('e')
			FindCargoBoats(workspace)