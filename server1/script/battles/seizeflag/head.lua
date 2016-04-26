Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\battles\\battles_award_head.lua")		--By 小浪多多
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");
MISSIONID = 11;
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
sf_aryItems = {
	{ "加跑丸", {6,0,2,1,0,0}, 5 },
	{ "高中丸", {6,0,5,1,0,0}, 5 },
	{ "高闪丸", {6,0,4,1,0,0}, 5 },
	{ "长命丸", {6,0,1,1,0,0}, 5 },
	{ "飞速丸", {6,0,6,1,0,0}, 5 },
	{ "毒防丸", {6,0,10,1,0,0}, 5 },
	{ "冰防丸", {6,0,7,1,0,0}, 5 },
	{ "火防丸", {6,0,9,1,0,0}, 5 },
	{ "雷防丸", {6,0,8,1,0,0}, 5 },
	{ "大力丸", {6,0,3,1,0,0}, 30 },
	{ "烟花", {6,0,11,1,0,0}, 1 },
	{ "玫瑰花雨", {6,0,20,1,0,0}, 2 },
	{ "心心相映符", {6,1,18,1,0,0}, 5 },
	}

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 90 * 60  * FRAME2TIME; -- 交战时间为1小时
RUNGAME_TIME = 30 * 60 * FRAME2TIME / TIMER_1; --报名30分钟之后，自动进入战斗阶段
VANISHGAME_TIME = 70 * 60 * FRAME2TIME/ TIMER_1; --战斗最后20分钟时，必须所以Npc全部产生

MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- 玩家死亡或退出游戏再进入时，必须3分钟之后才能离开后营到大营

--以下是某些值记录在MissionValue中的索引位置，通过GetMissionV(MS_XXX)来获得实际的值
MS_FLAGMODE = 2;--记录当前夺旗模式是固定模式还是随机夺旗模式，分别为0，1
MS_FLAGCOUNT = 3; --记录夺旗的数量

MS_CENTER_X1 = 4;   --区域1：当报名阶段时，禁止玩家离开大营时，将玩家扔回大营的坐标
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--区域2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --区域1：后营内坐标
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --后营外坐标
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--区域2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1_TIME = 17; --记录Timer1执行的次数

MS_FLAGPLY_S = 18;  --固定模式时，记录目前宋方夺旗的玩家PlayerIndex
MS_FLAGPLY_J = 19;  --固定模式时，记录目前金方夺旗的玩家PlayerIndex
MS_FLAGPOSX_S = 20; --固定模式时，记录宋方当前旗织的小地图坐标位置X
MS_FLAGPOSY_S = 21; --固定模式时，记录宋方当前旗织的小地图坐标位置Y
MS_FLAGPOSX_J = 22  --固定模式时，记录金方当前旗织的小地图坐标位置X
MS_FLAGPOSY_J = 23  --固定模式时，记录金方当前旗织的小地图坐标位置Y
MS_TOTALFLAG_S = 24	--记录固定模式夺旗数量，宋
MS_TOTALFLAG_J = 25	--记录固定模式夺旗数量，金

TOTALFLAG_FIX = 30	--固定模式夺旗总数量

--在固定模式下，获得当前某方帅旗的坐标，帅旗如果在某个玩家身上则返回玩家坐标，否则返回掉旗的坐标
function sf_getflagposinfo(camp)
	local oldplayer = PlayerIndex
	local l_playeridx = 0
	local l_msflag_v = 0

	if (camp == 1) then
		l_msflag_v = MS_FLAGPLY_S
	elseif (camp == 2) then
		l_msflag_v = MS_FLAGPLY_J
	else
		return 0, 0
	end

	l_playeridx = GetMissionV(l_msflag_v);
	if (l_playeridx > 0) then
		if (PIdx2MSDIdx(MISSIONID, l_playeridx) <= 0) then --该玩家不在战场上
			l_playeridx = 0
			print("error!flag is not in the player")
		end
	else
		l_playeridx = 0
	end
	
	if (l_playeridx > 0) then
		PlayerIndex = l_playeridx
		W,X,Y = GetWorldPos();
		PlayerIndex = oldplayer
		return floor(X / 8), floor(Y / 16) --返回小地图坐标
	else
		PlayerIndex = oldplayer
		if (camp == 1) then
			return floor(GetMissionV(MS_FLAGPOSX_S)), floor(GetMissionV(MS_FLAGPOSY_S))
		else
			return floor(GetMissionV(MS_FLAGPOSX_J)), floor(GetMissionV(MS_FLAGPOSY_J))
		end
	end
