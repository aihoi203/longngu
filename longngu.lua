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

-- Tạo chữ "Long Ngu" to, trắng, ở giữa
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0) -- phủ toàn màn hình
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Long Ngu"
textLabel.TextColor3 = Color3.new(1, 1, 1) -- màu trắng
textLabel.Font = Enum.Font.GothamBlack -- font đậm, đẹp
textLabel.TextScaled = true -- tự động phóng to hết mức
textLabel.Parent = background
