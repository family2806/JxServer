--by 廖志山 [2006-09-12]
--2006中秋活动:用10个五彩灯笼到礼官处领奖
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGUAN__) then
	__H_ITEM_LIGUAN__ = 1;

Include([[\script\event\mid_autumn06\head.lua]]);

tab_lg_award = {
	{	"武林秘籍",	125,	6,	1,	26, 1},
	{	"洗水晶",	125,	6,	1,	22, 1},
	{	"80级马",	250,	0,	10,	2,	4},
	{	"门派技能书",	400,	-1},
	{	"仙草露和福缘露",	4550,	-1},
	{	"八珍福月月饼",	4550,	6,	1,	126, 1},
};

tab_sbook_list =
{	-- 格式：{技能ID, 技能书名称}
	{27, "'袖箭术. 暴雨梨花' "},
	{28, "'陷阱术. 乱还击' "},
	{33, "太极拳谱. 卷3 "},
	{34, "太极拳谱. 卷2"},
	{35, "'云龙击. 矛派' "},
	{36, "'流星. 刀派' "},
	{37, "'天王锤法. 卷1' "},
	{38, "天王枪法- 卷2 "},
	{39, "天王刀法 - 卷3 "},
	{40, "'翠烟刀法' "},
	{41, "'翠烟双刀' "},
	{42, "'灭剑秘籍' "},
	{43, "'峨眉佛光掌秘笈' "},
	{45, "'飞刀术. 夜魂月影' "},
	{46, "'飞镖术. 九宫飞星' "},
	{47, "'五毒掌法. 卷 1' "},
	{48, "'五毒刀法. 卷 2' "},
	{49, "'五毒灭心术. 卷 3' "},
	{50, "'御风术' "},
	{51, "'驭雷术' "},
	{52, "'御心术' "},
	{53, "灭魂-摄咒"},
	{54, "'丐帮掌法' "},
	{55, "丐帮棍法"},
	{56, "'少林拳法. 卷 1' "},
	{57, "'少林棍法. 卷 2' "},
	{58, "'少林刀法. 卷 3' "},
	{59, "'秘籍图谱' "},
}

--礼官换奖品入口
function au06_lg_award()
	if (au06_is_inperiod() == 0) then --
		Say("活动结束了.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("只有充值玩家才可以参加中秋活动", 0);
		return
	end;
	
	local tab_Content = {
		"好了！我用10个特制五彩灯笼换你的礼物!/au06_shangjialingpai",
		"只是来看看你!/oncancel"
	};
	Say("中秋快乐！你想用10个特制五彩灯笼换我的礼物吗?", getn(tab_Content), tab_Content);
end;

function au06_shangjialingpai()
	if (CalcEquiproomItemCount(6, 1, 1234, -1) < 10) then
		Say("找够 <color=yellow>10个特制五彩灯笼<color> 之后到这!", 0);
		return
	end;
	
	--扣除物品
	if (ConsumeEquiproomItem(10, 6, 1, 1234, -1) ~= 1) then
		return
	end
	
	--随即种子
	local nIndex = 6;
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(tab_lg_award) do
		nSum = nSum + tab_lg_award[i][2];
		if (nSeed <= nSum) then
			nIndex = i;
			break;
		end;
	end;
	
	local szName = tab_lg_award[nIndex][1];
	--给予奖励
	if (nIndex == 4) then -- 增加技能书
		local bIdx = random(1, getn(tab_sbook_list));
		AddItem(6, 1, tab_sbook_list[bIdx][1], 1, 0, 0, 0);
		szName = "卷"..tab_sbook_list[bIdx][2];
	elseif (nIndex == 5) then -- 增加仙草和福缘
		AddItem(6, 1, 71, 1, 0, 0, 0);
		AddItem(6, 1, 124, 1, 0, 0, 0);
	elseif (nIndex == 3) then -- 增加仙草和福缘
		AddItem(0, 10, 2, 4, random(0, 4), 0, 0);
	else
		AddItem(tab_lg_award[nIndex][3], tab_lg_award[nIndex][4], tab_lg_award[nIndex][5], tab_lg_award[nIndex][6], 0, 0, 0);
	end;
	
	--给予提示
	Say("有了这些灯笼中秋就更加开心了！送给你！祝中秋快乐！", 0);
	Msg2Player("你得到<color=yellow>"..szName.."<color>");
end

end; --//end of __H_ITEM_LIGUAN__