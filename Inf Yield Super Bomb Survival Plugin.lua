local PluginName = "SBSE"

writefile(PluginName..".iy",[[

local function getroot(speaker: plr): BasePart
	local char = speaker.Character
	local Humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
	return Humanoid and Humanoid.RootPart or char and char.PrimaryPart
end

local UIS = game:GetService("UserInputService")

keycodeMap = {
	["0"] = 0x30,
	["1"] = 0x31,
	["2"] = 0x32,
	["3"] = 0x33,
	["4"] = 0x34,
	["5"] = 0x35,
	["6"] = 0x36,
	["7"] = 0x37,
	["8"] = 0x38,
	["9"] = 0x39,
	["a"] = 0x41,
	["b"] = 0x42,
	["c"] = 0x43,
	["d"] = 0x44,
	["e"] = 0x45,
	["f"] = 0x46,
	["g"] = 0x47,
	["h"] = 0x48,
	["i"] = 0x49,
	["j"] = 0x4A,
	["k"] = 0x4B,
	["l"] = 0x4C,
	["m"] = 0x4D,
	["n"] = 0x4E,
	["o"] = 0x4F,
	["p"] = 0x50,
	["q"] = 0x51,
	["r"] = 0x52,
	["s"] = 0x53,
	["t"] = 0x54,
	["u"] = 0x55,
	["v"] = 0x56,
	["w"] = 0x57,
	["x"] = 0x58,
	["y"] = 0x59,
	["z"] = 0x5A,
	["enter"] = 0x0D,
	["shift"] = 0x10,
	["ctrl"] = 0x11,
	["alt"] = 0x12,
	["pause"] = 0x13,
	["capslock"] = 0x14,
	["spacebar"] = 0x20,
	["space"] = 0x20,
	["pageup"] = 0x21,
	["pagedown"] = 0x22,
	["end"] = 0x23,
	["home"] = 0x24,
	["left"] = 0x25,
	["up"] = 0x26,
	["right"] = 0x27,
	["down"] = 0x28,
	["insert"] = 0x2D,
	["delete"] = 0x2E,
	["f1"] = 0x70,
	["f2"] = 0x71,
	["f3"] = 0x72,
	["f4"] = 0x73,
	["f5"] = 0x74,
	["f6"] = 0x75,
	["f7"] = 0x76,
	["f8"] = 0x77,
	["f9"] = 0x78,
	["f10"] = 0x79,
	["f11"] = 0x7A,
	["f12"] = 0x7B,
}

local CandyEsp = false
local CoinEsp = false


local function CandyHighlight(Item)

    local H = Instance.new("Highlight", Item)
    H.Name = "EspH"
    H.FillColor = Color3.fromRGB(255, 128, 0)
    
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

local function CoinHighlight(Item)

    local H = Instance.new("Highlight", Item)
    H.Name = "EspH"
    H.FillColor = Color3.fromRGB(255, 255, 0)
    
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

local Plugin = {
	["PluginName"] = "Super Bomb Survival Exploit",
	["PluginDescription"] = "Made by Cateh",
	["Commands"] = {
		["CandyEsp"] = {
			["ListName"] = "CandyEsp",
			["Description"] = "Esp for candys",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				CandyEsp = not CandyEsp
				
				if CandyEsp then
					notify("Notice", "CandyEsp Enabled")
				else
					notify("Notice", "CandyEsp Disabled")
				end
				
				while CandyEsp do wait()
					for i,v in pairs(workspace.Bombs:GetChildren()) do
						if v.Name:lower():find("candy") and not v:FindFirstChild("EspH") then print(1)
							CandyHighlight(v)
						end
					end
				end
			end
		},
		["CoinEsp"] = {
			["ListName"] = "CoinEsp",
			["Description"] = "Esp for coins",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				CoinEsp = not CoinEsp
				
				if CoinEsp then
					notify("Notice", "CoinEsp Enabled")
				else
					notify("Notice", "CoinEsp Disabled")
				end
				
				while CoinEsp do wait()
					for i,v in pairs(workspace.Bombs:GetChildren()) do
						if v.Name:lower():find("coin") and not v:FindFirstChild("EspH") then print(1)
							CoinHighlight(v)
						end
					end
				end
			end
		},
	}
}
return Plugin
]])

local success = pcall(function() readfile(PluginName..".iy") end) if success then for i=1,499 do print("--uploaded plugin--") end print([[
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- uploaded plugin ---------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
]]) end