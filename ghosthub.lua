local Window = Library:CreateWindow({
   Name = "Ghost Hub - Blox Fruits",
   LoadingTitle = "Ghost Hub",
   LoadingSubtitle = "by Ghost",
   ConfigurationSaving = {Enabled = false}
})

-- Tabs
local FarmTab = Window:CreateTab("Auto Farm",4483362458)
local BossTab = Window:CreateTab("Boss",4483362458)
local FruitTab = Window:CreateTab("Fruits",4483362458)
local RaidTab = Window:CreateTab("Raid",4483362458)
local EspTab = Window:CreateTab("ESP",4483362458)
local SeaTab = Window:CreateTab("Sea Events",4483362458)

local player = game.Players.LocalPlayer

-------------------------------------------------
-- AUTO BOAT
-------------------------------------------------

function AutoBoat()

local boat = workspace:FindFirstChild("Boat")

if not boat then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat","Dinghy")
task.wait(2)
end

end

-------------------------------------------------
-- RIGHT CTRL HUB
-------------------------------------------------

local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input)

if input.KeyCode == Enum.KeyCode.RightControl then

local gui = game.CoreGui:FindFirstChild("Rayfield")

if gui then
gui.Enabled = not gui.Enabled
end

end

end)

-------------------------------------------------
-- AUTO FARM LEVEL
-------------------------------------------------

FarmTab:CreateToggle({
Name = "Auto Farm Level",
CurrentValue = false,
Callback = function(Value)

_G.AutoFarmLevel = Value

task.spawn(function()

while _G.AutoFarmLevel do
task.wait()

for i,v in pairs(workspace.Enemies:GetChildren()) do

if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then

repeat task.wait()

player.Character.HumanoidRootPart.CFrame =
v.HumanoidRootPart.CFrame * CFrame.new(0,0,3)

game:GetService("VirtualUser"):Button1Down(Vector2.new())
game:GetService("VirtualUser"):Button1Up(Vector2.new())

until v.Humanoid.Health <= 0 or not _G.AutoFarmLevel

end
end

end

end)

end
})

-------------------------------------------------
-- AUTO FARM CHESTS
-------------------------------------------------

FarmTab:CreateToggle({
Name = "Auto Farm Chests",
CurrentValue = false,
Callback = function(Value)

_G.AutoFarmChest = Value

task.spawn(function()

while _G.AutoFarmChest do
task.wait()

for i,v in pairs(workspace:GetDescendants()) do

if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
player.Character.HumanoidRootPart.CFrame = v.CFrame
task.wait(1)
end

end

end

end)

end
})

-------------------------------------------------
-- AUTO HAKI
-------------------------------------------------

FarmTab:CreateToggle({
Name = "Auto Haki",
CurrentValue = false,
Callback = function(Value)

_G.AutoHaki = Value

task.spawn(function()

while _G.AutoHaki do
task.wait(3)

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")

end

end)

end
})

-------------------------------------------------
-- AUTO BOSS
-------------------------------------------------

BossTab:CreateToggle({
Name = "Auto Boss",
CurrentValue = false,
Callback = function(Value)

_G.AutoBoss = Value

task.spawn(function()

while _G.AutoBoss do
task.wait()

for i,v in pairs(workspace.Enemies:GetChildren()) do

if string.find(v.Name,"Boss") then

repeat task.wait()

player.Character.HumanoidRootPart.CFrame =
v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)

until v.Humanoid.Health <= 0 or not _G.AutoBoss

end
end

end

end)

end
})

-------------------------------------------------
-- AUTO RAID
-------------------------------------------------

RaidTab:CreateToggle({
Name = "Auto Raid",
CurrentValue = false,
Callback = function(Value)

_G.AutoRaid = Value

task.spawn(function()

while _G.AutoRaid do
task.wait()

for i,v in pairs(workspace.Enemies:GetChildren()) do

repeat task.wait()

player.Character.HumanoidRootPart.CFrame =
v.HumanoidRootPart.CFrame * CFrame.new(0,0,4)

until v.Humanoid.Health <= 0 or not _G.AutoRaid

end

end

end)

end
})

