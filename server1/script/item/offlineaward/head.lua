--风云令牌-对各新手调整重生时间- Modified By DinhHQ - 20110926
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
BOX_SIHAIXIAOYAO = {
	ID = {6, 1, 2398, 1},
	Name = "四海逍遥丹礼盒",
	Pill = {
		Name = "四海逍遥丹",
		ID = {6, 1, 2378, 1},
		Count = 10,
		},
}

BOX_WUZHOULINGKONG = {
	ID = {6, 1, 2399, 1},
	Name = "五洲凌空丹礼盒",
	Pill = {
		Name = "五洲凌空丹",
		ID = {6, 1, 2397, 1},
		Count = 10,
		},
}

BOX_JIUTIANYUNYOU = {
	ID = {6, 1, 2400, 1},
	Name = "九天云游丹礼盒",
	Pill = {
		Name = "九天云游丹",
		ID = {6, 1, 2379, 1},
		Count = 10,
		},
}

function use(box)
	if (not box) then
		return 1
	end
	local pill = box.Pill
	if (CalcFreeItemCellCount() < 10) then
		Say(format("最少需要10个空位来储存<color=red>%s<color>.", pill.Name))
		return 1
	end
	--风云令牌-新手使用出物品锁- Modified By DinhHQ - 20110926
	if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
		for i = 1, pill.Count do		
			local nidx = AddItem(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4], 0, 0)
			SetItemBindState(nidx, -2)
		end
	else
		for i = 1, pill.Count do		
			AddItem(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4], 0, 0)
		end
	end
	
	Msg2Player(format("您获得%d %s", pill.Count, pill.Name))
	return 0
end
