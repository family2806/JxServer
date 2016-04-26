Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")



function tbFunv0903:GetItemByTuoGuan(nSpecialD)
	
	if (nSpecialD < 1) then
		return
	end
	
	if (ST_GetOffliveState() == 0) then
		
		local _tbItem = {szName="首饰盒", tbProp={6, 1, 1959, 1, 0, 0}, nExpiredTime = self.nComposeEndDate}
		if self:IsActDate() and self:IsPlayerEligible() then
			
			local nCurCount = CalcEquiproomItemCount(_tbItem.tbProp[1], _tbItem.tbProp[2], _tbItem.tbProp[3], _tbItem.tbProp[4])
			if (CalcFreeItemCellCount() < 2 and mod(nCurCount, 50) == 0  ) then
				Msg2Player(format("背包空间不够, 因此大侠无法领取 %s.", _tbItem.szName));
			else				
				tbAwardTemplet:GiveAwardByList(_tbItem, "tbFunv0903 tuoguan");
			end
		end
	
		
	end
end