 --Animation Speed edit
 
 Playing = true
 Speed = 1
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e stop" then
       Playing = false 
    end
    
    if msg == "/e play" then
        Playing = true
        while Playing == true do
    wait()
    for _,v in next, game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Animator:GetPlayingAnimationTracks() do
        v:AdjustSpeed(Speed)
    end 
end
    end
    
    if msg:find("/e speed") then
        local split = msg:split("/e speed ")
        Speed = split[2]
    end
end)

while Playing == true do
    wait()
    for _,v in next, game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Animator:GetPlayingAnimationTracks() do
        v:AdjustSpeed(Speed)
    end 
end