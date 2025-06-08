-- Cleanup
if game.CoreGui:FindFirstChild("AtlantisV6UI") then game.CoreGui.AtlantisV6UI:Destroy() end

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

-- GUI Base
local ui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ui.Name = "AtlantisV6UI"
ui.ResetOnSpawn = false
ui.IgnoreGuiInset = true
ui.DisplayOrder = 999999999 -- Maximum GUI order
ui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- Fullscreen base frame
local main = Instance.new("Frame", ui)
main.Size = UDim2.new(1, 0, 1, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BackgroundTransparency = 1 -- Fully transparent background under sidebar
main.Visible = true
main.BorderSizePixel = 0
main.ZIndex = 1

-- Sidebar
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 70, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
sidebar.Position = UDim2.new(0, 0, 0, 0) -- Fixed to left
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 2
sidebar.BackgroundTransparency = 0 -- Solid sidebar

-- Particle Effect for Sidebar
local particleEmitter = Instance.new("ParticleEmitter", sidebar)
particleEmitter.Texture = "rbxassetid://243098098" -- Circle texture
particleEmitter.Lifetime = NumberRange.new(1, 2)
particleEmitter.Rate = 50 -- Increased rate for visibility
particleEmitter.Speed = NumberRange.new(1, 3) -- Slower speed for small particles
particleEmitter.SpreadAngle = Vector2.new(45, 45)
particleEmitter.Size = NumberSequence.new(0.1) -- Small particles
particleEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 50, 50)) -- Red
particleEmitter.Transparency = NumberSequence.new(0.5) -- Darker with transparency
particleEmitter.Enabled = true

-- Atlantis Logo
local atlantisLogo = Instance.new("ImageLabel", sidebar)
atlantisLogo.Image = "rbxassetid://135731490814137" -- Updated logo ID
atlantisLogo.Size = UDim2.new(0, 50, 0, 50)
atlantisLogo.Position = UDim2.new(0.5, 0, 0.05, 0) -- Top of sidebar
atlantisLogo.BackgroundTransparency = 1
atlantisLogo.AnchorPoint = Vector2.new(0.5, 0.5)
atlantisLogo.ZIndex = 3

-- Icons
local editorIcon = Instance.new("ImageButton", sidebar)
editorIcon.Name = "EditorTab"
editorIcon.Image = "rbxassetid://109670722508016"
editorIcon.Size = UDim2.new(0, 50, 0, 50)
editorIcon.Position = UDim2.new(0.5, 0, 0.2, 0)
editorIcon.BackgroundTransparency = 1
editorIcon.ImageColor3 = Color3.fromRGB(255, 100, 100)
editorIcon.AnchorPoint = Vector2.new(0.5, 0.5)
editorIcon.ZIndex = 3

local consoleIcon = Instance.new("ImageButton", sidebar)
consoleIcon.Name = "ConsoleTab"
consoleIcon.Image = "rbxassetid://106604548162273"
consoleIcon.Size = UDim2.new(0, 50, 0, 50)
consoleIcon.Position = UDim2.new(0.5, 0, 0.4, 0)
consoleIcon.BackgroundTransparency = 1
consoleIcon.AnchorPoint = Vector2.new(0.5, 0.5)
consoleIcon.ZIndex = 3

local settingsIcon = Instance.new("ImageButton", sidebar)
settingsIcon.Name = "SettingsTab"
settingsIcon.Image = "rbxassetid://70502264936352"
settingsIcon.Size = UDim2.new(0, 50, 0, 50)
settingsIcon.Position = UDim2.new(0.5, 0, 0.6, 0)
settingsIcon.BackgroundTransparency = 1
settingsIcon.AnchorPoint = Vector2.new(0.5, 0.5)
settingsIcon.ZIndex = 3

local closeBtn = Instance.new("ImageButton", sidebar)
closeBtn.Image = "rbxassetid://84954135153772"
closeBtn.Size = UDim2.new(0, 50, 0, 50)
closeBtn.Position = UDim2.new(0.5, 0, 0.9, 0)
closeBtn.BackgroundTransparency = 1 -- Remove background
closeBtn.BorderSizePixel = 0
closeBtn.AnchorPoint = Vector2.new(0.5, 0.5)
closeBtn.ZIndex = 3

-- Open Button
local openBtn = Instance.new("TextButton", ui)
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(0, 90, 0, 30) -- Right of sidebar
openBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
openBtn.Text = ""
openBtn.Visible = false
openBtn.BorderSizePixel = 0
openBtn.ZIndex = 1000
openBtn.AnchorPoint = Vector2.new(0.5, 0.5)
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)

