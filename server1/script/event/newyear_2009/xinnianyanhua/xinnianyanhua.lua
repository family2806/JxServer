Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\newyear_2009\\taskctrl.lua");
Include("\\script\\lib\\gb_taskfuncs.lua")

yanhua_gbtask	= "newyear0901";

tb_yanhua_specialreward	=
{
	{szName	= "神秘矿石", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "神秘矿石", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石",	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6级玄晶矿石", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "7级玄晶矿石", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7级玄晶矿石", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7级玄晶矿石", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7级玄晶矿石", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7级玄晶矿石", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "8级玄晶矿石", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "8级玄晶矿石", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "武林秘籍", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "武林秘籍", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "洗水晶", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName = "洗水晶", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName="安邦冰晶项链",	nQuality=1,	tbProp={0, 164}},
	{szName="安邦鸡血石戒指", nQuality=1, tbProp={0, 167}},
	{szName="安邦菊花石指环", nQuality=1, tbProp={0, 165}},
	{szName="安邦菊花石指环", nQuality=1, tbProp={0, 165}},
	{szName="柔情巾帼霓裳", 	nQuality=1, tbProp={0, 190}},
	{szName="紫水晶", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="紫水晶", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="紫水晶", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="紫水晶", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="紫水晶", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="蓝水晶", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="蓝水晶", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="蓝水晶", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="蓝水晶", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="蓝水晶", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="绿水晶", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="绿水晶", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="绿水晶", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="绿水晶", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="绿水晶", 			tbProp={4, 240, 1, 1, 0, 0}},
	{nExp = 20000000},
	{nExp = 20000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
};

tb_yanhua_randomaward	= tb_yanhua_specialreward;

function newyear0901_yanhua_dialogmain(nItemIndex, szDescLink)
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	if (gb_GetTask(yanhua_gbtask, 1) ~= n_dateD) then
		gb_SetTask(yanhua_gbtask, 1, n_dateD);
		gb_SetTask(yanhua_gbtask, 2, 0);
		gb_SetTask(yanhua_gbtask, 3, 0);
		newyear0901_random_spaward();
	end
	
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbTalk = {"<dec>"..szDescLink.."活动期间玩家送我一个发财红包就可以得到1个烟花，同时有机会得到一份特别礼物。注意：每天只能使用1个发财红包，特别奖励只能在21:00后领取.",
		"赠送发财红包/newyear0901_give_facaihongbao",
		"领取特别奖励/newyear0901_get_specialaward",
		"我只是路过./OnCancel"};
	CreateTaskSay(tbTalk);
end

function newyear0901_give_facaihongbao()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("大侠未够50级或者尚未充值，因此不能参加活动", 0);
		return
	end
	
	local n_dateD = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(newyear0901_TSK_GetYanhuaDate) == n_dateD) then
		Say("大侠今天已经交过发财红包并且也已领取贺春烟花了.", 0);
		return
	end
	
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH >= 21) then
		Say("今天领取贺春烟花的时间已经过了，请等到明天吧.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("大侠背包空间不够!",0);
		return
	end
	
	local nCount = CalcItemCount(3, 6, 1, 1893, -1); -- 返回 gdp道具的个数
	if (nCount <= 0) then
		Say("大侠的背包里还没有发财红包!", 0);
		return 
	end
	
	local bP = ConsumeItem(3, 1, 6, 1, 1893, -1); --  返回1扣除成功，返回0失败，nCount为指定扣除的数量 
	if (bP <= 0) then
		print("扣除发财红包失败!");
		return
	end
	
	local n_itemid = AddItem(6, 1, 1929, 1, 0, 0);
	ITEM_SetExpiredTime(n_itemid, 20090216);
	SyncItem(n_itemid);
	Say("恭喜大侠得到1个贺春烟花.", 0);
	
	AddOwnExp(1000000);
	n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	SetTask(newyear0901_TSK_GetYanhuaDate, n_dateD);
	gb_SetTask(yanhua_gbtask, 2, gb_GetTask(yanhua_gbtask, 2) + 1);
end

function newyear0901_get_specialaward()
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH < 21) then
		Say("现在不是领奖时间，待会再来吧.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetYanhuaDate) ~= n_dateD) then
		Say("今天大侠还没有交发财红包给我，所以没有机会领奖.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetSpAwardDate)	== n_dateD)	then
		Say("大侠已经参与了今天的特别领奖.", 0);
		return
	end
	
	if (gb_GetTask(yanhua_gbtask, 3) >= 60) then
		Say("今天的特别奖励已经发放完了，等到明天再来吧.", 0);
		return
	end
	
	SetTask(newyear0901_TSK_GetSpAwardDate, n_dateD);
	local n_rd_value = random(gb_GetTask(yanhua_gbtask, 2));
	local tb_award = tb_yanhua_randomaward[gb_GetTask(yanhua_gbtask, 3) + 1];
	if (n_rd_value <= 60) then
		tbAwardTemplet:GiveAwardByList(tb_award, "newyear0901_yanhua_specialaward");
		gb_SetTask(yanhua_gbtask, 3, gb_GetTask(yanhua_gbtask, 3) + 1);
		if (tb_award.nExp) then
			Say(format("大侠得到 %d经验.", tb_award.nExp));
		else
			Say(format("恭喜大侠得到 %s", tb_award.szName));
		end
	else
		Say("真可惜，大侠没有得到今天的特别奖励，继续努力吧！", 0);
	end
end

function newyear0901_random_spaward()
	local tb_award	= tb_yanhua_specialreward;
	local n_id1		= 0;
	local n_id2		= 0;
	local tb_tmp	= {};
	
	for i = 1, 100 do
		n_id1	= random(getn(tb_award));
		n_id2	= random(getn(tb_award));
		tb_tmp	= tb_award[n_id1];
		tb_award[n_id1] = tb_award[n_id2];
		tb_award[n_id2]	= tb_tmp;
	end
	
	tb_yanhua_randomaward	= tb_award;
end

function newyear0901_yanhua_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end