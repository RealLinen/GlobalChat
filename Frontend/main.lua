local API = {}
local WS;
if typeof(syn)=="table" then WS = syn.websocket end
if WebSocket or Websocket then WS = ( WebSocket or Websocket ) end -- ScriptWare or KRNL and etc...
if not WS or not WS["connect"] then return warn("Cannot Load Universal Chat, Exploit doesn't support Websockets! [ Or ur using SynX V3, Fixing that later ]"); end
--------------------------------------------
function API:LoadChat(UI: Frame, Layout: TextButton)
    if typeof(UI)~="Instance" then return "The first argument must be a Frame where with a UIGridLayout were a button of the people who text can be created can be showed or put inside." end
    if typeof(Layout)~="Instance" or (not Layout:IsA("TextButton") or not Layout:IsA("ScrollingFrame") or not Layout:IsA("Frame")) then 
        Layout = "" -- button
    end
    local connection = WS.connect("ws://localhost:8000/")
    connection.OnMessage:Connect(function(msg)
        if type(msg)=="table" then
            local msgtype = msg["type"]
            local usrData = msg["userdata"]
            if msgtype=="__NEWMESSAGE__" and type(usrData)=="table" then
                local cl = Layout:Clone()
                local D_Icon: ImageButton = cl:FindFirstChild("Icon")
                local D_Username: TextLabel = cl:FindFirstChild("Username")
                local D_Message: TextLabel = cl:FindFirstChild("Message")
                if D_Icon then pcall(function() D_Icon.Image = usrData["avatarURLIMAGE"] end) end
                if D_Username then pcall(function() D_Username.Text = (usrData["username"] or "<no username>") end) end
                if D_Message then pcall(function() D_Message.Text = (usrData["message"] or "<no message>") end) end
                cl.Visible = true
                cl.Name = tostring(usrData["username"])..":"..tostring(usrData["message"])
                cl.Parent = UI
            end
            if msgtype=="__DELETEMESSAGE__" and type(usrData)=="table" then
                local msgName = usrData["msgName"]
                if type(msgName)=="string" then
                    local found = UI:FindFirstChild(msgName)
                    if found then
                        found:Destroy()
                    end
                end
            end
        end
    end)
end
--------------------------------------------
