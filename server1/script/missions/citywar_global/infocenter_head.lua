IncludeLib("LEAGUE")
IncludeLib("TONG")
Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\citywar_function.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\citywar_global\\ladder.lua")
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

LGTSK_QINGTONGDING_COUNT = 1;	--报名竞投的 挑战令数量
LGTSK_CITYWAR_SIGNCOUNT = 2;	--当前竞投的次数

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
nCityWar_Item_ID_G = 6		--攻城战信物G ID
nCityWar_Item_ID_D = 1	--攻城战信物D ID
nCityWar_Item_ID_P = 1499		--攻城战信物P ID
TIAOZHANLING_TASK_DATE = 1839 --挑战令记录领取时期,1.时间(年%y),2.时间(月)，3.时间(日),4.领取次数
TIAOZHANLING_TASK_COUNT = 1840 --挑战令交纳次数
	
function OnCancel()
end;

function PreEnterGame()
	--如果玩家所在帮会正在进行擂台赛,则自动进入该场地
	TongName, result = GetTong()
	if (TongName ~= "") then
		for i = 0, 7 do
			if (IsArenaBegin(i) == 1) then
				Tong1, Tong2 = GetArenaBothSides(i);
				if (Tong1 == TongName or Tong2 == TongName) then
					EnterBattle(i);
					return
				end;
			end;
		end;
	end;

	--否则,请玩家自己选择进入哪一个
	EnterGame();
end;

function EnterGame()
	ExtraArenaInfo = {"<#> (空地) ", "<#> (空地) ", "<#> (空地) ", "<#> (空地) ", "<#> (空地) ", "<#> (空地) ", "<#> (空地) ", "<#> (空地) "};
	for i = 0, 7 do
		if (IsArenaBegin(i) == 1) then
			Tong1, Tong2 = GetArenaBothSides(i);
			ExtraArenaInfo[i + 1] = " ("..Tong1.." vs "..Tong2..") "
		end;
	end;

	Say("你想进攻城战擂台预选赛吗??", 9, "<#> 擂台1"..ExtraArenaInfo[1].."/EnterBattle", "<#>擂台2"..ExtraArenaInfo[2].."/EnterBattle", "<#>擂台3"..ExtraArenaInfo[3].."/EnterBattle", "<#>擂台4"..ExtraArenaInfo[4].."/EnterBattle", "<#>擂台5"..ExtraArenaInfo[5].."/EnterBattle", "<#>擂台6"..ExtraArenaInfo[6].."/EnterBattle", "<#>擂台7"..ExtraArenaInfo[7].."/EnterBattle", "<#>擂台8"..ExtraArenaInfo[8].."/EnterBattle","不去了/OnCancel");
end;

function EnterBattle(nBattleId)

	if (IsArenaBegin(nBattleId) ~= 1) then 
		return 
	end;

	SetFightState(0)
	--设置返回点
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);

	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;


-- function main()
	--
--	ArenaMain();
-- end

--报名指定城市擂台赛 [wxb 2004-3-31](废弃2006-11-22)
function SignupACity(sel)
	CityID = sel + 1;
	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "请输入投标的金额:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >城, 擂台报名还未开始", 0);
	end;
end;

--报名唯一的正在报名阶段的擂台赛 [wxb 2004-3-31](废弃2006-11-22)
function SignUpTheOne()
	CityID = 0;
	for i = 1, 7 do
		if (IsSigningUp(i) == 1) then
			CityID = i;
		end;
	end;

	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "请输入投标的金额:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >城, 擂台报名还未开始", 0);
	end;
end;

--玩家输入投标金后到这里 [wxb 2004-3-31](废弃2006-11-22)
function SignUpFinal(Fee)
	CityID = GetTaskTemp(15);
	SignUpCityWarArena(CityID, Fee);
end;

