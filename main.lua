-- [[ THÔNG BÁO KHI LOAD SCRIPT ]]
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "★ mrghost hub ★",
    Text = "Đang tải dữ liệu, vui lòng chờ...",
    Duration = 4
})

-- 1. Khởi tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local MainMenu = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleLightBtn = Instance.new("TextButton")
local OpenBtn = Instance.new("TextButton")

ScreenGui.Name = "MrGhostHub_Mini"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function addCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
end

-- 2. Cấu hình MENU MINI
MainMenu.Name = "MainMenu"
MainMenu.Parent = ScreenGui
MainMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainMenu.Position = UDim2.new(0.4, 0, 0.4, 0)
MainMenu.Size = UDim2.new(0, 200, 0, 120)
MainMenu.Active = true
MainMenu.Selectable = true
addCorner(MainMenu, 10)

-- Viền bảy màu cho Menu
local MenuStroke = Instance.new("UIStroke")
MenuStroke.Thickness = 2.5
MenuStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MenuStroke.Parent = MainMenu

-- Tiêu đề
Title.Name = "Title"
Title.Parent = MainMenu
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "★ mrghost hub ★"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
addCorner(Title, 10)

-- Nút Tắt/Bật Full Light Mini
ToggleLightBtn.Name = "ToggleLightBtn"
ToggleLightBtn.Parent = MainMenu
ToggleLightBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
ToggleLightBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
ToggleLightBtn.Size = UDim2.new(0.8, 0, 0, 40)
ToggleLightBtn.Font = Enum.Font.SourceSansBold
ToggleLightBtn.Text = "Full Light: OFF"
ToggleLightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLightBtn.TextSize = 15
addCorner(ToggleLightBtn, 6)

-- 3. Cấu hình Nút Con Ma 👻
OpenBtn.Name = "GhostToggleBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
OpenBtn.BackgroundTransparency = 0.2
OpenBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
OpenBtn.Size = UDim2.new(0, 55, 0, 55)
OpenBtn.Font = Enum.Font.SourceSans
OpenBtn.Text = "👻"
OpenBtn.TextSize = 32
OpenBtn.Visible = true
addCorner(OpenBtn, 100)

local GhostStroke = Instance.new("UIStroke")
GhostStroke.Thickness = 2.5
GhostStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
GhostStroke.Parent = OpenBtn

--- 4. Hiệu ứng Chroma / RGB ---
task.spawn(function()
    local speed = 0.5
    while true do
        for hue = 0, 1, 1/360 do
            local color = Color3.fromHSV(hue, 1, 1)
            MenuStroke.Color = color
            GhostStroke.Color = color
            task.wait(1/360 * speed)
        end
    end
end)

--- 5. Hàm di chuyển kéo thả (Draggable) ---
local function makeDraggable(frame)
    local UserInputService = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(MainMenu)
makeDraggable(OpenBtn)

--- 6. Logic Ẩn / Hiện Menu bằng Con Ma ---
OpenBtn.MouseButton1Click:Connect(function()
    MainMenu.Visible = not MainMenu.Visible
end)

--- 7. Logic Chức năng FULL LIGHT ---
local LightEnabled = false
local Lighting = game:GetService("Lighting")

local originalAmbient = Lighting.Ambient
local originalOutdoorAmbient = Lighting.OutdoorAmbient
local originalBrightness = Lighting.Brightness
local originalClockTime = Lighting.ClockTime
local originalShadows = Lighting.GlobalShadows

ToggleLightBtn.MouseButton1Click:Connect(function()
    LightEnabled = not LightEnabled
    
    if LightEnabled then
        ToggleLightBtn.Text = "Full Light: ON"
        ToggleLightBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 40)
        
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 3
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
    else
        ToggleLightBtn.Text = "Full Light: OFF"
        ToggleLightBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        
        Lighting.Ambient = originalAmbient
        Lighting.OutdoorAmbient = originalOutdoorAmbient
        Lighting.Brightness = originalBrightness
        Lighting.ClockTime = originalClockTime
        Lighting.GlobalShadows = originalShadows
    end
end)

-- Thông báo khi đã load xong hoàn toàn
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "★ mrghost hub ★",
    Text = "Đã kích hoạt! Bấm nút 👻 để ẩn/hiện menu.",
    Duration = 5
})
print("[★ mrghost hub ★] Loaded successfully!")
 
