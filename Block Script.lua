--[[
yeah this blocks players
what the frick did you expect??
:P
]]

function SendNotification(Title,Text,Duration,Button1,Image)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Duration = Duration;
		Button1 = Button1;
		Icon = Image;
	})
end

MainUi = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
MainUi.ResetOnSpawn = false
MainUi.DisplayOrder = 1000000000
--BlockList Ui
BlockedListFrame = Instance.new("Frame", MainUi)
BlockedListFrame.Position = UDim2.new(0, 0,0.505, 0)
BlockedListFrame.Size = UDim2.new(0.254, 0,0.495, 0)
BlockedListFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UiCorner = Instance.new("UICorner", BlockedListFrame)

BlockedListSearchBox = Instance.new("TextBox", BlockedListFrame)
BlockedListSearchBox.Position = UDim2.new(0, 0,0.154, 0)
BlockedListSearchBox.Size = UDim2.new(1, 0,0.112, 0)
BlockedListSearchBox.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
BlockedListSearchBox.BackgroundTransparency = 0.5
BlockedListSearchBox.Text = "Search"
BlockedListSearchBox.TextScaled = true
BlockedListSearchBox.TextStrokeTransparency = 0
BlockedListSearchBox.TextStrokeColor3 = Color3.fromRGB(255,255,255)
UiCorner = Instance.new("UICorner", BlockedListSearchBox)

BlockedListTitle = Instance.new("TextLabel", BlockedListFrame)
BlockedListTitle.Size = UDim2.new(1, 0,0.154, 0)
BlockedListTitle.BackgroundTransparency = 1
BlockedListTitle.Text = "Blocked List"
BlockedListTitle.TextScaled = true
BlockedListTitle.TextStrokeTransparency = 0
BlockedListTitle.TextStrokeColor3 = Color3.fromRGB(206, 206, 206)

BlockedListScrollingFrame = Instance.new("ScrollingFrame", BlockedListFrame)
BlockedListScrollingFrame.Position = UDim2.new(0, 0,0.267, 0)
BlockedListScrollingFrame.Size = UDim2.new(1, 0,0.733, 0)
BlockedListScrollingFrame.BackgroundTransparency = 1
BlockedListScrollingFrame.BorderSizePixel = 0
BlockedListScrollingFrame.CanvasSize = UDim2.new(0, 0,750, 0)
UiListLayout = Instance.new("UIListLayout", BlockedListScrollingFrame)

--UnblockedList Ui
UnBlockedListFrame = Instance.new("Frame", MainUi)
UnBlockedListFrame.Position = UDim2.new(0.746, 0,0.505, 0)
UnBlockedListFrame.Size = UDim2.new(0.254, 0,0.495, 0)
UnBlockedListFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UiCorner = Instance.new("UICorner", UnBlockedListFrame)

UnBlockedListSearchBox = Instance.new("TextBox", UnBlockedListFrame)
UnBlockedListSearchBox.Position = UDim2.new(0, 0,0.154, 0)
UnBlockedListSearchBox.Size = UDim2.new(1, 0,0.112, 0)
UnBlockedListSearchBox.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
UnBlockedListSearchBox.BackgroundTransparency = 0.5
UnBlockedListSearchBox.Text = "Search"
UnBlockedListSearchBox.TextScaled = true
UnBlockedListSearchBox.TextStrokeTransparency = 0
UnBlockedListSearchBox.TextStrokeColor3 = Color3.fromRGB(255,255,255)
UiCorner = Instance.new("UICorner", UnBlockedListSearchBox)

UnBlockedListTitle = Instance.new("TextLabel", UnBlockedListFrame)
UnBlockedListTitle.Size = UDim2.new(1, 0,0.154, 0)
UnBlockedListTitle.BackgroundTransparency = 1
UnBlockedListTitle.Text = "Unblocked List"
UnBlockedListTitle.TextScaled = true
UnBlockedListTitle.TextStrokeTransparency = 0
UnBlockedListTitle.TextStrokeColor3 = Color3.fromRGB(206, 206, 206)

