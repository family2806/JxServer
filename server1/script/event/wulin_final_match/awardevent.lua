Include("\\script\\event\\wulin_final_match\\awardhead.lua")

Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

function wl_get_zonename( clientid )
	for i = 1, getn( WL_TAB_ZONEINFO ) do
		if ( WL_TAB_ZONEINFO[ i ][ 2 ] == clientid ) then
			return WL_TAB_ZONEINFO[ i ][ 1 ]
		end
	end
	return nil
end

function safe_tonumber( str )
	local ret=tonumber(str)
	if (ret==nil) then
		return 0
	else
		return	ret
	end
end

function wl_get_zonefile_match( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."award.dat"
	end
	return nil
end

function wl_get_zonefile_actor( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."actoraward.dat"
	end
	return nil
end

------------------------------------------------------------------------------------
-- 打开一个文件
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--获得文件中的szSection的key的值
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--设置文件中的szSection的key值为szValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile) - 1
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row + 1, col))
	end
end

------------------------------------------------------------------------------------

--主要作用：判断是否可以领取该项奖励
--==========================================================================
--当查询区服获一、二、三等奖数量时：
--nMatchType：ZONEAWARD_TASKID_FIRST 或 ZONEAWARD_TASKID_SECOND 或 ZONEAWARD_TASKID_THIRD
--nAwardLevel：无用
--[返回]：该项奖励的数量
----------------------------------------------
--当查询其他奖项时：
--nMatchType：即为TaskID，代表比赛类型
--nAwardLevel：奖励等级
--	nAwardLevel=0表示：返回该奖项的奖励等级
--[返回]-1：	表示已经领过了
--[返回]0：	表示没有奖励
--[返回]1：	表示可以领取该项奖励
---------------------------------------------------
function wl_CheckAward(nMatchType, nAwardLevel)
	if( GetTask(nMatchType) == -1 ) then
		return -1
	end

	local nClientID = GetGateWayClientID()
	local strPlayerAccount = GetAccount()
	local strZoneName = wl_get_zonename( nClientID )
	local strPlayerName = GetName()
	local strZoneSection = tostring( nClientID )

	--必须是比赛区服
	if (strZoneName == nil) then
		-- print("必须是比赛区服")
		return 0
	end
	--必须50级以上
	if (GetLevel() < 50) then
		-- print("必须50级以上")
		return 0
	end

	--全区服获得一、二、三等奖数量（全服奖励）
	if (nMatchType == ZONEAWARD_TASKID_FIRST or nMatchType == ZONEAWARD_TASKID_SECOND or nMatchType == ZONEAWARD_TASKID_THIRD) then
		local strAwardType
		if (nMatchType == ZONEAWARD_TASKID_FIRST) then
			strMatchType="First"
		elseif (nMatchType == ZONEAWARD_TASKID_SECOND) then
			strMatchType="Second"
		elseif (nMatchType == ZONEAWARD_TASKID_THIRD) then
			strMatchType="Third"
		end

		biwu_loadfile( WL_FILE_ZONEAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, strMatchType ))
		return nAwardCount
	end

	--其他奖励必须是参赛队员
	local nChampTitle = champ_checktitle();
	if (nChampTitle == nil) then
		-- print("必须是参赛队员")
		return 0
	end

	--参赛人员奖励（队员、领队）
	local nReadAwardLevel	--读取到的奖励等级
	if (nMatchType == ZONEAWARD_TASKID_ACTORAWARD or nMatchType == ZONEAWARD_TASKID_LEADAWARD) then
		if (nMatchType == ZONEAWARD_TASKID_LEADAWARD and nChampTitle~=7) then
			-- print("必须是领队")
			return 0
		end
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneAwardType" ))
	--区服团体赛奖励
	elseif (nMatchType == ZONEAWARD_TASKID_ZONE) then
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneMatch" ))
	--单项奖奖励（单人、双人、五行、十人、十六人）
	else
		local strMatchType
		if (nMatchType == ZONEAWARD_TASKID_SINGLE) then
			strMatchType="SingleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_DOUBLE) then
			strMatchType="DoubleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_FIVE) then
			strMatchType="FiveMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_TEN) then
			strMatchType="TenMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_SIXTEEN) then
			strMatchType="SixteenMatch"
		else
			-- print("无此奖励类型！")
			return 0
		end

		biwu_loadfile( WL_FILE_MATCHAWARD )
		local strReadPlayerName = biwu_getdata( WL_FILE_MATCHAWARD, strPlayerAccount, "Key" )
		if (strReadPlayerName == nil or strReadPlayerName ~= strPlayerName) then
			-- print("没有该角色信息")
			return 0
		end

		nReadAwardLevel = safe_tonumber(biwu_getdata(WL_FILE_MATCHAWARD, GetAccount(), strMatchType))
	end

	if (nAwardLevel == nil or nAwardLevel <= 0) then
		return nReadAwardLevel
	elseif (nAwardLevel == nReadAwardLevel) then
		return 1
	else
		-- print("奖项不符")
		return 0
	end
