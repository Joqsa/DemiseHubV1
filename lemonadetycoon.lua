local Config = {
    WindowName = "DemiseHub v1 | LemonadeTycoon",
	Color = Color3.fromRGB(124,7,7),
	Keybind = Enum.KeyCode.RightBracket
}
local Library = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-BracketV3-Edited-6518"))()
if game:GetService("CoreGui"):FindFirstChild(Config.WindowName) ~= nil then
    game:GetService("CoreGui"):FindFirstChild(Config.WindowName):Destroy()
end
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local notifications = loadstring(game:HttpGet("https://raw.githubusercontent.com/Valenity/NotificationUI/main/Cheater.FunAreLeeches!"))()
local player = game:GetService("Players").LocalPlayer
local HumanoidRootPart = player.Character.HumanoidRootPart
local Replicated = game:GetService("ReplicatedStorage")
local Code = Replicated:WaitForChild("Events"):WaitForChild("Functions"):WaitForChild("Code")

local Main = Window:CreateTab("Main Menu")
local Misc = Window:CreateTab("Misc Menu")
local Settings = Window:CreateTab("UI Settings")

local Codes = Misc:CreateSection("Codes")
local Package = Misc:CreateSection("Package")
local Click = Main:CreateSection("Lemonade Production")

local MenuSection = Settings:CreateSection("Menu")
local BackgroundSection = Settings:CreateSection("Background")
-------------
function notify(a,b)
    notifications:message {
        Title = "DemiseHub | <font color='rgb(0, 255, 255)'>"..a.."</font>",
        Description = b
    }
end
-------------
local codebutton = Codes:CreateButton("Redeem All Codes",function()
    for _, x in pairs(require(Replicated.Codes)) do
        Code:InvokeServer(_)
        notify("Codes","Redeemed code for $"..x)
        wait(1)
    end
end)
------------
local packagebutton = Package:CreateButton("Remove Package",function()
    for _, x in pairs(game:GetService("Workspace").Tycoons:GetDescendants()) do
        if x.Name == "Owner" and x.Value == game:GetService("Players").LocalPlayer then
            game:GetService("Workspace").Tycoons[tostring(x.Parent)].Core.Package:Destroy()
        end
    end
    notify("Package","Package Removed!")
end)
------------
local harvest = Click:CreateToggle("Harvest Trees",false,function(value)
        if value == true then
            getgenv().Test = true
            value = true
        else
            getgenv().Test = false
            value = false
        end
    end
)

local make = Click:CreateToggle("Make Lemonade",false,function(value)
        if value == true then
            getgenv().Test2 = true
            value = true
        else
            getgenv().Test2 = false
            value = false
        end
    end
)
------------
local Toggle3 = MenuSection:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local CloseUI = MenuSection:CreateButton("Destroy UI",function()
    for _, x in pairs(game:GetService("CoreGui"):GetChildren()) do
        if x.Name == "ScreenGui" then
            x:Destroy()
        end
    end
    game:GetService("CoreGui"):FindFirstChild(Config.WindowName):Destroy()
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

while true do
task.wait(0.3)
    if getgenv().Test == true then
        for _, x in pairs(game:GetService("Workspace").Tycoons:GetDescendants()) do
            if x.Name == "Owner" and x.Value == game:GetService("Players").LocalPlayer then
                for _, c in pairs(x.Parent.Purchases:GetChildren()) do
                local str = tostring(c)
                    if string.find(str, "Tree") then
                        local cew = game:GetService("Workspace").Tycoons[tostring(x.Parent)].Purchases[str]
                        game:GetService("ReplicatedStorage").Events.Remotes.Harvest:FireServer(cew)
                    end
                end
            end
        end
    end
    
    if getgenv().Test2 == true then
        for _, x in pairs(game:GetService("Workspace").Tycoons:GetDescendants()) do
            if x.Name == "Owner" and x.Value == game:GetService("Players").LocalPlayer then
                fireproximityprompt(game:GetService("Workspace").Tycoons[tostring(x.Parent)].Core.JuicerStand.LemonadeTank.Glass.Make,1000)
            end
        end
    end
end