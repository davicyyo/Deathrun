local meta = FindMetaTable("Player")

if SERVER then

	function meta:isEnemy()
		if self:Team() == 0 then
			return true
		else
			return false
		end
	end

	function meta:sendSpectate(ent)

		if not ent then
			ent = self
		end

		net.Start("spectate")
		net.WriteEntity(ent)
		net.Send(self)

		return

	end

	function meta:unSpectate()

		self:UnSpectate()

		net.Start("remove_spectate")
		net.Send(self)

		return

	end

	function meta:getDRPacks()
		return self:GetPData("dr_packs")
	end

	function meta:giveDRPacks(val)
		if not val then return end

		if self:getDRPacks() == nil then
			self:SetPData("dr_packs",val)
			self:SetNWInt("dr_packs",val)
		else
			self:SetPData("dr_packs",self:getDRPacks() + val)
			self:SetNWInt("dr_packs",self:getDRPacks() + val)
		end

		return
	end

	function meta:setDRPacks(val)
		if not val then return end

		self:SetPData("dr_packs",val)
		self:SetNWInt("dr_packs",val)

		return
	end

	function meta:sendNotify(string)
		if not string then return end

		net.Start("sendnotify")
		net.WriteString(string)
		net.Send(self)

		return
	end

	function meta:sendChat(color,text)
		if !color or !text then return end

		net.Start("sendChat")
		net.WriteColor(color)
		net.WriteString(text)
		net.Send(self)

		return

	end

	function meta:removeHalo()

		self:SetNWBool("HasHalo",false)

		return
	end

end

if CLIENT then
	function meta:getDRPacks(val)
		return self:GetNWInt("dr_packs")
	end
end