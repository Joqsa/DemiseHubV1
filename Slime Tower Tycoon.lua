local Config = {
    WindowName = "DemiseHub v1",
	Color = Color3.fromRGB(124,7,7),
	Keybind = Enum.KeyCode.RightBracket
}
local Library = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-BracketV3-Edited-6518"))()
if game:GetService("CoreGui"):FindFirstChild(Config.WindowName) ~= nil then
    game:GetService("CoreGui"):FindFirstChild(Config.WindowName):Destroy()
end
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local notifications = loadstring(game:HttpGet("https://raw.githubusercontent.com/Valenity/NotificationUI/main/Cheater.FunAreLeeches!"))()
local Replicated = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer
local HumanoidRootPart = player.Character.HumanoidRootPart

local orbs = 0
local currentamount = 0
local plr = nil
local FadeScreen = require(Replicated.GTycoonClient.Modules.FadeScreen)
local SharedUtility = require(Replicated.Modules.SharedUtility)

local Main = Window:CreateTab("Main Menu")
local Slime = Window:CreateTab("Slime Menu")
local Traveling = Window:CreateTab("Travel Menu")
local Shop = Window:CreateTab("Shop Menu")
local Ads = Window:CreateTab("Misc Menu")
local Settings = Window:CreateTab("UI Settings")

local Grabbing = Main:CreateSection("Orb Options")
local Slimes = Shop:CreateSection("Purchase Options")
local Rate = Shop:CreateSection("Rate Options")
local Travel = Traveling:CreateSection("Areas")
local TP = Traveling:CreateSection("Players")
local Merging = Slime:CreateSection("Merge Options")
local Bullshit = Ads:CreateSection("Ad Options")
local MoreBullshit = Ads:CreateSection("Purchase Options")
local CompleteObby = Ads:CreateSection("Obby Manipulation")

local MenuSection = Settings:CreateSection("Menu")
local BackgroundSection = Settings:CreateSection("Background")
-------------
for _, x in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller:GetChildren()) do
    if x:IsA("Frame") then
        x:Destroy()    
    end
end
game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "DemiseHub on Top! Join the Discord:", 
	Color = Color3.fromRGB(255,200,100)
})
wait(1)
game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "https://discord.gg/4kDWpwqYKs", 
	Color = Color3.fromRGB(255,255,255)
})
-------------
function notify(a,b)
    notifications:message {
        Title = "DemiseHub | <font color='rgb(0, 255, 255)'>"..a.."</font>",
        Description = b
    }
end
-------------
function SkipObby(int)
	for _, x in pairs(game:GetService("Workspace").ObbyCheckpoints:GetChildren()) do
		if x:IsA("Part") then
			firetouchinterest(HumanoidRootPart,x,0)
			task.wait(0.02)
			firetouchinterest(HumanoidRootPart,x,1)
			task.wait(0.01)
		end
	end
	task.wait(1)
	local bruh = "ObbyButton"..int
	firetouchinterest(HumanoidRootPart,game:GetService("Workspace")[bruh].Button,0)
	task.wait(0.01)
	firetouchinterest(HumanoidRootPart,game:GetService("Workspace")[bruh].Button,1)
end
-------------
function Activate(acv)
    plr = SharedUtility.GetPlayerTycoon(game.Players.LocalPlayer)
    firetouchinterest(HumanoidRootPart,plr.Buttons[acv].Button,0)
    wait(0.1)
    firetouchinterest(HumanoidRootPart,plr.Buttons[acv].Button,1)
end
-------------
function Grab()
    notify("Drops", "Grabbing Drops")
    player.Character.HARVESTER.WeldConstraint:Destroy()
    for _, x in pairs(game:GetService("Workspace").Drops:GetChildren()) do
        orbs += 1
        player.Character.HARVESTER.CFrame = x.CFrame
        player.Character.HARVESTER.Size = Vector3.new(4,4,4)
        task.wait(0.001)
    end
    player.Character.HARVESTER.CFrame = HumanoidRootPart.CFrame - Vector3.new(0,2,0)
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = HumanoidRootPart
    weld.Part1 = player.Character.HARVESTER
    weld.Parent = player.Character.HARVESTER
    player.Character.HARVESTER.Size = Vector3.new(5,15,5)
    notify("Drops", "Grabbed ".. orbs .. " Drops")
    orbs = 0    
