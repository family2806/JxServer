IL("FILESYS");
IL("ITEM");
IL("LEAGUE");
IL("SETTING");
IL("TITLE");
IL("RELAYLADDER");
IL("BATTLE")


TONGWAR_LGTYPE = 10

--ս�ӳ�ԱTask
TONGWAR_LGMTASK_JOB = 1		--�ӳ�Ϊ1����ԱΪ0

--ս�ӹ���Task
TONGWAR_LGTASK_TONGCNT = 1	--��������
TONGWAR_LGTASK_WIN = 2			--ʤ������
TONGWAR_LGTASK_LOSE = 3			--ʧ�ܴ���
TONGWAR_LGTASK_TIE = 4			--ƽ�ִ���
TONGWAR_LGTASK_RESULT = 5		--�����ܻ���
TONGWAR_LGTASK_POINT = 6		--ÿ���������ۼ�
TONGWAR_LGTASK_CITYID = 7		--�ó���id
TONGWAR_LGTASK_CAMP = 8			--�ó�������Ӫ
TONGWAR_LGTASK_MAP = 9			--�óǱ���������ͼ
TONGWAR_LGTASK_RANK = 10		--������������
--11	�ƽ�֮��
--12	�Ի�֮�����
--13	���غ�����
--14	�����ؼ�
TONGWAR_LGTASK_TITLE = 15		--��������Ƿ���ȡ�˹⻷
TONGWAR_LGTASK_TONGID = 16		--�������ID
TONGWAR_LGTASK_SEASON = 17		--����
TONGWAR_LGTASK_ELDER = 18		--���Ͻ�������7��
TONGWAR_LGTASK_MASTER = 19		--������������1��
TONGWAR_LGTASK_MSTITLE = 20		--�����ƺ�
--21	ϴ�辭

--��ɫTask
TONGWAR_RLTASK_POINT = 2369
TONGWAR_RLTASK_NDEATH = 2370
TONGWAR_RLTASK_KILLPLAYER = 2371
TONGWAR_RLTASK_LASTDTIME = 2372
TONGWAR_RLTASK_CURRANK = 2373
TONGWAR_RLTASK_SERIESKILL = 2374
TONGWAR_RLTASK_MAXSERIESKILL = 2375
TONGWAR_RLTASK_MAXDEATH = 2376
TONGWAR_RLTASK_KEYNUMBER = 2377
TONGWAR_RLTASK_TOTALPOINT = 2378
TONGWAR_RLTASK_AWARD = 1737;	--BYTE1=season ��ȡ����ͨ����
								--BYTE2=��ʼ��Ϊ������������
								--BYTE3=�����ͳ��Ͻ���
								--BYTE4=��ʼ��Ϊseason

--ս�ӱ����������� �ƽ�֮��	�Ի�֮��	���ش���	�����ؼ�	ϴ�辭
LG_TASK_AWORD = {11, 12, 13, 14, 21};
PL_TEMPTASK_SECURITY = 193;

TV_LASTDEATHTIME = 2306	
TV_LASTDEATHMAPX = 2307
TV_LASTDEATHMAPY = 2308
TV_SERIESKILL_REALY = 2305  --��ҵ�ǰ��ʵ����նֵ���߼�ɱ�Ƚϵͼ�����ң�����ն����������ʵ��ն��
--
-- TONG_MASTER = 3;

	
--BATTLE TASK---------------------
		PL_TOTALPOINT = 1
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		--�������ս�ֵ������ն��
		PL_SERIESKILL = 14			--��ҵ�ǰ����ն��
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22
		PL_PARAM2 = 23
		PL_PARAM3 = 24
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 ��ʾ��ҵ�ǰ�Ĺ�ְ��Ŀǰʹ�õ�6�Ų���
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 --��¼�����һ�βμ�ս�۵�ս����ˮ��
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	--��¼��ұ�ս�۵��ܻ��֣��ܻ�����������μӵĸ���ս�ֵĻ����ܺ�, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48

		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5
		GAME_CAMP2 = 6
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14

