
Include("\\script\\lib\\pay.lua");	--充值的判断

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70314 and nDate <= 70321) then
		Say("老夫正在收集神秘密图，如果各位可以帮我找, 老夫一定予以重谢", 3,
					"用10张神秘密图交换银箱/sure2takeboxaward",
					"用10张神秘密图和金石交换金箱/sure2takeboxaward",
					"我还有其他事情要做/OnCancel");
	else
		Say("如果可以收集够神秘卷轴，将会发现更多的隐蔽宝藏",  0);
	end;
end;

function sure2takeboxaward(nSel)
	local nboxtype = nSel;
	local nmylevel = GetLevel();
	if (nmylevel < 50 or IsCharged() ~= 1) then
		Say("真不好意思! 只有玩家 <color=yellow>50级以上<color>已充值了才可以参加这个活动.", 0);
		return
	end;
	
	local njuanzhou = CalcEquiproomItemCount(6,1,196,-1);
	if (njuanzhou < 10) then
		Say("找到10张神秘密图之后回来找老夫!", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 6) then
		Say("请先整理背包!", 0);
		return
	end;
	--卷轴够了，看要什么宝箱
	if (nboxtype == 1) then	--黄金
		if (CalcEquiproomItemCount(6,1,1376,-1) >= 1) then
			ConsumeEquiproomItem(1,6,1,1376,-1);
			ConsumeEquiproomItem(10, 6, 1, 196, -1)	--删除叠加的神秘卷轴count个
			AddItem(6,1,1377,1,0,0);
			Msg2Player("得到<color=yellow>金箱");
			WriteLog(format("[收集神秘密图活动] \t %s\t 名字:%s\t Account: %s\t 得到一个金箱",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
		else
			Say("没有金石了，只能换走银箱，同意吗?", 2, 
						"用10张神秘密图换银箱/sure2takeboxaward", 
						"我整理下背包/OnCancel");
			return
		end;
	else										--白银
		ConsumeEquiproomItem(10, 6, 1, 196, -1)	--删除叠加的神秘卷轴count个
		AddItem(6,1,1378,1,0,0);
		Msg2Player("得到 <color=yellow>银箱");
		WriteLog(format("[收集神秘密图活动]\t %s\t Name: %s\t Account: %s\t 得到1个银箱",
														GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
	end;
	Say("累死了! 这是老夫的一点心意，请收下！", 0);
end;

function OnCancel()
end;
