if SERVER then

	util.AddNetworkString("sendInfoPlayerConnected")


	hook.Add("PlayerConnect","checkingPlayer",function(name,ip)
		net.Start("sendInfoPlayerConnected")
		net.WriteString(name)
		net.Broadcast()
	end)
end

if CLIENT then
	net.Receive("sendInfoPlayerConnected",function()
		local name = net.ReadString()
		local lang = NodesLang[LocalPlayer():GetNWInt("lang")]

		chat.AddText(Color(255,255,255),"[",Color(0,100,0), name,Color(255,255,255),"] ", Color(255,255,255), lang.connected)
		surface.PlaySound("buttons/button15.wav")
	end)
end