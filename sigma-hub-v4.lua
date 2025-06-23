-- Sigma Hub V4 with Tab Menu, Berry Theme, Scrolling & Loaded Notification
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Loaded Notification
game.StarterGui:SetCore("SendNotification", {
	Title = "Sigma Hub V4",
	Text = "Loaded successfully!",
	Duration = 5
})

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Tabs = Instance.new("Frame")
local TabFrame = Instance.new("ScrollingFrame")

ScreenGui.Name = "SigmaHub"
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.BackgroundTransparency = 0.05

UICorner.Parent = MainFrame

Tabs.Name = "Tabs"
Tabs.Parent = MainFrame
Tabs.BackgroundColor3 = Color3.fromRGB(152, 0, 76) -- Berry
Tabs.Size = UDim2.new(0, 120, 1, 0)
Tabs.BorderSizePixel = 0

TabFrame.Name = "TabFrame"
TabFrame.Parent = MainFrame
TabFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
TabFrame.Position = UDim2.new(0, 120, 0, 0)
TabFrame.Size = UDim2.new(1, -120, 1, 0)
TabFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
TabFrame.ScrollBarThickness = 5
TabFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabFrame.ScrollingDirection = Enum.ScrollingDirection.Y

-- Function to create toggle buttons
local buttonCount = 0
local function createToggleButton(name, action)
	local button = Instance.new("TextButton")
	button.Text = name
	button.Size = UDim2.new(1, -20, 0, 40)
	button.Position = UDim2.new(0, 10, 0, 10 + (buttonCount * 50))
	button.BackgroundColor3 = Color3.fromRGB(152, 0, 76)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 18
	button.Parent = TabFrame
	buttonCount += 1
	button.MouseButton1Click:Connect(action)
end

-- Unnoclip Toggle
local noclip = false
local noclipConn

createToggleButton("Unnoclip Toggle", function()
	noclip = not noclip
	if noclip then
		noclipConn = RunService.Stepped:Connect(function()
			if LocalPlayer.Character then
				for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end)
	else
		if noclipConn then
			noclipConn:Disconnect()
		end
	end
end)

-- Unspeed Toggle
local speedEnabled = false
createToggleButton("UnSpeed Toggle", function()
	speedEnabled = not speedEnabled
	local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = speedEnabled and 50 or 16
	end
end)
