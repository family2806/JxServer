--AddEventItem(489)���������
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

MISSIONID = 15			--δ��
FRAME2TIME = 18;		--18֡��Ϸʱ���൱��1����
boatMAPS = {337, 338, 339};		--�ϰ��ɴ���ͼ��˳��Ϊ��337�ϰ����Ρ�338���Ρ�339����
boatMAP_POS = {1646, 3233}
northMAP = 336
northMAP_POS = {{1158, 2964}, {1343, 2868}, {1482, 2796}}
TNPC_THIEF = {724, 725}
TNPC_THIEF_COUNT = 30
npcthiefpos = "\\settings\\maps\\��ԭ����\\�ɴ�\\�ɴ�ˢ�ֵ�.txt"
FLD_TIMER_1 = 20 * FRAME2TIME	--ÿ20�빫��һ��ս��
FLD_TIMER_2 = 39 * 60 * FRAME2TIME		--�ӱ���������򱦵�ͼ40����
ENDSIGN_TIME = 10 * 60 * FRAME2TIME/FLD_TIMER_1		--����ʱ�����
UPBOSS_TIME = 25 * 60 * FRAME2TIME/FLD_TIMER_1		--����15����ʱ������1��BOSS
UPBOSS_TIME2 = 30 * 60 * FRAME2TIME/FLD_TIMER_1		--����20����ʱ������2��BOSS
UPBOSS_TIME3 = 35 * 60 * FRAME2TIME/FLD_TIMER_1		--����25����ʱ������3��BOSS
REPORT_TIME = 38 * 60 * FRAME2TIME/FLD_TIMER_1 
HUOYUEDU_TIME = 3 * 60 * FRAME2TIME/FLD_TIMER_1 -- ��Ծ�Ȼ��ʱ�䣬���������3����

MS_STATE = 1
MS_TIMEACC_1MIN = 2
MS_TIMEACC_20SEC = 3




function fld_cancel()
end

