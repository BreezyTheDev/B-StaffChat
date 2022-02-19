--================================--
--      BreezyStaffChat 1.0       --
--      by DevBreezy              --
--      MIT License               --
--================================--


-- CODE BELOW --
SCActive = true
RegisterNetEvent("SendToStaffClient")
AddEventHandler("SendToStaffClient", function(staffmessage, src, ifMessage)
	if SCActive then
		TriggerServerEvent("SendToStaff", staffmessage, src, ifMessage)
	end
end)


RegisterCommand("sc-toggle", function(source, args, rawCommand)
	if SCActive then
		SCActive = false
		TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Staff Chat^3] ^3You will no longer receive new messages from Staff Chat. Status: ^1Disabled')
	else
		SCActive = true
		TriggerEvent('chatMessage', '', {255, 255, 255}, '^3[^1Staff Chat^3] ^3You will now receive new messages from Staff Chat. Status: ^2Enabled')
	end
end)
