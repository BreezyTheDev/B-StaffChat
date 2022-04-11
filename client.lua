--================================--
--      BreezyStaffChat 1.0       --
--      by DevBreezy              --
--		MIT License				  --
--================================--


-- CODE BELOW --
SCActive = true
RegisterNetEvent("BreezyStaffChat:SendToStaffClient")
AddEventHandler("BreezyStaffChat:SendToStaffClient", function(staffmessage, src, ifMessage)
	if SCActive then
		TriggerServerEvent("BreezyStaffChat:SendToStaff", staffmessage, src, ifMessage)
	end
end)

TriggerServerEvent("BreezyStaffChat:checkPerms")

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("BreezyStaffChat:checkPerms")
end)

local checkPerms = false

RegisterNetEvent("BreezyStaffChat:returnPerms")
AddEventHandler("BreezyStaffChat:returnPerms", function(ServerStaffChat)
	checkPerms = ServerStaffChat
end)

RegisterCommand("sc-toggle", function(source, args, rawCommand)
	if checkPerms ~= false and checkPerms == true then
		if SCActive then
			SCActive = false
			TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Staff Chat^3] ^3You will no longer receive new messages from Staff Chat. Status: ^1Disabled')
			TriggerEvent('DiscordChatRoles:StaffChat:Toggle')
		else
			SCActive = true
			TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Staff Chat^3] ^3You will now receive new messages from Staff Chat. Status: ^2Enabled')
			TriggerEvent('DiscordChatRoles:StaffChat:Toggle')
		end
	else
		TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Noir Roleplay^3] You do not have permission to run this command.')
	end
end)