end;
--固定模式下获得旗子的小地图坐标位置
function sf_setflagposinfo(camp, x, y)
	if (camp == 1) then
		SetMissionV(MS_FLAGPOSX_S, x)
		SetMissionV(MS_FLAGPOSY_S, y)
	else
		SetMissionV(MS_FLAGPOSX_J, x)
		SetMissionV(MS_FLAGPOSY_J, y)
	end
end
--固定模式下记录的拿旗人信息
function sf_setflagplayer(camp, pindex)
	if (camp == 1) then
		SetMissionV(MS_FLAGPLY_S, pindex)
	else
		SetMissionV(MS_FLAGPLY_J, pindex)
	end
end

FILE_HOMETRAP1 = "\\script\\battles\\seizeflag\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\seizeflag\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\seizeflag\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\seizeflag\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\seizeflag\\homeouttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\seizeflag\\npcdeath_1.lua",
	"\\script\\battles\\seizeflag\\npcdeath_2.lua",
	"\\script\\battles\\seizeflag\\npcdeath_3.lua",
	"\\script\\battles\\seizeflag\\npcdeath_4.lua",
	"\\script\\battles\\seizeflag\\npcdeath_5.lua",
	"\\script\\battles\\seizeflag\\npcdeath_6.lua"
	};

FILE_DOCTOR1 = 	"\\script\\battles\\seizeflag\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\seizeflag\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_FLAG = 		"\\script\\battles\\seizeflag\\flagobj.lua"
FILE_DEATH = 		"\\script\\battles\\seizeflag\\npcdeath.lua"

--Npc的模板号ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_KEY = 7;		--记录当前地图下任务的一个key，即一个随机生成的数定

MS_NEWSVALUE = 10; --任务中存放新闻变量的地方
GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- 报名时间为半小时


--增加一个指向某个坐标的某阵营旗
function sf_addflag(camp, x, y, desx,desy)
	
	if (camp == 1) then 
		tnpcid = TNPC_FLAG1
	elseif (camp == 2) then
		tnpcid = TNPC_FLAG2
	else
		tnpcid = TNPC_FLAG0
	end
	
	npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
	
	if (npcidx > 0) then
		SetNpcScript(npcidx, FILE_FLAG)
	else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
	end
	if (GetMissionV(MS_FLAGMODE) == 1) then
		sf_setflagposinfo(camp, floor(x / (32 * 8)), floor(y/ (32*16)))
		sf_setflagplayer(camp, 0)
	end;
	
	SetNpcParam(npcidx, 1, desx)
	SetNpcParam(npcidx, 2, desy)
	SetNpcParam(npcidx, 3, camp)
	SetNpcParam(npcidx, 4, 1)
	
	return npcidx
end;


