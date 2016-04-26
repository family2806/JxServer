IncludeLib("LEAGUE")
IncludeLib("TITLE")
Include("\\script\\lib\\gb_modulefuncs.lua");
TASK_ACTIVE_TITLE = 1122
CW_TITLE_TIME = 7*24*60*60*18;
TB_CITYWAR_ARRANGE = {
				{3,4},--凤翔
				{1,2},--成都
				{2,3},--大理
				{5,6},--汴京
				{4,5},--襄阳
				{0,1},--扬州
				{6,0},--临安
			}
			
-----购买攻城战道具 start
function AskDeal()
	Say("辅助攻城的用具十分有效用, 只能用元宝购买! 客观如果错过了不买真的就是遗憾了!", 4, 
	--"浑石裂/DealBuy", 
	"孽龙冲车/#DealBuy(1)", 
	"云集兵符/#DealBuy(2)", 
	"顽固兵符/#DealBuy(3)", 
	"不需要/OnCancelBuy");
end;

function DealBuy(ItemID)
	if (ItemID == 0) then
		SetTaskTemp(15, 29);
	elseif (ItemID == 1) then
		SetTaskTemp(15, 30);
	elseif (ItemID == 2) then
		SetTaskTemp(15, 31);
	elseif (ItemID == 3) then
		SetTaskTemp(15, 32);
	else
		return
	end;
	Say("因为买的人很多! 客观只能买一次!同意吗?", 2, "好/DoBuy", "我想一下/OnCancelBuy");
end;

function DoBuy()
	TheItem = GetTaskTemp(15);
	if (TheItem >= 29 and TheItem <= 32) then
		if (GetItemCountEx(343) > 0) then
			DelItemEx(343);
			AddItem(6,1,TheItem,1,0,0);
			WriteLog(format("%s 用343个金元宝买1个攻城道具>> %s",GetName(),TheItem));
			Say("客官真识货!", 0);
		else
			Say("客观是和小人开玩笑还是真的没有元宝?", 0);
		end;
	end;
end;
function OnCancelBuy()
	Say("祝义士旗开得胜, 早日凯旋!", 0);
end;
-----购买攻城战道具 end

--获得到7天后 20:00分 的时间祯
function getUsedLine()
	local nh = tonumber(GetLocalDate("%H"));
	local nm = tonumber(GetLocalDate("%M"));
	return (CW_TITLE_TIME-((nh-20)*60+nm)*60*18);
end;

--获得当前报名攻城战的城市
--nSel=1,报名；nSel=2,攻城
function getSigningUpCity(nSel)
	local nWeek = tonumber(GetLocalDate("%w"));
	for i = 1, getn(TB_CITYWAR_ARRANGE)do
		if (TB_CITYWAR_ARRANGE[i][nSel] == nWeek) then
			return i;
		end;
	end;
end;

-- 检查领奖条件
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> 只有占领城市的帮派才可以领奖, 带领我的兄弟们去占领一座城去!")
		end
		return 0
	end
	
	--local tong_master = GetTongMaster()
	--local player_name = GetName()
	--if (tong_master ~= player_name) then
--		if (show_talk == 1) then
	--		Talk(1, "", "<#>只有帮主才能领取帮会奖励，叫你们帮主来吧")
		--end
		--return 0
	--end
	
	local wday = tonumber(GetLocalDate("%w"))	-- 今天是星期几？
	local hour = tonumber(GetLocalDate("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#>每周从9:00~20:00 是领奖时间, 到时候再去")
		end
		return 0
	end

	local ndate = tonumber(GetLocalDate("%Y%m%d"))
	if (ndate == get_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS)) then
		if (get_city_orecount(city_index) <= get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT)) then
			if (show_talk == 1) then
				Talk(1, "", "<#>这周的奖品已领完，下周再来吧。")
			end
			return 0
		end;
	else
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS, ndate);
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 0);
	end

	return 1
end

TSK_CITYTONG_DATE = 2518
-- 领取占城帮会奖励
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#>占城帮会奖品. 占城帮成员可以到武林传人处领取5级玄晶, 每人可以领取1颗. 界限:都城(临安和汴京) 领取300颗5级玄晶, 城市(其他城市) 领取200颗5级玄晶. 在18h00之后如果还没有领完的话，那么帮主可以在20h00 之前再领取.",
			3,
			"<#>我想领取玄晶矿石/#take_tong_award(1)",
			"<#>我是帮主，再来领一次奖品/take_tong_resaward",
			"<#>我暂时不领/nothing")
	end
end

-- 领取红包
function take_tong_award(count)
	-- 一个红包占一个格子
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#>你的背包满了，整理好再来领奖.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH >= 18) then
		Talk(1, "", "<#>每个帮会的领奖时间是9h00到18h00, 请准时来领奖. 对于还没有领取的奖品, 通知帮主20h00前来领取.");
		return 0;
	end;
	local today = tonumber(GetLocalDate("%Y%m%d"));
	local nMydate = GetTask(TSK_CITYTONG_DATE);
	if (nMydate ~= today) then
		AddItem(6,1,147,5,1,1);
		SetTask(TSK_CITYTONG_DATE, today);
		add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 1);
	local msg =	format("%s %s (%s) 领取 %s 5级玄晶从金山掌门人处",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
		WriteLog(msg);
		Talk(1, "", "<#>这是你的奖品，请领取.")
	else
		Talk(1, "", "<#>你已经领了这周的奖品, 等下周吧。");
	end
end

function take_tong_resaward()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH < 18 or nH >= 20) then
		Talk(1, "", "<#>帮主可以在18h00到20:00第二次领奖品，请准时来领.");
		return 0;
	end;
	
	if (GetName() ~= GetTongMaster()) then
		Talk(1, "", "<#>只有帮主才可以再次领取属于帮会奖品. 请告知贵帮帮主在20h00之前到这领奖.");
		return 0;
	end;
	
	local nFreecell = CalcFreeItemCellCount();
	if (nFreecell < 20) then
		Talk(1, "", "<#>背包空间不够，请整理背包.")
		return 0;
	end;
	
	local nCount = get_city_orecount(city_index) - get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT);
	
	for i = 1, nCount do
		AddItem(6,1,147,5,1,1);
	end;
	add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, nCount);
	local msg =	format("%s %s (%s) 领取 %s 5级玄晶从金山掌门人",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
	WriteLog(msg);
	Say(format("这是贵帮的奖品, %s颗玄晶还有!",nCount), 0);
end;

function get_city_orecount(cityid)
	if (cityid == 4 or cityid == 7) then
		return 300;
	else
		return 200;
	end;
end;
--------------------------------------------------------------------------------
--得到一个玩家所在帮会占领的城市,返回索引值
function gettongownercity()
	--得到玩家帮会名称
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--分别得到七大城市的帮会名称与玩家帮会名称对比
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--表示玩家所在的帮会没有占领城市
	return 0
end

--如果为nil或0，返回1，否则返回0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
function checkCityWarLeague()
	for i = 1, 7 do
		local szLg = cityid_to_lgname(i);
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_SIGN, szLg)	--设置社团信息(类型、名称)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
		
		nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_FIRST, szLg)	--设置社团信息(类型、名称)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
	end;
end;

function cityid_to_lgname(nCityID)
	return GetCityAreaName(nCityID);
end;

--仅在一台服务器上执行即可
--所以，判断有华山的地图

--Relay执行设置 攻城方
function citywar_appointchallenger(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointChallenger(szCityName, szTongName)
	end;
end;

--Relay执行设置 城主
function citywar_appointviceroy(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointViceroy(szCityName, szTongName)
	end;
end;
