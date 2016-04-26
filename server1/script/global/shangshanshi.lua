--赏善使
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("物品错误！", 0)
		return
	end
	--读取存盘文件，保证只读取一次
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#>赏善使:我是掌管赏善令的使者，我能帮你什么呢？",
		"<#>提交赏善令/onsubmit",
		"<#>领取奖励/ontakeprize",
		"<#>查询本帮会占领城市的功绩/onchecknum",
		"<#>了解此次活动/onhelp",
		"<#>我只是来逛逛/oncancel",
	}
	
	Say(aryszContent[1], 5, aryszContent[2], aryszContent[3], aryszContent[4], aryszContent[5], aryszContent[6]);
end 

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
		if (strCityTongName ~= "") then 
			if (strCityTongName == strTongName) then
				return nCityID
			end
		end
	end
	
	--表示玩家所在的帮会没有占领城市
	return 0
end

--某一城市的赏善令增加到开始奖赏的数量
function beginadward(nCityIndex)
	--首先清空所有城市累计的赏善令
	for i=1, 7 do
		SetGlbValue(arraycitytoglobalvalue[i], 0)
	end
	
	--清空所有累计数据
	for i=1, 7 do
		CityData[i] = 0
	end
	
	local strTongName = GetCityOwner(nCityIndex)
	--存储要奖励的城市索引
	SetGlbValue(AEXP_GLOBAL_ADWARD_CITY, nCityIndex)

	--设置奖励的最后期限
	--存储时间变量(系统的时间)
	local nEnddate = GetCurrentTime() + AEXP_ADWARD_HOURNUM * 60 * 60
	SetGlbValue(AEXP_GLOBAL_ENDDATE, nEnddate)
	
	--进行存盘
	savevalue()
		
	--增加世界显示消息
	AddGlobalCountNews("帮会"..strTongName.."占领城市的功绩达到获得将励的要求，请该帮所有帮众到扬州赏善使处领取奖励,奖励期限为"..AEXP_ADWARD_HOURNUM.."小时,过期不候。所有城市功绩全部清空", 1)
end

function onsubmit()
	--判断占领城市的帮会
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1) then
		Say("<#>你没有加入帮会或者你的帮会没有占领城市，无法提交赏善令。", 0)
		return
	end
	
	--打开给与界面
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	GiveItemUI( "提交赏善令", "赏善令可以增加帮会占领城市的功绩，当功绩积累到一定数量，本帮会的所有帮众都会得到大奖,你们帮派目前占领城市是<color=read>"..arraycityindextoname[nCityIndex].."<color>,功绩为:<color=read>"..nNum.."<color>", "onsubmitconfirm", "oncancel" );
end

