--================================--
--      B-StaffChat 1.0           --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--

-- Configuration
prefix = '^3[^1Staff Chat^3] '

-- Commands

RegisterCommand("sc", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "StaffChat.View") then
        local src = source
        local message = table.concat(args, " ")
        local name = GetPlayerName(source)
            ifMessage = false
            if #args > 0 then
                ifMessage = true
            else
                ifMessage = false
            end
        local staffmessage = "^5 " .. table.concat(args, " ")
        TriggerClientEvent("B-StaffChat:SendToStaffClient", -1, staffmessage, src, ifMessage)
    else
        TriggerClientEvent('chatMessage', source, prefix .. 'You do not have permission to do this!')
    end
end)

-- Events 

RegisterNetEvent("B-StaffChat:SendToStaff")
AddEventHandler("B-StaffChat:SendToStaff", function(message, id, checkMessage)
	local _src = source
	local name = GetPlayerName(id)
	if IsPlayerAceAllowed(_src, "StaffChat.View") then
		if checkMessage then
			TriggerClientEvent('chat:addMessage', _src, {args = {prefix .. "^3" .. name ..":"..message}})
		end
	end
end)


RegisterServerEvent("B-StaffChat:checkPerms")
AddEventHandler("B-StaffChat:checkPerms", function()
    if IsPlayerAceAllowed(source, "StaffChat.View") then
        TriggerClientEvent("B-StaffChat:returnPerms", source, true)
    else
        TriggerClientEvent("B-StaffChat:returnPerms", source, false)
    end
end)

-- Functions

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
function sleep (a) 
    local sec = tonumber(os.clock() + a); 
    while (os.clock() < sec) do 
    end 
end
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
function get_index (tab, val)
	local counter = 1
    for index, value in ipairs(tab) do
        if value == val then
            return counter
        end
		counter = counter + 1
    end

    return nil
end

-- Version Checker

expectedName = "B-StaffChat" -- This is the resource and is not suggested to be changed.
resource = GetCurrentResourceName()

-- check if resource is renamed
if resource ~= expectedName then
    print("^1[^4" .. expectedName .. "^1] WARNING^0")
    print("Change the resource name to ^4" .. expectedName .. " ^0or else it won't work!")
end


print("^0This resource was created by ^5Breezy#0001 ^0for support you can join his ^5discord: ^0https://discord.gg/zzUfkfRHzP")

-- check if resource version is up to date
PerformHttpRequest("https://raw.githubusercontent.com/BreezyTheDev/B-StaffChat/main/fxmanifest.lua", function(error, res, head)
    i, j = string.find(tostring(res), "version")
    res = string.sub(tostring(res), i, j + 6)
    res = string.gsub(res, "version ", "")
    res = string.gsub(res, '"', "")
    resp = tonumber(res)
    verFile = GetResourceMetadata(expectedName, "version", 0)
    
    if verFile then
        if tonumber(verFile) < resp then
            print("^1[^4" .. expectedName .. "^1] WARNING^0")
            print("^4" .. expectedName .. " ^0is outdated. Please update it from ^5https://github.com/BreezyTheDev/B-StaffChat^0| Current Version: ^1" .. verFile .. " ^0| New Version: ^2" .. resp .. " ^0|")
        elseif tonumber(verFile) > tonumber(resp) then
            print("^1[^4" .. expectedName .. "^1] WARNING^0")
            print("^4" .. expectedName .. "s ^0version number is higher than we expected. | Current Version: ^3" .. verFile .. " ^0| Expected Version: ^2" .. resp .. " ^0|")
        else
            print("^4" .. expectedName .. " ^0is up to date | Current Version: ^2" .. verFile .. " ^0|")
        end
    else
        print("^1[^4" .. expectedName .. "^1] WARNING^0")
        print("You may not have the latest version of ^4" .. expectedName .. "^0. A newer, improved version may be present at ^5https://github.com/BreezyTheDev/B-StaffChat^0")
    end
end)