function fld_wanttakeboat(addr)

	-- �����������ϴ� Modified - by AnhHH - 20110724
	if (GetLastFactionNumber() == -1)then
		Talk(1,"","����δ�������ɣ������ϴ�")
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
		Say("�Բ���! ǰ����Σ�գ���ʱ�����ϴ�!.",0)
		return
	end
	if (fld_haveroom() == 1) then
		return
	end
	local sz_msg = "��˴�������ɱ�������Ҫ�з�������ƻ������Ѿ�����<color=red>200<color> ���ؾ��ᣬ�Ҿ͸����ϴ�!";
	local str = {	
		"���з��������/use_lingpai",
		"���ռ���200�����ؾ���/use_juanzhou",
		"��������!/fld_cancel",
			};		
	--��������ɷ���ʱ�� - Modified by DinhHQ - 20110504
	if (check_new_shuizeitask() == 1) then
		sz_msg = format("��Ҫ�� %s ���ܲμӷ���ɱ�����˳���ȹ����н���", "ˮ������");
		str = {	
		format("����%s/use_suizeilingpai", "ˮ������"),
		"��������!/fld_cancel",
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
	--20110405: Fix bug, ����13h, 15h, 17h, 19h��2 3 ��ͷ����pk��ɱ
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
	Msg2Player("����"..t.." �����뿪��ͷ��������ɱ���")
	DisabledUseTownP(1)	--�������ڶɴ���ʹ�ûسǷ�
	SetRevPos(175,1);		--��������������ɽ��
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
			Say("��������! ���Ѿ����ˣ�����һ�˰�!", 0)
			return 1
		elseif (BOATID == 2) then
			Say("�������ˣ� ���Ѿ����ˣ�����һ�˰�!", 0)
			return 1
		elseif (BOATID == 3) then
			Say("�������ˣ� ���Ѿ����ˣ�����һ�˰�!", 0)
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

-- ���ؾ��ύ������
function	use_juanzhou()	--ʹ�����ؾ���
	GiveItemUI( "�����ؾ���", "��200�����ؾ��ᵽ����Ŀո�Ҫע�⣬����ո��ڵ����ؾ������ڻ��߶���200���ҽ���Ҫ.", "exchange_juanzhou", "no" );
end;

-- ȷ�����ؾ�����������
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
		Say("���ؾ�����񲻶ԣ���鿴��.", 2, "����ԭ���Ŵ��ˣ�������./use_juanzhou", "���Ҽ�鿴��/no")
		return
	end
	if (scrollcount > 200) then
		Say("��ֻ��Ҫ200�����ؾ��ᣬʣ��������ȥ!", 2, "����ԭ���Ŵ��ˣ�������./use_juanzhou", "���Ҽ�鿴��/no")
		return
	end
	if (scrollcount < 200) then
		Say("���ؾ��᲻����������!", 2, "����ԭ���Ŵ��ˣ�������./use_juanzhou", "���Ҽ�鿴��/no")
		return
	end
	if (scrollcount == 200) then
		if (fld_TakeBoat(PlayerIndex) ~= 1) then
			Say("ʱ�䲻���ˣ����Ѿ����ˣ��´�������!", 0)
			return
		end
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
	end;		
end;


-- ��������ƽ�������
function	use_lingpai()	--ʹ�÷��������
	GiveItemUI( format("���ѽ��� %s ����", "���������"), format("��һ��%s �����·��ո�������ҷ��붫�����Ҳ�ϡ��", "���������"), "exchange_lingpai_1", "no" );
end;

function use_suizeilingpai()
--Modified By DinhHQ - 20110930
	GiveItemUI( format("���ѽ���%s ����", "ˮ������"), format("��һ��%s �����·��ո�������ҷ��붫�����Ҳ�ϡ��", "ˮ������"), "exchange_lingpai_2", "no", 1 );
end

function exchange_lingpai_1(ncount)
	exchange_lingpai(ncount, 1)
end

function exchange_lingpai_2(ncount)
	exchange_lingpai(ncount, 2)
end

-- ȷ��
function exchange_lingpai(ncount, ntype)
	if (ncount == 0) then
		Say("û���������ϴ���?", 0)
		return
	end
	
	if (ncount > 1) then
		Say("�Ҳ��Ǹ����㲻Ҫ�ҷ���?", 0)
		return
	end

	local nItemIdx = GetGiveItemUnit(1);
	local nStackCount = GetItemStackCount(nItemIdx);
	
	if (nStackCount > 1) then
		Say("�ϰ�������ֻ��Ҫһ�����ƣ��������Ҳ�Ҫ", 0)
		return
	end
	
	local itemgenre, detailtype, particular = GetItemProp(nItemIdx);
	
	if (ntype ==1) then
		if (itemgenre ~= 4 or detailtype ~= 489) then
			Say(format("�ϰ�������ֻ����Ҫһ�����ƣ�������Ҫ", "���������"), 2, "����ԭ���Ŵ��ˣ�������./use_lingpai", "���Ҽ�鿴��/no")
			return
		end
	else
		if (itemgenre ~= 6 or particular ~= 2745) then
			Say(format("�ϰ�������ֻ����Ҫһ�����ƣ�������Ҫ", "ˮ������"), 2, "����ԭ���Ŵ��ˣ�������./use_suizeilingpai", "���Ҽ�鿴��/no")
			return
		end
	end
	
	if (fld_TakeBoat(PlayerIndex) ~= 1) then
		Say("ʱ�䲻���ˣ����Ѿ����ˣ��´�������!", 0)
		return
	end
	
	RemoveItemByIndex(nItemIdx);
	if particular == 2745 then
		AddStatData("shuizeilingpai_shiyongshuliang", 1)	--��������һ��
	end
	tbLog:PlayerActionLog("EventChienThang042011","BaoDanhPhongLangDo")	-- ������־
	--ghi log ���� key - Modified By DinhHQ - 20120410
	if particular == 2745 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiThuyTac")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiPLD")
	end
end;

function check_new_shuizeitask()
	local nHour = tonumber(GetLocalDate("%H"));
	--�i����������ɷ��� - Modified by DinhHQ - 20110504
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
