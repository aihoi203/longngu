-- UI Setup
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Black overlay
local frame = Instance.new("Frame", screenGui)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.ZIndex = 10

-- Input Box
local textBox = Instance.new("Enter key here..", frame)
textBox.Size = UDim2.new(0, 300, 0, 40)
textBox.Position = UDim2.new(0.5, -150, 0.5, -20)
textBox.PlaceholderText = "Enter key..."
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 20
textBox.TextColor3 = Color3.new(1,1,1)
textBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 8)

-- Watermark (hidden initially)
local watermark = Instance.new("TextLabel", screenGui)
watermark.Text = "kill aura by BensGaming"
watermark.Position = UDim2.new(1, -180, 1, -30)
watermark.AnchorPoint = Vector2.new(1, 1)
watermark.Size = UDim2.new(0, 180, 0, 20)
watermark.TextSize = 14
watermark.TextColor3 = Color3.new(1, 1, 1)
watermark.BackgroundTransparency = 1
watermark.Visible = false

-- Key check
textBox.FocusLost:Connect(function()
	if textBox.Text == "bensgamingontop" then
		frame:Destroy()
		watermark.Visible = true

		-- Kill Aura Start
		local function getNearbyTargets()
			local targets = {}
			local char = LocalPlayer.Character
			if not char or not char:FindFirstChild("HumanoidRootPart") then return {} end
			local pos = char.HumanoidRootPart.Position

			for _, npc in pairs(workspace:GetDescendants()) do
				if npc:IsA("Model") and npc:FindFirstChildOfClass("Humanoid") and npc ~= char then
					local root = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso")
					if root and (root.Position - pos).Magnitude < 20 then
						table.insert(targets, npc)
					end
				end
			end

			return targets
		end

		task.spawn(function()
			while true do
				task.wait(0.2)
				for _, target in pairs(getNearbyTargets()) do
					local hum = target:FindFirstChildOfClass("Humanoid")
					if hum and hum.Health > 0 then
						hum.Health = 0 -- Local kill, visible to you (real kill requires RemoteEvent or tool)
					end
				end
			end
		end)
	else
		textBox.Text = ""
		textBox.PlaceholderText = "Incorrect key!"
	end
end)