-------------------------------------------------
-- AUTO FRUIT
-------------------------------------------------

FruitTab:CreateToggle({
Name = "Auto Fruit",
CurrentValue = false,
Callback = function(Value)

_G.AutoFruit = Value

task.spawn(function()

while _G.AutoFruit do
task.wait()

for i,v in pairs(workspace:GetChildren()) do

if string.find(v.Name,"Fruit") then
player.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
end

end

end

end)

end
})

-------------------------------------------------
-- ESP DEVIL FRUITS
-------------------------------------------------

FruitTab:CreateToggle({
Name = "ESP Devil Fruits",
CurrentValue = false,
Callback = function(Value)

_G.ESPDevilFruit = Value

task.spawn(function()

while _G.ESPDevilFruit do
task.wait(5)

for i,v in pairs(workspace:GetChildren()) do

if string.find(v.Name,"Fruit") then

if not v:FindFirstChild("FruitESP") then

local highlight = Instance.new("Highlight")
highlight.Parent = v
highlight.FillColor = Color3.new(1,1,0)

end

end

end

end

end)

end
})

-------------------------------------------------
-- RADAR FRUITS
-------------------------------------------------

FruitTab:CreateButton({
Name = "Radar Fruits",
Callback = function()

local count = 0

for i,v in pairs(workspace:GetChildren()) do
if string.find(v.Name,"Fruit") then
count = count + 1
end
end

Library:Notify({
Title = "Fruit Radar",
Content = "Frutas no mapa: "..count,
Duration = 5
})

end
})

-------------------------------------------------
-- ESP PLAYERS
-------------------------------------------------

EspTab:CreateButton({
Name = "ESP Players",
Callback = function()

for i,v in pairs(game.Players:GetPlayers()) do

if v ~= player and v.Character then

local highlight = Instance.new("Highlight")
highlight.Parent = v.Character
highlight.FillColor = Color3.new(1,0,0)

end

end

end
})

-------------------------------------------------
-- AUTO LEVIATHAN
-------------------------------------------------

SeaTab:CreateToggle({
Name = "Auto Leviathan",
CurrentValue = false,
Callback = function(Value)

_G.AutoLeviathan = Value

task.spawn(function()

while _G.AutoLeviathan do
task.wait(5)

AutoBoat()

if workspace:FindFirstChild("SeaBeasts") then

for i,v in pairs(workspace.SeaBeasts:GetChildren()) do

if string.find(v.Name,"Leviathan") then

repeat task.wait()

player.Character.HumanoidRootPart.CFrame =
v.HumanoidRootPart.CFrame * CFrame.new(0,0,50)

until v.Humanoid.Health <= 0 or not _G.AutoLeviathan

end

end

end

end

end)

end
})

-------------------------------------------------
-- AUTO MIRAGE ISLAND
-------------------------------------------------

SeaTab:CreateToggle({
Name = "Auto Mirage Island",
CurrentValue = false,
Callback = function(Value)

_G.AutoMirage = Value

task.spawn(function()

while _G.AutoMirage do
task.wait(5)

AutoBoat()

for i,v in pairs(workspace:GetChildren()) do

if string.find(v.Name,"Mirage") then
player.Character.HumanoidRootPart.CFrame = v:GetPivot()
end

end

end

end)

end
})

-------------------------------------------------
-- AUTO PREHISTORIC ISLAND
-------------------------------------------------

SeaTab:CreateToggle({
Name = "Auto Prehistoric Island",
CurrentValue = false,
Callback = function(Value)

_G.AutoPrehistoric = Value

task.spawn(function()

while _G.AutoPrehistoric do
task.wait(5)

AutoBoat()

for i,v in pairs(workspace:GetChildren()) do

if string.find(v.Name,"Prehistoric") then
player.Character.HumanoidRootPart.CFrame = v:GetPivot()
end

end

end

end)

end
})
