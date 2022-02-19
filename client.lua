--================================--
--      BreezyStaffChat 1.1       --
--      by DevBreezy              --
--		License: GNU GPL 3.0      --
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
		else
			SCActive = true
			TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Staff Chat^3] ^3You will now receive new messages from Staff Chat. Status: ^2Enabled')
		end
	else
		TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Staff Chat^3] You do not have permission to run this command.')
	end
end)

