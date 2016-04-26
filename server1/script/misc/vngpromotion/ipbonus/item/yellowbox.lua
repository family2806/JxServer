Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

function main(nItemIndex)
--	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
--		Talk(1,"", "该物品已过期")
--		return 0
--	end
	
	if GetLevel() < 50 then
		Talk(1,"", "等级不够50级，请再练习")
		return 1
	end
	
	local nMonth = tonumber(date("%m"))
	if GetByte(GetTask(TASKID_YELLOW_USE_DATE),1) == nMonth then
		Talk(1,"", "每个月只能使用该物品最多一次")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("装备空位不足 %d 空位，请再安排一下.", 2))
		return 1
	end
	
	local nAddExp = YELLOW_ITEM_EXP
	SetTask(TASKID_YELLOW_USE_DATE, SetByte(GetTask(TASKID_USE_TIMES),1,nMonth))
	AddOwnExp(nAddExp)
	Msg2Player("你获得"..nAddExp.."经验值.")
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","使用黄宝盒",GetAccount(),GetName()))		
	return 0;
end