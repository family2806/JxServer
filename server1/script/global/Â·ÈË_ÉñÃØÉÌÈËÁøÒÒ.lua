--以福缘出售物品的NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include([[\script\event\mid_autumn06\head.lua]]);
Include("\\script\\vng_feature\\thuongnhanthanbi\\moruongfour\\openchestfour.lua")

function main()
	local tab_Content = {
		"交易/OnBuy", 
		"结束对话/OnCancel", 
		"前往长白山顶/GotoHuanZhuan",
		"关于福缘/OnAbout"
	};
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "中秋活动/au06_lpaw_entrance");
	end;
	--tinsert(tab_Content, "开箱 4/#tbChectfour:main()");
	Say ( "客官想买什么？本店不缺货哦!", getn(tab_Content), tab_Content);
end

function OnBuy()
	Sale( 93, 2 );
end

function OnAbout()
	Talk( 3, "", "福缘点数：通过累积在线时间来兑换的一种虚拟点数，可以用来与襄阳的神秘商人柳乙兑换各种特殊物品。", "福缘兑换：累积两小时以上在线时间后，去各大城市找武林盟传人即可兑换。一天内如果两次成功兑换福缘，有额外奖励。累积在线时间4小时以内，每小时兑换1点福缘，4小时以上，前4小时每小时兑换1点，之后每两小时兑换1点。组队时，队伍中任意一个成员可以帮全队队员领取福缘。", "限制条件：坐牢期间不增加可换取福缘的在线时间。" );
end

function au06_lpaw_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("只有充值玩家才能参加中秋活动", 0);
		return
	end;
	Say("如果你有<color=yellow> 10 商贾令牌<color> 我会给你换一个<color=yellow>奉月果蓉<color> 送技能值或者1 <color=yellow>贡月芙蓉<color>送潜能值.", 3, "1个商贾令牌换取奖励/#shangjialingpai(1)", "10个商贾令牌换取奖励/#shangjialingpai(2)", "结束对话/oncancel");
end;

function shangjialingpai(nIndex)
	if (CalcEquiproomItemCount(6, 1, 1252, -1) < 10) then
		Say("需要10个商贾令牌才能换取奖励！", 0);
		return
	end;
	
	--扣除物品
	if (ConsumeEquiproomItem(10, 6, 1, 1252, -1) ~= 1) then
		return
	end
	
	--给予奖励
	local str = "<color=yellow>奉月果蓉<color>";
	if (nIndex == 1) then -- 增加一个技能点
		AddItem(6, 1, 127, 1, 0, 0, 0);
	else -- 增加5个潜能点
		AddItem(6, 1, 128, 1, 0, 0, 0);
		str = "<color=yellow>贡月芙蓉<color>";
	end;
	
	--给予提示
	Say("好啊！请接受一点礼物!", 0);
	Msg2Player("你达到"..str);
end;

function OnCancel()
end
function GotoHuanZhuan()
	NewWorld(934, 49632 / 32, 105696 /32)
end
