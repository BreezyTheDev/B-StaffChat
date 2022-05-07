--================================--
--      B-StaffChat 1.0           --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--


-- Events
SCActive = true
RegisterNetEvent("B-StaffChat:SendToStaffClient")
AddEventHandler("B-StaffChat:SendToStaffClient", function(staffmessage, src, ifMessage)
	if SCActive then
		TriggerServerEvent("B-StaffChat:SendToStaff", staffmessage, src, ifMessage)
	end
end)

TriggerServerEvent("B-StaffChat:checkPerms")

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("B-StaffChat:checkPerms")
end)

local checkPerms = false

RegisterNetEvent("B-StaffChat:returnPerms")
AddEventHandler("B-StaffChat:returnPerms", function(ServerStaffChat)
	checkPerms = ServerStaffChat
end)

-- Commands
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



