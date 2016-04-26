PlayerFloor3 = {}
PlayerFloor3.nCurCamp = 1 --用来给玩家设置临时阵营
PlayerFloor3.tbTmpCamp = {}

function PlayerFloor3:OnLeaveMap()
	SetDeathScript("")
	SetFightState(0) --非战斗状态
	ForbidChangePK(0)
	SetPKFlag(0)
	DisabledUseTownP(0) --可以使用回城符
	SetTmpCamp(0)
	local szName = GetName()
	self.tbTmpCamp[szName] = nil
	local nMapId = GetWorldPos()
	local tbGame = DynamicExecute("\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "getglobal", "GameFloor3")	
	local tbMapCapacity = tbGame.tbMapCapacity
	if (tbMapCapacity[nMapId] ~= nil and tbMapCapacity[nMapId] > 0) then
		tbMapCapacity[nMapId] = tbMapCapacity[nMapId] - 1
	end
end

function PlayerFloor3:OnEnterMap()
	SetDeathScript("\\script\\missions\\tianchimijing\\floor3\\playerdeath.lua")	
	RemoveSkillState(987)	
	SetLogoutRV(1)
	SetFightState(1) --战斗状态
	ForbidChangePK(1); --不改变pk	
	SetPKFlag(1) --pk标记	
	DisabledUseTownP(1) --不能使用回城符
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
	self:SetCamp() --设置临时阵营
	local nMapId = GetWorldPos()
	local tbGame = DynamicExecute("\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "getglobal", "GameFloor3")	
	local tbMapCapacity = tbGame.tbMapCapacity
	if (tbMapCapacity[nMapId] == nil) then
		tbMapCapacity[nMapId] = 0
	end
	tbMapCapacity[nMapId] = tbMapCapacity[nMapId] + 1
end

function PlayerFloor3:SetCamp()
	local nTmpCamp = GetTmpCamp()
	if(nTmpCamp == 0) then --如果还未给当前玩家设置临时阵营
		local szName = GetName()
		if(self.tbTmpCamp[szName] == nil) then
			local nTeamSize = GetTeamSize()
			if nTeamSize == 0 then
				DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\tianchimijing\\floor_templet\\game.lua", "Game:WritePlayerLog", 3, "进入地图, 所有队伍有1人")
			else
				DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\tianchimijing\\floor_templet\\game.lua", "Game:WritePlayerLog", 3, "进入地图, 所有队伍有"..nTeamSize.." 人")
			end
			SetTmpCamp(self.nCurCamp)
			self.tbTmpCamp[szName] = self.nCurCamp
			for i=1, nTeamSize do
				local szMemberName = CallPlayerFunction(GetTeamMember(i), GetName)
				self.tbTmpCamp[szMemberName] = self.nCurCamp
			end
			self.nCurCamp = self.nCurCamp + 1
		else
			SetTmpCamp(self.tbTmpCamp[szName])
		end
	end
end