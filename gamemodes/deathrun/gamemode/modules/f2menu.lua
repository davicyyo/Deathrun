if SERVER then

	util.AddNetworkString("comprarMejora")

net.Receive("comprarMejora",function()
	local ent = net.ReadEntity()
	local prize = net.ReadString()
	local mejora = net.ReadString()
	local drpacks = tonumber(ent:getDRPacks()) - tonumber(prize)
	local lang = NodesLang[ent:GetPData("lang")]

	if ent:Team() == 0 then
		ent:sendNotify(lang.cantbuy)
		return
	end

	if tonumber(ent:getDRPacks()) >= tonumber(prize) then
		ent:setDRPacks(drpacks)
	else
		ent:sendNotify(lang.cantafford)
		return
	end


	if mejora == "gravity" then
		ent:SetGravity(0.3)
		ent:SetNWBool("gravity",true)
		--ent:sendHalo(Color(255,255,255))
	end

	if mejora == "speed" then
		ent:SetWalkSpeed(500)
	end

	if mejora == "impulse" then
		ent:SetNWBool("impulse",true)
		ent:sendNotify(lang.impulseInstructions)
	end

	if mejora == "rocket" then
		ent:Give("dr_cohete")
		ent:SelectWeapon("dr_cohete")
	end

	local text1 = string.Replace(lang.boughtItem,"%m",mejora)
	local text2 = string.Replace(text1,"%p",prize)

	ent:sendNotify(text2)
	ent:EmitSound("wohoo.wav")

end)

local check = 0
local pressed = false
hook.Add("Think","impulso_dr",function()
	for k,v in pairs(player.GetAll()) do
		if v:GetNWBool("impulse") then
			v.check = 0
	if v.check == 1 then return end
	if v:KeyDown(IN_ATTACK2) then
		if v.pressed then return end
		v.pressed = true
		v.check = 1
		timer.Simple(0.1,function()
		if IsValid(v) then
			local vec = v:GetAimVector() * 1000

			if v:IsPlayer() or v:IsNPC() then
				v:SetVelocity(vec)
				timer.Simple(0.2,function()
					v:SetNWBool("impulse",false)
					v:sendNotify(lang.impulseUsed)
				end)
			else
				local phys = v:GetPhysicsObject()
				if IsValid(phys) then phys:SetVelocity(vec) end
			end
		end
		end)
	else
		v.pressed = false
	end
end
	end
end)

end