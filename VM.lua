local toHook = { "FireServer", "InvokeServer", "OnClientEvent" }
local rmt = { game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering }
local cached = {}
---------------------
for i,v in pairs(rmt) do
    if typeof(v)=="Instance" then
        for a,b in pairs(toHook) do
            if not cached[b] then cached[b] = nil; end 
            pcall(function()
                cached[b] = hookfunc(v[b], function(...)
                    print(v.Name..":"..b.." was called!")
                    print("Arguments:\n\n", ...) -- Print arguments remote was called with
                    print("\n\n===========================================") 
                    return cached[b](...) -- Call remote back with arguments         
                end)
            end)
        end
    end
end