--查询昨天竞投挑战令的情况
function citywar_CheckVotes()
	local nCityId = getSigningUpCity(1);
	local tbVotes = citywar_tbLadder:GetInfo()
	local szMsg = format("<dec><npc>下面是帮会参加竞投挑战令<%s>: <enter>%s%s%s<enter>", GetCityAreaName(nCityId), strfill_center("STT",4, " "), strfill_center("帮会", 20, " "), strfill_center("数量", 20, " "))
	local res = {}
	for i = 1, getn(tbVotes) do
		tinsert(res, strfill_center(i, 4, " "))
		tinsert(res, strfill_center(tbVotes[i].szName, 20, " "))
		tinsert(res, strfill_center(tbVotes[i].nValue, 20, " "))
		tinsert(res, "<enter>")
	end
	PushString(szMsg)
	for i = 1, getn(res) do
		AppendString(res[i])
	end
	szMsg = PopString()
	TaskSayList(szMsg, "谢谢!我明白了./OnCancel")
end
--入口
function ArenaMain()
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Say(format("现在攻城占城<%s>正在报名, 你要登记吗?",GetCityAreaName(nCityId)), 7, "报名攻城战/SignUpCityWar", "我想看看攻城战的报名情况/ViewCityWarTong","我想看看帮会挑战令的数量/ViewTiaoZhanLing","了解攻城战情况/GameInfo", "商议占城令牌/TokenCard", "购买攻城战辅助用具/AskDeal", "什么都不需要/OnCancel");
	else
		Say("这是商议攻城战的地方，你有什么事吗?",
			7,
			"我来交令牌/GiveTiaoZhanLing",
			"看挑战令投标情况/citywar_CheckVotes" ,
			"我想看看帮会挑战令的数量/ViewTiaoZhanLing",
			"了解攻城战情况/GameInfo",
			"商议占城令牌/TokenCard",
			"购买攻城战辅助用具/AskDeal",
			"什么都不需要/Cancel");
	end;
end;

--查看已经报名参加攻城战的帮会
function ViewCityWarTong()
	local caption = nil
	local nCityId = getSigningUpCity(1);
	local nlgID = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId)) 
	--LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId),
	local nlgcount = LG_GetMemberCount(nlgID)
	if nlgcount == 0 then
		caption = "<dec>现在没有帮会报名攻城."	
	else
		caption = "<dec>报名攻城战的帮会: \n"
		PushString(caption)
		for nindex=0,nlgcount do
			szTongName = LG_GetMemberInfo(nlgID,nindex)
			AppendString("<color=yellow>")
			AppendString(szTongName)
			AppendString("<color>\t")
		end
		caption = PopString()
	end
	local option = {"返回/ArenaMain", "离开/OnCancel"}
	TaskSay(caption, option)
end

--交纳挑战令
function GiveTiaoZhanLing()
	if checkBangHuiLimit() == 0 then
			Say("不好意思! 你还没有加入任何帮派！",0);
			return 0;
	end
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCount >= 300) then
			Say("每天最多提交300块令牌。今天你已经提交了300块令牌，明天继续吧",0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end

	local szlgname = GetTongName();
	--****判断是否创建了该社团
	checkCreatLG(szlgname);
	
	--**判断是否加入了该社团
	checkJoinLG(szlgname);
	local szTongName, nTongID = GetTongName();
	local nsum = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nsum >= 2000000000 then   --上限达20亿则不能再提交
		Say("武林令总数已达上限。别的时候再试试吧.",0)
		return 0;
	end
	--**提交挑战令
	GiveItemUI("提交挑战令", "挑战令可以兑换 20万经验, 帮会用来报名攻城战.", "sure_GiveTiaoZhanLing", "OnCancel");
end

function sure_GiveTiaoZhanLing(nCount)
	if nCount <= 0 then
		Say("真可惜, 你还没有交挑战物品给我",2,"交物品/GiveTiaoZhanLing","我想一想/OnCancel");
		return 0;
	end
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= nCityWar_Item_ID_G or d ~= nCityWar_Item_ID_D or p ~= nCityWar_Item_ID_P) then
			Say("我不想要别的, 只需带给我<color=yellow>挑战令<color>就可以了.", 2,"交物品/GiveTiaoZhanLing","我想一想/OnCancel");
			return 0;
		end;
	end;
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCountall = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCountall+nCount > 300) then
			Say(format("真遗憾, 今天你已经上交 %d挑战令, 只需再上交 %d 令牌就可以了.",nCountall,300-nCountall),0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end
	local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local szplayName = GetName()
	--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName);
	--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
	--local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE, szTongName, szplayName, LGTSK_QINGTONGDING_COUNT);
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	--ConsumeEquiproomItem(nCount, nCityWar_Item_ID_G, nCityWar_Item_ID_D, nCityWar_Item_ID_P, -1);
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;
	SetTask(TIAOZHANLING_TASK_COUNT,nCountall+nCount);
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "");
	
	
	--print(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "")
	--增加经验,提交1个增加20万经验
	nAddExp = nCount * 200000
	AddOwnExp(nAddExp)
	Msg2Player(format("你已上交 %d 挑战令, 得到 %d 经验",nCount,nAddExp))
	WriteLog(format("[攻城战_交挑战令]Date:%s Account:%s Name:%s Tong:%s Count:%d Exp:%d",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szTongName,nCount,nAddExp))