-- 获取可获得奖励的令牌数目
function GetMaxCardCount()
	local count = GetTongMemberCount()
	if (count == 0) then
		return 999999999
	end
	if (count > 1500) then	-- (1500, +∞)
		return 49999
	elseif (count > 900) then	-- (900, 1500]
		return 39999
	elseif (count > 600) then	-- (600, 900]
		return 29999
	elseif (count > 300) then	-- (300, 600]
		return 19999
	else 						-- (0, 300]
		return 9999
	end
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("你没有提交赏善令")
		return
	end
	
	--判断本帮会占领的城市
	local nCityIndex = gettongownercity();
	if (nCityIndex < 1) then
		Say("你没有加入帮会或者你的帮会没有占领城市，无法提交赏善令。", 0)
		return
	end
		
	--判断物品是否为赏善令
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_AWARDMEDIAL_NGENTYPE or
			DetailType ~= AEXP_AWARDMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_AWARDMEDIAL_PARTYPE) then
				Msg2Player("你好像有东西不是赏善令哟！")
				return 0			
		end
	end
	local nTotalNum = 0;
	--删除所有赏善令
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	--if (nNum < 0) then
		--nNum = 0
	--end
	nNum = nNum + nTotalNum;
	SetGlbValue(arraycitytoglobalvalue[nCityIndex], nNum)
	SetTask(1074,1);
	
	local strTongName = GetCityOwner(nCityIndex)	
	if (nNum >= GetMaxCardCount()) then
		Msg2Player("你们帮派占领的城市"..arraycityindextoname[nCityIndex].."获得奖励,你赶快去领取奖励吧")
		WriteLog( "["..date("%Y-%m-%d %X").."] 帮会:"..strTongName.."城市"..arraycityindextoname[nCityIndex].."获得奖励. "..GetAccount().."("..GetName()..")提交了"..nTotalNum.."个赏善令 (Current OnlineTime: "..GetGameTime().." sec)" );
		beginadward(nCityIndex)
	else
		CityData[nCityIndex] = CityData[nCityIndex] + nTotalNum
		if (CityData[nCityIndex] > AEXP_ADDMAX_SAVE) then
			CityData[nCityIndex] = 0			
			WriteLog( "["..date("%Y-%m-%d %X").."] 帮会"..strTongName.."城市"..arraycityindextoname[nCityIndex].."因为"..GetAccount().."("..GetName()..")提交了"..nTotalNum.."个赏善令,赏善令超过存盘数量进行存盘,赏善令数量为:"..nNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
			savevalue()			
		end
		Msg2Player("你们帮会功绩增加了"..nTotalNum..",目前是:"..nNum);
	end 	
end

function ontakeprize()
	
	-- 判断玩家帮会所占城市的索引
	local nCityIndex = gettongownercity()	
	if (nCityIndex < 1 ) then
		Say("<#>你没有加入帮会或你的帮会没有占领城市，无法获得奖励。", 0);
	 	return 0
	end
	 
	--判断玩家帮会所占城市是否获的奖励
	local nAdwardCityIndex = GetGlbValue(AEXP_GLOBAL_ADWARD_CITY)
	if (nAdwardCityIndex < 1) then
		Say("<#>当前没有城市获得奖励，无法领取。", 0);
		return 0
	end
	
	if (nAdwardCityIndex ~= nCityIndex) then
		Say("<#>你所在的帮会占领城市的城市功绩不够，没有获得奖励。", 0);
		return 0
	end
	 
	local nNow = GetCurrentTime()
	local nLastdate = GetGlbValue(AEXP_GLOBAL_ENDDATE);
	if (nNow > nLastdate) then
		Say("<#>领奖期限已过，无法领取本次城市功绩得到的奖励。", 0);
		SetTask(1074,0);
		return 0
	end
	
	--判断玩家的入帮时间
	if (GetJoinTongTime() < AEXP_PLAYERTONG_LIMIT * 24 * 60) then
		Say("<#>你入帮时间不到<color=red>"..AEXP_PLAYERTONG_LIMIT.."<color>天,无法领取奖励。", 0);
		return 0
	end
	
	--判断玩家最后一次的领奖日期
	local today = tonumber(date("%Y%m%d"))
	local nLastAdward = GetTask(AEXP_TASK_ADWARDDATE)
	if (today == nLastAdward) then
		Say("<#>今天的奖励你已经领取，不能再次领取喽。", 0);
		return 0
	end
	
	--如果所有条件都满足那么给与奖励
	if(GetTask(1074) ~= 1) then
		Say("<#>你不曾提交赏善令为帮会做贡献，不能领取奖励。",0);
		return 0
	end
	giveprize();
	return 1
end

--如果都成功那么，给玩家奖励
function giveprize()
	--奖励(仙草露的奖励)
	--随即形成奖励
	local iRand = random(1,1)
	if (iRand == 1) then
		local nExpRate = 0--GetNpcExpRate()
		if (nExpRate == nil) then
			nExpRate = 1
		end
		if (nExpRate <= 100) then
			AddSkillState(440, 1, 1, AEXP_ADWARD_TIME * FRAME2TIME * 60 * 60);
			SetTask(1074,0);
			Say("恭喜你，你获得了在"..AEXP_ADWARD_TIME.."小时内经验双倍的奖励", 0)
		else
			Say("<#>对不起，目前暂时无法给你经验加倍。", 0)
			return 1
		end
	else
		--在这里添加别的奖励吧 	
	end
	
	--这段话放置到这里还是前面？
	--设置玩家最后领奖日期
	WriteLog( "["..date("%Y-%m-%d %X").."] 城市功绩累计到一定限度。玩家"..GetAccount().."("..GetName()..")领取了奖励(Current OnlineTime: "..GetGameTime().." sec)" );	
	
	-- 设置上次领奖的日期
	local today = tonumber(date("%Y%m%d"))
	SetTask(AEXP_TASK_ADWARDDATE, today)
end

function onchecknum()
	--得到玩家所在帮会占领城市的索引
	--如果小于1那么表示玩家的帮会没有占领城市
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1 ) then
		Say("<#>你没有加入帮会或者你所在的帮会没有占领城市，没有城市功绩积累。", 0);
		return 
	end
	
	--得到玩家帮会占领城市的赏善领数量
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	Say("<#>你们帮会占领城市为<color=red>"..arraycityindextoname[nCityIndex].."<color>,城市功绩为:<color=red>"..nNum.."<color>", 0);
end

function oncancel()
	return
end

function onhelp()
	Talk(2, "continuefun_help","<#>赏善罚恶系统介绍:玩家可以在50级以上地图,打怪掉落得到赏善令和罚恶令.7大城市占领帮派的成员可到扬州赏善使[女]提交赏善令,为本帮的城市积累相应量的功绩.", "所有玩家可以到扬州罚恶使［男］使用罚恶令惩罚７大城市.每当玩家对某城市提交一个罚恶令,则该城市的赏善令累积数量将减去一个.");
end

function continuefun_help()
	Talk(3, "", "当某个城市积累的功绩达到一定数量,所有入帮时间大于１天且为帮会提交了赏善令的的成员,都可在一天的领奖时间内获得４小时经验双倍的特殊奖励,并且其他城市的赏善令数量清零.","注意:<color=red>在此期间请不要使用仙草露,而且一旦死亡双倍经验失效.<color> 在领奖期间,如有其它城市功绩再次达到奖励条件,则开始为新的帮派发奖,此前未领奖品的帮众将不能得到任何奖励.", "帮会规模与城市所需功绩的关系:人数<=300,功绩9999;300<人数<=600,功绩19999;600<人数<=900,功绩29999;900<人数<=1500,功绩39999;1500<人数,功绩49999.");
end