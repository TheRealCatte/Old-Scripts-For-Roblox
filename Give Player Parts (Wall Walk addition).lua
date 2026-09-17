local Players = game.Players:GetPlayers()
local Folder = Instance.new("Folder", workspace)
Folder.Name = "WalkOnParts"
local ScriptStopped = false

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if ScriptStopped == false then
        if msg == "/e stopScript" then
            ScriptStopped = true
            Folder:Remove()
            warn("Stopped Script")
        end
    end
end)

while ScriptStopped == false do wait()
    for _, Player in pairs(Players) do
        if Player:IsA("Player") and Player.Name ~= game.Players.LocalPlayer.Name and not Folder:FindFirstChild("Part "..Player.Name) then
            local Part = Instance.new("Part", Folder)
            Part.Name = "Part "..Player.Name
            Part.Size = Vector3.new(4,5,1)--4,5,1
            Part.Transparency = 1
            local Weld = Instance.new("Weld", Part)
            Weld.Part0 = Part
            Weld.Part1 = Player.Character.HumanoidRootPart
        end
    end
end