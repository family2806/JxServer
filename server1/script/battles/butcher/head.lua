Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan ��Ŀ��
Include("\\script\\battles\\battles_award_head.lua")		--By С�˶��
Include("\\script\\event\\change_destiny\\mission.lua");	-- �������
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

MISSIONID = 20
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


MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- ����������˳���Ϸ�ٽ���ʱ������3����֮������뿪��Ӫ����Ӫ
TIME_PLAYER_STAY = 120
--������ĳЩֵ��¼��MissionValue�е�����λ�ã�ͨ��GetMissionV(MS_XXX)�����ʵ�ʵ�ֵ
MS_butcher = 2;--��¼��ǰ���������ξ�Ԫ˧��1�����ǽ��Ԫ˧��2�����Ƕ������ˣ�3��

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
MS_TIMER1 = 17; --��¼Timer1ִ�еĴ���

MS_MOSTDEATH = 18	--���һ������������Ϊ��1���Σ���2���𣩣�����Ϊ��0

MS_TOTALPOINT_S = 19		--����ս�۽���ʱ���㣬��¼����ս���η��ܻ���
MS_TOTALPOINT_J = 20		--����ս�۽���ʱ���㣬��¼����ս�۽��ܻ���


FILE_HOMETRAP1 = "\\script\\battles\\butcher\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\butcher\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\butcher\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\butcher\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\butcher\\homeouttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\butcher\\npcdeath_1.lua",
	"\\script\\battles\\butcher\\npcdeath_2.lua",
	"\\script\\battles\\butcher\\npcdeath_3.lua",
	"\\script\\battles\\butcher\\npcdeath_4.lua",
	"\\script\\battles\\butcher\\npcdeath_5.lua",
	"\\script\\battles\\butcher\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\butcher\\npcdeath.lua"
FILE_TRANSPORT1 = 	"\\script\\battles\\butcher\\transport.lua";
FILE_TRANSPORT2 = 	"\\script\\battles\\butcher\\transport.lua";

--Npc��ģ���ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

--��С�����ĳһ��Ӫ����������������ս������Ӫ������������ڸ���Ŀ�����Ӫ���䣬���ۻ���������
MIN_PLAYER_COUNT_LIMIT = 0

MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս��������	��3��ʾս�۸ոս�����

MS_KEY = 7;		--��¼��ǰ��ͼ�������һ��key����һ��������ɵ�����

MS_NEWSVALUE = 10; --�����д�����ű����ĵط�

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------
function but_getminplayerlimit()
	return MIN_PLAYER_COUNT_LIMIT
end