local openIcon = Instance.new("ImageLabel", openBtn)
openIcon.Image = "rbxassetid://135731490814137"
openIcon.Size = UDim2.new(0.8, 0, 0.8, 0)
openIcon.Position = UDim2.new(0.1, 0, 0.1, 0)
openIcon.BackgroundTransparency = 1
openIcon.ZIndex = 1001

-- Click Sound
local clickSound = Instance.new("Sound", SoundService)
clickSound.SoundId = "rbxassetid://6895079853"
clickSound.Volume = 0.5
clickSound.Looped = false

local function playClickSound()
    clickSound:Play()
end

-- Editor Frame
local editor = Instance.new("Frame", main)
editor.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
editor.Size = UDim2.new(1, -70, 1, 0) -- Full width minus sidebar
editor.Position = UDim2.new(0, 70, 0, 0) -- After sidebar
editor.Visible = true
editor.BorderSizePixel = 0
editor.ZIndex = 2

-- Line Numbers
local lineScroll = Instance.new("ScrollingFrame", editor)
lineScroll.Size = UDim2.new(0, 40, 1, -50)
lineScroll.Position = UDim2.new(0, 5, 0, 45)
lineScroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
lineScroll.BorderSizePixel = 0
lineScroll.ScrollBarThickness = 2
lineScroll.CanvasSize = UDim2.new(0, 0, 0, 0) -- Dynamic sizing
lineScroll.ScrollingEnabled = true
lineScroll.ZIndex = 3

local codeScroll = Instance.new("ScrollingFrame", editor)
codeScroll.Size = UDim2.new(1, -50, 1, -50)
codeScroll.Position = UDim2.new(0, 45, 0, 45)
codeScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
codeScroll.BorderSizePixel = 0
codeScroll.ScrollBarThickness = 4
codeScroll.CanvasSize = UDim2.new(0, 0, 0, 0) -- Dynamic sizing
codeScroll.ScrollingEnabled = true
codeScroll.ZIndex = 3

local codeBox = Instance.new("TextBox", codeScroll)
codeBox.Size = UDim2.new(1, -10, 1, -10)
codeBox.Position = UDim2.new(0, 5, 0, 5)
codeBox.BackgroundTransparency = 1
codeBox.TextColor3 = Color3.new(1, 1, 1)
codeBox.Font = Enum.Font.Code
codeBox.TextSize = 16
codeBox.MultiLine = true
codeBox.ClearTextOnFocus = false
codeBox.TextXAlignment = Enum.TextXAlignment.Left
codeBox.TextYAlignment = Enum.TextYAlignment.Top
codeBox.TextWrapped = false
codeBox.Text = "-- Write script here"
codeBox.ZIndex = 4

local lineText = Instance.new("TextLabel", lineScroll)
lineText.TextColor3 = Color3.new(0.7, 0.7, 0.7)
lineText.Font = Enum.Font.Code
lineText.TextSize = 16
lineText.BackgroundTransparency = 1
lineText.Size = UDim2.new(1, -4, 1, -10)
lineText.Position = UDim2.new(0, 2, 0, 5)
lineText.TextXAlignment = Enum.TextXAlignment.Right
lineText.TextYAlignment = Enum.TextYAlignment.Top
lineText.Text = "1"
lineText.ZIndex = 4

-- Editor Buttons (Fixed Position, Centered Anchor, 3px Higher)
local execBtn = Instance.new("ImageButton", editor)
execBtn.Image = "rbxassetid://130515704356225"
execBtn.Size = UDim2.new(0, 40, 0, 43) -- 3px higher
execBtn.Position = UDim2.new(0, 10, 0, 10) -- Fixed to top-left
execBtn.BackgroundTransparency = 1
execBtn.AnchorPoint = Vector2.new(0.5, 0.5)
execBtn.ZIndex = 5

local clearBtn = Instance.new("ImageButton", editor)
clearBtn.Image = "rbxassetid://89954172160198"
clearBtn.Size = UDim2.new(0, 40, 0, 43) -- 3px higher
clearBtn.Position = UDim2.new(0, 60, 0, 10) -- Fixed next to execute
clearBtn.BackgroundTransparency = 1
clearBtn.AnchorPoint = Vector2.new(0.5, 0.5)
clearBtn.ZIndex = 5