end;

--查询挑战令
function ViewTiaoZhanLing()
		local szTongName, nTongID = GetTongName();
		if (nTongID == 0 or ( GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER)) then
			Say("真可惜, 只有帮助和长老才可以看挑战令的数量信息.", 0);
			return 0
		end
		--local szlgname = GetTongName();
		--****判断是否创建了该社团
		checkCreatLG(szTongName);
	
		--**判断是否加入了该社团
		checkJoinLG(szTongName);
		--local nCityId = getSigningUpCity(1);
		--local szTongName, nTongID = GetTongName();
		--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE, szTongName);
		--local szplayName = GetName()
		--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
		--Msg2Player(nlid)
		--local nCurCount = LG_GetMemberTask(nlid, LGTSK_TIAOZHANLING_COUNT)
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		
		Say(format("贵帮已上交了<color=yellow>%d<color>挑战令.",nCurCount),0)
end

--关于令牌的处理 start************************************************
function TokenCard()
	Say("挑战令牌要留给想去支援帮会攻守城的人! 请问一下义士的目的是什么?", 4, "买占城令牌/BuyCard", "守令牌/CheckCard", "退回令牌/ReturnCard", "不做什么/OnCancel");
end;

function BuyCard()
	if (GetName() == GetTongMaster()) then
		TongName, result = GetTong()
		for i = 1, 7 do
			Tong1, Tong2 = GetCityWarBothSides(i);
			if (Tong1 == TongName) then
				SetTaskTemp(15, CardTab[i * 2 - 1]);
				str_format = format("原来大侠是挑战城 %s的人, 真厉害，这里有卖攻城令牌，这个令牌有保留贵帮联盟5天的效力，每个令牌售价 %s两.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "买一点/DealBuyCard", "暂时不需要/OnCancel");
				return
			elseif (Tong2 == TongName) then
				SetTaskTemp(15, CardTab[i * 2]);
				str_format = format("原来大侠是 %s城的太守, 这里有卖守城令牌，这个令牌有保留贵帮联盟5天的效力，每个令牌售价 %s两.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "买一点/DealBuyCard", "暂时不需要/OnCancel");
				return
			end;
		end;
		Say("你和攻守城的帮派没有关系！不能使用占城令牌!", 0);
	else
		Say("只有帮主才能买占城令牌", 0);
	end;
end;

function DealBuyCard(CardID)
	AskClientForNumber("PayForCard", 1, 30, "你要多少?");
end;

function PayForCard(count)
	CardItemID = GetTaskTemp(15);
	if (CardItemID > 0 and count > 0) then
		if (Pay(count * CardPrice) ~= 0) then
			for i = 1,count do
				AddEventItem(CardItemID);
			end;
			Say("请妥善保存！这个令牌是战场上同盟的见证！请注意令牌的时间，只有5天的效力，如果过期了就不能使用，可以到这退换和拿回费用", 0);
		end;
	end;
end;

function CheckCard()
	count = 0;
	CardItemID = 0;
	for i=1,14 do
		newcount = count + GetItemCountEx(CardTab[i])
		if (newcount > count) then
			CardItemID = CardTab[i];
			count = newcount;
		end;
	end;
	if (count == 0) then
		Say("你身上没有任何令牌!", 0);
	elseif (count > 1) then
		Say("你带了太多的占城令牌，不知你要验证哪块！请只带一块令牌就好!", 0);
	elseif (CardItemID ~= 0) then
		life = GetItemLife(CardItemID);
		if (life < 0) then
			Say("这块令牌的情况是......", 0);
		elseif (life < 7200) then
			Say(format("这些攻城令牌的数量要在 %s 日前发出, 现在依旧有效力.",floor(life/1440)), 0)
		else
			Say(format("这些攻城令牌的数量要在 %s 日前发出, 现在已经过期了, 没有使用效力.",floor(life/1440)), 0);
		end;
	end;
end;

function ReturnCard()
	count = 0;
	for i=1,14 do
		count = count + GetItemCountEx(CardTab[i]);
	end;
	if (count <= 0) then
		Say("你身上没有任何令牌!", 0);
	else
		str_format = format("攻城令牌可以用 %s两回收, 你同意退还吗?",count*ReturnCardPrice);
		Say(str_format, 2, "我想退还/DealReturnCard", "不, 我只是问问/OnCancel");
	end;
end;

function DealReturnCard()
	money = 0;
	for i=1,14 do
		count = GetItemCountEx(CardTab[i]);
		if (count > 0) then
			money = money + count * ReturnCardPrice;
			for j=1,count do DelItemEx(CardTab[i]) end;
		end;
	end;
	Earn(money);
end;
--关于令牌的处理 end**************************************************

--AskDeal攻城战辅助道具 转到citywar_global\\citywar_function.lua

--了解攻城战情况 start************************************************
function GameInfo()
Say("想要了解哪个城市?", 9, GetCityAreaName(1).."/CityInfo", GetCityAreaName(2).."/CityInfo", GetCityAreaName(3).."/CityInfo", GetCityAreaName(4).."/CityInfo", GetCityAreaName(5).."/CityInfo", GetCityAreaName(6).."/CityInfo", GetCityAreaName(7).."/CityInfo", "Tr?v?ArenaMain", "不需要/OnCancel");
end;

--"赛程安排/ArenaInfo", 
--"比武结果/AllArenaInfo", 
function CityInfo(nSel)
	local nCityId =  nSel + 1;
	SetTaskTemp(245, nCityId);
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(format("想要了解攻城战 %s的什么信息?",GetCityAreaName(nCityId)), 4, 
		"报名情况/RegisterInfo", 
		"攻城战事/CityWarInfo", 
		"返回/GameInfo", 
		"不需要/OnCancel");
end;

function RegisterInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	
	local nHour = tonumber(GetLocalDate("%H"));
	if (nHour<18 or nHour>=19) then
		Say("现在不是攻城战的报名时间.", 2, "返回/GameInfo", "不需要/OnCancel");
		return 0;
	end;
	if (nCityId ~= getSigningUpCity(1) or getSignUpState(nCityId) ~= 1) then
		Say(format("现在攻城战 <%s> 不在报名阶段.",GetCityAreaName(nCityId)), 2, "返回/GameInfo", "不需要/OnCancel");
		return 0;
	end;
	
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<暂无>"
	if (szElector == "" or szElector == nil) then
		szElector = "<暂时不>";
	end;
Say(format("攻城战<%s>正在准备，参赛帮会令牌排行第一是: %s<color=red><enter>如果有帮会的令牌数量和第一相同，则由系统随机选出明天的攻城帮.<color>",GetCityAreaName(nCityId),szElector), 2, "返回/GameInfo", "不需要/OnCancel");
end;


function getCityWarElector(szLeagueName)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)

	if (leagueObj == 0) then
		return 
	end;
	local nMem = LG_GetMemberCount(leagueObj);
	if (nMem < 1) then
		return
	end;
	local szMem = "";
	local tbMem = {};
	for i = 0, nMem - 1 do
		szMem = LG_GetMemberInfo(leagueObj, i);
		ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
		if (getn(tbMem) == 0) then
			tbMem[1] = {szMem, ncount};
		else
			if (ncount == tbMem[1][2]) then
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			elseif (ncount > tbMem[1][2]) then
				tbMem = {};
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			end;
		end;
	end;
	--local szMem = LG_GetMemberInfo(leagueObj, 0)
	return tbMem[random(getn(tbMem))][1];
	--return LG_GetMemberInfo(leagueObj, 0)
end;

--赛程安排-(废弃2006-11-22)
function ArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(GetArenaSchedule(nCityId), 0);
end;

function AllArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	--Say(GetArenaInfoByCity(nCityId), 0);
end;

function CityWarInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	local str_format = format("攻城战 <%s> 明天: ",GetCityAreaName(nCityId));
	local str1, str2 = GetCityWarBothSides(nCityId);
	if (str1 ~= "" and str2 ~= "" ) then
		if (nCityId == getSigningUpCity(2)) then
			str_format = format("攻城战 <%s> 今天: ",GetCityAreaName(nCityId));
			if (HaveBeginWar(nCityId) == 1) then 
				str_format = format("眼下 <%s> 处于攻城战阶段: ",GetCityAreaName(nCityId));
			end;
		end;
		str_format = format("守方%s是%s, 攻方是%s!",str_format,str2,str1);
		Say(str_format , 2, "返回/GameInfo", "不需要/OnCancel");
	else
		Say(format("眼下 %s 还没进入攻城战阶段!",GetCityAreaName(nCityId)) , 2, "返回/GameInfo", "不需要/OnCancel");
	end;
end;


--了解攻城战情况 end**************************************************

--领取攻城信物 start**************************************************
	function checkIsTakeQingtongDing(szTongName, nTongID, nCityId)
		if (nTongID == 0 or GetTongMaster()~= GetName()) then
			Say("只有报名攻城帮会的帮主和在令牌比赛中失败的帮会帮主才可以领信物.", 0);
			return 0;
		end;
		if (nCityId < 1 or nCityId > 7) then
			return 0;
		end;
		
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour < 19) then
			Say("领取攻城信物的时间已经结束了, 每天在19h00到24h00这个时段中，争夺令牌失败的帮会可以到我这里来领取挑战令.", 0)
			return 0;
		end;
		
		if (getSignUpState(nCityId) == 1) then
			Say(format("报名参加 %s城明天的争夺令牌还没有结束，可以继续参加.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityWarBothSides(nCityId);
		if (szChallenger == szTongName) then
			Say(format("贵帮已成为明天攻城 %s的帮会,攻城信物已交还给太守了.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityOwner(nCityId);
		if (szChallenger == szTongName) then
			Say(format("你是 %s城的太守, 不应该再接受攻城信物了.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
		if (FALSE(nlid)) then
			Say("还没有报名参加明天的攻城战，这里没有你的信物.", 0);
			return 0;
		end;
		return 1;
	end;
	
	function getSignUpState(nCityId)
		return LG_GetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), 1);
	end;
	
function TakeQingtongDing()
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) ~= 1) then
		return 0
	end;
	local ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	if (ncount < 1) then
		Say("报名攻城信物我已经都还给你了.", 0);
	else
		Say(format("你有%s挑战令, 领令牌前请先整理背包.",ncount), 3, "我想领令/#sure_takeQingtongDing("..ncount..")", "返回/ArenaMain", "一下回来/OnCancel");
	end;
end;

function sure_takeQingtongDing(ncount)
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) == 1) then
		local nFree = CalcFreeItemCellCount();
		if (nFree > 6) then
			local szMsg = format("这是<color=yellow>%s<color>你的挑战令.",ncount);
			if (nFree < ncount) then
				szMsg = format("你有<color=yellow>%s<color>挑战令, 因为背包空间不足, 我退还来之前的 %s块. 还有<color=yellow>%s<color>没有领取, 今天24h00 之前领取!",ncount,nFree,(ncount - nFree));
				ncount = nFree;
			end;
			for i =1, ncount do
				AddItem(nCityWar_Item_ID_G,nCityWar_Item_ID_D,nCityWar_Item_ID_P,1,1,1);--qingtongding
			end;
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, -nFree);
			WriteLog(format("[争夺攻城令]%s Name:%s Account:%s Tong:%s 城市 %s 领取挑战令 %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),ncount));
			Say(szMsg, 0);
		else
			Say("背包空间不足. 注意要在24h00之前到这领回信物, 如果不来就不能再领取了.", 0);
		end;
	end;
end;

--领取攻城信物 end****************************************************

--报名攻城战 start****************************************************
function SignUpCityWar()
	local nCityId = getSigningUpCity(1);
	
	local szTongName, nTongID = GetTongName();
	
	if (checkSignUpCityWar(szTongName, nTongID, nCityId) ~= 1) then
		return 0;
	end;
	
	local szMsg = format("<dec>现在正进行 %s城报名.",GetCityAreaName(nCityId));
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<暂无>"
	
	if (szElector == "" or szElector == nil) then
		szElector = "<暂时不>";
	end;

	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	if (FALSE(nlid)) then
		szMsg = szMsg.."只要有'挑战令' 就可以参加争夺. 争夺规则: 还没有占城的18级以上帮会可以使用'挑战令'参加竞争. 竞争时间是每天18h00到19h00. 19h00之前, 得到挑战令最多的帮会有权参加明天参加攻城战.<color=red><enter>如果有帮会的令牌数量并列第一的话系统将随机抽取一个进行明天的攻城.<color><enter>现在排名第一的帮会是："..szElector
	else
		
		local nCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
		
		--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT)
		szMsg = format("%s争夺规则: 还没有占城的18级以上帮会可以使用'挑战令'参加竞争. 竞争时间是每天18h00到19h00. 19h00之前, 得到挑战令最多的帮会有权参加明天参加攻城战.<color=red><enter>如果有帮会的令牌数量并列第一的话系统将随机抽取一个进行明天的攻城.<color><enter>现在排名第一的帮会是：%s<enter>贵帮争夺 %s的挑战令数量是%s",szMsg,szElector,szTongName,nCount)
	end;
	TaskSayList(szMsg, "我想竞争令牌/want_signupcitywar", "返回/ArenaMain", "我想一下/OnCancel");
end;

function want_signupcitywar()
	--local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCurCount <= 0 then
		Say("贵帮没有挑战令, 不能上交, 请收集了挑战令以后再来找我.",0)
		return 0
	end
	if nCurCount > 1000000 then
		nCurCount = 1000000
	end
	AskClientForNumber("sure_signupcitywar", 0,nCurCount,"上交挑战令")
	--if (FALSE(nlid)) then
		--if (GetCash() >= 10000000) then
			--GiveItemUI("攻城战信物", "请将攻城战信物——挑战令放进去吧。", "sure_signupcitywar", "OnCancel");
		--else
			--Say("第一次报名攻城战需要较纳<color=yellow>1000W两<color>银子，你身上没有带这么多钱。你先准备好报名费再来吧。", 0);
		--end;
	--else
		--local nNum = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName,LGTSK_CITYWAR_SIGNCOUNT);
		--if (nNum >= 3) then
			--Say("您的竞投次数已经达到<color=yellow>3次<color>，您现在不能继续投注，请您等待竞投结果的公布。", 0);
		--else
			--GiveItemUI("攻城战信物", "每个挑战令可以换取5万点经验，挑战令可用来报名帮会攻城战。", "sure_signupcitywar", "OnCancel");
		--end;
	--end;