function sf_winbouns(n_camp)
	local wincamp = n_camp;
	local failcamp = 0
	
	if (wincamp == 0) then
		wincamp = 1;
	end
	
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
	local All_Players_Table = {};
	local Win_Players_Table = {};
	idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, wincamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	
	local Los_Players_Table = {};
	idx = 0;
	for i = 1 , GetMSPlayerCount(MISSIONID, failcamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp)
		if (pidx > 0) then
			Los_Players_Table[getn(Los_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	battle_finish_activity(BT_GetGameData(GAME_LEVEL), All_Players_Table, Win_Players_Table, Los_Players_Table, n_camp)
	tbChangeDestiny:completeMission_Battle(All_Players_Table)
	TB_QIANQIU_YINGLIE0904:add_lucky_award(All_Players_Table)
	
	if (n_camp ~= 0) then
		TB_QIANQIU_YINGLIE0904:add_end_award(Win_Players_Table, 2);
		TB_QIANQIU_YINGLIE0904:add_end_award(Los_Players_Table, 0);
	else
		TB_QIANQIU_YINGLIE0904:add_end_award(All_Players_Table, 1);
	end
	
	--end 
	--by zero 2007-7-30 ����ν������ һ����2��
	local OldPlayerIndex = PlayerIndex
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
		local player_total_point=BT_GetData(PL_TOTALPOINT) --��û���
		
		--��ȡ2007���ﻨ��
		--2007��9��21�գ�����ά����~9��28��00��30
		local nTime=0;
		nTime = tonumber(GetLocalDate("%y%m%d%H%M"))
		
		
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
           local n_bonuscff1 = 0;
	   		AddRepute(repute);			
	   		Msg2Player("�������������"..repute.."�㣡")
			n_bonuscff1 = bt_addtotalpoint(bonuscff1)
			Msg2Player("��õ�"..n_bonuscff1.."��Ļ��ֽ�����")
			--Storm ʤ��������ս������¼��ʤ��
			Say("��ϲ���ڱ���ս���л��ʤ�����������������<color=yellow>"..repute.."<color>�㣡���õ������<color=yellow>"..n_bonuscff1.."<color>��Ļ��ֽ���!", 1, "�����Ի�/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1

			
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

function but_addmissionpoint(totalpoint)
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
	end
end

function GameOver()
	WriteLog("[Battle Log] battle is ending. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local OldPlayerIndex = PlayerIndex
	
	--�����ν���ص�����������
	WriteLog("[Battle Log] Sorting World Ladder");

--	--ģʽ�����а�

		BT_SortWorldLadder(PL_TOTALPOINT, 10147)
		BT_SortWorldLadder(PL_KILLPLAYER, 10148)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10149)
		BT_SortWorldLadder(PL_GETITEM, 10150)

	
	local game_level = BT_GetGameData(GAME_LEVEL);
	
	--ģʽ�ӵȼ����а�
		if (game_level == 3) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10151)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10152)
			BT_SortWorldLadder(PL_GETITEM, 10153)
			BT_SortWorldLadder(PL_TOTALPOINT, 10154)
			bt_sortbthonour();			--�ν�������������
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10155)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10156)
			BT_SortWorldLadder(PL_GETITEM, 10157)
			BT_SortWorldLadder(PL_TOTALPOINT, 10158)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10159)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10160)
			BT_SortWorldLadder(PL_GETITEM, 10161)
			BT_SortWorldLadder(PL_TOTALPOINT, 10162)
		end

	
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	WriteLog("[Battle Log] Awarding Activity");
	
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
	
	WriteLog("[Battle Log] Awarding Single Player");
	
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
	
	TB_QIANQIU_YINGLIE0904:sorter_award(game_level)
	

	WriteLog("[Battle Log] Awarding by Result");

	if (GetMissionV(MS_MOSTDEATH) == 0) then
		if (bonus_s > bonus_j ) then
			resultstr = resultstr.."�ν�ս���ѽ����������ν�˫����õ��ܻ���Ϊ"..bonus_s.."��"..bonus_j.."���η�Ӯ����ʤ����";
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr)
			BT_ReportResult(1)
			RecordBTCount_Win(1)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
			sf_winbouns(1)
		elseif (bonus_s < bonus_j) then
			resultstr = resultstr.."�ν�ս���ѽ����������ν�˫����õ��ܻ���Ϊ"..bonus_s.."��"..bonus_j.."����Ӯ����ʤ����"
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr)
			BT_ReportResult(2)
			RecordBTCount_Win(2)	--��ÿ��������������¼���˴��ν�ս��ʤ��״��
			sf_winbouns(2)
		else
			resultstr = resultstr.."�ν�ս���ѽ����������ν�˫����õ��ܻ���Ϊ"..bonus_s.."��"..bonus_j
			Msg2MSAll(MISSIONID, resultstr)
			local award_over = BATTLES_TIEGAME_POINT * bt_getgn_awardtimes()
			bt_camp_getbonus(1, award_over, "�����ν�ս��սƽ�ˣ���ʿ�����ձ���Ӫ,��������,����������پ����ۣ�<color=yellow>", 75);
			bt_camp_getbonus(2, award_over, "�����ν�ս��սƽ�ˣ���ʿ�����ձ���Ӫ,��������,����������پ����ۣ�<color=yellow>", 75);
			sf_winbouns(0)
			WriteLog(resultstr)
		end;

		AddGlobalCountNews(resultstr, 1) 

	elseif (GetMissionV(MS_MOSTDEATH) == 1) then
		resultstr = resultstr.."�ν�ս���ѽ������η�Ӯ����ʤ����"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr)
		BT_ReportResult(1)
		sf_winbouns(1)
		RecordBTCount_Win(1)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
		AddGlobalCountNews(resultstr, 1) 
	elseif (GetMissionV(MS_MOSTDEATH) == 2) then
		resultstr = resultstr.."�ν�ս���ѽ�������Ӯ����ʤ����"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr)
		BT_ReportResult(2)
		sf_winbouns(2)
		RecordBTCount_Win(2)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
		AddGlobalCountNews(resultstr, 1) 
	end
	
	WriteLog("[Battle Log] Ready for kick Out");
	
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

		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
		-- Big Boss Remove bonus state
		BigBoss:RemoveSongJinBonus();
		
		--Storm ����ʤ������Ľ�����ս
		if (tb_storm_winner[PlayerIndex] == nil) then
			storm_end(1)
		end

		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[game_level], 1)
			NewWorld(bt_getsignpos(1))
		else	
			SetRevPos(tbGAME_SIGNMAP[game_level], 2)
			NewWorld(bt_getsignpos(2))
		end;
		
		camp = GetCamp();
		SetCurCamp(camp);
		
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
		if (CalcItemCount(-1, 6, 1, 30083, -1) >= 1 and ConsumeEquiproomItem(1, 6, 1, 30083, 1) == 1) then		
		BT_LeaveBattle() -- �����ҿͻ��˵�ǰ����������
		BT_ClearPlayerData()
		SetTask(2435, 0);--�����ν��Ѿ���ȡ�İ�ṱ�׶�����--by ��־ɽ
			Msg2Player("ս����ʾ��ս���п��԰��������Ͻǵġ����л���ʾ��ǰս�������");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		tbLog:PlayerActionLog("EventChienThang042011","�ν���")	-- ������־
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nlevel)
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhTongKim")
	else
		local szMsg = %BATTLE_STR_2
		Say(szMsg, 0)
		return 
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
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
		EnterChannel(PlayerIndex, "�η�"..szGAME_GAMELEVEL[level].."ɱ¾ģʽ")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
		str = GetName().."�����˽���Ӫ"
		EnterChannel(PlayerIndex, "��"..szGAME_GAMELEVEL[level].."ɱ¾ģʽ")
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
SetDeathScript("\\script\\battles\\butcher\\playerdeath.lua");
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
		print("ERROR: �ν��������¼ʤ��������Ӫ��������")
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

