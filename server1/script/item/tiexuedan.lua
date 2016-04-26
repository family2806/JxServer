IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\task\\system\\task_string.lua")

function main()
	GiveItemUI("修白金装备", "放需要修的白金装备进去", "repair_platina", "OnCancel", 1);
	return 1;
end

function repair_platina(nCount)

	if nCount ~= 1 then
		CreateTaskSay({"放入物品的数量不和要求", "真是对不起，我将重新安排/main", "真是不好意思，我稍后回来./onCancel"});
		return
	end
	
	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);			--品质
	
	if (nQuality ~= 4) then
		CreateTaskSay({"请放需要修的白金装备.", "真是对不起，我将重新安排/main", "真是不好意思，我稍候回来./onCancel"});
		return
	end

	
	if (GetPlatinaLevel(nItemIndex) < 6) then
		CreateTaskSay({"只能修+6以上的白金装备.", "真是对不起，我将重新安排/main", "真是不好意思，我稍候回来./onCancel"});
		return
	end
	
	if (GetCurDurability(nItemIndex) == GetMaxDurability(nItemIndex)) then
		CreateTaskSay({"该装备已有最大的结实度了，不需要再修了", "真是对不起，我将重新安排/main", "真是不好意思，我稍候回来./onCancel"});
		return
	end
		
	if (ConsumeItem(3, 1, 6, 1, 2163, 1) ~= 1) then	-- 删除背包中的铁血丹
		WriteLog("[铁血丹修改目前的结实度]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\删除铁血丹失败");
		return
	end
	
	Msg2Player("修改成功!");
	
	SetCurDurability(nItemIndex, GetMaxDurability(nItemIndex));
end