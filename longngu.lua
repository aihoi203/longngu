-- INIT
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Name = "BensGamingUI"

-- BLUR background
local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
blur.Size = 24

-- BACKGROUND frame
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.BackgroundTransparency = 0.3

-- CENTER panel
local panel = Instance.new("Frame", bg)
panel.Size = UDim2.new(0, 400, 0, 250)
panel.Position = UDim2.new(0.5, -200, 0.5, -125)
panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
panel.BorderSizePixel = 0
panel.BackgroundTransparency = 0.1
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 12)

-- TITLE
local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "BensGaming Access"
title.TextColor3 = Color3.fromRGB(0, 255, 128)
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.BackgroundTransparency = 1

-- SHADOW
local shadow = Instance.new("Frame", panel)
shadow.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
shadow.Size = UDim2.new(1, 0, 0, 2)
shadow.Position = UDim2.new(0, 0, 0, 50)

-- INPUT
local input = Instance.new("TextBox", panel)
input.PlaceholderText = "Enter access key..."
input.Size = UDim2.new(0.8, 0, 0, 40)
input.Position = UDim2.new(0.1, 0, 0.45, 0)
input.TextSize = 18
input.Font = Enum.Font.Gotham
input.TextColor3 = Color3.new(1,1,1)
input.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

-- BUTTON
local confirm = Instance.new("TextButton", panel)
confirm.Size = UDim2.new(0.5, 0, 0, 40)
confirm.Position = UDim2.new(0.25, 0, 0.7, 0)
confirm.Text = "UNLOCK"
confirm.TextSize = 18
confirm.TextColor3 = Color3.new(1,1,1)
confirm.Font = Enum.Font.GothamBold
confirm.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
Instance.new("UICorner", confirm).CornerRadius = UDim.new(0, 8)

-- Unlock logic
local function unlock()
	if input.Text == "bensgamingontop" then
		bg:Destroy()
		blur:Destroy()

		-- Watermark
		local markFrame = Instance.new("Frame", gui)
		markFrame.AnchorPoint = Vector2.new(1, 1)
		markFrame.Position = UDim2.new(1, -10, 1, -10)
		markFrame.Size = UDim2.new(0, 180, 0, 25)
		markFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		markFrame.BackgroundTransparency = 0.3
		Instance.new("UICorner", markFrame).CornerRadius = UDim.new(0, 8)

		local mark = Instance.new("TextLabel", markFrame)
		mark.Size = UDim2.new(1, 0, 1, 0)
		mark.BackgroundTransparency = 1
		mark.Text = "kill aura by BensGaming"
		mark.TextColor3 = Color3.new(0, 255, 128)
		mark.TextSize = 14
		mark.Font = Enum.Font.GothamSemibold

		-- [CALL KILL AURA FUNCTION HERE]
	else
		input.Text = ""
		input.PlaceholderText = "Wrong key!"
	end
end

confirm.MouseButton1Click:Connect(unlock)
