--Animation Player

local anim = Instance.new("Animation")
anim.AnimationId = "http://www.roblox.com/Asset?ID=54432537"
local yeah = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)

local Playing = true
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if Playing == true then
        if msg == "/e end" then
            yeah:Stop() 
            Playing = false
        end 
    end
end)

while Playing == true do wait()
    yeah:Play()
end