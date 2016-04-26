Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\battles\\battles_award_head.lua")		--By С�˶��
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");
MISSIONID = 11;
FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����
sf_aryItems = {
	{ "������", {6,0,2,1,0,0}, 5 },
	{ "������", {6,0,5,1,0,0}, 5 },
	{ "������", {6,0,4,1,0,0}, 5 },
	{ "������", {6,0,1,1,0,0}, 5 },
	{ "������", {6,0,6,1,0,0}, 5 },
	{ "������", {6,0,10,1,0,0}, 5 },
	{ "������", {6,0,7,1,0,0}, 5 },
	{ "�����", {6,0,9,1,0,0}, 5 },
	{ "�׷���", {6,0,8,1,0,0}, 5 },
	{ "������", {6,0,3,1,0,0}, 30 },
	{ "�̻�", {6,0,11,1,0,0}, 1 },
	{ "õ�廨��", {6,0,20,1,0,0}, 2 },
	{ "������ӳ��", {6,1,18,1,0,0}, 5 },
	}

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 90 * 60  * FRAME2TIME; -- ��սʱ��Ϊ1Сʱ
RUNGAME_TIME = 30 * 60 * FRAME2TIME / TIMER_1; --����30����֮���Զ�����ս���׶�
VANISHGAME_TIME = 70 * 60 * FRAME2TIME/ TIMER_1; --ս�����20����ʱ����������Npcȫ������

MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- ����������˳���Ϸ�ٽ���ʱ������3����֮������뿪��Ӫ����Ӫ

--������ĳЩֵ��¼��MissionValue�е�����λ�ã�ͨ��GetMissionV(MS_XXX)�����ʵ�ʵ�ֵ
MS_FLAGMODE = 2;--��¼��ǰ����ģʽ�ǹ̶�ģʽ�����������ģʽ���ֱ�Ϊ0��1
MS_FLAGCOUNT = 3; --��¼���������

MS_CENTER_X1 = 4;   --����1���������׶�ʱ����ֹ����뿪��Ӫʱ��������ӻش�Ӫ������
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--����2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --����1����Ӫ������
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --��Ӫ������
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--����2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1_TIME = 17; --��¼Timer1ִ�еĴ���

MS_FLAGPLY_S = 18;  --�̶�ģʽʱ����¼Ŀǰ�η���������PlayerIndex
MS_FLAGPLY_J = 19;  --�̶�ģʽʱ����¼Ŀǰ�𷽶�������PlayerIndex
MS_FLAGPOSX_S = 20; --�̶�ģʽʱ����¼�η���ǰ��֯��С��ͼ����λ��X
MS_FLAGPOSY_S = 21; --�̶�ģʽʱ����¼�η���ǰ��֯��С��ͼ����λ��Y
MS_FLAGPOSX_J = 22  --�̶�ģʽʱ����¼�𷽵�ǰ��֯��С��ͼ����λ��X
MS_FLAGPOSY_J = 23  --�̶�ģʽʱ����¼�𷽵�ǰ��֯��С��ͼ����λ��Y
MS_TOTALFLAG_S = 24	--��¼�̶�ģʽ������������
MS_TOTALFLAG_J = 25	--��¼�̶�ģʽ������������

TOTALFLAG_FIX = 30	--�̶�ģʽ����������

--�ڹ̶�ģʽ�£���õ�ǰĳ��˧������꣬˧�������ĳ����������򷵻�������꣬���򷵻ص��������
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
		if (PIdx2MSDIdx(MISSIONID, l_playeridx) <= 0) then --����Ҳ���ս����
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
		return floor(X / 8), floor(Y / 16) --����С��ͼ����
	else
		PlayerIndex = oldplayer
		if (camp == 1) then
			return floor(GetMissionV(MS_FLAGPOSX_S)), floor(GetMissionV(MS_FLAGPOSY_S))
		else
			return floor(GetMissionV(MS_FLAGPOSX_J)), floor(GetMissionV(MS_FLAGPOSY_J))
		end
	end