end

-----------------------------------------------------------

--最终领取奖品（含保护）
--返回：1、成功；0、失败
function wl_FinalTakeMatch( nTaskID, nCount )
	local nAwardLevel = wl_CheckAward(nTaskID)

	if( nAwardLevel == -1 ) then
		Say("怎么？你已经领过了，怎么还来这里？!!", 0)
		-- print("你应该已经领取过了")
		return 0
	elseif( nAwardLevel == 0 ) then
		Say("对不起，你不能领那个奖!", 0)
		WriteLog("武林大会奖励出错！有人正在领不上自己的双倍经验奖励! ["..GetName().."]  TaskID:"..nTaskID);
		-- print("尝试领取不能领取的奖项！	["..GetName().."]  TaskID:"..nTaskID);
		return 0
	end
	
	local nClientID = GetGateWayClientID();
	local strZoneName = tostring( nClientID )

	--一等奖奖励
	if (nTaskID == ZONEAWARD_TASKID_FIRST) then
		if( nCount == nil or nCount <= 0 ) then
			-- print("领取仙草露数目不大于 0 或 nil 。")
			WriteLog("武林大会奖励出错！领仙草露不能超过0或者 nil")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			Say("领取数量好像不对!", 0)
			-- print("有人尝试领取过多的仙草露！	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			WriteLog("武林大会奖励出错！有人领取仙草露奖励超过允许值! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end;
		
		local nRoom = CalcFreeItemCellCount()
		if ( nRoom < nCount ) then
			Say("装备没有空间了，重新安排一下再来。超过仙草露奖励值", 0)
			-- print("你的背包好像没有那么多位置", 0)
			return 0
		end;
		
		SetTask( nTaskID, GetTask( nTaskID ) - nCount )
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end;
		for i = 1, nCount do
			AddItem( 6, 1, 71, 1, 0, 0, 0 )
		end;
		Msg2Player("恭喜，你获得"..nCount.."1 仙草露")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", 区域内获得的奖励"..nCount.."仙草露")
		return 1
	--二、三等奖奖励，都是加双倍经验
	elseif (nTaskID == ZONEAWARD_TASKID_SECOND or nTaskID == ZONEAWARD_TASKID_THIRD) then
		if( nCount == nil or nCount <= 0 ) then
			WriteLog("武林大会奖励出错，领取经验值不能大于0或者nil")
			-- print("领取双倍经验数目不大于 0 或 nil。")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			WriteLog("武林大会奖励出错。可以有人领取大于允许值的双倍经验!! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			-- print("尝试领取过多的双倍经验！	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end
		SetTask( nTaskID, GetTask(nTaskID) - nCount )
		
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end
		
		local nDoubleTime = 15 * nCount
		if (nTaskID == ZONEAWARD_TASKID_SECOND) then
			nDoubleTime = nDoubleTime * 2;
		end
		
		AddSkillState(440, 1, 1, nDoubleTime * 60 * 18)
		Msg2Player("恭喜，您获得"..nDoubleTime.."经验值分钟增加双倍")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName().."区域内获得的奖励"..nDoubleTime.."经验值分钟增加双倍")
		return 1
	--参赛选手奖励
	elseif (nTaskID == ZONEAWARD_TASKID_ACTORAWARD) then
		--总数控制
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot"))
		if( nAwardCount >= 100 ) then
			Say("对不起，那个奖励已领完了!", 0)
			-- print("奖品已经领完了，仍有人尝试领奖！	["..GetName().."]:ActorAward");
			WriteLog("武林大会奖励出错，有人领奖了，但是又来领! ["..GetName().."]:ActorAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot", nAwardCount+1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		if( nRoom < nCount ) then
			Say("装备已没有位置，重新安排，然后到这里。这个奖励已有人领了.", 0)
			Say("您的装备空位不够", 0)
			return 0
		end
		
		SetTask( ZONEAWARD_TASKID_ACTORAWARD, -1 )

		wl_addownexp( WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 3 ] )
		AddItem( 6, 1, 831, 1, 0, 0, 0 )		--武林大会红包	？？
		Msg2Player("恭喜，你获得"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ])
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", 参加区域比赛选手获得"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ].."区域积分排名"..nAwardLevel)
		return 1
	--总领队奖励
	elseif (nTaskID == ZONEAWARD_TASKID_LEADAWARD) then
		--总数控制
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot"))
		if( nAwardCount >= 1 ) then
			Say("对不起，那个奖励已领取了!", 0)
			WriteLog("武林大会奖励出错，有人领奖了，但是又来领! ! ["..GetName().."]:LeadAward");
			-- print("奖品已经领完了，仍有人尝试领奖！	["..GetName().."]:LeadAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot", 1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		
		if( nRoom < nCount or (nAwardLevel == 1 and nRoom < nCount + 6)) then
			Say("装备已没有位置，重新安排，然后到这里。这个奖励已有人领了.", 0)
			-- print("背包空间好像不够", 0)
			return 0
		end
		
		if( nAwardLevel == 1 ) then
			wl_addgolditem_random()
		end
		
		for i = 1, nCount do
			AddItem( 6, 1, 831, 1, 0, 0, 0 )		--武林大会红包	？？
		end;

		SetTask( ZONEAWARD_TASKID_LEADAWARD, -1 )
		Msg2Player("恭喜你获得"..nCount.."1 外链大礼包")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", 区域总领队获得"..WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 1 ].."区域积分排行"..nAwardLevel)
		return 1
	end

	--单项奖奖励（单人、双人、五行、十人、十六人、团体）
	local strMatchName
	if (nTaskID == ZONEAWARD_TASKID_SINGLE) then
		strMatchName = "SingleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_DOUBLE) then
		strMatchName = "DoubleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_FIVE) then
		strMatchName = "FiveMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_TEN) then
		strMatchName = "TenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_SIXTEEN) then
		strMatchName = "SixteenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strMatchName = "ZoneMatch"
	end

	local strAwardCountName
	if (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strAwardCountName = "ZoneMatchLeft"
	else
		strAwardCountName = strMatchName..tostring(nAwardLevel).."Left"
	end

	--奖品总数控制
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName))
	if( nAwardCount <= 0 ) then
		Say("对不起，那个奖励已经领完了!", 0)
		WriteLog("武林大会奖励出错，有人领奖了，但是又来领! ["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		-- print("奖品已经领完了，仍有人尝试领奖！	["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		return 0
	else
		biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName, nAwardCount-1);
		biwu_save(WL_FILE_MATCHAWARD)
	end

	--如果是门派单项赛冠军则奖励是固定的 大黄金装备
	if(nTaskID == ZONEAWARD_TASKID_SINGLE and nAwardLevel == 1) then
		if ( wl_awardgolditem( GetLastFactionNumber(), nTaskID ) ~= nil ) then
			SetTask( nTaskID, -1 )
		end
		return 1
	end
	
	local nCount = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][2]
	if( nCount == nil or nCount == 0 ) then
		WriteLog( "武林大会奖励出错	count==0 match=="..strMatchName..", 奖励为"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		-- print( "武林大会奖励出错		count==0 match=="..strMatchName..",奖励为"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		return 0
	end
	
	--如果是双人赛的或者五行赛的冠军则，每人还有一件随机的大黄金
	if( ( strMatchName == "DoubleMatch" or strMatchName == "FiveMatch" ) and nAwardLevel == 1 ) then
		wl_addgolditem_random()	--奖励随机的大黄金
	end
	
	local q = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][3]
	local g = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][4]
	local d = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][5]
	local l = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][6]
	local f = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][7]
	local k = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][8]
	local m = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][9]
	for i = 1, nCount do
		AddItem( q, g, d, l, f, k, m )
	end
	SetTask( nTaskID, -1 )
	Msg2Player( "恭喜，你获得"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 已获得"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1].."参加比赛是"..strMatchName)
	return 1
end

--============================================

function wl_get_awardcount( count, taskid )
	if ( GetTask( taskid ) == 0 ) then
		SetTask( taskid, count )
		return count
	end
	if( GetTask( taskid ) == -1 ) then
		return 0
	end
	return GetTask( taskid )
end

function champ_checktitle()
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	if( zonename == nil ) then	--不是比赛区服
		return nil
	end
	local prefix = "\\data\\wulin\\"..nClientID.."\\"
	local name = ""	--判断是不是总领队
	biwu_loadfile( prefix .. BID_LEADER )
	name = biwu_getdata( prefix..BID_LEADER, "Leader_Name", "Name")
	if( GetName() == name ) then
		return 7
	end
	
	name = ""	--判断是不是世界十大
	biwu_loadfile(prefix.. LEVELTOP10 )
	for i = 1, 10 do
		name = biwu_getdata(prefix..LEVELTOP10, "LevelTop10", "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end

	name = ""	--判断是不是门派赛前五名
	local fanctionnum = GetLastFactionNumber()
	--for fanctionnum = 0, 9 do	--temp
	biwu_loadfile( prefix..WL_FACTION[fanctionnum+1][1] )
	for i = 1, 5 do
		name = biwu_getdata(prefix..WL_FACTION[fanctionnum+1][1], WL_FACTION[fanctionnum+1][2], "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end
	--end	--temp

	name = ""	--判断是不是总领队给与的参赛资格
	local count = 0
	biwu_loadfile( prefix..LEADER_MEMBER )
	count = tonumber(biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Count"))
	if( count == 0 ) then
		return nil
	end
	for i = 1, count do
		name = biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Member"..i)
		if( GetName() == name ) then
			return 1
		end
	end
	
	return nil
end;

------------------------------------------------------------------------------------
--main
function wulin_awardmain()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local nowday = tonumber(date("%Y%m%d"))
	local bAwardNow = 1
	if (nowday > WL_AWARD_TIME[2] or nowday < WL_AWARD_TIME[1]) then
		bAwardNow = 0
	end
		
	if( zonename == nil or bAwardNow == 0) then	--不是比赛区服
		Say("武林大会已结束，详细结果请联系主页", 0)
		return
	end

	if ( GetLevel() < 50 ) then
		Say("武林大会已正式落幕，详细结果请看主页 <color=red> 50级<color> 以上可以来我这领取区域奖", 0)
		return
	end
	
	local zonesection = tostring( nClientID )
	biwu_loadfile( WL_FILE_ZONEAWARD )
	local firstcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" ))--biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" )
	local secondcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Second" ))
	local thirdcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Third" ))
	
	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	
	local count = 0
	local tbOpp = {}
	count = firstcount + secondcount + thirdcount
	if (GetLastFactionNumber() ~= -1 and GetCamp() > 0) then
		if ( champ_checktitle() ~= nil ) then	--是不是参赛选手
			tbOpp[ getn( tbOpp ) + 1 ] = "武林大会半决赛奖励/wl_matchaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "选手参加区域比赛奖励/wl_joinaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "领取武林大会半决赛称号/wl_taketitle"
		end
	end
		
	if (nowday >= WL_ZONEAWARD_TIME[1] and nowday <= WL_ZONEAWARD_TIME[2]) then
		if (count > 0 ) then --区服中有获得冠、亚、季军，则
			tbOpp[ getn( tbOpp ) + 1 ] = "区域奖励/#wl_awardall("..firstcount..","..secondcount..","..thirdcount..")"
		end
	end
	
	if( getn( tbOpp ) < 1 ) then	--没有奖励
		Say("武林大会已结束，详细结果请看主页", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "我只是来玩/OnCancel"
	Say( "武林大会已结束，可以到我这领奖.", getn(tbOpp), tbOpp )
end;

--------------------------------------------------------------------------------------------

function wl_matchaward()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	--WL_TAB_MATCHAWARD_INFO
	--WL_FILE_MATCHAWARD
	local playeraccount = GetAccount()
	local playername = GetName()

	biwu_loadfile( WL_FILE_MATCHAWARD )
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("你没有在比赛中获得任何奖励，要更加努力哦。详细结果请看主页", 0)
		return
	end
	
	local tbOpp = {}
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch ~= 0 and GetTask( ZONEAWARD_TASKID_ZONE ) ~= -1 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "区域集体比赛奖励___"..WL_TAB_MATCHAWARD_INFO[ "ZoneMatch" ][zonematch][1].."/#wl_want2takematch('ZoneMatch',"..zonematch..","..ZONEAWARD_TASKID_ZONE..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch ~= 0 and GetTask( ZONEAWARD_TASKID_SINGLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "门派单斗奖励___"..WL_TAB_MATCHAWARD_INFO[ "SingleMatch" ][singlematch][1].."/#wl_want2takematch('SingleMatch',"..singlematch..","..ZONEAWARD_TASKID_SINGLE..")"
		end
		if( doublematch ~= 0 and GetTask( ZONEAWARD_TASKID_DOUBLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "双斗奖励___"..WL_TAB_MATCHAWARD_INFO[ "DoubleMatch" ][doublematch][1].."/#wl_want2takematch('DoubleMatch',"..doublematch..","..ZONEAWARD_TASKID_DOUBLE..")"
		end
		if( fivematch ~= 0 and GetTask( ZONEAWARD_TASKID_FIVE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "五行斗奖励___"..WL_TAB_MATCHAWARD_INFO[ "FiveMatch" ][fivematch][1].."/#wl_want2takematch('FiveMatch',"..fivematch..","..ZONEAWARD_TASKID_FIVE..")"
		end
		if( tenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_TEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "十人斗奖励___"..WL_TAB_MATCHAWARD_INFO[ "TenMatch" ][tenmatch][1].."/#wl_want2takematch('TenMatch',"..tenmatch..","..ZONEAWARD_TASKID_TEN..")"
		end
		if( sixteenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_SIXTEEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "16人斗奖励___"..WL_TAB_MATCHAWARD_INFO[ "SixteenMatch" ][sixteenmatch][1].."/#wl_want2takematch('SixteenMatch',"..sixteenmatch..","..ZONEAWARD_TASKID_SIXTEEN..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say( "你已领过奖了或者没有奖励，详细结果请看主页", 0 )
		return
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "L竧 n鱝 ta quay l筰/OnCancel"
	Say("你可以领一下奖励，在领之前请整理一下装备!", getn( tbOpp ), tbOpp)
end

function wl_want2takematch( sectionname ,awardtype, taskid )
	local room = 0
	room = CalcFreeItemCellCount()
	if( room < 12 ) then
		Say("装备已无空位，安排好再来吧!", 0)
		return
	end
	Say( "目前你需要领的是"..WL_TAB_MATCHAWARD_INFO[ sectionname ][awardtype][1]..", 现在领吗", 2, "快点拿给我!/#wl_FinalTakeMatch("..taskid..")", "让我想想/OnCancel" )
end

function wl_awardgolditem( fact, taskid )
	if ( fact == 0 ) then
		print("属于少林，但是没有少林冠军奖")
		return nil
	end
	
	if( fact == 1 ) then
		AddGoldItem(0,19)
		Msg2Player("恭喜你获得一个撼天虎头紧束腰")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..",获得天王单斗第一，奖励为紧束腰")
		return 1
	elseif ( fact == 2 ) then
		AddGoldItem(0,80)
		Msg2Player("恭喜你获得一个天光之束天缚地环")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 获得唐门第一，奖励为缚地环")
		return 1
	elseif( fact == 3 ) then
		AddGoldItem(0,59)
		Msg2Player("恭喜你获得一个幽胧之银蟾护手")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 获得五毒单斗第一，奖励为银蟾护手")
		return 1
	elseif( fact == 6 ) then
		AddGoldItem(0,100)
		Msg2Player("恭喜你获得一个敌忾之草间石戒")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..",获得丐帮单斗第一，奖励为一个间石戒")
		return 1
	elseif( fact == 7 ) then
		AddGoldItem(0,113)
		Msg2Player("恭喜你获得一个魔嗜之业火幽冥戒")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 获得天忍单斗第一，奖励为一个幽冥戒")
		return 1
	elseif( fact == 4 ) then
		AddGoldItem(0,35)
		Msg2Player("恭喜你获得一个无间之白玉般指")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..",获得峨眉单斗第一， 奖励为一个玉般指 ")
		return 1
	elseif( fact == 5 ) then
		AddGoldItem(0,50)
		Msg2Player("恭喜你获得一个栖凰之翠玉指环")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 获得翠烟单斗第一，奖励为一个玉指环")
		return 1
	elseif( fact == 8 ) then
		AddGoldItem(0,125)
		Msg2Player("恭喜你获得一个及丰之青松法戒")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 获得武当单斗第一，奖励为一个青松法戒")
		return 1
	elseif( fact == 9 ) then
		AddGoldItem(0,130)
		Msg2Player("恭喜你获得一个霜晶之风暴指环")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 单斗昆仑第一，奖励为一个风暴指环")
		return 1
	else
		print("wl_awardgolditem faction wrong!!!!error!!!!")
		return nil
	end
end;

---------------------------------------------------------------------------------------------

function wl_joinaward()		--区服参赛得奖
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	local tabTitle = {}
	local leader = 0
	local awardtype = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneAwardType" ))
	
	local leader = 0
	leader = champ_checktitle()		--leader == 7为总领队
	if( leader == 7 ) then
		local tbOpp = {}
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) == -1 and GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "你已领过奖品了，详细结果请看主页", 0 )
			return
		end;
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "领取总领队奖励/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_LEADAWARD..")"
		end;
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "领取选手奖/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")"
		end;
		tbOpp[ getn( tbOpp ) + 1 ] = "等一下!/OnCancel" 
		if( awardtype == 5 ) then
			Say("像你是总领队可以领"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", 选手"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", 现在就领吗？在领之前请整理好装备。", getn( tbOpp ), tbOpp )
		else
			Say("武林新秀官员:"..zonename.."在成绩榜上排名第"..awardtype.."名，由于是总领队，您获得"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", 参加选手奖励"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", 现在就领吗？在领之前请整理好装备!", getn( tbOpp ), tbOpp )
		end
	else
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "你已领过奖品了，详细结果请看主页", 0 )
			return
		end;
		if( awardtype == 5 ) then
			Say("作为"..zonename.."区域选手，你可以获得"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", 现在就领吗？在领之前请整理好装备!", 2, "马上就领!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "等一下吧!/OnCancel" )
		else
			Say("武林新秀官员:"..zonename.."在成绩榜上排名第"..awardtype.."名，由于是总领队，您获得 "..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", 现在就领吗？在领之前请整理好装备!", 2, "马上就领!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "等一下吧!/OnCancel" )
		end
	end
	
end;

function wl_addgolditem_random()
	local serial = random( WL_GOLDITEMCOUNT )
	AddGoldItem(WL_TAB_MATCHAWARD[serial][3][1], WL_TAB_MATCHAWARD[serial][3][2])
	Msg2Player("恭喜，你获得一个"..WL_TAB_MATCHAWARD[serial][1])
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", 黄金装备奖励"..WL_TAB_MATCHAWARD[serial][1])
end;

function wl_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end;


---------------------------------------------------------------------------------------------
function wl_awardall( firstcnt, secondcnt, thirdcnt )	--领取区服奖励
	local awardfst = 0
	local awardsec = 0
	local awardthd = 0
	local tbOpp = {}
	awardfst = wl_get_awardcount( firstcnt, ZONEAWARD_TASKID_FIRST )
	awardsec = wl_get_awardcount( secondcnt, ZONEAWARD_TASKID_SECOND )
	awardthd = wl_get_awardcount( thirdcnt, ZONEAWARD_TASKID_THIRD )
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local str = "武林新秀联赛官员:"..zonename.."在区域为 "
	
	if ( firstcnt ~= 0 ) then
		str = str.."冠军"..firstcnt..", "
	end
	
	if ( secondcnt ~= 0 ) then
		str = str.."亚军"..secondcnt..", "
	end
	
	if ( thirdcnt ~= 0 ) then
		str = str.."季军"..thirdcnt..", "
	end
	
	if ( awardfst == 0 and awardsec == 0 and awardthd == 0 ) then
		str = str.."你已领取区域内所有奖励."
		Say(str, 0)
		return
	end
	
	str = str.."你还可以领:"
	if( awardfst > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardfst).."冠军奖励_仙草露/#wl_want2takeaward(1,"..awardfst..")"
	end
	
	if( awardsec > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardsec).."亚军奖励_在30分钟内增加双倍经验值/#wl_want2takeaward(2,"..awardsec..")"
	end
	
	if ( awardthd > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardthd).."季军奖励_在15分钟内增加双倍经验值/#wl_want2takeaward(3,"..awardthd..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "等一下吧!/OnCancel"
	Say( str, getn( tbOpp ), tbOpp )
end

function wl_want2takeaward(title,awardcount)
	local str = ""
	local cbFunc = ""
	local taskid = 0
	local tbOpp = {}
	if ( title == 1) then
		str = "你可以获得"..awardcount.."1 仙草露，现在就领吗？"
		cbFunc = "个/#wl_FinalTakeMatch"
		taskid = ZONEAWARD_TASKID_FIRST
	elseif ( title == 2 ) then
		str = "你可以获得"..awardcount.."在30分钟内增加双倍经验值的机会，现在就领吗？"
		cbFunc = "次/#wl_want2doubleexp_30"
		taskid = ZONEAWARD_TASKID_SECOND
	elseif( title == 3 ) then
		str = "你可以获得"..awardcount.."在15分钟内增加双倍经验值的机会，现在就领吗？"
		cbFunc = "次/#wl_want2doubleexp_15"
		taskid = ZONEAWARD_TASKID_THIRD
	end
	
	for i = 1, awardcount do
		tbOpp[ getn( tbOpp ) + 1 ] = "领!"..tostring(i)..cbFunc.."("..taskid..","..i..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "等下回来领/OnCancel"
	Say(str, getn(tbOpp), tbOpp)
end;

function wl_want2doubleexp_30( taskid, count )	--领取亚军奖励
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("领到的数量好像不对!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 30 * count
	Say("你想领的是"..count.."亚军奖励+ "..doubletime.."分钟增加双倍经验对吗?", 2, "想/#wl_FinalTakeMatch("..taskid..","..count..")", "等下再来领哦!/OnCancel")
end

function wl_want2doubleexp_15( taskid, count )	--领取季军奖励
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("领到的数量好像不对!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 15 * count
	Say("你想领的是"..count.."ph莕 thng ?Qu﹏ + "..doubletime.."分钟增加双倍经验对吗?", 2, "想/#wl_FinalTakeMatch("..taskid..","..count..")", "等下再来领哦!/OnCancel")
end

----------------------------------------------------------------------------------------------


function wl_taketitle()
--	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
--	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	local tbOpp = {}
	local zonesection = tostring(GetGateWayClientID())
	local playeraccount = GetAccount()
	biwu_loadfile( WL_FILE_MATCHAWARD)
	local playername = GetName()
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("你在比赛中没有任何排名，我没有称号给你.", 0)
		return
	end

	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch > 0 and zonematch <= 3 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "很多区域集体比赛称号/#wl_sure2taketitle('ZoneMatch',"..zonematch..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch > 0 and singlematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "获得门派单斗称号/#wl_sure2taketitle('SingleMatch',"..singlematch..")"
		end
		if( doublematch > 0 and doublematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "获得双斗称号/#wl_sure2taketitle('DoubleMatch',"..doublematch..")"
		end
		if( fivematch > 0 and fivematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "获得五行斗称号/#wl_sure2taketitle('FiveMatch',"..fivematch..")"
		end
		if( tenmatch > 0 and tenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "获得十派都称号/#wl_sure2taketitle('TenMatch',"..tenmatch..")"
		end
		if( sixteenmatch > 0 and sixteenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "获得十六杀斗称号/#wl_sure2taketitle('SixteenMatch',"..sixteenmatch..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say("你在比赛中没有任何排名，我没有称号给你.", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "让我想想先/OnCancel"
	
	Say("你可以获得以下称号，想想看:", getn( tbOpp ), tbOpp)
end

function wl_sure2taketitle( sectionname , awardtype)
	if( awardtype < 0 or awardtype > 3 ) then
		return
	end
	
	local title = 0
	local str = ""
	if ( sectionname == "SingleMatch" ) then
		local faction = GetLastFactionNumber()
		if( faction == -1 ) then
			return
		end
		str = "比赛门派称号"
		if( awardtype == 1 ) then
			title = 32 + faction
		elseif( awardtype == 2 ) then
			title = 42 + faction
		else
			title = 52 + faction
		end
	end
	
	if( sectionname == "DoubleMatch" ) then
		title = 61 + awardtype
		str = "双斗"
	end
	
	if( sectionname == "FiveMatch" ) then
		title = 64 + awardtype
		str = "五行斗"
	end
	
	if( sectionname == "TenMatch" ) then
		title = 67 + awardtype
		str = "十派斗"
	end
	
	if( sectionname == "SixteenMatch" ) then
		title = 70 + awardtype
		str = "十六杀斗"
	end
	
	if( sectionname == "ZoneMatch" ) then
		title = 73 + awardtype
		str = "区域团队"
	end

	Title_AddTitle(title, 1, 30 * 24 * 60 * 60 * 18)
	Title_ActiveTitle( title )
	SetTask( ZONEAWARD_TASKID_TITLEID, title )
	if ( awardtype == 1 ) then
		str = str.."冠军"
	elseif ( awardtype == 2 ) then
		str = str.."亚军"
	else
		str = str.."季军"
	end
	Msg2Player( "恭喜你达到"..str.."称号" )
end

