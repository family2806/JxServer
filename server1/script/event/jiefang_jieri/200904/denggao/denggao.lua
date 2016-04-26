IncludeLib("RELAYLADDER")

Include("\\script\\lib\\awardtemplet.lua");
tbDenggaoItemAward =
{
	[1]		= {szName = "食物包",		tbProp = {3, 6, 1, 2018, -1},	nScore = 10},
	[2]		= {szName = "水瓶", 		tbProp = {3, 6, 1, 2019, -1},	nScore = 30},
	[3]		= {szName = "个人用品袋", 	tbProp = {3, 6, 1, 2016, -1},	nScore = 260},
	[4]		= {szName = "医药包", 		tbProp = {3, 6, 1, 2017, -1},	nScore = 60},
};

tbDenggaoScore =
{
	[1]	= {500, 	2000000,	"祝贺！你已到达500m的高度，前路崎岖艰险，加油！"},
	[2]	= {1000, 	3000000,	"祝贺！你已到达1000m的高度，前路崎岖艰险，加油！"},
	[3]	= {1500, 	5000000,	"祝贺！你已到达1500m的高度，前路崎岖艰险，加油！"},
	[4]	= {2000, 	10000000,	"祝贺！你已到达2000m的高度，前路崎岖艰险，加油！"},
	[5]	= {2200, 	15000000,	"已到正午, 休息一下吧. 从这回去我们要翻越很多更高的山峰."},
	[6]	= {2800, 	20000000,	"天黑了，搭帐篷休息下吧，今晚我们将一起生火唱歌!"},
	[7]	= {2900, 	20000000,	"经过一夜的休息你的体力一定都恢复了. 还等什么呢，加速一同登顶番西邦峰."},
	[8]	= {3000, 	20000000,	"加油.我们已经看到番西邦峰顶了!"},
	[9]	= {3143, 	30000000,	"恭喜！你已经登顶番西邦峰了!"},
};

