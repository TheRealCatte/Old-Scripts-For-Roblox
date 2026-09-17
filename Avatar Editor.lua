--Avatar Editor
--Locals
local Plr = game.Players.LocalPlayer
local Char = Plr.Character

--Library
local OrionLib
local Window
local MainTab

--Values
local SelectedHat = nil
local CurrentShirtId = nil
local CurrentPantsId = nil

--True/False
local AutoMorph = false

--Instances
local InstanceFolder
if game:FindFirstChild("InstanceFolder") then
    InstanceFolder = game.InstanceFolder
else
   InstanceFolder = Instance.new("Folder", game)
   InstanceFolder.Name = "InstanceFolder"
end

--Tables
local Hats = {}

--Functions
local function SendNotification(Title, Text, Img, Time) OrionLib:MakeNotification({Name = Title, Content =Text, Image = Img, Time = Time}) end

--Get new char every respawn
Plr.CharacterAdded:Connect(function(c)
    Char = c
    
    --Hat Dropdown Reset
    for i,hat in pairs(Char:GetChildren()) do if hat:IsA("Accessory") then table.insert(Hats, hat.Name) end end Dropdown:Refresh(Hats,true)
end)

--Setup
for i,hat in pairs(Char:GetChildren()) do if hat:IsA("Accessory") then table.insert(Hats, hat.Name) end end

--Ui Build and other shit :P
OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

Window = OrionLib:MakeWindow({Name = "Avatar Editor", HidePremium = false, SaveConfig = false, ConfigFolder = "Useless", IntroEnabled = false})

MainTab = Window:MakeTab({Name = "",Icon = "",PremiumOnly = false})

Section = MainTab:AddSection({Name = "Avatar"})
Section = MainTab:AddSection({Name = "Hats"})

--Hats Editor
MainTab:AddDropdown({Name = "Hats",Default = Hats[1],Options = Hats,Callback = function(Value)SelectedHat = Value end})

MainTab:AddButton({
	Name = "Remove Hat",
	Callback = function()
        if Char:FindFirstChild(SelectedHat) then
            Char:FindFirstChild(SelectedHat).Parent = InstanceFolder
        else
            SendNotification("Error!", "You already have that hat removed!", nil, 5)
      	end
	end
})

MainTab:AddButton({
	Name = "Restore Hat",
	Callback = function()
        if InstanceFolder:FindFirstChild(SelectedHat) then
            InstanceFolder:FindFirstChild(SelectedHat).Parent = Char
        else
            SendNotification("Error!", "That hat isnt removed!", nil, 5)
      	end
	end
})

Section = MainTab:AddSection({Name = "Shirt/Pant"})

MainTab:AddButton({
	Name = "Remove Shirt",
	Callback = function()
        if Char:FindFirstChildOfClass("Shirt") then
            if InstanceFolder:FindFirstChildOfClass("Shirt") then
                InstanceFolder:FindFirstChildOfClass("Shirt"):Remove()
                Char:FindFirstChildOfClass("Shirt").Parent = InstanceFolder
            else
                Char:FindFirstChildOfClass("Shirt").Parent = InstanceFolder
            end
        else
            SendNotification("Error!", "You already have your shirt removed!", nil, 5)
      	end
	end
})

MainTab:AddButton({
	Name = "Remove Pants",
	Callback = function()
        if Char:FindFirstChildOfClass("Pants") then
            if InstanceFolder:FindFirstChildOfClass("Pants") then
                InstanceFolder:FindFirstChildOfClass("Pants"):Remove()
                Char:FindFirstChildOfClass("Pants").Parent = InstanceFolder
            else
                Char:FindFirstChildOfClass("Pants").Parent = InstanceFolder
            end
        else
            SendNotification("Error!", "You already have your pants removed!", nil, 5)
      	end
	end
})

MainTab:AddButton({
	Name = "Restore Shirts",
	Callback = function()
        if InstanceFolder:FindFirstChildOfClass("Shirt") then
            if Char:FindFirstChildOfClass("Shirt") then
                Char:FindFirstChildOfClass("Shirt"):Remove()
                InstanceFolder:FindFirstChildOfClass("Shirt").Parent = Char
            else
                InstanceFolder:FindFirstChildOfClass("Shirt").Parent = Char
            end
        else
            SendNotification("Error!", "You already have your shirt restored!", nil, 5)
      	end
	end
})

MainTab:AddButton({
	Name = "Restore Pants",
	Callback = function()
        if InstanceFolder:FindFirstChildOfClass("Pants") then
            if Char:FindFirstChildOfClass("Pants") then
                Char:FindFirstChildOfClass("Pants"):Remove()
                InstanceFolder:FindFirstChildOfClass("Pants").Parent = Char
            else
                InstanceFolder:FindFirstChildOfClass("Pants").Parent = Char
            end
        else
            SendNotification("Error!", "You already have your pants restored!", nil, 5)
      	end
	end
})

MainTab:AddTextbox({
	Name = "Shirt ID",
	Default = "Put a shirt id here",
	TextDisappear = false,
	Callback = function(Value)
		CurrentShirtId = Value
	end	  
})

MainTab:AddButton({
	Name = "Insert Shirt",
    Callback = function()
        --local success = pcall(function()
            if Char:FindFirstChildOfClass("Shirt") then
                SendNotification("Oops!", "Please remove your shirt!")
            else
                local Shirt = Instance.new("Shirt", Char)
                Shirt.ShirtTemplate = CurrentShirtId
            end
	    --end)
        if not success then
            SendNotification("Error!", "Please put a valid id!", nil, 5)
        end
	end
})