end;
--�̶�ģʽ�»�����ӵ�С��ͼ����λ��
function sf_setflagposinfo(camp, x, y)
	if (camp == 1) then
		SetMissionV(MS_FLAGPOSX_S, x)
		SetMissionV(MS_FLAGPOSY_S, y)
	else
		SetMissionV(MS_FLAGPOSX_J, x)
		SetMissionV(MS_FLAGPOSY_J, y)
	end
end
--�̶�ģʽ�¼�¼����������Ϣ
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

--Npc��ģ���ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս�������У�3��ʾս�۸ոս�����

MS_KEY = 7;		--��¼��ǰ��ͼ�������һ��key����һ��������ɵ�����

MS_NEWSVALUE = 10; --�����д�����ű����ĵط�
GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- ����ʱ��Ϊ��Сʱ


--����һ��ָ��ĳ�������ĳ��Ӫ��
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
		--�������������������״̬����������Ҫ���������
			if (GetMissionV(MS_FLAGMODE) == 1) then
					w,x,y = GetWorldPos()
					sf_addflag(GetCurCamp(), x*32, y*32, BT_GetData(PL_PARAM1), BT_GetData(PL_PARAM2))
					
					if (GetCurCamp() == 1 ) then
						sf_setflagplayer(1, 0) --��ǰ����Ѳ�������
						sf_setflagposinfo(1, floor(x / 8), floor(y/16))
						Msg2MSAll(MISSIONID, "<color=0x00FFFF>�η�<color=yellow>"..GetName().."<color>������˧����<color=yellow>"..floor(x / 8).."��".. floor(y / 16))
					else
						sf_setflagplayer(2, 0)
						sf_setflagposinfo(2, floor(x / 8), floor(y/16))
						Msg2MSAll(MISSIONID, "<color=0x9BFF9B>��<color=yellow>"..GetName().."<color>������˧����<color=yellow>"..floor(x / 8).."��".. floor(y / 16))
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
					Msg2MSAll(MISSIONID, "<color=0x00FFFF>�η�<color=yellow>"..GetName().."<color>������˧����<color=yellow>"..floor(x / 8).."��".. floor(y / 16))
				else
					Msg2MSAll(MISSIONID, "<color=0x9BFF9B>��<color=yellow>"..GetName().."<color>������˧����<color=yellow>"..floor(x / 8).."��".. floor(y / 16))
				end
			end
	end
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

--����һ�������������area1����Ŀ�����area2��
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
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>���ڲ�����һ���µ��η�˧�죬λ����<color=yellow>"..floor(srcx/(32*8)).."��"..floor(srcy/(32*16)));
	elseif (camp == 2) then
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>���ڲ�����һ���µĽ�˧�죬λ����<color=yellow>"..floor(srcx/(32*8)).."��"..floor(srcy/(32*16)));
	else
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>���ڲ�����һ���µ�˧�죬λ����<color=yellow>"..floor(srcx/(32*8)).."��"..floor(srcy/(32*16)));
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
--ѡȡ������ͬ�����������������ΪԴ����Ŀ���
	--�����˫�����ڵ�����λ��
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
	--��������Է���Ӫû����ң���ʤ����������
	if (wincamp == 1) then
		failcamp = 2;
	else
		failcamp = 1;
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("���ڰܷ�û����ң�����ʤ�������ͽ���")
		return
	end
