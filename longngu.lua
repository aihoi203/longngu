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
local textBox = Instance.new("TextBox", frame)
textBox.Size = UDim2.new(0, 300, 0, 40)
textBox.Position = UDim2.new(0.5, -150, 0.5, -20)
textBox.PlaceholderText = "Enter key..."
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 20
textBox.TextColor3 = Color3.new(1,1,1)
textBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 8)

-- Watermark with black background
local watermarkFrame = Instance.new("Frame", screenGui)
watermarkFrame.AnchorPoint = Vector2.new(1, 1)
watermarkFrame.Position = UDim2.new(1, -10, 1, -10)
watermarkFrame.Size = UDim2.new(0, 180, 0, 25)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
watermarkFrame.Visible = false
Instance.new("UICorner", watermarkFrame).CornerRadius = UDim.new(0, 10)

local watermark = Instance.new("TextLabel", watermarkFrame)
watermark.Text = "kill aura by BensGaming"
watermark.Size = UDim2.new(1, 0, 1, 0)
watermark.TextSize = 14
watermark.TextColor3 = Color3.new(1, 1, 1)
watermark.BackgroundTransparency = 1
watermark.Font = Enum.Font.Gotham

-- Key check
textBox.FocusLost:Connect(function()
	if textBox.Text == "bensgamingontop" then
		frame:Destroy()
		watermarkFrame.Visible = true

		-- Kill Aura Start
		local function getNearbyTargets()
			local targets = {}
			local char = LocalPlayer.Character
			if not char or not char:FindFirstChild("HumanoidRootPart") then return {} end
			local pos = char.HumanoidRootPart.Position

			for _, npc in pairs(workspace:GetDescendants()) do
				if npc:IsA("Model") and npc ~= char and npc:FindFirstChildOfClass("Humanoid") then
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
				task.wait(0.25)
				for _, target in pairs(getNearbyTargets()) do
					local hum = target:FindFirstChildOfClass("Humanoid")
					if hum and hum.Health > 0 then
						hum:TakeDamage(9999)
					elseif hum and hum.Health <= 0 then
						-- Failsafe: remove NPC if still there
						task.delay(1, function()
							if hum.Health <= 0 and target.Parent then
								target:Destroy()
							end
						end)
					end
				end
			end
		end)
	else
		textBox.Text = ""
		textBox.PlaceholderText = "Incorrect key!"
	end
end)
