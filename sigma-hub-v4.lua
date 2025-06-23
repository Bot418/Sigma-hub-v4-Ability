-- Sigma Hub V4 - Blue & White Theme with Tabs (Exploit + Main) local Players = game:GetService("Players") local RunService = game:GetService("RunService") local LocalPlayer = Players.LocalPlayer

-- Notification Loaded pcall(function() game.StarterGui:SetCore("SendNotification", { Title = "Sigma Hub V4", Text = "Loaded Successfully!", Duration = 5 }) end)

-- GUI Setup local ScreenGui = Instance.new("ScreenGui", game.CoreGui) ScreenGui.Name = "SigmaHub"

local MainFrame = Instance.new("Frame", ScreenGui) MainFrame.Size = UDim2.new(0, 500, 0, 320) MainFrame.Position = UDim2.new(0.25, 0, 0.25, 0) MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) MainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", MainFrame)

-- Tabs Button Panel local TabButtons = Instance.new("Frame", MainFrame) TabButtons.Size = UDim2.new(0, 120, 1, 0) TabButtons.BackgroundColor3 = Color3.fromRGB(0, 100, 255)

-- Pages Container local Pages = Instance.new("Folder", MainFrame) Pages.Name = "Pages"

local ExploitPage = Instance.new("Frame", Pages) ExploitPage.Name = "Exploit" ExploitPage.Size = UDim2.new(1, -120, 1, 0) ExploitPage.Position = U