function sf_onplayerleave()
	RestoreOwnFeature()
	if (GetMissionV(MS_STATE) == 2 and BT_GetData(PL_PARAM1) ~= 0 and BT_GetData(PL_PARAM2) ~= 0) then
		--该玩家现在正处于旗手状态，死亡里需要让旗掉下来
			if (GetMissionV(MS_FLAGMODE) == 1) then
					w,x,y = GetWorldPos()
					sf_addflag(GetCurCamp(), x*32, y*32, BT_GetData(PL_PARAM1), BT_GetData(PL_PARAM2))
					
					if (GetCurCamp() == 1 ) then
						sf_setflagplayer(1, 0) --当前玩家已不拿旗了
						sf_setflagposinfo(1, floor(x / 8), floor(y/16))
						Msg2MSAll(MISSIONID, "<color=0x00FFFF>宋方<color=yellow>"..GetName().."<color>丢下了帅旗在<color=yellow>"..floor(x / 8).."，".. floor(y / 16))
					else
						sf_setflagplayer(2, 0)
						sf_setflagposinfo(2, floor(x / 8), floor(y/16))
						Msg2MSAll(MISSIONID, "<color=0x9BFF9B>金方<color=yellow>"..GetName().."<color>丢下了帅旗在<color=yellow>"..floor(x / 8).."，".. floor(y / 16))
					end
			else
				local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
				w,x,y = GetWorldPos()
				area_s = BT_GetGameData(GAME_CAMP1AREA)
				area_j = BT_GetGameData(GAME_CAMP2AREA)	
				camp = GetCurCamp()
				if (camp == 1) then
					flagplace = random(2)
					if (flagplace == 1) then
						flagposfile1 = GetIniFileData(mapfile, "Area_"..area_j, "randomflagpos1");
					else
						flagposfile1 = GetIniFileData(mapfile, "Area_"..area_j, "randomflagpos2");
					end
				else
					flagplace = random(2)
					if (flagplace == 1) then
						flagposfile1 = GetIniFileData(mapfile, "Area_"..area_s, "randomflagpos1");
					else
						flagposfile1 = GetIniFileData(mapfile, "Area_"..area_s, "randomflagpos2");
					end
				end
		
				count = GetTabFileHeight(flagposfile1) - 1 ;
				if (count < 1) then
					print("error, flagposfile height not enough!"..flagposfile1);
					return
				end
		
				n = random(count);
				desx = GetTabFileData(flagposfile1, n + 1, 1)
				desy = GetTabFileData(flagposfile1, n + 1, 2)
				sf_addflag(0, x*32, y*32, desx, desy)
				if (GetCurCamp() == 1 ) then
					Msg2MSAll(MISSIONID, "<color=0x00FFFF>宋方<color=yellow>"..GetName().."<color>丢下了帅旗在<color=yellow>"..floor(x / 8).."，".. floor(y / 16))
				else
					Msg2MSAll(MISSIONID, "<color=0x9BFF9B>金方<color=yellow>"..GetName().."<color>丢下了帅旗在<color=yellow>"..floor(x / 8).."，".. floor(y / 16))
				end
			end
	end
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

--产生一个随机的旗子在area1区，目标点是area2区
function sf_createflag(camp, area1, area2)
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	if (GetMissionV(MS_FLAGMODE) == 1) then
		flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "fixedflagpos");
		flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "fixedflagpos");
	else
		flagplace = random(2)
		if (flagplace == 1) then
			flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "randomflagpos1");
		else
			flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "randomflagpos2");
		end

		flagplace = random(2)
		if (flagplace == 1) then
			flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "randomflagpos1");
		else
			flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "randomflagpos2");
		end
	end
	
	count = GetTabFileHeight(flagposfile1) - 1 ;
	if (count < 1) then
		print("error, flagposfile height not enough!"..flagposfile1);
		return
	end
	
	n = random(count);
	srcx = GetTabFileData(flagposfile1, n + 1, 1)
	srcy = GetTabFileData(flagposfile1, n + 1, 2)

	count = GetTabFileHeight(flagposfile2) - 1 ;
	if (count < 1) then
		print("error, flagposfile height not enough!"..flagposfile2);
		return
	end
	
	n = random(count);
	desx = GetTabFileData(flagposfile2, n + 1, 1)
	desy = GetTabFileData(flagposfile2, n + 1, 2)
