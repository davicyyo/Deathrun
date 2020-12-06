if SERVER then

	util.AddNetworkString("sendSound")

	local kills = 0
	hook.Add("PlayerDeath","checking Multiple",function(victim, inflictor, attacker)
		victim:SetNWInt("kills",0)
		if victim == attacker then return end

		attacker:SetNWInt("kills",attacker:GetNWInt("kills") + 1)

		local sound = false
		if attacker:GetNWInt("kills") == 2 then
			sound = "double"
		elseif attacker:GetNWInt("kills") == 3 then
			sound = "triple"
		elseif attacker:GetNWInt("kills") == 4 then
			sound = "mega"
		end

		if not sound then return end
		net.Start("sendSound")
		net.WriteString(sound)
		net.Broadcast()

	end)

	hook.Add("ScalePlayerDamage","put_Sound",function(ply, hitgroup, dmginfo)

	if ( hitgroup == HITGROUP_HEAD ) then
		timer.Simple(0.01,function()
		if ply:Alive() then return end
		net.Start("sendSound")
		net.WriteString("headshot")
		net.Broadcast()
		end)
	end
	end)
end

if CLIENT then
	net.Receive("sendSound",function()

		local sound_ = net.ReadString()

	if tostring(LocalPlayer():GetNWInt("removemusic")) == "1" then return end

	sound.PlayURL ( "http://nodes.headarrow.com/media/ultimate_sounds/"..sound_..".wav", "mono", function( station )
		if ( IsValid( station ) ) then

			station:SetPos( LocalPlayer():GetPos() )

			station:Play()

		else

			LocalPlayer():ChatPrint( "Invalid URL!" )

		end
		end)
	end )
end