tbTop10Award	=
{
	[1]	=
	{
		[1]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "玄真丹",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
		[3]	= {szName = "神秘矿石", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[2]	=
	{
		[1]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "神秘矿石",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
	},
	[3]	=
	{
		[1]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
		[3]	= {szName = "神秘矿石", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[4]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
	[5]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
	[6]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
	[7]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
	[8]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
	[9]	= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
	[10]= {szName = "天山雪莲", tbProp = {6, 1, 1431, 1, 0, 0}},
};

function item_exchange_score()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("大侠未达50级或未充值，因此不能参加活动", 0);
		return
	end
	local ndate = tonumber(GetLocalDate("%m%d"));
	if (GetTask(jf0904_TSK_denggao_ndate) ~= ndate) then
		SetTask(jf0904_TSK_denggao_ndate, ndate);
		SetTask(jf0904_TSK_denggao_curscore, 0);
	end
	tbDialog = {};
	for i = 1, getn(tbDenggaoItemAward) do
		tinsert(tbDialog, format("%s/#useitem(%d)", tbDenggaoItemAward[i].szName, i));
	end
	tinsert(tbDialog, getn(tbDialog)+1, "我只是顺路来玩./OnCancel");
	Say("请选要兑换的物品", getn(tbDialog), unpack(tbDialog));
end

function useitem(nIdx)
	local nCount = CalcItemCount(unpack(tbDenggaoItemAward[nIdx].tbProp));	-- 背包中的当前物品数量
	
	if (nCount == 0) then
		Say(format("背包里没有 ?%s!", tbDenggaoItemAward[nIdx].szName), 0);
		return
	end
	
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("大侠的积累值已达最高界限，先兑换奖励吧.", 0);
		return
	end
	
	local nCurScore = GetTask(jf0904_TSK_denggao_curscore);
	if (nCurScore + tbDenggaoItemAward[nIdx].nScore > 500) then
		Say(format("每人每天从活动中只能获得500积累点，今天已获得 %d点，不能再使用 %s", nCurScore, tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < nCount) then
		nCount = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	SetTaskTemp(114, nIdx);
	AskClientForNumber("exchangeitem", 0, nCount, "填入要兑换的数字")
end

function exchangeitem (nCount)
	local nIdx = GetTaskTemp(114);
	local tbProp = tbDenggaoItemAward[nIdx].tbProp;
	
	local n_Count 	= CalcItemCount(unpack(tbProp));	-- 背包中的当前物品数量
	local nCurScore	= GetTask(jf0904_TSK_denggao_curscore);
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < n_Count) then
		n_Count = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	if (nCount > n_Count) then
		Msg2Player("输入数字有误!", 0);
		return
	end
	
	local bP = ConsumeItem(tbProp[1], nCount, tbProp[2], tbProp[3], tbProp[4], tbProp[5]); --  返回1扣除成功，返回0失败，nCount为指定扣除的数量
	if (bP <= 0) then
		print(format("扣除 %s 失败!", tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	local nAddedScore = nCount * tbDenggaoItemAward[nIdx].nScore;
	SetTask(jf0904_TSK_denggao_curscore, GetTask(jf0904_TSK_denggao_curscore) + nAddedScore);	-- 每天的积分要加个当前的分数
	Say(format("兑换成功 %d %s, 今天的积累值是 %d.", nCount, tbDenggaoItemAward[nIdx].szName, GetTask(jf0904_TSK_denggao_curscore)), 0);
	SetTask(jf0904_TSK_denggao_totscore, GetTask(jf0904_TSK_denggao_totscore) + nAddedScore);
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("积累值已达最高界限，之前先把积累值兑换成奖励.", 0);
	end
end

function view_score()
	Say(format("现在积累值是 %d,大侠要兑换奖励吗?", GetTask(jf0904_TSK_denggao_totscore)), 2, "想/turn_score_2_exp", "我只是问问/OnCancel");
end

function turn_score_2_exp()
	if (GetTask(jf0904_TSK_denggao_totscore) < tbDenggaoScore[GetTask(jf0904_TSK_denggao_nidx)][1]) then
		Say("现在大侠无法兑换奖励.", 0);
		return
	end
	
	for i = GetTask(jf0904_TSK_denggao_nidx), getn(tbDenggaoScore) do
		if (GetTask(jf0904_TSK_denggao_totscore) >= tbDenggaoScore[i][1]) then
			Say(tbDenggaoScore[i][3], 0);
			if (tbDenggaoScore[i][2] + GetTask(jf0904_TSK_denggao_totexp) > 500000000)then
				AddOwnExp(500000000 - GetTask(jf0904_TSK_denggao_totexp))
				SetTask(jf0904_TSK_denggao_totexp, 500000000);
			else
				AddOwnExp(tbDenggaoScore[i][2]);
				SetTask(jf0904_TSK_denggao_totexp, GetTask(jf0904_TSK_denggao_totexp) + tbDenggaoScore[i][2]);	
			end
		else
			SetTask(jf0904_TSK_denggao_nidx, i);
			break;
		end
	end
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_nidx, 1);
		SetTask(jf0904_TSK_denggao_totscore, 0);
		SetTask(jf0904_TSK_denggao_gettoptimes, GetTask(jf0904_TSK_denggao_gettoptimes)+1);
		if (GetTask(jf0904_TSK_denggao_gettoptimes) == 1) then
			Ladder_NewLadder(10262, GetName(), 3143, 0);
		end
	end
end

function view_top10_player()
	tbRoleName = {};
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == "" and i == 1) then
			Say("排行表暂时没有消息!", 0);
			return
		end
		tinsert(tbRoleName, getn(tbRoleName)+1, "种类"..i.."等级: \t"..RoleName.."/OnCancel");
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "我只是来看看!/OnCancel");
	Say("排行表:", getn(tbRoleName), unpack(tbRoleName));
end

function get_award()
	if CalcFreeItemCellCount() < 3 then
		Say("为保证物品安全，请给背包留出空间（3个空格）", 0);
		return
	end
	local nrank = 0;
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == GetName()) then
			nrank = i;
			break;
		end
	end
	if (nrank <= 0 or nrank > 10) then
		Say("大侠还未进入排行榜因此不能领奖", 0);
		return
	end
	if(GetTask(jf0904_TSK_denggao_getaward) == 0) then
		tbAwardTemplet:GiveAwardByList(tbTop10Award[nrank], "前10名领取登顶番西邦峰的奖励");
		Say(format("恭喜你是成功登顶番西邦峰的第 %d人!", nrank),0);
		AddGlobalNews(format("恭喜 %s是成功登顶番西邦峰的第 %d人!", GetName(), nrank));
		SetTask(jf0904_TSK_denggao_getaward, 1);
	else
		Say("你已成功登顶", 0);
	end
end

function about_denggao()
	Say("礼官: 登顶FanXiPan峰活动从28-04-2009到31-05-2009,24:00. 活动期间，各位大侠可以到黄连姥姥处(390/317)登记登顶番西邦峰.", 0);
end