function but_pop2home( camp )
	oldPlayerIndex = PlayerIndex
	tbPlayer = { }
	tbRMPlayer = {}
	count = 0
	count_remain = 0
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer( MISSIONID,idx, camp );
		if( pidx > 0 ) then
		 	PlayerIndex = pidx
		 	if ( GetFightState( ) == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_PLAYER_STAY ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
		 	elseif ( GetFightState( ) == 0 ) then
		 		count_remain = count_remain + 1
		 		tbRMPlayer[ count_remain ] = pidx
		 	end
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 

	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))

	if ( count > 0 ) then
		if ( camp == 1 ) then
			area = BT_GetGameData(GAME_CAMP1AREA);
		else
			area = BT_GetGameData(GAME_CAMP2AREA);
		end
		npcfile = GetIniFileData(mapfile, "Area_"..area, tbNPCPOS[random(2)]);
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
			x,y = bt_getadata(npcfile)
			SetPos(floor(x/32), floor(y/32))
			SetFightState(1)
			Msg2Player("<color=pink>�㲻�ܼ���ͣ���ں�Ӫ")
		end
	end

	if ( count_remain > 0 ) then
		for i = 1, count_remain do
			PlayerIndex = tbRMPlayer[ i ]
			remain_time = TIME_PLAYER_STAY - ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) )
			if( remain_time > 0) then
				Msg2Player("<color=pink>�㻹���ں�Ӫͣ��"..remain_time.."��")
			end
		end
	end
	PlayerIndex = oldPlayerIndex
end