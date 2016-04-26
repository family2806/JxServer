--AddEventItem(489)风陵渡领牌
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

MISSIONID = 15			--未定
FRAME2TIME = 18;		--18帧游戏时间相当于1秒钟
boatMAPS = {337, 338, 339};		--南岸渡船地图依顺序为，337南岸上游、338中游、339下游
boatMAP_POS = {1646, 3233}
northMAP = 336
northMAP_POS = {{1158, 2964}, {1343, 2868}, {1482, 2796}}
TNPC_THIEF = {724, 725}
TNPC_THIEF_COUNT = 30
npcthiefpos = "\\settings\\maps\\中原北区\\渡船\\渡船刷怪点.txt"
FLD_TIMER_1 = 20 * FRAME2TIME	--每20秒公布一下战况
FLD_TIMER_2 = 39 * 60 * FRAME2TIME		--从报名到进入打宝地图40分钟
ENDSIGN_TIME = 10 * 60 * FRAME2TIME/FLD_TIMER_1		--报名时间结束
UPBOSS_TIME = 25 * 60 * FRAME2TIME/FLD_TIMER_1		--开打15分钟时产生第1个BOSS
UPBOSS_TIME2 = 30 * 60 * FRAME2TIME/FLD_TIMER_1		--开打20分钟时产生第2个BOSS
UPBOSS_TIME3 = 35 * 60 * FRAME2TIME/FLD_TIMER_1		--开打25分钟时产生第3个BOSS
REPORT_TIME = 38 * 60 * FRAME2TIME/FLD_TIMER_1 
HUOYUEDU_TIME = 3 * 60 * FRAME2TIME/FLD_TIMER_1 -- 活跃度获得时间，船开启后的3分钟

MS_STATE = 1
MS_TIMEACC_1MIN = 2
MS_TIMEACC_20SEC = 3




function fld_cancel()
end

function fld_wanttakeboat(addr)

	-- 加入新门派上船 Modified - by AnhHH - 20110724
	if (GetLastFactionNumber() == -1)then
		Talk(1,"","大侠未加入门派，不能上船")
		return
	end
	
	local orgworld = SubWorld
	local MapId = boatMAPS[addr]
	if (MapId <= 0) then
		print("error:fenglingdu script wrong! mapid is nil!")
		return
	end
	local idx = SubWorldID2Idx(MapId)		
	if (idx < 0) then
		Say("对不起! 前方有危险，暂时不能上船!.",0)
		return
	end
	if (fld_haveroom() == 1) then
		return
	end
	local sz_msg = "想乘船到风陵渡北岸，需要有风陵渡令牌或者你已经给我<color=red>200<color> 神秘卷轴，我就给你上船!";
	local str = {	
		"我有风陵渡令牌/use_lingpai",
		"我收集了200卷神秘卷轴/use_juanzhou",
		"让我想想!/fld_cancel",
			};		
	--调整风陵渡费用时间 - Modified by DinhHQ - 20110504
	if (check_new_shuizeitask() == 1) then
		sz_msg = format("需要有 %s 才能参加风陵渡北岸，顺利度过后将有奖励", "水贼令牌");
		str = {	
		format("我有%s/use_suizeilingpai", "水贼令牌"),
		"让我想想!/fld_cancel",
			};
	end
	
	if (addr == 1) then
		Say(" "..sz_msg, getn(str), str);
	elseif (addr == 2) then
		Say(" "..sz_msg, getn(str), str);
	elseif (addr == 3) then
		Say(" "..sz_msg, getn(str), str);
	end
end



function fld_TakeBoat(plindex)
	orgplayerindex = PlayerIndex
	PlayerIndex = plindex

	local orgworld = SubWorld
	if ( BOATID == 1 ) then
		boatmapid = 337
		idx = SubWorldID2Idx(boatmapid)
	elseif( BOATID == 2 ) then
		boatmapid = 338
		idx = SubWorldID2Idx(boatmapid)
	elseif ( BOATID == 3 ) then
		boatmapid = 339
		idx = SubWorldID2Idx(boatmapid)
	else
		return 0
	end

	oldsubworldindex = SubWorld
	SubWorld = SubWorldID2Idx(boatmapid)
	if (fld_haveroom() == 1) then
		return 0
	end
	t = 10 - GetMissionV(MS_TIMEACC_1MIN)
	if (t <= 0) then
		return 0
	end
	LeaveTeam()
	--DinhHQ
	--20110405: Fix bug, 除了13h, 15h, 17h, 19h，2 3 码头可以pk仇杀
	if (check_new_shuizeitask() == 1) then
		if ( BOATID ~= 1 ) then
			SetTaskTemp(200,1);
			ForbidEnmity(1);			
		end		
	end
	SetCurCamp(1);	
--	if ( BOATID ~= 1 ) then
--		ForbidEnmity(1);
--		SetCurCamp(1);
--	end
	
--	SetTaskTemp(200,1);
	SetFightState(0)
	posx, posy = fld_getadata(npcthiefpos)
	posx = floor(posx/32)
	posy = floor(posy/32)
	AddMSPlayer(MISSIONID,1)
	NewWorld(boatmapid, posx, posy)
	Msg2Player("还有"..t.." 分钟离开码头，到风陵渡北岸")
	DisabledUseTownP(1)	--限制其在渡船内使用回城符
	SetRevPos(175,1);		--设置重生点在西山村
	SetLogoutRV(1)
	SetCreateTeam(0);
	SetDeathScript("\\script\\missions\\fengling_ferry\\fld_death.lua")
	SubWorld = oldsubworldindex
	PlayerIndex = orgplayerindex
	return 1
