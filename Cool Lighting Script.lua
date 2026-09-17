--[[Chat commands
"/stop" --Ends script (RECOMMENDED BEFORE EXECUTING AGAIN)
"/refresh" --Sets lighting to defult game lighting
"/removeLighting" --Removes all of the instances in game.Lighting
--]]

--Settings
local RemoveDefultLightingOnExecute = false
local Atmo = true
--Stuff you can enable if Atmo is disabled
local Fog = false
local FogEnd = 100
local FogColor = Color3.fromRGB(0,255,255) --From 1,255
--end
local DayTime = 14
--Settings End







local ScriptEnd = false
local Lighting = game.Lighting

local LightingChildren = Lighting:GetChildren()
local DefultLightingInstances = Instance.new("Folder")
DefultLightingInstances.Name = "DefultLighting"
local DefultLightingInstancesChildren = DefultLightingInstances:GetChildren()
if not game.Players.LocalPlayer:FindFirstChild("DefultLighting") then
    for i=1,#LightingChildren do
        local Clone = LightingChildren[i]:Clone()
        Clone.Parent = DefultLightingInstances
        DefultLightingInstances.Parent = game.Players.LocalPlayer
    end
else
    DefultLightingInstances = game.Players.LocalPlayer:FindFirstChild("DefultLighting"):GetChildren()
end

if RemoveDefultLightingOnExecute == true then
    for i=1,100 do
        if Lighting:FindFirstChildOfClass("Atmosphere") then
            Lighting:FindFirstChildOfClass("Atmosphere"):Remove()
        end
        if Lighting:FindFirstChildOfClass("Sky") then
            Lighting:FindFirstChildOfClass("Sky"):Remove()
        end
    end
end

if GraphicLighting == false then
    if Atmo == true then
        local Sky = Instance.new("Sky", Lighting)
        local Atmo = Instance.new("Atmosphere", Lighting)
        Atmo.Density = 0.3
    else
    if Fog == true then
            Lighting.FogEnd = FogEnd
            Lighting.FogColor = FogColor
        else
            Lighting.FogEnd = 999999999999
        end
    end
    Lighting.ClockTime = DayTime
else
    local Sky = Instance.new("Sky", Lighting)
    local Atmo = Instance.new("Atmosphere", Lighting)
    Atmo.Density = 0.3
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if ScriptEnd == false then
        if msg == "/stop" then
            warn("Stopped Script")
            ScriptEnd = true
        elseif msg == "/refresh" then
            for i=1,#LightingChildren do
                LightingChildren[i]:Remove()
                print(LightingChildren[i])
            end
            for i=1,#DefultLightingInstancesChildren do
                local Clone = DefultLightingInstancesChildren[i]:Clone()
                Clone.Parent = Lighting
                print(Clone:GetFullName())
            end
        elseif msg == "/removeLighting" then
            for i=1,#LightingChildren do
                LightingChildren[i]:Remove()
                print(LightingChildren[i])
            end
        end
    end
end)