-------------------------------------------------------------------------	
	
	sf_addflag(camp , srcx, srcy, desx,desy)
	if (camp == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>现在产生了一面新的宋方帅旗，位置在<color=yellow>"..floor(srcx/(32*8)).."，"..floor(srcy/(32*16)));
	elseif (camp == 2) then
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>现在产生了一面新的金方帅旗，位置在<color=yellow>"..floor(srcx/(32*8)).."，"..floor(srcy/(32*16)));
	else
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>现在产生了一面新的帅旗，位置在<color=yellow>"..floor(srcx/(32*8)).."，"..floor(srcy/(32*16)));
	end
end

function sf_createrandomflag()
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GameGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
---------------------------------------------------------------------
--选取两个不同的区域的两个坐标作为源点与目标点
	--计算出双方所在的区域位置
	area1 = random(areacount);
	area2 = area1;
	
	while (area1 == area2) 	do
		area2 = random(areacount)
	end;
	sf_createflag(0, area1, area2)
end
-----------------------------------------------------------------------------

function sf_winbouns(wincamp)
	local failcamp = 0;
	--如果结束对方阵营没有玩家，则胜方不给奖励
	if (wincamp == 1) then
		failcamp = 2;
	else
		failcamp = 1;
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("由于败方没有玩家，所以胜利方不送奖励")
		return
	end
--by zero 2007-8-1 获得所有赢方
	local Win_Players_Table={}
	idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, wincamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	--end 
	--by zero 2007-7-30 获得宋金军功牌 一天获得2次
	local OldPlayerIndex = PlayerIndex
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
		local player_total_point=BT_GetData(PL_TOTALPOINT) --获得积分
		
		--领取军功牌
		local jg_ndate=tonumber(GetLocalDate("%y%m%d"))
		jg_ndate=jg_ndate*10+2;
		local JG_T_Value=GetTask(JUNGONGPAI_Task_ID) --军功牌获取任务变量
		
		--print(format("%d %d",player_total_point,JG_T_Value))
		if(player_total_point >= 1000 and JG_T_Value < jg_ndate) then
			local ItemIdx = AddItem(6,1,JUNGONGPAI,1,0,0);
			
			local Tdate=FormatTime2Number(GetCurServerTime()+24*60*60)--领取的第二天
			Tdate=floor(Tdate/10000) --取年,月,日
			nEndYear=floor(Tdate/10000)+2000
			nEndMonthDay=floor(mod(Tdate,10000))
			SetSpecItemParam(ItemIdx, 1,nEndYear);--设置物品年
			SetSpecItemParam(ItemIdx, 2,nEndMonthDay);--设置物品月日
		SyncItem(ItemIdx)
			SetItemBindState(ItemIdx, -2);-- 绑定
			Msg2Player("你获得一个宋金军功牌")
			WriteLog(format("[宋金战场]\t%s\tName:%s\tAccount:%s\t积分1000以上得到一个宋金军功牌",
					GetLocalDate("%y%m%d %X"), GetName(), GetAccount()));
			if(JG_T_Value == (jg_ndate-1)) then --领取了2次	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate);
			elseif(JG_T_Value ~= jg_ndate) then --领取了1次	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate-1);
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	--end
	
	local award_over = floor(BATTLES_LOSEGAME_POINT * bt_getgn_awardtimes())
	bt_camp_getbonus(failcamp, award_over, "本次宋金战斗已经结束了，我方失败！不过胜败乃兵家常事，将士切勿灰心丧气，来日再绝雌雄！(得到额外<color=yellow>"..award_over.."<color>点的积分奖励)", 50);
	
	bonuscff1 = BATTLES_WINGAME_POINT * bt_getgn_awardtimes()
   	repute = 3 * bt_getgn_awardtimes()
	WriteLog("胜利方送给的奖励积分为："..bonuscff1)
	
	sf_itemcount = getn(sf_aryItems)
	-- by zero 修改获取赢方人员的方式
	OldPlayerIndex = PlayerIndex	
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
            local game_level = BT_GetGameData(GAME_LEVEL);
            
	   		AddRepute(repute);			
	   		Msg2Player("你的声望上升了"..repute.."点！")
	   		Msg2Player("你得到"..bonuscff1.."点的积分奖励！")
	   		
			--Storm 胜方结束挑战，并记录获胜者
                Say("恭喜你在本场战斗中获得胜利，你的声望上升了<color=yellow>"..repute.."<color>点！并得到额外的<color=yellow>"..bonuscff1.."<color>点的积分奖励和一块<color=yellow>玄晶矿石<color>！", 1, "结束对话/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1
			
			bt_addtotalpoint(bonuscff1)
			
			randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#>恭喜您得到了奖品"..szItemName);
			end;
	end
	PlayerIndex = OldPlayerIndex
end;

function GameOver()
	WriteLog("battle is ending. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	local bonus_s = BT_GetGameData(GAME_CAMP1);
	local bonus_j = BT_GetGameData(GAME_CAMP2);
	local resultstr = "";
	local OldPlayerIndex = PlayerIndex;

	
	--更新宋金相关的世界排名榜
	--
	game_mode = GetMissionV(MS_FLAGMODE);
	--模式总排行榜
	if (game_mode == 1) then
		BT_SortWorldLadder(PL_TOTALPOINT, 10009)
		BT_SortWorldLadder(PL_KILLPLAYER, 10011)
		BT_SortWorldLadder(PL_KILLNPC, 10012)
		BT_SortWorldLadder(PL_SNAPFLAG, 10008)
		--BT_SortWorldLadder(PL_KILLRANK5, 10006)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10013)
		BT_SortWorldLadder(PL_GETITEM, 10014)
	else
		BT_SortWorldLadder(PL_TOTALPOINT, 10018)
		BT_SortWorldLadder(PL_KILLPLAYER, 10020)
		BT_SortWorldLadder(PL_KILLNPC, 10021)
		BT_SortWorldLadder(PL_SNAPFLAG, 10017)
		--BT_SortWorldLadder(PL_KILLRANK5, 10006)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10022)
		BT_SortWorldLadder(PL_GETITEM, 10023)
	end
	
	local game_level = BT_GetGameData(GAME_LEVEL);
	
	--模式加等级排行榜
	if (game_mode == 1) then
		if (game_level == 3) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10044)
			BT_SortWorldLadder(PL_KILLPLAYER, 10045)
			BT_SortWorldLadder(PL_KILLNPC, 10046)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10047)
			BT_SortWorldLadder(PL_GETITEM, 10048)
			BT_SortWorldLadder(PL_TOTALPOINT, 10049)
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10060)
			BT_SortWorldLadder(PL_KILLPLAYER, 10061)
			BT_SortWorldLadder(PL_KILLNPC, 10062)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10063)
			BT_SortWorldLadder(PL_GETITEM, 10064)
			BT_SortWorldLadder(PL_TOTALPOINT, 10065)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10076)
			BT_SortWorldLadder(PL_KILLPLAYER, 10077)
			BT_SortWorldLadder(PL_KILLNPC, 10078)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10079)
			BT_SortWorldLadder(PL_GETITEM, 10080)
			BT_SortWorldLadder(PL_TOTALPOINT, 10081)
		end
	else
		if (game_level == 3) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10036)
			BT_SortWorldLadder(PL_KILLPLAYER, 10037)
			BT_SortWorldLadder(PL_KILLNPC, 10038)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10039)
			BT_SortWorldLadder(PL_GETITEM, 10040)
			BT_SortWorldLadder(PL_TOTALPOINT, 10041)
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10052)
			BT_SortWorldLadder(PL_KILLPLAYER, 10053)
			BT_SortWorldLadder(PL_KILLNPC, 10054)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10055)
			BT_SortWorldLadder(PL_GETITEM, 10056)
			BT_SortWorldLadder(PL_TOTALPOINT, 10057)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10068)
			BT_SortWorldLadder(PL_KILLPLAYER, 10069)
			BT_SortWorldLadder(PL_KILLNPC, 10070)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10071)
			BT_SortWorldLadder(PL_GETITEM, 10072)
			BT_SortWorldLadder(PL_TOTALPOINT, 10073)
		end
	end
	
	BT_SortWorldLadder(PL_SNAPFLAG, 10084)
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_KILLNPC, 10088)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	if (game_level == 1) then
		resultstr = "初级战场的"
	elseif (game_level == 2) then
		resultstr = "中级战场的"
	elseif (game_level == 3) then
		resultstr = "高级战场的"
	end
		--edit by zero 根据排名给奖励
	
	battle_rank_award0808(game_level)
	battle_rank_activity(game_level)
	
	--end
	--edit by 小浪多多
	--把3种模式奖励指向一个文件编写
	--所有队员奖励,胜负平皆有
	--sign start
	local Win_Players_Table={}
	local idx = 0;
	local pidx = 0;
	for i=1,500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, 0)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	for i = 1,getn(Win_Players_Table) do
		local noldplayerindex = PlayerIndex
		PlayerIndex = Win_Players_Table[i]
		local player_total_point=BT_GetData(PL_TOTALPOINT) --获得积分
		battles_award_all_singleplayer(PlayerIndex,player_total_point,game_level)
		PlayerIndex = noldplayerindex
	end 
	--sign end
	
	tb_storm_winner = {}	--Storm	清空获胜者
	
	if (bonus_s > bonus_j ) then
		resultstr = resultstr.."宋金夺旗的战斗已结束，最终宋金双方获得的帅旗数为"..BT_GetGameData(GAME_CAMP1).."："..BT_GetGameData(GAME_CAMP2).."，宋方赢得了胜利！";
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."双方人数比为宋"..GetMSPlayerCount(MISSIONID, 1)..":金"..GetMSPlayerCount(MISSIONID, 2).."。结束时间"..date("%H:%M"))
		BT_ReportResult(1)
		sf_winbouns(1)
		RecordBTCount_Win(1)		--在每个人任务变量里记录它此次宋金战场胜负状况
	elseif (bonus_s < bonus_j) then
		resultstr = resultstr.."宋金夺旗的战斗已结束，最终宋金双方获得的帅旗数为"..BT_GetGameData(GAME_CAMP1).."："..BT_GetGameData(GAME_CAMP2).."，金方赢得了胜利！"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."双方人数比为宋"..GetMSPlayerCount(MISSIONID, 1)..":金"..GetMSPlayerCount(MISSIONID, 2).."。结束时间"..date("%H:%M"))
		BT_ReportResult(2)
		sf_winbouns(2)
		RecordBTCount_Win(2)		--在每个人任务变量里记录它此次宋金战场胜负状况
	else
			resultstr = resultstr.."宋金夺旗的战斗已结束，结果为平局，最终宋金双方获得的帅旗数都为"..bonus_s.."";
			Msg2MSAll(MISSIONID, resultstr);
			WriteLog(resultstr.."双方人数比为宋"..GetMSPlayerCount(MISSIONID, 1)..":金"..GetMSPlayerCount(MISSIONID, 2).."。结束时间"..date("%H:%M"))
			local award_over = BATTLES_TIEGAME_POINT * bt_getgn_awardtimes()
			bt_camp_getbonus(1, award_over, "本次宋金战斗战平了！将士暂且收兵回营,养兵蓄锐,来日与敌人再绝雌雄！(得到额外<color=yellow>"..award_over.."<color>点的积分奖励)", 75);
			bt_camp_getbonus(2, award_over, "本次宋金战斗战平了！将士暂且收兵回营,养兵蓄锐,来日与敌人再绝雌雄！(得到额外<color=yellow>"..award_over.."<color>点的积分奖励)", 75);
	end;
		AddGlobalCountNews(resultstr, 1) 
	
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	branchTask_JoinSJend1();
	 	l_curcamp = GetCurCamp();
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
		--Storm 给获胜者以外的结束挑战
		if (not tb_storm_winner[PlayerIndex]) then
			storm_end(1)
		end
		
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[game_level], 1)
			NewWorld(bt_getsignpos(1))
		else	
			SetRevPos(tbGAME_SIGNMAP[game_level], 2)
			NewWorld(bt_getsignpos(2))
		end;
	end;
	PlayerIndex = OldPlayerIndex