end;

function sure_signupcitywar(nCount)
	--Msg2Player(nCount)
	
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if not (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Talk(1, "", "现在不是攻城战的报名时间.")
		return 1
	end
	
	
	
	
	local szTongName, nTongID = GetTongName();
	local nTongCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCount > nTongCurCount or nCount > 1000000 then
		Say("挑战令不够, 不能上交,请继续收集之后再来.",0)
		return 1
	end
	local nCityId = getSigningUpCity(1);
	local nlg = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	if (FALSE(nlid)) then
			local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
			--设置社团成员的信息(角色名、职位、社团类型、社团名称)
			LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
			LG_AddMemberToObj(nlg, nMemberID);
			local ret = LGM_ApplyAddMember(nMemberID, "", "")
			LGM_FreeMemberObj(nMemberID)
	end;

	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	local nCurCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount, "", "");
	--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount)
	citywar_tbLadder:AddOneInGameServer(nTongID, cityid_to_lgname(nCityId), szTongName, nCount)
	
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, -nCount, "", "");
	
	WriteLog(format("[争夺攻城令]%s Name:%s Account:%s TongName:%s 城市 %s 争夺攻城数量: %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),(nCount + nCurCount)));
	
	local szFirstTong = checkFirstSignUpChallenger(cityid_to_lgname(nCityId), szTongName, nCount + nCurCount);
	if (szFirstTong == szTongName) then
		Say(format(" %s帮会挑战令牌的数量现在是：<color=yellow>%s<color>块, 暂列第一, 尽管如此，还是要关注情况变化.",szTongName,(nCount + nCurCount)), 0);
	else
		Say(format(" %s帮会挑战令牌的数量现在是：<color=yellow>%s<color>块. 暂列第一的是%s,贵帮需继续努力.",szTongName,(nCount + nCurCount),szFirstTong), 0);
	end;
end;

function checkSignUpCityWar(szTongName, nTongID, nCityId)
	local nHour = tonumber(GetLocalDate("%H"));
	if (nTongID == 0 or GetTongMaster() ~= GetName()) then
		Say("你不是帮主。在18h00到19h00,这个时段， 还没有占城的18级以上的帮会帮主可以报名参加今天之后的攻城战.", 0);
	elseif (nHour < 18 or nHour >= 19) then
		Say("现在不是攻城战的报名时间. 每天18h00到19h00, 还没有占城的18级以上的帮会可以到这报名参加今天之后的攻城战.", 0);
	elseif (TONG_GetExpLevel(nTongID) < 18) then
		Say("要求要18级以上的帮会才可以报名今天之后的攻城战.", 0);
	elseif (checkCityOwner(szTongName) ~= 0) then
		Say("你是城主，不必报名攻城.", 0);
	elseif (checkCItyChallenger(szTongName) ~= 0) then
			Say(format("你已是挑战方 %s, 不能争夺今天的令牌.",GetCityAreaName(checkCItyChallenger(szTongName))), 0);
	elseif (getSignUpState(nCityId) ~= 1) then
		Say("现在还没有开始报名攻城，养足精神准备着", 0);
	else
		return 1;
	end;
	return 0;
end;

function checkCityOwner(szTongName)
	for i=1, 7 do
		if (GetCityOwner(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkCItyChallenger(szTongName)
	for i=1, 7 do
		if (GetCityWarBothSides(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkFirstSignUpChallenger(szLeagueName, szTongName, nCurCount)
	local szFirstTong = getCityWarElector(szLeagueName)
	local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)
	
	if (FALSE(szFirstTong)) then
		local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
		--设置社团成员的信息(角色名、职位、社团类型、社团名称)
		LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		
		LGM_FreeMemberObj(nMemberID);
		if (ret == 1) then
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szTongName, LGTSK_QINGTONGDING_COUNT, nCurCount);
		end;
		return szTongName;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLeagueName);
	local nCount = LG_GetMemberCount(nlid);
	local szTemTong = szFirstTong;
	for i = 0, nCount - 1 do
		local szMem = LG_GetMemberInfo(nlid, i);
		if (szMem == szFirstTong) then
			local nMemCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
			
			if (nMemCount <= nCurCount) then
				szTemTong = szTongName;
				break
			end;
		end;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
	if (szTemTong ~= szFirstTong) then
		local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
		--设置社团成员的信息(角色名、职位、社团类型、社团名称)
		LGM_SetMemberInfo(nMemberID, szTemTong, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		LGM_FreeMemberObj(nMemberID);
		--LG_ApplyDoScript(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong, "\\script\\event\\citywar.lua", "citywar_removemem", szLeagueName.." "..szFirstTong);
		--LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong);
	end;
	return getCityWarElector(szLeagueName);
end;
--报名攻城战 end******************************************************

