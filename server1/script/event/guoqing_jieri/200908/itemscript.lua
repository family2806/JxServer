Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\guoqing_jieri\\200908\\head.lua")


function tbGuoqing0908:UseCapHepin(nItemIndex)
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate >= 20090927 then
		Talk(1, "" ,"�������.")
		return 0
	end
	
	
	local nResult, szFailMsg = self:IsPlayerEligible()

	if nResult ~= 1 then
		Talk(1, "", szFailMsg)
		return 1
	end
	
	if  CalcFreeItemCellCount() < 10 then
		Talk(1,"", format("�����ռ䲻����%d��, ������һ��.", 10));
		return 1
	end
	if not self.tbTask:CheckHepinCapExp() then
		Talk(1, "", format("ʹ�ô���Ʒֻ�ܵõ� %u����ֵ", self.tbTask.nMaxHepinCapExp))
		return 1
	end
	local _, _, nP = GetItemProp(nItemIndex)
	
	
	tbAwardTemplet:GiveAwardByList({nExp = 1e6}, "use "..GetItemName(nItemIndex))

	self.tbTask:AddHepinCapExp(1e6)

end


local tbAwardList = 
{
	[2099] = 
	{
		{nExp = 15e6},
		
	},
	[2100] = 
	{
		{nExp = 30e6},
	}
	
}

function tbGuoqing0908:UseCapOther(nItemIndex)
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate >= 20090927  then
		Talk(1, "" ,"�������.")
		return 0
	end
	
	
	local nResult, szFailMsg = self:IsPlayerEligible()
	if nResult ~= 1 then
		Talk(1, "", szFailMsg)
		return 1
	end
	
	if  CalcFreeItemCellCount() < 10 then
		Talk(1,"", format("�����ռ䲻����%d��, ������һ��.", 10));
		return 1
	end
	if not self.tbTask:CheckOtherCapExp() then
		Talk(1, "", format("ʹ�ô���Ʒֻ�ܵõ� %u����ֵ", self.tbTask.nMaxOtherCapExp))
		return 1
	end
	
	
--	if not self.tbTask:CheckUseCount() then
--		Talk(1, "", format("����Ʒ���ֻ��ʹ�� %d.", self.tbTask.nMaxUseCount))
--		return 1
--	end
	local _, _, nP = GetItemProp(nItemIndex)
	
	local tbItem = %tbAwardList[nP]
	if tbItem == nil then
		return 1
	end
	tbAwardTemplet:GiveAwardByList(tbItem, "use "..GetItemName(nItemIndex))

	self.tbTask:AddOtherCapExp(tbItem[1].nExp)
	self.tbTask:AddUseCount(1)
end