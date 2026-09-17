--Character morph

--Say "/e end" to revert changes ^^

local ShirtId = "12343708539" --Set to nil to prevent changes
local PantsId = "12343726068" --Set to nil to prevent changes
local CharacterMesh = "48112070" --Set to nil to prevent changes
local ShirtGraphic = "12465339935" --Set to nil to prevent changes
local WhatToDelete = nil --Just in case there is a custom character system
--(you can use DEX [if you have it], to copy the  path of the script preventing this)


local OldPath = nil
local plr = game.Players.LocalPlayer
function Morph(Char)
	for i,v in pairs(Char:GetChildren()) do
		if v:IsA("Shirt") and ShirtId ~= nil then
			v:Remove()
		elseif v:IsA("Pants") and PantsId ~= nil then
			v:Remove()
		elseif v:IsA("CharacterMesh") and CharacterMesh ~= nil then
			v:Remove()
		elseif v:IsA("ShirtGraphic") and ShirtGraphic ~= nil then
			v:Remove()
		end
	end

	if ShirtId ~= nil then
		local Shirt = Instance.new("Shirt", Char)
		Shirt.ShirtTemplate = "rbxassetid://"..ShirtId
	end

	if PantsId ~= nil then
		local Pants = Instance.new("Pants", Char)
		Pants.PantsTemplate = "rbxassetid://"..PantsId 
	end

	if CharacterMesh ~= nil then
		local CharacterM = Instance.new("CharacterMesh", Char)
		CharacterM.MeshId = CharacterMesh
		CharacterM.BodyPart = Enum.BodyPart.Torso
	end

	if ShirtGraphic ~= nil then
		local ShirtG = Instance.new("ShirtGraphic", Char)
		ShirtG.Graphic = "rbxassetid://"..ShirtGraphic
	end
	
	if WhatToDelete ~= nil then
	    OldPath = WhatToDelete.Parent
        WhatToDelete.Parent = nil
    end
end
local Character = plr.Character
Morph(Character)
local Ended = false
plr.CharacterAdded:Connect(function(Char)
	if Ended == false then
		Morph(Char) 
	end
end)

plr.Chatted:Connect(function(msg)
	if msg == "/e end" then
		Ended = true
		WhatToDelete.Parent = OldPath
		warn("Script ended")
	end
end)