end
-------------
local grabbutton = Grabbing:CreateButton("Grab Orbs",function()
    Grab()
end)
------------
local depositbutton = Grabbing:CreateButton("Deposit Orbs",function()
    notify("Drops", "Depositing Drops")
    Activate("DepositButton")
end)
------------
local mergebutton = Merging:CreateButton("Merge Slime(s)",function()
    Activate("MergeButton")
    notify("Slimes", "Merged Slime(s)")
end)
------------
local slimebox = Slimes:CreateTextBox("Slime Amount", "Slime Amount",false,function(f)
    currentamount = f
    notify("Slimes", currentamount.." Slime(s) Selected!")
end)
------------
local buybutton = Slimes:CreateButton("Purchase Slime(s)",function()
    game:GetService("ReplicatedStorage").GTycoonClient.Remotes.BuyDropper:FireServer(tonumber(currentamount))
    notify("Slimes", "Purchasing "..currentamount.. " Slime(s)!")
end)
------------
local removeads = Bullshit:CreateButton("Remove Ads",function()
    game:GetService("Workspace").ADS:Destroy()
    game:GetService("Workspace").BloxbizAdBoxUnit:Destroy()
    game:GetService("ReplicatedStorage").BloxbizRemotes:Destroy()
    game:GetService("ReplicatedStorage").Bloxbiz3DAdAssets:Destroy()
    game:GetService("ReplicatedStorage").BloxbizSDK:Destroy()
    player.PlayerScripts.BloxbizSDK:Destroy()
    notify("Ads", "Removed Bullshit Ads!")
end)
------------
local removerobuxpurchases = MoreBullshit:CreateButton("Remove R$ Items",function()
    plr = SharedUtility.GetPlayerTycoon(game.Players.LocalPlayer)
    for _, x in pairs(plr.Static.Part.SurfaceGui:GetChildren()) do
        if x.Text == ":)" then
            x.Text = ":("
        else
            x.Text = "Valenity Was Here!"
        end
    end
    plr.Buttons.ProductButton:Destroy()
    plr.Buttons.TenDroppers:Destroy()
    plr.Buttons.ObbyBoost:Destroy()
    plr.Buttons.QuickSell:Destroy()
    plr.Buttons.FiftySlimes:Destroy()
    plr.Buttons.DoubleCash:Destroy()
    plr.Buttons.DoubleDrops:Destroy()
    plr.Buttons.AutoCollect:Destroy()
    plr.Buttons.AutoDeposit:Destroy()
    notify("Ads", "Removed R$ Items!")
end)
------------
local ObbyManipulation = CompleteObby:CreateButton("Complete Floor 1",function()
    SkipObby("")
end)
------------
local ObbyManipulation2 = CompleteObby:CreateButton("Complete Floor 2",function()
    SkipObby(2)
end)
------------
local ObbyManipulation3 = CompleteObby:CreateButton("Complete Floor 3",function()
    SkipObby(3)
end)
------------
local myplot = Travel:CreateButton("My Plot",function()
    plr = SharedUtility.GetPlayerTycoon(game.Players.LocalPlayer)
    FadeScreen.Fade(Color3.fromRGB(70, 70, 70), 0.5, 0.5, true)
    player.Character:SetPrimaryPartCFrame(plr.Static.PlotTeleport.CFrame)
end)

local Wizard = Travel:CreateButton("Wizard Obby",function()
    Activate("ObbyPortal")
end)

local Realms = Travel:CreateButton("Dungeon Realms",function()
    Activate("DungeonPortal")
end)

local HoF = Travel:CreateButton("Hall of Fame",function()
    Activate("HallOfFamePortal")
end)
------------
local increaserate = Rate:CreateButton("Increase Rate",function()
    Activate("BuySpeed")
end)
------------
for _, x in pairs(game:GetService("Players"):GetChildren()) do
    if x ~= player then
        local teleport = TP:CreateButton("Teleport to "..x.Name,function()
            FadeScreen.Fade(Color3.fromRGB(70, 70, 70), 0.5, 0.5, true)
            HumanoidRootPart.CFrame = x.Character.HumanoidRootPart.CFrame 
        end)
    end
end
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
local Dropdown3 = BackgroundSection:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral","xbGuard"}, function(Name)
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
	elseif Name == "xbGuard" then
	    Window:SetBackground("11310622169")
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