--================================--
--      BreezyStaffChat 2.0       --
--      by DevBreezy              --
--		MIT License				  --
--================================--

function GetAllPlayers()
    local players = {}

    for _, i in ipairs(GetPlayers()) do
        table.insert(players, i)    
    end

    return players
end

local displaystaffchat = false
RegisterCommand("sc", function(source, args, rawCommand)
    local player = source
    local name = GetPlayerName(player)
    local message = table.concat(args, " ")
    if IsPlayerAceAllowed(source, "StaffChat.View") then
        if displaystaffchat == false then
            if message ~= "" then
                local players = GetAllPlayers()
                for i=1, #players do
                    if IsPlayerAceAllowed(players[i], "StaffChat.View") then
                        if Config.Template then
                            TriggerClientEvent("chat:addMessage", players[i], {
                                color = {255, 0, 0},
                                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(186, 51, 187, 0.6); border-radius: 3px;"><i class="fas fa-shield-alt"></i> {0} {1}</div>',
                                args = {"^0" .. "[" .. source .. "] " .. name .. ":" , message}
                            })
                        else
                            TriggerClientEvent('chat:addMessage', players[i], {args = {Config.Prefix .. "^5" .. name ..": ^1"..message}})
                        end
                    end
                end
            else
                if Config.Template then
                    TriggerClientEvent("chat:addMessage", player, {
                        color = {255, 0, 0},
                        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(186, 51, 187, 0.6); border-radius: 3px;"><i class="fas fa-shield-alt"></i> {0} </div>',
                        args = {"^0You must include a message!"}
                    })
                else
                    TriggerClientEvent('chat:addMessage', player, {args = {Config.Prefix  .. "^5 You must include a message!"}})
                end
            end
        elseif displaystaffchat == true then
            if Config.Template then
                TriggerClientEvent("chat:addMessage", player, {
                    color = {255, 0, 0},
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(186, 51, 187, 0.6); border-radius: 3px;"><i class="fas fa-shield-alt"></i> {0} </div>',
                    args = {"^0Your staff chat is toggled off, toggle it back on to use it again."}
                })
            else
                TriggerClientEvent('chat:addMessage', player, {args = {Config.Prefix  .. "^5 Your staff chat is toggled off, toggle it back on to use it again."}})
            end
        end
    else
        if Config.Template then
            TriggerClientEvent("chat:addMessage", player, {
                color = {255, 0, 0},
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(186, 51, 187, 0.6); border-radius: 3px;"><i class="fas fa-shield-alt"></i> {0} </div>',
                args = {"^0You need permission to run this command!"}
            })
        else
            TriggerClientEvent('chat:addMessage', player, {args = {Config.Prefix  .. "^5 You need permission to run this command!"}})
        end
    end
end, false)


RegisterCommand("sc-toggle", function(source, args, rawCommand)
    local player = source
    if displaystaffchat == false then
        displaystaffchat = true
        if Config.Template then
            TriggerClientEvent("chat:addMessage", player, {
                color = {255, 0, 0},
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(186, 51, 187, 0.6); border-radius: 3px;"><i class="fas fa-shield-alt"></i> {0} </div>',
                args = {"^0You will no longer receive new messages from Staff Chat."}
            })
        else
            TriggerClientEvent('chat:addMessage', player, {args = {Config.Prefix  .. "^5 You will no longer receive new messages from Staff Chat."}})
        end
    elseif displaystaffchat == true then
        displaystaffchat = false
        if Config.Template then
            TriggerClientEvent("chat:addMessage", player, {
                color = {255, 0, 0},
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(186, 51, 187, 0.6); border-radius: 3px;"><i class="fas fa-shield-alt"></i> {0} </div>',
                args = {"^0You will now receive new messages from Staff Chat."}
            })
        else
            TriggerClientEvent('chat:addMessage', player, {args = {Config.Prefix  .. "^5 You will now receive new messages from Staff Chat."}})
        end
    end
end, false)


expectedName = "BreezyStaffChat" -- This is the resource and is not suggested to be changed.
resource = GetCurrentResourceName()

-- check if resource is renamed
if resource ~= expectedName then
    print("^1[^4" .. expectedName .. "^1] WARNING^0")
    print("Change the resource name to ^4" .. expectedName .. " ^0or else it won't work!")
end


print("^0This resource is created by ^5Breezy#0001 ^0for support you can join the ^5discord: ^0https://discord.gg/zzUfkfRHzP")

-- check if resource version is up to date
PerformHttpRequest("https://raw.githubusercontent.com/DevBreezy/BreezyStaffChat/main/fxmanifest.lua", function(error, res, head)
    i, j = string.find(tostring(res), "version")
    res = string.sub(tostring(res), i, j + 6)
    res = string.gsub(res, "version ", "")

    res = string.gsub(res, '"', "")
    resp = tonumber(res)
    verFile = GetResourceMetadata(expectedName, "version", 0)
    if verFile then
        if tonumber(verFile) < resp then
            print("^1[^4" .. expectedName .. "^1] WARNING^0")
            print("^4" .. expectedName .. " ^0is outdated. Please update it from ^5https://github.com/DevBreezy/BreezyStaffChat^0| Current Version: ^1" .. verFile .. " ^0| New Version: ^2" .. resp .. " ^0|")
        elseif tonumber(verFile) > tonumber(resp) then
            print("^1[^4" .. expectedName .. "^1] WARNING^0")
            print("^4" .. expectedName .. "s ^0version number is higher than we expected. | Current Version: ^3" .. verFile .. " ^0| Expected Version: ^2" .. resp .. " ^0|")
        else
            print("^4" .. expectedName .. " ^0is up to date | Current Version: ^2" .. verFile .. " ^0|")
        end
    else
        print("^1[^4" .. expectedName .. "^1] WARNING^0")
        print("You may not have the latest version of ^4" .. expectedName .. "^0. A newer, improved version may be present at ^5https://github.com/DevBreezy/BreezyStaffChat^0")
    end
end)