-- Console Frame (Infinite Scrollable)
local console = Instance.new("ScrollingFrame", main)
console.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
console.Size = UDim2.new(1, -70, 1, 0)
console.Position = UDim2.new(0, 70, 0, 0)
console.Visible = false
console.ScrollBarThickness = 4
console.CanvasSize = UDim2.new(0, 0, 0, 0) -- Dynamic sizing
console.BorderSizePixel = 0
console.ZIndex = 2

local consoleText = Instance.new("TextLabel", console)
consoleText.TextColor3 = Color3.new(0.9, 0.9, 0.9)
consoleText.Font = Enum.Font.Code
consoleText.TextSize = 16
consoleText.TextWrapped = true
consoleText.TextXAlignment = Enum.TextXAlignment.Left
consoleText.TextYAlignment = Enum.TextYAlignment.Top
consoleText.Size = UDim2.new(1, -10, 0, 0) -- Dynamic height
consoleText.Position = UDim2.new(0, 5, 0, 5)
consoleText.BackgroundTransparency = 1
consoleText.Text = "[Console Output]:"
consoleText.ZIndex = 3

-- Settings Frame
local settings = Instance.new("Frame", main)
settings.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
settings.Size = UDim2.new(1, -70, 1, 0)
settings.Position = UDim2.new(0, 70, 0, 0)
settings.Visible = false
settings.BorderSizePixel = 0
settings.ZIndex = 2

-- Zoom Buttons (Replace Slider)
local zoomFrame = Instance.new("Frame", settings)
zoomFrame.Size = UDim2.new(0, 300, 0, 80)
zoomFrame.Position = UDim2.new(0.5, -150, 0.3, -40)
zoomFrame.BackgroundTransparency = 1
zoomFrame.ZIndex = 3

local zoom0_5Btn = Instance.new("TextButton", zoomFrame)
zoom0_5Btn.Size = UDim2.new(0, 80, 0, 40)
zoom0_5Btn.Position = UDim2.new(0, 20, 0, 0)
zoom0_5Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
zoom0_5Btn.Text = "x0.5 zoom"
zoom0_5Btn.TextColor3 = Color3.new(1, 1, 1)
zoom0_5Btn.Font = Enum.Font.GothamBold
zoom0_5Btn.TextSize = 14
zoom0_5Btn.BorderSizePixel = 0
zoom0_5Btn.ZIndex = 4
Instance.new("UICorner", zoom0_5Btn).CornerRadius = UDim.new(0, 5)

local zoom1Btn = Instance.new("TextButton", zoomFrame)
zoom1Btn.Size = UDim2.new(0, 80, 0, 40)
zoom1Btn.Position = UDim2.new(0, 110, 0, 0)
zoom1Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
zoom1Btn.Text = "x1 zoom"
zoom1Btn.TextColor3 = Color3.new(1, 1, 1)
zoom1Btn.Font = Enum.Font.GothamBold
zoom1Btn.TextSize = 14
zoom1Btn.BorderSizePixel = 0
zoom1Btn.ZIndex = 4
Instance.new("UICorner", zoom1Btn).CornerRadius = UDim.new(0, 5)

local zoom2Btn = Instance.new("TextButton", zoomFrame)
zoom2Btn.Size = UDim2.new(0, 80, 0, 40)
zoom2Btn.Position = UDim2.new(0, 200, 0, 0)
zoom2Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
zoom2Btn.Text = "x2 zoom"
zoom2Btn.TextColor3 = Color3.new(1, 1, 1)
zoom2Btn.Font = Enum.Font.GothamBold
zoom2Btn.TextSize = 14
zoom2Btn.BorderSizePixel = 0
zoom2Btn.ZIndex = 4
Instance.new("UICorner", zoom2Btn).CornerRadius = UDim.new(0, 5)

-- Dev Console Toggle (Open Only)
local devConsoleToggle = Instance.new("TextButton", settings)
devConsoleToggle.Size = UDim2.new(0, 200, 0, 40)
devConsoleToggle.Position = UDim2.new(0.5, -100, 0.5, -20)
devConsoleToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
devConsoleToggle.Text = "Open Dev Console"
devConsoleToggle.TextColor3 = Color3.new(1, 1, 1)
devConsoleToggle.Font = Enum.Font.GothamBold
devConsoleToggle.TextSize = 16
devConsoleToggle.BorderSizePixel = 0
devConsoleToggle.AnchorPoint = Vector2.new(0.5, 0.5)
devConsoleToggle.ZIndex = 3
Instance.new("UICorner", devConsoleToggle).CornerRadius = UDim.new(0, 10)