UnBlockedListScrollingFrame = Instance.new("ScrollingFrame", UnBlockedListFrame)
UnBlockedListScrollingFrame.Position = UDim2.new(0, 0,0.267, 0)
UnBlockedListScrollingFrame.Size = UDim2.new(1, 0,0.733, 0)
UnBlockedListScrollingFrame.BackgroundTransparency = 1
UnBlockedListScrollingFrame.BorderSizePixel = 0
UnBlockedListScrollingFrame.CanvasSize = UDim2.new(0, 0,750, 0)
UiListLayout = Instance.new("UIListLayout", UnBlockedListScrollingFrame)

StarterGui = game:GetService("StarterGui")
BlockedUserIdTable = {}
BlockedPlayers = {
	[1] = "2092122"
}
NumberId = 0
for _, item in pairs(BlockedPlayers) do
	NumberId=NumberId+1
	BlockedUserIdTable[NumberId] = item
end

function BlockRefresh(PlayerId, NumId)
	if game.Players:GetNameFromUserIdAsync(PlayerId) ~= "someoneyouhate" then
		local PlayerName
		if game.Players:GetPlayerByUserId(PlayerId) then
			PlayerName = game.Players:GetPlayerByUserId(PlayerId)
		else
			PlayerName = game.Players:GetNameFromUserIdAsync(PlayerId)
		end
		local TextBox = Instance.new("TextBox", BlockedListScrollingFrame)
		TextBox.Size = UDim2.new(0.795, 0, 0.00025, 0)
		TextBox.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
		TextBox.BackgroundTransparency = 0.5
		TextBox.BorderSizePixel = 0
		if game.Players:GetPlayerByUserId(PlayerId) then
			TextBox.Text = PlayerName.DisplayName.." ["..PlayerName.Name.."]".." ("..PlayerId..")"
		else
			TextBox.Text = PlayerName.." ("..PlayerId..")"
		end
		TextBox.ClearTextOnFocus = false
		TextBox.TextEditable = false
		TextBox.TextScaled = true
		TextBox.TextStrokeTransparency = 0
		TextBox.TextStrokeColor3 = Color3.fromRGB(163, 163, 163)
		local UnblockButton = Instance.new("ImageButton", TextBox)
		UnblockButton.Position = UDim2.new(1,0,0,0)
		UnblockButton.Size = UDim2.new(0.2,0,1,0)
		UnblockButton.BackgroundTransparency = 0.5
		UnblockButton.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
		UnblockButton.BorderSizePixel = 0
		UnblockButton.Image = "rbxassetid://4458873191"
		UnblockButton.ImageColor3 = Color3.fromRGB(255, 0, 0)
		local NumberId = Instance.new("IntValue", TextBox)
		NumberId.Value = NumId
		UnblockButtonFuction(UnblockButton, NumId)
	end
end

function UnblockRefresh(Player)
	local TextBox = Instance.new("TextBox", UnBlockedListScrollingFrame)
	TextBox.Size = UDim2.new(0.795, 0, 0.00025, 0)
	TextBox.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	TextBox.BackgroundTransparency = 0.5
	TextBox.BorderSizePixel = 0
	TextBox.Text = Player.DisplayName.." ["..Player.Name.."]".." ("..Player.UserId..")"
	TextBox.ClearTextOnFocus = false
	TextBox.TextEditable = false
	TextBox.TextScaled = true
	TextBox.TextStrokeTransparency = 0
	TextBox.TextStrokeColor3 = Color3.fromRGB(163, 163, 163)
	local BlockButton = Instance.new("ImageButton", TextBox)
	BlockButton.Position = UDim2.new(1,0,0,0)
	BlockButton.Size = UDim2.new(0.2,0,1,0)
	BlockButton.BackgroundTransparency = 0.5
	BlockButton.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	BlockButton.BorderSizePixel = 0
	BlockButton.Image = "rbxassetid://4458873815"
	BlockButton.ImageColor3 = Color3.fromRGB(255, 0, 0)
	local UserId = Instance.new("IntValue", TextBox)
	UserId.Value = Player.UserId
	BlockButtonFuction(BlockButton, Player.UserId)
