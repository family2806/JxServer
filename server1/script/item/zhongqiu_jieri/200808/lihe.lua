--云游 仙游



Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	-- 云游盒
	local tbItem = 
	{
	{szName="蝴蝶灯笼", tbProp={6, 1, 1796, 1, 0, 0}, nRate = 1},
	{szName="星星灯笼", tbProp={6, 1, 1797, 1, 0, 0}, nRate = 33},
	{szName="长管灯笼", tbProp={6, 1, 1798, 1, 0, 0}, nRate = 33},
	{szName="圆灯笼", tbProp={6, 1, 1799, 1, 0, 0}, nRate = 33},
	}
	-- 仙羽盒
	local tbItem2 = 
	{
	{szName="蝴蝶灯笼", tbProp={6, 1, 1796, 1, 0, 0}, nRate = 97},
	{szName="星星灯笼", tbProp={6, 1, 1797, 1, 0, 0}, nRate = 1},
	{szName="长管灯笼", tbProp={6, 1, 1798, 1, 0, 0}, nRate = 1},
	{szName="圆灯笼", tbProp={6, 1, 1799, 1, 0, 0}, nRate = 1},
	}
	
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_liheEndTime then
		Say("该物品已过使用期.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then		
		Say("要求50级以上且已充值", 0)
		return 1
	end
	local nG, nD, nP = GetItemProp(nItemIndex)
	--local nCount = getn(tbItem)
	--if nP == 1795 then
		--for i=1, nCount do
			--tbItem[i].nRate =  (nCount - i + 1)*10
		--end
	--end
	
	if nP == 1794 then
		tbAwardTemplet:GiveAwardByList(tbItem, format("%s", GetItemName(nItemIndex)))
	elseif nP == 1795 then
		tbAwardTemplet:GiveAwardByList(tbItem2, format("%s", GetItemName(nItemIndex)))
	else
		return 1
	end		
end

