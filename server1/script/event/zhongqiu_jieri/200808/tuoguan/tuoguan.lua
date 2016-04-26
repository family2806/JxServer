--zhongchaolong

--	玩家背包满时，系统会提醒并不再给玩家物品。
--还没到五分钟的线上托管而被中断，托管时间被刷新。 (像在线托管获得经验点的规则)
IncludeLib("SETTING")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
function zhongqiu0808_tuoguan(nSpecialD)
	
	
	if nSpecialD <= 0.5 * 0.5 then
	
		return
	end
	if zhongqiu0808_IsActDate()	~= 1 then
		return 
	end
	
	local tbItem = {szName="仙羽盒",tbProp={6, 1, 1795, 1, 0, 0}}
	
	if ST_GetOffliveState() == 0 then
		local nCount = CalcEquiproomItemCount(tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], -1)
	
		if CalcFreeItemCellCount() >= 1 or (nCount > 0 and nCount < 50 )  then
	
			tbAwardTemplet:GiveAwardByList(tbItem, "委托收集活动")
		else
			Msg2Player(format("您的装备已满，不能获得 %s.", tbItem.szName))
		end
	end
end