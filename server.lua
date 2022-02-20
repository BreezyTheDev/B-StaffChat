--================================--
--      BreezyStaffChat 1.1       --
--      by DevBreezy              --
--		License: GNU GPL 3.0      --
--================================--

-- CONFIG --
prefix = '^3[^1Staff Chat^3] '

-- CODE BELOW --
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
        TriggerClientEvent("BreezyStaffChat:SendToStaffClient", -1, staffmessage, src, ifMessage)
    else
        TriggerClientEvent('chatMessage', source, prefix .. 'You do not have permission to do this!')
    end
end)

RegisterNetEvent("BreezyStaffChat:SendToStaff")
AddEventHandler("BreezyStaffChat:SendToStaff", function(message, id, checkMessage)
	local _src = source
	local name = GetPlayerName(id)
	if IsPlayerAceAllowed(_src, "StaffChat.View") then
		if checkMessage then
			TriggerClientEvent('chat:addMessage', _src, {args = {prefix .. "^3" .. name ..":"..message}})
		end
	end
end)


RegisterServerEvent("BreezyStaffChat:checkPerms")
AddEventHandler("BreezyStaffChat:checkPerms", function()
    if IsPlayerAceAllowed(source, "StaffChat.View") then
        TriggerClientEvent("BreezyStaffChat:returnPerms", source, true)
    else
        TriggerClientEvent("BreezyStaffChat:returnPerms", source, false)
    end
end)