--Auto tree farm

local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local trees = game:GetService("Workspace").Map.Trees:GetChildren()
local char = plr.Character

local keycodeMap = {
	["f"] = 0x46,
}

function Sell(itemName)
    local args = {
        [1] = itemName,
        [2] = false,
        [3] = false
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
end

local enabled = false
local stopped = false

function FindTrees(model)
    local C = model:GetChildren()
    for _, item in pairs(C) do
        if enabled == true and stopped == false then
            local ItemC = item:GetChildren()
		    local Number = 0
		    for i=1,#ItemC do Number=Number+1 end
		    if Number ~= 0 then
		        FindTrees(item)
		    end
		    if item.Parent.Name:find("Tree") and not item.Parent.Name:find("Palm") then
                if item.Name == "Base" and item:FindFirstChild("ChopTree") then
                    char.HumanoidRootPart.CFrame = item.CFrame
                    char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
                    wait(0.1)
                    keypress(keycodeMap["f"])
                    wait()
                    keyrelease(keycodeMap["f"])
                    keypress(keycodeMap["f"])
                    wait()
                    keyrelease(keycodeMap["f"]) 
                elseif item.Name == "Wood" and item:FindFirstChild("ChopTree") then
                    char.HumanoidRootPart.CFrame = item.CFrame
                    char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
                    wait(0.1)
                    keypress(keycodeMap["f"])
                    wait()
                    keyrelease(keycodeMap["f"])
                    keypress(keycodeMap["f"])
                    wait()
                    keyrelease(keycodeMap["f"]) 
                end
            end
        end
	end
end

UIS.InputBegan:Connect(function(input)
    if stopped == false then
        if input.KeyCode == Enum.KeyCode.L then
            if enabled == false then
                enabled = true
                while enabled == true do
                   FindTrees(workspace)
                    -- for i=1,500 do
                    --   wait()
                    --   Sell("wood")
                    -- end
                end
            else
                enabled = false
            end
        end
    end
end)

plr.Chatted:Connect(function(msg)
    if stopped == false then
        if msg == "/e end" then
            stopped = true
        end
    end
end)