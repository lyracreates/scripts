-- Gui to Lua
-- Version: 3.2

local SG = Instance.new("ScreenGui")
SG.Name = "ScreenGui"
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.DisplayOrder = math.huge

local CG = Instance.new("CanvasGroup")
CG.Position = UDim2.new(0.449, 0 , 0.419, 0)
CG.Size = UDim2.new(0.102, 0 , 0.163, 0)
CG.BackgroundTransparency = 1
CG.GroupTransparency = 1
CG.Parent = SG
CG.ZIndex = math.huge

local ratio = Instance.new("UIAspectRatioConstraint")

ratio.Parent = CG

-- Instances:

local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local UIStroke = Instance.new("UIStroke")
local UIStroke2 = Instance.new("UIStroke")

--Properties:

Frame.Parent = CG
Frame.BackgroundColor3 = Color3.fromRGB(0, 76, 164)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.100877076, 0, 0.109999999, 0)
Frame.Size = UDim2.new(0.779999971, 0, 0.910000026, 0)

UIStroke2.Name = "UIStroke"
UIStroke2.Color = Color3.fromRGB(49, 141, 210)
UIStroke2.Thickness = 2
UIStroke2.Parent = TextLabel

UIStroke.Name = "UIStroke"
UIStroke.Color = Color3.fromRGB(21, 104, 184)
UIStroke.Thickness = 4
UIStroke.Parent = Frame

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.101110838, 0, 0.101111144, 0)
TextLabel.Size = UDim2.new(0.800370336, 0, 0.790370345, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Xe"
TextLabel.TextColor3 = Color3.fromRGB(161, 194, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UITextSizeConstraint.Parent = TextLabel

UIAspectRatioConstraint.Parent = TextLabel

UIAspectRatioConstraint_2.Parent = Frame

repeat task.wait() until game:IsLoaded()
task.wait(1)

SG.Parent = game:GetService("Players").LocalPlayer.PlayerGui

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

local function TweenTransparency(t)
	return TweenService:Create(CG, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
		GroupTransparency = t,
	})
end

local function loadXenon()
	local games = HttpService:JSONDecode(game:HttpGet("https://github.com/lyracreates/scripts/blob/main/xenon/gamelist.json", true))

	local filename = games[tostring(game.GameId)]
	
	return function()
        pcall(loadstring, game:HttpGet(("https://github.com/lyracreates/scripts/blob/main/xenon/%s"):format(filename), true))
	end
end

task.wait(1)
TweenTransparency(0):Play()
local l = loadXenon()
task.wait(2)
TweenTransparency(1):Play()
task.wait(1)
coroutine.resume(coroutine.create(l))