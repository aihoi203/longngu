-- Script này đặt trong StarterGui, dạng LocalScript

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LongNguUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Tạo nền đen full màn hình
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.Parent = screenGui

-- Tạo chữ "Long Ngu" ở giữa
local mainText = Instance.new("TextLabel")
mainText.Size = UDim2.new(1, 0, 0.5, 0)
mainText.Position = UDim2.new(0, 0, 0.25, 0)
mainText.BackgroundTransparency = 1
mainText.Text = "Long Ngu"
mainText.TextColor3 = Color3.new(1, 1, 1)
mainText.Font = Enum.Font.GothamBlack
mainText.TextScaled = true
mainText.Parent = background

-- Tạo chữ "Phú DZ" nằm dưới
local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1, 0, 0.5, 0)
subText.Position = UDim2.new(0, 0, 0.5, 0) -- nằm bên dưới dòng trên
subText.BackgroundTransparency = 1
subText.Text = "Phú Đẹp trai"
subText.TextColor3 = Color3.new(1, 1, 1)
subText.Font = Enum.Font.GothamBold
subText.TextScaled = true
subText.Parent = background
