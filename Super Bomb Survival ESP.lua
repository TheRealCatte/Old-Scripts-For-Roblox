--Super Bomb Survial Esp

local Player = game.Players.LocalPlayer
local BombsFolder = workspace.Bombs

local RunService = game:GetService("RunService")

local ESPEnabled = false
local Ended = false

local function Highlight(Item)

    local H = Instance.new("Highlight", Item)

    if Item:IsA("BasePart") then
        H.FillColor = Item.Color
    elseif Item:IsA("Model") then
        H.FillColor = Item:FindFirstOfClass("BasePart").Color
    end

    H.OutlineColor = Color3.new(0,0,0)

    task.defer(function()
        while RunService.Heartbeat:Wait() and ESPEnabled == true and Ended == false do
            local HRP = Player.Character:FindFirstChild("HumanoidRootPart")

            if HRP then
                local Dist = (HRP.Position - Item.Position).Magnitude
                local Mathy = Dist
                Mathy *= 100
                math.floor(Mathy)
                Mathy /= 100
                Mathy /= 100

                H.FillTransparency = Mathy
            end
        end
    end)
end

local function Check()
    for i,Instance in pairs(BombsFolder:GetChildren()) do
        pcall(function()
            if not Instance:FindFirstChildOfClass("Highlight") then
                Highlight(Instance)
            end
        end)
    end
end

Player.Chatted:Connect(function(Msg)
if Ended == false then
    if Msg == "/e esp" then
        warn("Esp Enabled")
        ESPEnabled = true
        while ESPEnabled == true do wait()
            Check()
        end
    elseif Msg == "/e noesp" then
        warn("Esp Disable")
        ESPEnabled = false
    elseif Msg == "/e endesp" then
        warn("Esp Ended")
        Ended = true
    end
end
end)

warn("Esp loaded succesfully!")