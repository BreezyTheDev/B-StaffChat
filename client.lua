--================================--
--      S-StaffChat 1.0           --
--      by SmurkTheDev            --
--		MIT License				  --
--================================--


-- EVENTS --
SCActive = true
RegisterNetEvent("S-StaffChat:SendToStaffClient")
AddEventHandler("S-StaffChat:SendToStaffClient", function(staffmessage, src, ifMessage)
	if SCActive then
		TriggerServerEvent("S-StaffChat:SendToStaff", staffmessage, src, ifMessage)
	end
end)

TriggerServerEvent("S-StaffChat:checkPerms")

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("S-StaffChat:checkPerms")
end)

local checkPerms = false

RegisterNetEvent("S-StaffChat:returnPerms")
AddEventHandler("S-StaffChat:returnPerms", function(ServerStaffChat)
	checkPerms = ServerStaffChat
end)

-- COMMANDS --
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
		TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Noir Roleplay^3] You do not have permission to run this command.')
	end
end)



