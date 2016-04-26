Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\vonghoa\\item\\yanhua.lua")
Include("\\script\\lib\\awardtemplet.lua")

 
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("物品过使用期，自动消失.")
		return 0;
	end
	if (GetTask(Task_IsCurUse_VongHoa) ~= 0) then
		Talk(1,"","你正在使用物品 !")
		return 1
	end
	if (GetTask(Task_BeUse_VongHoa) >= nMaxEXP) then
		Talk(1,"","使用花圈达到最大经验值!")
		return 1
	end
	if (GetLevel() < 50) then
		Talk(1,"","等级低于50级，不能使用 !")
		return 1
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "装备不足5个空位.");
			return 1
	end
	Create_main(nItemIndex)
	--WriteLog(date("%Y%m%d %H%M%S").."\t".."行侠旗"..GetAccount().."\t"..GetName().."\t".."使用行侠旗")	
end