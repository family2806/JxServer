Include("\\script\\lib\\awardtemplet.lua");

function jf0904_getjinnangshijian()
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jinnangsj) >= 1) then
		Say("你已经领取了锦囊事件.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("礼官: 背包空间不够，请整理出空位（最少1格）!", 0);
		return
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("大侠的级别不够50级或者未充值因此无法领取锦囊事件.", 0);
		return
	end
	
	local nIndex = AddItem(6, 1, 1833, 1, 0, 0);
	ITEM_SetExpiredTime(nIndex, jf0904_item_expiredtime);
	SyncItem(nIndex);
	Say("礼官: 请领取!", 0);
	SetTask(jf0904_TSK_jinnangsj, 1);
end