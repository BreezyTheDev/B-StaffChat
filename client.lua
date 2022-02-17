--================================--
--      BreezyStaffChat 1.0       --
--      by DevBreezy              --
--		License: GNU GPL 3.0	  --
--================================--

-- CODE BELOW --
RegisterNetEvent("SendToStaffClient")
AddEventHandler("SendToStaffClient", function(staffmessage, src, ifMessage)
	TriggerServerEvent("SendToStaff", staffmessage, src, ifMessage)
end)