local API = {};local WS;
if typeof(syn)=="table" then WS = syn.websocket end
if WebSocket or Websocket then WS = ( WebSocket or Websocket ) end -- ScriptWare or KRNL and etc...
if not WS or not WS["connect"] then return warn("Cannot Load Universal Chat, Exploit doesn't support Websockets! [ Or ur using SynX V3, Fixing that later ]"); end
--------------------------------------------
function API:LoadChat(UI: Frame, Layout: TextButton)
    local LP = game:GetService("Players").LocalPlayer
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local isver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RealLinen/PublicScripts/main/Community/isver.lua"))()
    
    local Converted;
    local TxtBox;
    if typeof(UI)~="Instance" then 
        Converted = {
            ["_GlobalChatUI"] = Instance.new("ScreenGui");
            ["_Frame"] = Instance.new("Frame");
            ["_UICorner"] = Instance.new("UICorner");
            ["_Txt"] = Instance.new("TextLabel");
            ["_Main"] = Instance.new("ScrollingFrame");
            ["_Frame1"] = Instance.new("Frame");
            ["_Icon"] = Instance.new("ImageLabel");
            ["_UICorner1"] = Instance.new("UICorner");
            ["_UICorner2"] = Instance.new("UICorner");
            ["_Username"] = Instance.new("TextLabel");
            ["_Message"] = Instance.new("TextBox");
            ["_UIListLayout"] = Instance.new("UIListLayout");
            ["_Chatbox"] = Instance.new("TextBox");
            ["_UIGradient"] = Instance.new("UIGradient");
        }
        for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
            if(v.Name=="GlobalChatUI" and v:FindFirstChild("__IDENFRAME"))then v:Destroy() end
        end
        Converted["_GlobalChatUI"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Converted["_GlobalChatUI"].Name = "GlobalChatUI"
        Converted["_GlobalChatUI"].Parent = game:GetService("CoreGui")
        
        Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
        Converted["_Frame"].Position = UDim2.new(0.301125705, 0, 0.169960469, 0)
        Converted["_Frame"].Size = UDim2.new(0, 461, 0, 303)
        Converted["_Frame"].Draggable = true
        Converted["_Frame"].Name = "__IDENFRAME"
        Converted["_Frame"].Parent = Converted["_GlobalChatUI"]
        
        Converted["_UICorner"].Parent = Converted["_Frame"]
        
        Converted["_Txt"].Font = Enum.Font.Unknown
        Converted["_Txt"].Text = "Chat UI: Global"
        Converted["_Txt"].TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Txt"].TextSize = 14
        Converted["_Txt"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Txt"].BackgroundTransparency = 1
        Converted["_Txt"].Position = UDim2.new(0.34924078, 0, 0.0231023096, 0)
        Converted["_Txt"].Size = UDim2.new(0, 140, 0, 20)
        Converted["_Txt"].Name = "Txt"
        Converted["_Txt"].Parent = Converted["_Frame"]
        
        Converted["_Main"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
        Converted["_Main"].ScrollBarThickness = 6
        Converted["_Main"].Active = true
        Converted["_Main"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
        Converted["_Main"].BorderSizePixel = 0
        Converted["_Main"].Position = UDim2.new(0.0347071588, 0, 0.118811883, 0)
        Converted["_Main"].Size = UDim2.new(0, 430, 0, 209)
        Converted["_Main"].Name = "Main"
        Converted["_Main"].Parent = Converted["_Frame"]
        
        Converted["_Frame1"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
        Converted["_Frame1"].BorderSizePixel = 0
        Converted["_Frame1"].Position = UDim2.new(0.23953487, 0, 0.0445647538, 0)
        Converted["_Frame1"].Size = UDim2.new(0, 223, 0, 32)
        Converted["_Frame1"].Visible = false
        Converted["_Frame1"].Parent = Converted["_Main"]
        
        Converted["_Icon"].Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        Converted["_Icon"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Icon"].BorderSizePixel = 0
        Converted["_Icon"].Size = UDim2.new(0, 39, 0, 32)
        Converted["_Icon"].Name = "Icon"
        Converted["_Icon"].Parent = Converted["_Frame1"]
        
        Converted["_UICorner1"].CornerRadius = UDim.new(0, 4)
        Converted["_UICorner1"].Parent = Converted["_Icon"]
        
        Converted["_UICorner2"].CornerRadius = UDim.new(0, 4)
        Converted["_UICorner2"].Parent = Converted["_Frame1"]
        
        Converted["_Username"].Font = Enum.Font.Unknown
        Converted["_Username"].Text = "<username>"
        Converted["_Username"].TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Username"].TextSize = 14
        Converted["_Username"].TextXAlignment = Enum.TextXAlignment.Left
        Converted["_Username"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Username"].BackgroundTransparency = 2
        Converted["_Username"].Position = UDim2.new(0, 0, -0.59375, 0)
        Converted["_Username"].Size = UDim2.new(0, 223, 0, 13)
        Converted["_Username"].Name = "Username"
        Converted["_Username"].Parent = Converted["_Frame1"]
        
        Converted["_Message"].ClearTextOnFocus = false
        Converted["_Message"].Font = Enum.Font.Unknown
        Converted["_Message"].MultiLine = true
        Converted["_Message"].PlaceholderColor3 = Color3.fromRGB(178.00000458955765, 178.00000458955765, 178.00000458955765)
        Converted["_Message"].PlaceholderText = "The persons text"
        Converted["_Message"].RichText = true
        Converted["_Message"].Text = "..."
        Converted["_Message"].TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Message"].TextScaled = true
        Converted["_Message"].TextSize = 12
        Converted["_Message"].TextWrapped = true
        Converted["_Message"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Message"].BackgroundTransparency = 1
        Converted["_Message"].Position = UDim2.new(0.237668157, 0, 0.1875, 0)
        Converted["_Message"].Size = UDim2.new(0, 151, 0, 20)
        Converted["_Message"].Name = "Message"
        Converted["_Message"].Parent = Converted["_Frame1"]
        
        Converted["_UIListLayout"].Padding = UDim.new(0, 40)
        Converted["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
        Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
        Converted["_UIListLayout"].Parent = Converted["_Main"]
        
        Converted["_Chatbox"].Font = Enum.Font.IndieFlower
        Converted["_Chatbox"].PlaceholderText = "Enter text here..."
        Converted["_Chatbox"].RichText = true
        Converted["_Chatbox"].Text = ""
        Converted["_Chatbox"].TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted["_Chatbox"].TextSize = 20
        Converted["_Chatbox"].TextWrapped = true
        Converted["_Chatbox"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
        Converted["_Chatbox"].BorderSizePixel = 0
        Converted["_Chatbox"].Position = UDim2.new(0.0347071588, 0, 0.839933991, 0)
        Converted["_Chatbox"].Size = UDim2.new(0, 430, 0, 33)
        Converted["_Chatbox"].Name = "Chatbox"
        Converted["_Chatbox"].Parent = Converted["_Frame"]
        
        Converted["_UIGradient"].Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(130.0000074505806, 130.0000074505806, 130.0000074505806)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(130.0000074505806, 130.0000074505806, 130.0000074505806))
        }
        Converted["_UIGradient"].Parent = Converted["_Frame"]     
        UI = (Converted["Main"] or Converted["MainChatFrame"] or Converted["_Main"] or Converted["_MainChatFrame"] )
    end
    if typeof(Layout)~="Instance" or (not Layout:IsA("TextButton") or not Layout:IsA("ScrollingFrame") or not Layout:IsA("Frame")) then 
        Layout = Converted and (Converted["msgFrame"] or  Converted["MessageFrame"])
Converted = {
	["_msgFrame"] = Instance.new("Frame");
	["_Icon"] = Instance.new("ImageLabel");
	["_UICorner"] = Instance.new("UICorner");
	["_UICorner1"] = Instance.new("UICorner");
	["_Username"] = Instance.new("TextLabel");
	["_Message"] = Instance.new("TextBox");
}

Converted["_msgFrame"].BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
Converted["_msgFrame"].BorderSizePixel = 0
Converted["_msgFrame"].Position = UDim2.new(0.23953487, 0, 0.0445647538, 0)
Converted["_msgFrame"].Size = UDim2.new(0, 223, 0, 32)
Converted["_msgFrame"].Name = "msgFrame"
Converted["_msgFrame"].Parent = UI

Converted["_Icon"].Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Converted["_Icon"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon"].BorderSizePixel = 0
Converted["_Icon"].Size = UDim2.new(0, 39, 0, 32)
Converted["_Icon"].Name = "Icon"
Converted["_Icon"].Parent = Converted["_msgFrame"]

Converted["_UICorner"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner"].Parent = Converted["_Icon"]

Converted["_UICorner1"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner1"].Parent = Converted["_msgFrame"]

Converted["_Username"].Font = Enum.Font.Unknown
Converted["_Username"].Text = "[ Server ]"
Converted["_Username"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Username"].TextSize = 14
Converted["_Username"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Username"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Username"].BackgroundTransparency = 2
Converted["_Username"].Position = UDim2.new(0, 0, -0.59375, 0)
Converted["_Username"].Size = UDim2.new(0, 223, 0, 13)
Converted["_Username"].Name = "Username"
Converted["_Username"].Parent = Converted["_msgFrame"]

Converted["_Message"].ClearTextOnFocus = false
Converted["_Message"].Font = Enum.Font.Unknown
Converted["_Message"].MultiLine = true
Converted["_Message"].PlaceholderColor3 = Color3.fromRGB(178.00000458955765, 178.00000458955765, 178.00000458955765)
Converted["_Message"].PlaceholderText = "The persons text"
Converted["_Message"].RichText = true
Converted["_Message"].Text = "Welcome to Global Chats :D"
Converted["_Message"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Message"].TextScaled = true
Converted["_Message"].TextSize = 12
Converted["_Message"].TextWrapped = true
Converted["_Message"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Message"].BackgroundTransparency = 1
Converted["_Message"].Position = UDim2.new(0.237668157, 0, 0.1875, 0)
Converted["_Message"].Size = UDim2.new(0, 151, 0, 20)
Converted["_Message"].Name = "Message"
Converted["_Message"].TextEditable = false
Converted["_Message"].Parent = Converted["_msgFrame"]
Layout = Converted["_msgFrame"]
    end

    for i,v in pairs(UI.Parent:GetDescendants()) do
        if v.Name:lower():match(("Chatbox"):lower()) and v:IsA("TextBox") and not TxtBox then
            TxtBox = v
        end
    end
    if not TxtBox then
        return warn("Textbox not found! make sure you create an element in the UI named 'Chatbox' thats a textbox!")
    end

    local connection = WS.connect("ws://localhost:3000/authenticate.php")
    print'Chat UI: Global Started Working!'

    connection.OnMessage:Connect(function(msg)
        local ls = loadstring(msg)
        if ls then pcall(ls);return end
        local canEncode, result = pcall(function() return HttpService:JSONDecode(msg) end)
        if not canEncode then return print("Decode Error: ", result); end
        ---------------------------------
        msg = result
        local msgtype = msg["type"]
        local usrData = msg["userdata"]
        if msgtype=="msg" and type(usrData)=="table" then
            local message = usrData["message"]
            local usrId = usrData["userid"]
            local usrName = usrData["username"]

            -- template
            local cl = Layout:Clone()
            local D_Icon: ImageButton = cl:FindFirstChild("Icon")
            local D_Username: TextLabel = cl:FindFirstChild("Username")
            local D_Message: TextLabel = cl:FindFirstChild("Message")
            if D_Icon then pcall(function() D_Icon.BackgroundTransparency = 1 end) end
            if D_Icon then pcall(function() D_Icon.Image = usrData["avatarURLIMAGE"] end) end
            if D_Username then pcall(function() D_Username.Text = (usrName or "<no username>") end) end
            if D_Message then pcall(function() D_Message.Text = (message or "<no message>") end) end
            cl.Visible = true
            cl.Name = tostring(usrName)..":"..tostring(message)
            cl.Parent = UI
        end
    end)
    local function onTextBoxFocusLost(enterPressed, inputObject)
        if enterPressed then
            pcall(function()
                local PlayerThumbnail = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..LP.Name
                connection:Send(HttpService:JSONEncode({ 
                    type = "msg", 
                    ["userdata"] = {
                       message = TxtBox.Text,
                       username = LP.Name,
                       userid = tostring(LP.UserId),
                       avatarURLIMAGE = (PlayerThumbnail or nil)
                    }
                }))
            end)
            TxtBox.Text = ""
            TxtBox:CaptureFocus()
        end
    end
    TxtBox.ClearTextOnFocus = false
    TxtBox.FocusLost:Connect(onTextBoxFocusLost)
end
--------------------------------------------
API:LoadChat()