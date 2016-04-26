-- 奖励.lua (帮会招募弟子活动)
if (not __COLLG_AWARD_H__) then
	__COLLG_AWARD_H__ = 1;
Include([[\script\missions\tong\collectgoods\head.lua]]);
IncludeLib("FILESYS");

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
1000000
};

collg_tabRate = {--小福缘 仙草露 随机PK丸 中福缘 4级玄晶 大福缘 5级玄晶 随机水晶 任务卷轴 6级玄晶 7级玄晶 8级玄晶
	{0, 0, 0, 0, 0, 0.27, 0.2755, 0.12, 0.2, 0.1, 0.03, 0.0045},	--第一名
	{0, 0, 0, 0, 0.2, 0.172, 0.2, 0.1, 0.2, 0.1, 0.025, 0.003},	--
	{0, 0, 0, 0.061, 0.2, 0.137, 0.2, 0.1, 0.2, 0.08, 0.02, 0.002},	--
	{0.04, 0.04, 0.04, 0.061, 0.17, 0.137, 0.2, 0.05, 0.18, 0.072, 0.01, 0},	--
	{0.05, 0.05, 0.06, 0.068, 0.17, 0.137, 0.2, 0.05, 0.15, 0.06, 0.005, 0},	--
	{0.059, 0.06, 0.1, 0.1, 0.12, 0.15, 0.15, 0.05, 0.15, 0.06, 0.001, 0},		--
	{0.15, 0.12, 0.14, 0.1, 0.1, 0.1, 0.1, 0.01, 0.12, 0.06, 0, 0},	--
	{0.18, 0.17, 0.14, 0.1, 0.1, 0.05, 0.1, 0.01, 0.1, 0.05, 0, 0},	--
	{0.17, 0.15, 0.1, 0.2, 0.1, 0.05, 0.1, 0.01, 0.1, 0.02, 0, 0},	--
	{0.15, 0.13, 0.16, 0.25, 0.15, 0.05, 0.1, 0.01, 0, 0, 0, 0}	--第十名
};

--物品种类
tab_goods = {
	{122, 0, "福缘露(小) "},
	{71, 0, "仙草露 "},
	{"PK 丸"},
	{123, 0, "福缘露(中) "},
	{147, 4, "玄晶4级"},
	{124, 0, "福缘露(大) "},
	{147, 5, "玄晶5级"},
	{"水晶"},
	{"任务秘图 "},
	{147, 6, "玄晶6级"},
	{147, 7, "玄晶7级"},
	{147, 8, "玄晶8级"},
}


function collg_about()
	Say("每次活动举行 <color=red>15<color>分钟。其中有<color=red>5<color> 5分钟准备。报名参加后，玩家将被送到准备区域。活动开始时，区域内会出现货物袋，玩家只需要捡起这些货物袋，但是需要小心那些爆炸的虫子，突然出现飞到人身上爆炸。", 1, "下一页 /collg_about_next");
end;

function collg_about_next()
	Say("如果玩家被昆虫炸中，货物袋就会掉落，同时晕眩30秒。在晕眩时间，将不被爆炸虫进攻。如果被爆炸虫贴在身上，就能添加扔转技能，可以用该技能将虫子扔向他人。活动结束后，'<color=yellow>活动坊总管<color>' 将根据货物袋排名数量发奖励.", 0);
end;

function collg_aword()
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local nCount = GetTask(COLLG_COUNT_ONETIME);
	local nRank = GetTask(COLLG_TK_RANK);
	SetTask(COLLG_COUNT_ONETIME, 0);
	SetTask(COLLG_TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Say("活动坊总管: 你想领奖啊，快去找货物袋先吧，如果没有就来找我，也是浪费时间.", 1, "按照挥手规定飞出/oncancel");
		SetTaskTemp(193, 0);
		return
	end;
	
	Say("活动坊总管: 做的很好，你找到 <color=yellow>"..nCount.."<color> 货物袋，排名第<color=yellow>"..nRank.."<color>, 这是给你的奖励，请收下.", 1, "领取奖励./oncancel");
	collg_giveaward(nRank);
	SetTaskTemp(193, 0);
end;


function collg_giveaward(nRank)
	AddOwnExp(tabExp[nRank]);
	collg_goodsaward(nRank);
end;

function collg_festival_addpkwan()--加PK丸
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"长命丸", "加跑丸", "大力丸", "高闪丸", "高中丸", "飞速丸", "冰防丸", "雷防丸", "火防丸", "毒防丸"};
    Msg2Player("你获得一个"..tab_pkwan_name[itemidx]);
end;

function collg_goodsaward(nRank)
	local nGoodsType = collg_getgoodtype(nRank);
	
	if (nGoodsType == 3) then	--加一个PK丸
		collg_festival_addpkwan();
		return
	end;
	
	if (nGoodsType == 8) then	--随机一个水晶
		collg_givecrystal();
		return
	end;
	
	if (nGoodsType == 9) then	--加一个任务卷轴
		collg_giveTaskBook();
		return
	end;
	AddItem(6, 1, tab_goods[nGoodsType][1], tab_goods[nGoodsType][2], 0, 0, 0);
	local strsay = "你获得一个"..tab_goods[nGoodsType][3];
	Msg2Player(strsay);
end;

function collg_givecrystal()
	local nIdx = random(1, 3);
	local tab_Crystal = {{238, "蓝水晶"}, {239, "紫水晶"}, {240, "绿水晶"}};
	AddItem(4, tab_Crystal[nIdx][1], 0, 0, 0, 0, 0);
	Msg2Player("你获得 <color=yellow>"..tab_Crystal[nIdx][2].."<color>.");
end;

function collg_getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	local nBase = 0;
	for i = 1, getn(collg_tabRate[nRank]) do
		nBase = nBase + collg_tabRate[nRank][i] * 100;
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

-- 生成一个任务卷轴
function collg_giveTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	-- 选择一个第二层的随机任务
	nRandomTaskID = TaskNo(selectNextTask());
	-- 生成一个任务卷轴
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	-- 同步物品魔法属性
	SyncItem(nRandomItemIndex);	
	Msg2Player("你获得一个 <color=green>任务册color>!");
	WriteTaskLog("获得一个任务秘籍，号码为 "..nRandomTaskID);
	return nRandomTaskID;
end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)
	-- 如果是空值则不写入
	if strMain==nil then return end;
	WriteLog("[2006年帮会物品收集活动]"..GetLocalDate(" [%y 年 %m 月 %d 日 %H 时%M 分]").." [密码 "..GetAccount().."] [人物:"..GetName().."]:"..strMain);
end;

function oncancel()	--取消

end;

end; --// end of __COLLG_AWARD_H__