end

function UnblockButtonFuction(UnblockButton, NumId)
	UnblockButton.MouseButton1Click:Connect(function()
		table.remove(BlockedUserIdTable, NumId)

		local Instances = BlockedListScrollingFrame:GetChildren()
		for _,item in pairs(Instances) do
			if item:IsA("TextBox") then
				item:Remove()
			end
		end

		for NumId,PlayerId in pairs(BlockedUserIdTable) do
			BlockRefresh(PlayerId, NumId)
		end
	end)
end

for NumId,PlayerId in pairs(BlockedUserIdTable) do
	BlockRefresh(PlayerId, NumId)
end

function BlockButtonFuction(BlockButton, UserId)
	BlockButton.MouseButton1Click:Connect(function()
		table.insert(BlockedUserIdTable, UserId)

		--UnblockList
		local Instances = UnBlockedListScrollingFrame:GetChildren()
		for _,item in pairs(Instances) do
			if item:IsA("TextBox") then
				item:Remove()
			end
		end

		local PlayerList = game.Players:GetPlayers()
		for _,Player in pairs(PlayerList) do
			local IsBlocked = false
			for _,PlayerId in pairs(BlockedUserIdTable) do
				if PlayerId == Player.UserId then
					IsBlocked = true
				end
			end

			if IsBlocked == false then
				UnblockRefresh(Player)
			end
		end

		--BlockList
		local Instances = BlockedListScrollingFrame:GetChildren()
		for _,item in pairs(Instances) do
			if item:IsA("TextBox") then
				item:Remove()
			end
		end

		for NumId,PlayerId in pairs(BlockedUserIdTable) do
			BlockRefresh(PlayerId, NumId)
		end
	end)
end

local PlayerList = game.Players:GetPlayers()
for _,Player in pairs(PlayerList) do
	local IsBlocked = false
	for _,PlayerId in pairs(BlockedUserIdTable) do
		if PlayerId == Player.UserId then
			IsBlocked = true
		end
	end

	if IsBlocked == false then
		UnblockRefresh(Player)
	end
end

BlockedListScrollingFrame.DescendantRemoving:Connect(function(WhatGotRemoved)
	if WhatGotRemoved:IsA("TextBox") then
		wait()
		local Instances = UnBlockedListScrollingFrame:GetChildren()
		for _, item in pairs(Instances) do
			if item:IsA("TextBox") then
				item:Remove()
			end
		end
		for _,Player in pairs(PlayerList) do
			local IsBlocked = false
			for _,PlayerId in pairs(BlockedUserIdTable) do
				if PlayerId == Player.UserId then
					IsBlocked = true
				end
			end

			if IsBlocked == false then
				UnblockRefresh(Player)
			end
		end
	end
end)

UIS = game:GetService("UserInputService")
function dragify(Frame)
	local dragToggle = nil
	local dragSpeed = 0
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

dragify(BlockedListFrame)
dragify(UnBlockedListFrame)

BlockedPlayersInstancesFolder = Instance.new("Folder", game)
WhileWaitFuction = Instance.new("BindableEvent", game.Players.LocalPlayer)
WhileWaitFuction.Event:Connect(function()
	while wait(1) do
		local PlayerList = game.Players:GetPlayers()
		for _, Player in pairs(PlayerList) do
			local PlayerName = Player.Name
			local IsBlocked = false
			for _, PlayerId in pairs(BlockedUserIdTable) do
				if IsBlocked == false then
					if PlayerId == Player.UserId then
						IsBlocked = true
						pcall(function()
							if not BlockedPlayersInstancesFolder:FindFirstChild(PlayerName) then
								Player.Character.Parent = BlockedPlayersInstancesFolder
								Player.Character:FindFirstChild("Head").Position = Vector3.new(999999,999999,999999)
								--StarterGui:SetCore("PromptBlockPlayer", Player)
							end
						end)
					else
						pcall(function()
							if not workspace:FindFirstChild(PlayerName) then
								Player.Character.Parent = workspace
							end
						end)
					end
				end
			end
		end
	end
end)
WhileWaitFuction:Fire()