end;
-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("以我军现在的兵力已足以全灭金兵，今后大展宏图的机会还很多，等下一次吧！")
			return
		elseif (camp==2) then
			Msg2Player("以我军现在的兵力已足以全灭宋军，今后大展宏图的机会还很多，等下一次吧！")
			return
		end
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","你们这些金人，侵我河山，杀我同胞，着实可恨，我们誓与你们抗战到底！")
		else
			Talk(1,"","想我金国将士，个个晓勇善战，岂是你们宋国的腐朽之师能与之匹敌的！")
			return
		end
	end

if (result == 0) then
	if (GetCash() >= 3000) then
		Pay(3000)
		BT_LeaveBattle() -- 清除玩家客户端当前的排名数据
		BT_ClearPlayerData()
		SetTask(2435, 0);--本场宋金已经领取的帮会贡献度清零--by 廖志山
			Msg2Player("战场提示：战场中可以按键盘左上角的～键切换显示当前战斗的情况");
			Msg2Player("战场提示：你必须在后营军需官处购买<color=yellow>旗标<color>才能夺旗后插旗")
			Msg2Player("战场提示：当玩家处于持旗状态时，不能进入后营！")
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nleve)
	else
		Say("想参加宋金战役，请支持3000两", 0)
		return 
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 22) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
		str = GetName().."加入了宋方阵营"
		EnterChannel(PlayerIndex, "宋方"..szGAME_GAMELEVEL[level].."夺旗")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
		str = GetName().."加入了金方阵营"
		EnterChannel(PlayerIndex, "金方"..szGAME_GAMELEVEL[level].."夺旗")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], 1)
else
	SetRevPos(tbGAME_SIGNMAP[level], 2)
end

NewWorld(sf_mapid, posx, posy);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(0);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf()
BT_BroadBattleDesc();
BT_ViewBattleStart()
SetFightState(0)
--Msg2MSAll(MISSIONID,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\seizeflag\\playerdeath.lua");
bt_JudgePLAddTitle()
end;
------------------------------------------------------------------

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
------------------------------------------------------

function RecordBTCount_Win(camp)		--在每个人任务变量里记录它此次宋金战场胜负状况
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: 宋金结束，记录胜负次数阵营出错！！！")
		return
	end
	local OldPlayerIndex = PlayerIndex
	idx = 0
	if (camp == 1) then
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
	else
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
	end
	PlayerIndex = OldPlayerIndex
end

-- 设置任务状态
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end