--by zero 2007-8-1 �������Ӯ��
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
	--by zero 2007-7-30 ����ν������ һ����2��
	local OldPlayerIndex = PlayerIndex
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
		local player_total_point=BT_GetData(PL_TOTALPOINT) --��û���
		
		--��ȡ������
		local jg_ndate=tonumber(GetLocalDate("%y%m%d"))
		jg_ndate=jg_ndate*10+2;
		local JG_T_Value=GetTask(JUNGONGPAI_Task_ID) --�����ƻ�ȡ�������
		
		--print(format("%d %d",player_total_point,JG_T_Value))
		if(player_total_point >= 1000 and JG_T_Value < jg_ndate) then
			local ItemIdx = AddItem(6,1,JUNGONGPAI,1,0,0);
			
			local Tdate=FormatTime2Number(GetCurServerTime()+24*60*60)--��ȡ�ĵڶ���
			Tdate=floor(Tdate/10000) --ȡ��,��,��
			nEndYear=floor(Tdate/10000)+2000
			nEndMonthDay=floor(mod(Tdate,10000))
			SetSpecItemParam(ItemIdx, 1,nEndYear);--������Ʒ��
			SetSpecItemParam(ItemIdx, 2,nEndMonthDay);--������Ʒ����
		SyncItem(ItemIdx)
			SetItemBindState(ItemIdx, -2);-- ��
			Msg2Player("����һ���ν������")
			WriteLog(format("[�ν�ս��]\t%s\tName:%s\tAccount:%s\t����1000���ϵõ�һ���ν������",
					GetLocalDate("%y%m%d %X"), GetName(), GetAccount()));
			if(JG_T_Value == (jg_ndate-1)) then --��ȡ��2��	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate);
			elseif(JG_T_Value ~= jg_ndate) then --��ȡ��1��	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate-1);
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	--end
	
	local award_over = floor(BATTLES_LOSEGAME_POINT * bt_getgn_awardtimes())
	bt_camp_getbonus(failcamp, award_over, "�����ν�ս���Ѿ������ˣ��ҷ�ʧ�ܣ�����ʤ���˱��ҳ��£���ʿ�������ɥ���������پ����ۣ�(�õ�����<color=yellow>"..award_over.."<color>��Ļ��ֽ���)", 50);
	
	bonuscff1 = BATTLES_WINGAME_POINT * bt_getgn_awardtimes()
   	repute = 3 * bt_getgn_awardtimes()
	WriteLog("ʤ�����͸��Ľ�������Ϊ��"..bonuscff1)
	
	sf_itemcount = getn(sf_aryItems)
	-- by zero �޸Ļ�ȡӮ����Ա�ķ�ʽ
	OldPlayerIndex = PlayerIndex	
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
            local game_level = BT_GetGameData(GAME_LEVEL);
            
	   		AddRepute(repute);			
	   		Msg2Player("�������������"..repute.."�㣡")
	   		Msg2Player("��õ�"..bonuscff1.."��Ļ��ֽ�����")
	   		
			--Storm ʤ��������ս������¼��ʤ��
                Say("��ϲ���ڱ���ս���л��ʤ�����������������<color=yellow>"..repute.."<color>�㣡���õ������<color=yellow>"..bonuscff1.."<color>��Ļ��ֽ�����һ��<color=yellow>������ʯ<color>��", 1, "�����Ի�/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1
			
			bt_addtotalpoint(bonuscff1)
			
			randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#>��ϲ���õ��˽�Ʒ"..szItemName);
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

	
	--�����ν���ص�����������
	--
	game_mode = GetMissionV(MS_FLAGMODE);
	--ģʽ�����а�
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
	
	--ģʽ�ӵȼ����а�
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
		resultstr = "����ս����"
	elseif (game_level == 2) then
		resultstr = "�м�ս����"
	elseif (game_level == 3) then
		resultstr = "�߼�ս����"
	end
		--edit by zero ��������������
	
	battle_rank_award0808(game_level)
	battle_rank_activity(game_level)
	
	--end
	--edit by С�˶��
	--��3��ģʽ����ָ��һ���ļ���д
	--���ж�Ա����,ʤ��ƽ����
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
		local player_total_point=BT_GetData(PL_TOTALPOINT) --��û���
		battles_award_all_singleplayer(PlayerIndex,player_total_point,game_level)
		PlayerIndex = noldplayerindex
	end 
	--sign end
	
	tb_storm_winner = {}	--Storm	��ջ�ʤ��
	
	if (bonus_s > bonus_j ) then
		resultstr = resultstr.."�ν�����ս���ѽ����������ν�˫����õ�˧����Ϊ"..BT_GetGameData(GAME_CAMP1).."��"..BT_GetGameData(GAME_CAMP2).."���η�Ӯ����ʤ����";
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."˫��������Ϊ��"..GetMSPlayerCount(MISSIONID, 1)..":��"..GetMSPlayerCount(MISSIONID, 2).."������ʱ��"..date("%H:%M"))
		BT_ReportResult(1)
		sf_winbouns(1)
		RecordBTCount_Win(1)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
	elseif (bonus_s < bonus_j) then
		resultstr = resultstr.."�ν�����ս���ѽ����������ν�˫����õ�˧����Ϊ"..BT_GetGameData(GAME_CAMP1).."��"..BT_GetGameData(GAME_CAMP2).."����Ӯ����ʤ����"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."˫��������Ϊ��"..GetMSPlayerCount(MISSIONID, 1)..":��"..GetMSPlayerCount(MISSIONID, 2).."������ʱ��"..date("%H:%M"))
		BT_ReportResult(2)
		sf_winbouns(2)
		RecordBTCount_Win(2)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
	else
			resultstr = resultstr.."�ν�����ս���ѽ��������Ϊƽ�֣������ν�˫����õ�˧������Ϊ"..bonus_s.."";
			Msg2MSAll(MISSIONID, resultstr);
			WriteLog(resultstr.."˫��������Ϊ��"..GetMSPlayerCount(MISSIONID, 1)..":��"..GetMSPlayerCount(MISSIONID, 2).."������ʱ��"..date("%H:%M"))
			local award_over = BATTLES_TIEGAME_POINT * bt_getgn_awardtimes()
			bt_camp_getbonus(1, award_over, "�����ν�ս��սƽ�ˣ���ʿ�����ձ���Ӫ,��������,����������پ����ۣ�(�õ�����<color=yellow>"..award_over.."<color>��Ļ��ֽ���)", 75);
			bt_camp_getbonus(2, award_over, "�����ν�ս��սƽ�ˣ���ʿ�����ձ���Ӫ,��������,����������پ����ۣ�(�õ�����<color=yellow>"..award_over.."<color>��Ļ��ֽ���)", 75);
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
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
		--Storm ����ʤ������Ľ�����ս
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
			Msg2Player("���Ҿ����ڵı���������ȫ����������չ��ͼ�Ļ��ỹ�ܶ࣬����һ�ΰɣ�")
			return
		elseif (camp==2) then
			Msg2Player("���Ҿ����ڵı���������ȫ���ξ�������չ��ͼ�Ļ��ỹ�ܶ࣬����һ�ΰɣ�")
			return
		end
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","������Щ���ˣ����Һ�ɽ��ɱ��ͬ������ʵ�ɺޣ������������ǿ�ս���ף�")
		else
			Talk(1,"","���ҽ����ʿ������������ս�����������ι��ĸ���֮ʦ����֮ƥ�еģ�")
			return
		end
	end

if (result == 0) then
	if (GetCash() >= 3000) then
		Pay(3000)
		BT_LeaveBattle() -- �����ҿͻ��˵�ǰ����������
		BT_ClearPlayerData()
		SetTask(2435, 0);--�����ν��Ѿ���ȡ�İ�ṱ�׶�����--by ��־ɽ
			Msg2Player("ս����ʾ��ս���п��԰��������Ͻǵġ����л���ʾ��ǰս�������");
			Msg2Player("ս����ʾ��������ں�Ӫ����ٴ�����<color=yellow>���<color>���ܶ�������")
			Msg2Player("ս����ʾ������Ҵ��ڳ���״̬ʱ�����ܽ����Ӫ��")
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nleve)
	else
		Say("��μ��ν�ս�ۣ���֧��3000��", 0)
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
		str = GetName().."�������η���Ӫ"
		EnterChannel(PlayerIndex, "�η�"..szGAME_GAMELEVEL[level].."����")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
		str = GetName().."�����˽���Ӫ"
		EnterChannel(PlayerIndex, "��"..szGAME_GAMELEVEL[level].."����")
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

-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
------------------------------------------------------

function RecordBTCount_Win(camp)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: �ν��������¼ʤ��������Ӫ����������")
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

-- ��������״̬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end