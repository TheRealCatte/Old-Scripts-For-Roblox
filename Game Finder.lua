--Game Finder

local child = game.Players.LocalPlayer.Character.Torso:GetChildren()
local Active = true --If you want to turn off Finder

--Put Something here

--Not below here though

if Active == true then
    print('-----------------')
    for i=1,#child do
        print(child[i])
    end
    print('-----------------')
end