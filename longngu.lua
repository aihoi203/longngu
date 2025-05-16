--// Key System by bensgamingontop - Pretty UI Version

-- SETTINGS
local correctKey = "bensgamingontop"

-- SERVICES
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- UI SETUP
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "KeySystemUI"

-- Background Blur
local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
blur.Size = 10

-- Main Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 220)
Frame.Position = UDim2.new(0.5, -200, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.ClipsDescendants = true

-- Rounded Corners
local corner = Instance.new("UICorner", Frame)
corner.CornerRadius = UDim.new(0, 20)

-- Title
local title = Instance.new("TextLabel", Frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.Text = "🔑 Enter key to continue"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 24

-- Input Box
local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.PlaceholderText = "Enter key here..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 18

local inputCorner = Instance.new("UICorner", TextBox)
inputCorner.CornerRadius = UDim.new(0, 12)

-- Submit Button
local Submit = Instance.new("TextButton", Frame)
Submit.Text = "✔️ Success"
Submit.Size = UDim2.new(0.6, 0, 0, 40)
Submit.Position = UDim2.new(0.2, 0, 0.7, 0)
Submit.BackgroundColor3 = Color3.fromRGB(60, 120, 250)
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
Submit.Font = Enum.Font.GothamBold
Submit.TextSize = 20

local btnCorner = Instance.new("UICorner", Submit)
btnCorner.CornerRadius = UDim.new(0, 12)

-- Hover effect
local function hover(button, enterColor, leaveColor)
	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = enterColor}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = leaveColor}):Play()
	end)
end

hover(Submit, Color3.fromRGB(80, 150, 255), Submit.BackgroundColor3)

-- KILL ALL FUNCTION
local function killAll()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.Health = 0
            end
        end
    end
end

-- On Submit
Submit.MouseButton1Click:Connect(function()
	if TextBox.Text == correctKey then
		blur:Destroy()
		ScreenGui:Destroy()

		-- Create Kill All Button
		local killGui = Instance.new("ScreenGui", CoreGui)
		killGui.Name = "KillAllGui"

		local killBtn = Instance.new("TextButton", killGui)
		killBtn.Size = UDim2.new(0, 120, 0, 40)
		killBtn.Position = UDim2.new(1, -130, 0, 20)
		killBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		killBtn.Text = "💀 KILL ALL"
		killBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		killBtn.Font = Enum.Font.GothamBold
		killBtn.TextSize = 18

		local btnKillCorner = Instance.new("UICorner", killBtn)
		btnKillCorner.CornerRadius = UDim.new(0, 12)

		hover(killBtn, Color3.fromRGB(220, 80, 80), killBtn.BackgroundColor3)

		killBtn.MouseButton1Click:Connect(function()
			killAll()
		end)
	else
		TextBox.Text = "❌ Wrong key!"
	end
end)
