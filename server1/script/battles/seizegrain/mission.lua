IncludeLib("BATTLE");
IncludeLib("TITLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
--V�n l��ngģʽ��PL_PARAM3���ڵ�������ڱ���ʿ��ʱ�ı��


function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	SetMissionV(MS_FLAGMODE , flagmode)
	
	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--��ʾ��ͳ���ܻ���
	BT_SetView(PL_KILLPLAYER);--ɱ�����Ŀ
	BT_SetView(PL_KILLNPC);--ɱNpc��Ŀ
	BT_SetView(PL_BEKILLED);--����ұ�ɱ����
	BT_SetView(PL_GETITEM);
	BT_SetView(PL_MAXSERIESKILL);--��ն����
	
	BT_SetGameData(GAME_CAMP1, 0) --���õ�ǰPhe T�ng����
	BT_SetGameData(GAME_CAMP2, 0) --���õ�ǰPhe Kim����

	subworldid = SubWorldIdx2ID(SubWorld)	
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
	
	--���û�֮�»��������
	SetMissionV(MS_HUANGZHIZHANG, greatnight_huang_event(1))
	
	--��õ�ͼ���Ӧ���趨�ļ���
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	

	--�õ��õ�ͼ�м�������
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--��������������г�ȡ��������Ϊ˫����������
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)
	
	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);

	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--��ȡ��������Ĵ�Ӫ�ڵ�����
	--�Ӵ�Ӫ����Ӫʱ�������
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--�Ӻ�Ӫ����Ӫ�������
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
-------------------------------------------------------------------------
	
	--�ڷ�Trap��
	--�ڷ�˫����Ӫ��Trap��

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--�ڷ�˫����Ӫ��trap��

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP1)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP2)
	

	--�ڷŶԻ�����Npc
	--��ҽ�İڷ�
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "Qu�n Nhu quan (T�ng) ");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Qu�n Nhu quan (Kim) ");
	
	
	--˧��İڷ�
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--������İڷ�
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32,y * 32);
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32, y * 32);
	
	
	StartMissionTimer(MISSIONID, 97, TIMER_2);
	--���ģʽ��Ҫ��ÿXph�t����һ�εĴ��������Բ�������
	StartMissionTimer(MISSIONID, 96, TIMER_1);
	
	SetMissionV(MS_STATE,1);--��������
	if (level == 1) then
		lvlstr = "Khu v�c S� c�p "
	elseif (level == 2) then
		lvlstr = "Khu v�c Trung c�p "
	else
		lvlstr = "Khu v�c Cao c�p "
	end
	
	RestMin, RestSec = GetMinAndSec(1800);
	local str1 = lvlstr.."T�ng Kim ��i chi�n ph��ng th�c V�n l��ng �ang cho b�o danh, m�i ng��i h�y mau ch�ng ��n T��ng D��ng ho�c Chu Ti�n tr�n �� b�o danh, ho�c c� th� d�ng T�ng Kim chi�u th� �� tr�c ti�p ��n �i�m b�o danh Chi�n tr��ng T�ng Kim, th�i gian c�n l�i l�:"..RestMin.."ph�t"..RestSec.."gi�y. �i�u ki�n tham gia: ��ng c�p t� 40. ph� b�o danh 3000 l��ng";
	AddGlobalNews(str1);
	CreateChannel("Phe T�ng"..szGAME_GAMELEVEL[level].."V�n l��ng", 9)
	CreateChannel("Phe Kim"..szGAME_GAMELEVEL[level].."V�n l��ng", 10)
	BT_SetMissionName("V�n l��ngģʽ")
	BT_SetMissionDesc("����:1160�꣬Phe Kim������������ı��ȡ�ι����������£����ǣ����������������˸ó�ʿ���ļ��ҷ��������ҵĴ�ս�Ӵ˴���.<enter><enter><color=yellow>V�n l��ngģʽ: ���������ϵ������ر����Ĵ�Ӫ���ķ�����������࣬�ķ��ͻ�ʤ.<enter>��ʯ:�����ջٶԷ�����.")
	WriteLog(lvlstr.."Phe T�ng��սV�n l��ngģʽ��ʼ��������ͼID��"..subworldid..".Th�i gian:"..date("%H:%M"))
	
end;

function RunMission()
	SetMissionV(MS_STATE,2);
	
	local subworldid = SubWorldIdx2ID(SubWorld);
	local level = BT_GetGameData(GAME_LEVEL);
	if (level == 1) then
		lvlstr = "Khu v�c S� c�p "
	elseif (level == 2) then
		lvlstr = "Khu v�c Trung c�p "
	else
		lvlstr = "Khu v�c Cao c�p  "
	end
	
	WriteLog(format("%s Phe T�ng��սV�n l��ngģʽ�ѿ�ʼ. ��ͼID�ǣ� %d. ��սʱ��: %s Phe T�ng��������Ϊ%d:%d",
				lvlstr, subworldid, GetLocalDate("%y-%m-%d %H:%M"),GetMSPlayerCount(MISSIONID, 1),GetMSPlayerCount(MISSIONID, 2)))
	
	local idx = 0;
	local pidx = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		--��ʱΪGM���������ʽ����ս��
		if (pidx > 0) then
			PlayerIndex = pidx;
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() );
			PutMessage("��ch qu�n �� b�t ��u h�nh ��ng! C�c chi�n s�! X�ng l�n!");
		end;
		if (idx <= 0) then 
			break
		end;
	end;
	PlayerIndex = oldPlayerIndex
end;

function EndMission()
	StopMissionTimer(MISSIONID, 96);
	StopMissionTimer(MISSIONID ,97);
	
	GameOver();
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("Phe T�ng"..szGAME_GAMELEVEL[level].."V�n l��ng")
	DeleteChannel("Phe Kim"..szGAME_GAMELEVEL[level].."V�n l��ng")

	SetGlbValue(GLB_BATTLESTATE, 0) --���ø�ȫ�ֱ���Ϊ1����־��ǰ������������Phe T�ngս�۽׶Σ���ʱ������������ĳ��ڵ��Զ�����Phe T�ngս�۵ı����㣬����������ԭPhe T�ngս����ͼ
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--�������ϵ�������û���
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	branchTask_JoinSJend1()
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "Phe T�ng"..szGAME_GAMELEVEL[level].."V�n l��ng")
	else
		LeaveChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."V�n l��ng")
	end
	sf_onplayerleave()
	SyncTaskValue(700 + PL_BATTLEPOINT);--ͬ����ҵ��ܻ��ָ��ͻ��ˣ����ڻ��ֹ�����
	AddSkillState(656,30,0,0) --����ҵ��ٶ�
	AddSkillState(661,5,0,0) --�����ҵĳƺż�������
	Title_ActiveTitle(0);
	local nRecord = GetTask(PL_TOTALPOINT + 750);	--By Liao Zhishan
	local nBeiShu = greatnight_huang_event(1);
	if (nBeiShu > 0) then
		nRecord = floor(nRecord / nBeiShu);
	end;
	local nOffered = GetTask(2435);
	SetTask(2435, nRecord);
	if (nRecord > nOffered) then
		tongaward_battle(nRecord - nOffered);--
	end;

	if (GetMissionV(MS_TIMER1_TIME) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end	
	ResetBonus()		--�������ϵ�������û���
end;