-- UI Scale Logic
local currentScale = 1
local function updateZoom(scale)
    currentScale = scale
    main.Size = UDim2.new(1 * scale, 0, 1 * scale, 0)
    sidebar.Size = UDim2.new(0, 70 * scale, 1 * scale, 0)
    editor.Size = UDim2.new(1 * scale, -70 * scale, 1 * scale, 0)
    console.Size = UDim2.new(1 * scale, -70 * scale, 1 * scale, 0)
    settings.Size = UDim2.new(1 * scale, -70 * scale, 1 * scale, 0)
    codeScroll.CanvasSize = UDim2.new(0, 0, 0, codeBox.TextBounds.Y * scale + 10)
    lineScroll.CanvasSize = UDim2.new(0, 0, 0, codeBox.TextBounds.Y * scale + 10)
    console.CanvasSize = UDim2.new(0, 0, 0, consoleText.TextBounds.Y * scale + 10)
end

zoom0_5Btn.MouseButton1Click:Connect(function()
    playClickSound()
    updateZoom(0.5)
end)

zoom1Btn.MouseButton1Click:Connect(function()
    playClickSound()
    updateZoom(1)
end)

zoom2Btn.MouseButton1Click:Connect(function()
    playClickSound()
    updateZoom(2)
end)

-- Sync Scrolling and Update CanvasSize
local function updateScrollAndLines()
    local lines = ""
    local count = #codeBox.Text:split("\n")
    for i = 1, count do lines = lines .. i .. "\n" end
    lineText.Text = lines
    local textBounds = codeBox.TextBounds.Y * currentScale
    codeScroll.CanvasSize = UDim2.new(0, 0, 0, math.max(textBounds, codeScroll.AbsoluteSize.Y) + 10)
    lineScroll.CanvasSize = UDim2.new(0, 0, 0, math.max(textBounds, lineScroll.AbsoluteSize.Y) + 10)
    codeScroll.ScrollingEnabled = true
    lineScroll.ScrollingEnabled = true
end

codeBox:GetPropertyChangedSignal("Text"):Connect(updateScrollAndLines)
codeScroll.Changed:Connect(function(prop)
    if prop == "CanvasPosition" then
        lineScroll.CanvasPosition = codeScroll.CanvasPosition
    end
end)
updateScrollAndLines()

-- Console Infinite Scroll
local function updateConsoleScroll()
    local textBounds = consoleText.TextBounds.Y * currentScale
    console.CanvasSize = UDim2.new(0, 0, 0, math.max(textBounds, console.AbsoluteSize.Y) + 10)
end

game:GetService("LogService").MessageOut:Connect(function(msg, msgType)
    consoleText.Text = consoleText.Text .. "\n[" .. msgType.Name .. "]: " .. msg
    updateConsoleScroll()
end)
updateConsoleScroll()

execBtn.MouseButton1Click:Connect(function()
    clickAnimation(execBtn)
    local success, err = pcall(function()
        loadstring(codeBox.Text)()
    end)
    if success then
        consoleText.Text = consoleText.Text .. "\n[Success]: Executed."
    else
        consoleText.Text = consoleText.Text .. "\n[Error]: " .. tostring(err)
    end
    updateConsoleScroll()
end)

clearBtn.MouseButton1Click:Connect(function()
    clickAnimation(clearBtn)
    codeBox.Text = ""
end)

editorIcon.MouseButton1Click:Connect(function()
    clickAnimation(editorIcon)
    toggleTab("editor", editor)
end)

consoleIcon.MouseButton1Click:Connect(function()
    clickAnimation(consoleIcon)
    toggleTab("console", console)
end)

settingsIcon.MouseButton1Click:Connect(function()
    clickAnimation(settingsIcon)
    toggleTab("settings", settings)
end)

closeBtn.MouseButton1Click:Connect(function()
    clickAnimation(closeBtn)
    main.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    clickAnimation(openBtn)
    main.Visible = true
    openBtn.Visible = false
end)

-- Draggable Open Button
local dragging, dragStart, startPos
openBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = openBtn.Position
        openBtn.ZIndex = 1001 -- Ensure it stays on top while dragging
    end
end)

openBtn.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
        openBtn.Position = newPos
    end
end)

openBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
        openBtn.ZIndex = 1000 -- Reset ZIndex
    end
end)
