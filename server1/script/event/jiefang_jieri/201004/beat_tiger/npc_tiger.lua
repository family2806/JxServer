-- 寻花打虎 老虎
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")

function OnDeath(nNpcIndex)
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		Msg2Player("活动已结束");
		return
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		Msg2Player("活动还未开始，请注意活动时间.");
		return
	end		
	
	-- 记录怪物死亡时间
	local nDeathTime = GetCurServerTime();
	local tbPlayerInfo = tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	
	if tbPlayerInfo == nil then
		tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()] = {nkillTime = nDeathTime, nAwardDate = 0,};
	else
		tbPlayerInfo.nkillTime = nDeathTime;
	end
	
	Msg2Player("大侠已经打败杀血老虎了，请到留香处领奖!");
	
end

