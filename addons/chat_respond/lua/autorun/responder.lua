if SERVER then
util.AddNetworkString("sendChat")

local vote = 0
hook.Add("PlayerSay","get_words_CR",function(ply,text)

	local lang = NodesLang[ply:GetPData("lang")]

	if CR.ChatCommands[string.lower(text)] then
		net.Start("sendChat")
		net.WriteColor(CR.ChatCommands[text].color)
		net.WriteString(CR.ChatCommands[text].msg)
		net.Send(ply)
	end

	for k,v in pairs(CR.Responder.Items) do
		if string.find(string.lower(text),v) then
			net.Start("sendChat")
			net.WriteColor(CR.Responder[v].color)
			net.WriteString(CR.Responder[v].msg)
			net.Send(ply)
		end
	end

	if (string.lower(string.Left(text,6)) == "!music" ) then
		print(ply:GetPData("removemusic"))
		if ply:GetPData("removemusic") == "1" or ply:GetPData("removemusic") == 1 then
			ply:SetPData("removemusic","0")
			ply:SetNWInt("removemusic","0")
			ply:sendNotify(lang.musicEnabled)
		else
			ply:SetPData("removemusic",1)
			ply:SetNWInt("removemusic",1)
			ply:sendNotify(lang.musicDisabled)
		end
	end

	if string.lower(string.Left(text,5)) == "!lang" then
		TXT = string.Replace(text,"!lang ","")
			
		local langs = {"en","es","fr"}
		if not table.HasValue(langs,TXT) then return "Please add en/es or fr for change lang" end

			ply:SetPData("lang",TXT)
			ply:SetNWInt("lang",TXT)

			TexT = string.Replace(NodesLang[TXT].langChanged,"%l",NodesLang[TXT].Lang)

			ply:sendNotify(TexT)
	end
		
		if string.lower(string.Left(text,8)) == "!restart" then
			if #player.GetAll() <= 1 then
				game.CleanUpMap()
				hook.Run("round.spawn()",ply)
				ply:sendNotify(lang.singleplayermsg)
				ply:sendNotify(lang.restartNotify)
			else
				ply:sendNotify(lang.restartNotify2)
			end
		end

		if string.find(string.lower(text),"free") then
			if ply:GetNWBool("removekey") then return end
			if ply:Team() == 0 then
				for k,v in pairs(player.GetAll()) do
					v:sendNotify(lang.freeMSG)
				end
			ply:SetNWBool("removekey",true)
				for k,v in pairs(ents.GetAll()) do
					if string.find(string.lower(v:GetClass()),"button") then
						v:Fire("lock")
					end
				end
			end
		end

	if string.lower(string.Left(text,3)) == "rtv" then
			if tonumber(ply:GetNWInt("vote")) == 1 then return end

			ply:SetNWInt("vote",1)

			vote = vote + 1

			local necesary = 0

			if #player.GetAll() >= 3 then

			necesary = math.Round( #player.GetAll()/3 )

			end

			for _,p in pairs(player.GetAll()) do
				if necesary == 0 then
					p:ChatPrint("[RTV] "..NodesLang[p:GetPData("lang")].RTV_Preparing)
					p:sendNotify("[RTV] "..NodesLang[p:GetPData("lang")].RTV_Preparing)
				else
					lg = NodesLang[p:GetPData("lang")].RTV_PlayersVoting
					lg = string.Replace(lg,"%v",vote)
					send = string.Replace(lg,"%n",necesary)
					p:ChatPrint("[RTV] "..send)
					p:sendNotify("[RTV] "..send)
				end

				if vote >= necesary then
					p:ChatPrint("[RTV] "..NodesLang[p:GetPData("lang")].RTV_Starting)
					p:sendNotify("[RTV] "..NodesLang[p:GetPData("lang")].RTV_Starting)
					StartRTV()
				end
			end

			net.Start("rtv_sound")
			net.WriteString("vo/npc/female01/hacks01.wav")
			net.Send(ply)


	end


	if ply:IsAdmin() then
		if text == "" or text == " " then return end
		BroadcastLua([[chat.AddText(Color(255,255,255),"[",Color(182,51,116), "ADMIN",Color(255,255,255),"] ",Color(255,255,255), "<",Color(182,51,116), "]]..ply:Nick()..[[",Color(255,255,255), "> ",Color(255,255,255), "]]..text..[[")]])
		return ""
	end

	if ply:GetUserGroup() == "vip" then
		if text == "" or text == " " then return end
			BroadcastLua([[chat.AddText(Color(255,255,255),"[",Color(213,120,26),"DONATOR",Color(255,255,255),"] ",Color(255,255,255), "<",Color(213,120,26), "]]..ply:Nick()..[[",Color(255,255,255), "> ",Color(255,255,255), "]]..text..[[")]])
		return ""
	end

end)

end

if CLIENT then

	net.Receive("sendChat",function()
		local color = net.ReadColor()
		local msg = net.ReadString()

		chat.AddText( color, msg)
	end)
end