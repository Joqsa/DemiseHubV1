local Config = {
    WindowName = "Demise Hub v1",
	Color = Color3.fromRGB(124,7,7),
	Keybind = Enum.KeyCode.RightBracket
}
local player = game:GetService("Players").LocalPlayer
local Library = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-BracketV3-Edited-6518"))()
if game:GetService("CoreGui"):FindFirstChild("DemiseHubv1") ~= nil then
    game:GetService("CoreGui"):FindFirstChild("DemiseHubv1"):Destroy()
end
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local Speed = Window:CreateTab("Speed Menu")
local Teleport = Window:CreateTab("Teleport Menu")
local Misc = Window:CreateTab("Misc Menu")

local Tab2 = Window:CreateTab("UI Settings")

local SpeedHax = Speed:CreateSection("Click Options")
local TP = Teleport:CreateSection("Players")
local Friend = Misc:CreateSection("Star Rewards")

local MenuSection = Tab2:CreateSection("Menu")
local BackgroundSection = Tab2:CreateSection("Background")
-------------
local Label1 = SpeedHax:CreateLabel("Manipulate Clicks")
local ClickToggle = SpeedHax:CreateToggle("Toggle Clicks", nil, function(State)
    getgenv().g = State
	if getgenv().g == true then
        Label1:UpdateText("Clicking!")
    else
        Label1:UpdateText("Not Clicking!")
        wait(1)
        Label1:UpdateText("Manipulate Clicks")
    end
end)
ClickToggle:CreateKeybind("P", function(Key)

end)
------------
local Label2 = Friend:CreateLabel("Star Reward Manipulation")
local StarToggle = Friend:CreateToggle("Manipulate Star Rewards", nil, function(State)
    getgenv().h = State
	if getgenv().h == true then
        Label2:UpdateText("Manipulated!")
    else
        Label2:UpdateText("Not Manipulated!")
        wait(1)
        Label2:UpdateText("Star Reward Manipulation")
    end
end)
StarToggle:CreateKeybind("T", function(Key)

end)
------------
local Toggle3 = MenuSection:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local CloseUI = MenuSection:CreateButton("Destroy UI",function()
    game:GetService("CoreGui"):FindFirstChild("DemiseHubv1"):Destroy()    
end)

local Colorpicker3 = MenuSection:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = BackgroundSection:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = BackgroundSection:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = BackgroundSection:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = BackgroundSection:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)

Window:SetBackground("6071575925")
Window:SetBackgroundColor(Color3.fromRGB(124,7,7))

for _, x in pairs(game:GetService("Players"):GetChildren()) do
    if x.Name ~= player.Name then
        local Button2 = TP:CreateButton("Teleport To:\n"..x.Name, function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.Character.HumanoidRootPart.CFrame
        end)
    end
end

while true do
    task.wait(0.01)
    if getgenv().g == true then
        game:GetService("ReplicatedStorage").RemoteEvents["Rocket_RemoteEvent"]:FireServer("ClickPower", 1000)
    end
    
    if getgenv().h == true then
        game:GetService("ReplicatedStorage").RemoteEvents["Friend_RemoteEvent"]:FireServer(10000000 * 9)
    end
end