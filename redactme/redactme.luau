repeat task.wait() until game:IsLoaded()

-- Character Anonymizer (turns character into something unrecognizable)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local plr = Players.LocalPlayer

local replacer = (getfenv or function() return {} end)().RedactMeName or "yournamehere"

function characterPartAdded(obj: Instance)
    if obj:IsA("Accessory") or obj:IsA("ShirtGraphic") or obj:IsA("Clothing") or obj:IsA("Decal") then
        obj:Destroy()
    end

    if obj:IsA("BodyColors") then
        obj.HeadColor = BrickColor.new("Medium stone grey")
        obj.LeftArmColor = BrickColor.new("Medium stone grey")
        obj.LeftLegColor = BrickColor.new("Medium stone grey")
        obj.RightArmColor = BrickColor.new("Medium stone grey")
        obj.RightLegColor = BrickColor.new("Medium stone grey")
        obj.TorsoColor = BrickColor.new("Medium stone grey")
    end
end

function characterAdded(c, init)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = c
    highlight.Parent = game:GetService("CoreGui")
    highlight.OutlineTransparency = 1
    highlight.FillColor = Color3.new(0,0,0)
    highlight.FillTransparency = 0

    if not init then 
        RunService.RenderStepped:Wait()
        task.wait(.75)
    end
    for _, v in pairs(c:GetDescendants()) do characterPartAdded(v) end
    c.DescendantAdded:Connect(characterPartAdded)

    highlight:Destroy()
end

plr.CharacterAdded:Connect(characterAdded)
if plr.Character then 
    task.spawn(pcall, characterAdded, plr.Character, true)
end

-- Name Anonymizer (WIP)

function exe(f, ...)
    local args = {...}
    return function() f(table.unpack(args)) end
end

function changed(obj, init)
    if init then obj.Changed:Connect(exe(changed, obj)) end

    if obj:IsA("GuiObject") and (obj:IsA("TextLabel") or obj:IsA("TextButton")) then
        obj.Text = obj.Text:gsub(plr.Name, replacer)
    end
end

game.DescendantAdded:Connect(function(obj) changed(obj, true) end)

for _, v in pairs(game:GetDescendants()) do changed(v, true) end
