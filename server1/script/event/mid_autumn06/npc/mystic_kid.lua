--by 廖志山 [2006-09-12]
--2006中秋活动之做对话奖励,新手村小孩对话奖励
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--领奖入口
function main()
	if (au06_is_inperiod() == 0) then --
		Say("活动结束了.", 0);
		return 1;
	end;
	if (au06_IsPayed_player() == 0) then
		Say("只有充值玩家可以参加中秋活动", 0);
		return
	end;
	local str_Content = {
		"赠送特制彩蝶灯笼./#determine_get( 1 )",
		"赠送特制彩星灯笼./#determine_get( 2 )",
		"赠送特制管状灯笼./#determine_get( 3 )",
		"赠送特制圆形灯笼./#determine_get( 4 )",
		"赠送特制鲤鱼灯笼./#determine_get( 5 )",
		"赠送特制五彩灯笼./#determine_get( 6 )",
		"我现在很忙!/oncancel"
	};
	Say("<color=yellow>灯笼<color>很好看！可以送给小妹给妹妹们做礼物吗？小妹将送给大侠自己亲手做的月饼.", getn(str_Content), str_Content);
end;

--确定领奖
function determine_get(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5, 6};
	Say("大侠是想把灯笼送给小妹妹们吗?", 2, "额！希望小妹不要嫌弃！/#getaward("..tab_Index[nIndex]..")", "不行!这个灯笼我还在用呢/oncancel");
end;

--最终得奖
function getaward(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	local szCageName = tab_Lightcage[nIndex][3];
	
	--如果没有物品
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][1], -1) < 1) then
		Say("为什么骗我说送我但是还没有看到灯笼!?", 1, "啊！我忘记在储物箱里了./oncancel");
		return
	end;
	
	--如果经验达到上限
	if (GetTask(AU06_TK_EXP) >= EXP_AWARD_LIMIT) then
		Say("多谢！但是我已经有足够的灯笼了.", 1, "嘻嘻！去灯会玩要小心！/oncancel");
		return
	end;
	
	--扣除东西
	if (ConsumeEquiproomItem(1, 6, 1, tab_Lightcage[nIndex][1], -1) ~= 1) then
		return
	end;
	--给予物品
	AddItem(6, 1, tab_Lightcage[nIndex][7], 1, 0, 0, 0);
	--公告
	Say("谢谢! 这是我做的月饼，请收下.", 0);
	Msg2Player("你得到<color=yellow>"..tab_Lightcage[nIndex][8].."<color>.");
end;
