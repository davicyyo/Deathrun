

hook.Add("PlayerSay","voteban",function(ply,text)

	if string.Left(text,8) == "!vote" then

		for k,v in pairs(player.GetAll()) do
			if v:IsAdmin() or v:IsSuperAdmin() then ply:ChatPrint("Voteban desactivado, admins online.") return end
		end

		string.Replace(text,"!vote ","")

		for k,v in pairs(player.GetAll()) do

			if string.match( text, v:Nick() ) then
				ply:ChatPrint("Ha votado a expulsar a "..v:Nick())
			end
		end
	end
end)