--�����˴���	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>���ִ���\n   <link>"
--����
TONGWAR_CITY = {"����","�ɶ�","����","�꾩","����","����","�ٰ�",}
TONGWAR_CITYID = {['����']=1,['�ɶ�']=2,['����']=3,['�꾩']=4,['����']=5,['����']=6,['�ٰ�']=7}
--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
TONGWAR_CALENDAR = {
			format("<color=red>%s<color><color=yellow>|<color>�ٰ� vs ����<color=yellow>|<color>�꾩 vs ����<color=yellow>|<color>\n�ɶ� vs ����<color=yellow>|<color>���費����.", "16/05"),
			format("<color=red>%s<color><color=yellow>|<color>����vs �꾩<color=yellow>|<color>����vs����<color=yellow>|<color>�ٰ�vs����<color=yellow>|<color>�ɶ�������.", "17/05"),
			format("<color=red>%s<color><color=yellow>|<color>�ɶ� vs �ٰ�<color=yellow>|<color>����vs ����<color=yellow>|<color>\���� vs ����<color=yellow>|<color>�꾩������.", "19/05"),
			format("<color=red>%s<color><color=yellow>|<color>�꾩 vs ����<color=yellow>|<color>�ɶ�vs ����<color=yellow>|<color>����vs ����<color=yellow>|<color>�ٰ�������.", "20/05"),
			format("<color=red>%s<color><color=yellow>|<color>����vs �ɶ�<color=yellow>|<color>�ٰ�vs ����<color=yellow>|<color>\�꾩vs ����<color=yellow>|<color>����������.", "21/05"),
			format("<color=red>%s<color><color=yellow>|<color>�ɶ�vs �꾩<color=yellow>|<color>����vs �ٰ�<color=yellow>|<color>\����vs ����<color=yellow>|<color>���ݲ�����.", "22/05"),
			format("<color=red>%s<color><color=yellow>|<color>�꾩vs �ٰ�<color=yellow>|<color>�ɶ�vs ����<color=yellow>|<color>\����vs ����<color=yellow>|<color>��������.", "23/05"),
			}
			
PHB_WULIN = 10227 --����ʮ������
PHB_CHENGSHI = {['�ɶ�'] = 10228 ,--�ɶ�ʮ������
				['����'] = 10229 ,--����ʮ������
				['�꾩'] = 10230 ,--�꾩ʮ������
				['�ٰ�'] = 10231 ,--�ٰ�ʮ������
				['����'] = 10232 ,--����ʮ������
				['����'] = 10233 ,--����ʮ������
				['����'] = 10234 --����ʮ������
			}

TAB_AWORD_GOOD = 
		{
			{{tbProp={6,1,907 ,1},szName="�ƽ�֮��",nExpiredTime=10080}, {15, 10, 8, 6, 5, 3, 1}},	--�ƽ�֮�ֵĽ����б�
			{{tbProp={6,1,1075,1},szName="�Ի͹����"}, {150, 100, 80, 60, 50, 30, 10}},	--�Ի�֮�ֵĽ����б�
			{{tbProp={6,1,2263,1},szName="�Ͻ��浤",tbParam={0,20}}, {8, 4, 2, 1, 0, 0, 0}},	--�Ͻ��浤��20�ڣ��Ľ����б�
			{{tbProp={6,1,2270,1},szName="ǧ��Ի͹�"}, {80, 60, 50, 40, 30, 20, 10}},	--ǧ��Ի�֮���Ľ����б�
			--VLDNB 11 - Modified By DinhHQ - 20120507
			{{tbProp={6,1,2357,1},szName="�׻���"}, {5, 3, 2, 1, 0, 0, 0}},			
			{{tbProp={0,10,9,1, 5},szName="������", nExpiredTime=180 * 60 * 24}, {1, 0, 0, 0, 0, 0, 0}},	--��Գ��Ľ����б�
			
			
--		{{6, 1, 1074, TONGTASK_AWORD_SMDHB, "���ش������"}, {80, 50, 30, 20, 15, 10, 5}},	--���ش����Ľ����б�
--		{{6, 1, 26, TONGTASK_AWORD_CBT, "�����ؼ�"}, {15, 10, 8, 6, 5, 3, 1}},	--�����ؼ��Ľ����б�
--		{{6, 1, 22, TONGTASK_AWORD_CBT, "ϴ�辭"}, {15, 10, 8, 6, 5, 3, 1}},	--ϴ�辭�Ľ����б�
		}

function tongwar_contribute(szPlayerName, szCityName, nRecord)--�������а�
	--addrecord totalrecord
	--ladder_(ncity, record)   taskvalue
	--ladder_(record)
	--1.�����˻��ּӵ��������а���������а���ȥ��
	if (not szCityName or not szPlayerName) then
		return
	end;
	local taskid_record;
	local nPlayerRecord = GetTask(TONGWAR_RLTASK_TOTALPOINT);
--	nPlayerRecord = nPlayerRecord + nRecord;
--	SetTask(TONGWAR_RLTASK_TOTALPOINT, nPlayerRecord);
	if (tongwar_citynamecheck(szCityName)) then
		Ladder_NewLadder(PHB_CHENGSHI[szCityName], szPlayerName, nPlayerRecord, 0);
		Ladder_NewLadder(PHB_WULIN, szPlayerName, nPlayerRecord, 0);
	end;
	
end;

function tongwar_citynamecheck(szCityName)
	local bIsCity = 0;
	local i;
	for i = 1, getn(TONGWAR_CITY) do
		if (szCityName == TONGWAR_CITY[i]) then
			bIsCity = 1;
			break;
		end;
	end;
	return bIsCity;
end;