end

function fld_haveroom()
	if (GetMSPlayerCount(MISSIONID, 1) >= 100 ) then
		if (BOATID == 1) then
			Say("你来晚了! 船已经满了，等下一趟吧!", 0)
			return 1
		elseif (BOATID == 2) then
			Say("你来晚了， 船已经满了，等下一趟吧!", 0)
			return 1
		elseif (BOATID == 3) then
			Say("你来晚了， 船已经满了，等下一趟吧!", 0)
			return 1
		end
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function fld_landingpos(posation)
	if (posation <= 0 and posation >3) then
		print("error: i still not know why!")
		return
	end
	return northMAP, northMAP_POS[posation][1], northMAP_POS[posation][2]
end

function fld_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

-- 神秘卷轴交付界面
function	use_juanzhou()	--使用神秘卷轴
	GiveItemUI( "交神秘卷轴", "放200张神秘卷轴到下面的空格，要注意，如果空格内的神秘卷轴少于或者多余200，我将不要.", "exchange_juanzhou", "no" );
end;

-- 确定神秘卷轴数量函数
function exchange_juanzhou(ncount)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("神秘卷轴好像不对，检查看看.", 2, "啊，原来放错了，我重来./use_juanzhou", "让我检查看看/no")
		return
	end
	if (scrollcount > 200) then
		Say("我只需要200个神秘卷轴，剩余的你带回去!", 2, "啊，原来放错了，我重来./use_juanzhou", "让我检查看看/no")
		return
	end
	if (scrollcount < 200) then
		Say("神秘卷轴不够，请重试!", 2, "啊，原来放错了，我重来./use_juanzhou", "让我检查看看/no")
		return
	end
	if (scrollcount == 200) then
		if (fld_TakeBoat(PlayerIndex) ~= 1) then
			Say("时间不等人，船已经走了，下次再来吧!", 0)
			return
		end
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
	end;		
end;


-- 风陵渡令牌交付界面
function	use_lingpai()	--使用风陵渡令牌
	GiveItemUI( format("交费界面 %s 令牌", "风陵渡令牌"), format("用一个%s 放入下方空格。如果你乱放入东西，我不稀罕", "风陵渡令牌"), "exchange_lingpai_1", "no" );
end;

function use_suizeilingpai()
--Modified By DinhHQ - 20110930
	GiveItemUI( format("交费界面%s 令牌", "水贼令牌"), format("用一个%s 放入下方空格。如果你乱放入东西，我不稀罕", "水贼令牌"), "exchange_lingpai_2", "no", 1 );
end

function exchange_lingpai_1(ncount)
	exchange_lingpai(ncount, 1)
end

function exchange_lingpai_2(ncount)
	exchange_lingpai(ncount, 2)
end

-- 确定
function exchange_lingpai(ncount, ntype)
	if (ncount == 0) then
		Say("没有令牌想上船啊?", 0)
		return
	end
	
	if (ncount > 1) then
		Say("我不是告诉你不要乱放吗?", 0)
		return
	end

	local nItemIdx = GetGiveItemUnit(1);
	local nStackCount = GetItemStackCount(nItemIdx);
	
	if (nStackCount > 1) then
		Say("南岸船夫：我只需要一个令牌，其他的我不要", 0)
		return
	end
	
	local itemgenre, detailtype, particular = GetItemProp(nItemIdx);
	
	if (ntype ==1) then
		if (itemgenre ~= 4 or detailtype ~= 489) then
			Say(format("南岸船夫：我只是需要一个令牌，其他不要", "风陵渡令牌"), 2, "啊，原来放错了，我重来./use_lingpai", "让我检查看看/no")
			return
		end
	else
		if (itemgenre ~= 6 or particular ~= 2745) then
			Say(format("南岸船夫：我只是需要一个令牌，其他不要", "水贼令牌"), 2, "啊，原来放错了，我重来./use_suizeilingpai", "让我检查看看/no")
			return
		end
	end
	
	if (fld_TakeBoat(PlayerIndex) ~= 1) then
		Say("时间不等人，船已经走了，下次再来吧!", 0)
		return
	end
	
	RemoveItemByIndex(nItemIdx);
	if particular == 2745 then
		AddStatData("shuizeilingpai_shiyongshuliang", 1)	--数据埋点第一期
	end
	tbLog:PlayerActionLog("EventChienThang042011","BaoDanhPhongLangDo")	-- 报名日志
	--ghi log 性能 key - Modified By DinhHQ - 20120410
	if particular == 2745 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiThuyTac")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiPLD")
	end
end;

function check_new_shuizeitask()
	local nHour = tonumber(GetLocalDate("%H"));
	--调整交风陵渡费用 - Modified by DinhHQ - 20110504
	local tb_sptime = {
		[10] = 1,
		[14] = 1,
		[16] = 1,
		[18] = 1,
		[20] = 1,
	};
	if (tb_sptime[nHour] and tb_sptime[nHour] == 1) then
		return 1
	else
		return 0
	end
end	

function no()
end;
