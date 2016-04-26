-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

IncludeLib("RELAYLADDER")
IncludeLib("FILESYS")
IncludeLib("TITLE");
IncludeLib("SETTING");

-- Message ��ɱ���׵���������BOSS -Modifiled by AnhHH - 20110725
Include("\\script\\lib\\objbuffer_head.lua")

YDBZ_MISSION_MATCH			= 50		-- ����mission
YDBZ_TIMER_MATCH				= 87		-- ������ʼ��ʱ��
YDBZ_TIMER_FIGHTSTATE 	= 89		-- ������ս��״̬��ʱ��
YDBZ_NPC_BOSS_COUNT			= 1			-- �����boss��������
YDBZ_VARV_STATE 				= 4			-- mission״̬��1��ʾ������2׼���׶Σ�ֹͣ������3��ʼ����
YDBZ_SIGNUP_WORLD				= 5			-- ������ͼ
YDBZ_SIGNUP_POSX				= 6			-- �����ص��X����
YDBZ_SIGNUP_POSY				= 7			-- �����ص��Y���� 
YDBZ_NPC_COUNT					= {8,9,10}		-- ��С��С�ֵ���
YDBZ_NPC_BOSS_COUNT			= 11		-- �����boss
YDBZ_NPC_WAY						= {12,13,14}	-- �ﵽ�Ĺ�
YDBZ_STATE_SIGN					= 15 		--����,YDBZ_STATE_SIGN
YDBZ_TEAM_COUNT					= 16		--�μ�����Ķ�������������
YDBZ_TEAM_SUM						=	17		--�μ�����Ķ�������������
YDBZ_NPC_TYPE						= {
	{20,21,22,23,24,25,26,27,28,29},		--A·��¼��������			
	{30,31,32,33,34,35,36,37,38,39},		--B·��¼��������	
	{40,41,42,43,44,45,46,47,48,49},		--C·��¼��������	
}


YDBZ_TEAM_NAME					= {1,2,3}						--A������	--B������	--C������					

YDBZ_TEAMS_TASKID				=	1851			-- ��¼�������group�������
YDBZ_PLAY_LIMIT_COUNT   = 1852			-- �μӴ���������1������ĵڼ��ܣ�2���� ��3�� ��4����
YDBZ_ITEM_YANDILING			= 1853			-- �׵���ʹ�ñ�����¼,1�׵��� 2��¼��ʱ��Ӫ
YDBZ_MISSIOM_PLAYER_KEY = 1854			-- �׵ۼ�¼������ϵ�key
YDBZ_ITEM_YANDILING_SUM	= 1855			-- �׵���ʹ������
YDBZ_LIMIT_SIGNUP				= 5					-- ��ʼˢ��֮���ʱ�䣺10��
YDBZ_LIMIT_FINISH 			= 30 * 60		-- ����ʱ�����ޣ��룩��30����
YDBZ_LIMIT_BOARDTIME		= 5	* 60		-- ����ʱ��,ÿ5���ӹ���һ��ʱ��
YDBZ_TIME_WAIT_STATE1		= 10				-- ɱ�������boss��ȼ�10���������׶�
YDBZ_TIME_WAIT_STATE3		= 30				-- ���سɹ������󣬵ȴ�30�뱻���ͳ�����
YDBZ_LIMIT_SETFIGHTSTATE= 3					-- ����׶Σ���ұ�ɱ���޵�״̬ʱ��3��
YDBZ_LIMIT_TEAMS_COUNT	= 15				-- �����������������
YDBZ_LIMIT_PLAYER_LEVEL = 160				-- �����͵ȼ�����
YDBZ_LIMIT_WEEK_COUNT		= 15				-- һ�ܲμ�������
YDBZ_LIMIT_DAY_COUNT		= 3 				-- ÿ��μ�������
YDBZ_PAIHANG_ID					=	10252			--���а�ID
YDBZ_LIMIT_ITEM					= {{6,1,1604},1,"Ӣ����"}	--��Ҫ���Ӣ������tb1��ͼ��ID��tb2����Ҫ����
YDBZ_LIMIT_DOUBEL_ITEM	= {{6,1,1617},1,"�׵���"}	--�׵���ɻ��˫���Ľ���
YDBZ_AWARD_EXP 					= 2000000									--ÿͨ��һ�����ӻ�õľ���
YDBZ_Faninl_AWARD_EXP		=	5000000								--�����boss����
YDBZ_KILLPLAYER_EXP 		= 2000000									--ɱ��һ�����˻�þ��飨ɱ��ҵþ��飩
YDBZ_KILLLASTBOSS_EXP		= 10000000									--ɱ������boss��þ���
YDBZ_BOAT_POS 					=													--��ұ����ͱ��س���3����x,y���ꡣ
{
	[1]={60032,104832},
	[2]={59744,123296},
	[3]={52960,121952},
}
YDBZ_FIGHTING_RELIFT = 		--������������͵�������㣬���
{
	[1]=
	{
		{57408,112000},
		{57504,112160},
		{57664,112160},
	},
	[2]=
	{
		{58016,114464},
		{57888,114688},
		{58048,114784},
	},
	[3]=
	{
		{56288,112544},
		{56160,112736},
		{56320,112736},
	},
}
-- ������ͼID
YDBZ_MAP_MAP = {
	853,
	854,
	855,
	856,
	857,
	858,
	859,
	860,
	861,
	862,
};

-- Message��ɱ���׵���������BOSS-Modifiled by AnhHH - 20110725
local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("��ϲ���� <color=yellow>%s<color>�������� [��ü��]������ѻ�ý��� [%s] " ,GetName(),GetItemName(nItemIndex))
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Tong(nTongId, msg)
	end
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
	Msg2Team(msg)
end

--����
YDBZ_ZUANYONG_ITEM =				--ר����Ʒ
{
	[1] = {"����",6,1,1605}, -- 1�̶�Ϊ����
	[2] = {"�׵۳�����",	6,	0,	1607}, 
	[3] = {"�׵ۼ�����",	6,	0,	1608}, 
	[4] = {"�׵۴�����",	6,	0,	1609}, 
	[5] = {"�׵۸�����",	6,	0,	1610}, 
	[6] = {"�׵۸�����",	6,	0,	1611}, 
	[7] = {"�׵۷�����",	6,	0,	1612}, 
	[8] = {"�׵۱�����",	6,	0,	1613}, 
	[9] = {"�׵�l�׷���",	6,	0,	1614}, 
	[10] = {"�׵ۻ����",	6,	0,	1615}, 
	[11] = {"�׵۶�����",	6,	0,	1616}, 

}

-- ������Ʒ
YDBZ_tbaward_item ={
	[1]=--С��
	{
	},
	[2]=--С��boss
	{--����%,����,��ƷID,�Ƿ������(0,�����ϣ�1ֱ�������һ����Ա����),����,˫�����Ƿ���Ч
		{50,1,{6,1,1605,1,0,0},1,"����",1},		--����
		{100,15,{1, 2, 0, 5, 0, 0},0,"�廨��¶��",0}, --�廨
--		{10,1,{6,1,1606,1,0,0},1,"�׵�ͼ��",1},			--��Ƭ
--		{10,1,{6,0,1591,1,0,0},1,"�׵۱���ר�ó�����",0},
--		{10,1,{6,0,1592,1,0,0},1,"�׵۱���ר�ü�����",0},
--		{10,1,{6,0,1593,1,0,0},1,"�׵۱���ר�ô�����",0},
--		{10,1,{6,0,1594,1,0,0},1,"�׵۱���ר�ø�����",0},
--		{10,1,{6,0,1595,1,0,0},1,"�׵۱���ר�ø�����",0},
--		{10,1,{6,0,1596,1,0,0},1,"�׵۱���ר�÷�����",0},
--		{10,1,{6,0,1597,1,0,0},1,"�׵۱���ר�ñ�����",0},
--		{10,1,{6,0,1598,1,0,0},1,"�׵۱���ר���׷���",0},
--		{10,1,{6,0,1599,1,0,0},1,"�׵۱���ר�û����",0},
--		{10,1,{6,0,1600,1,0,0},1,"�׵۱���ר�ö�����",0},
	},
	[3]=--�����Сboss
	{
		{100,5,{6,1,2311,1,0,0},1,"���",1},		--���
		{100,30,{1, 2, 0, 5, 0, 0},0,"�廨��¶��",0},--�廨
--		{30,1,{6,1,1606,1,0,0},1,"�׵�ͼ��",1}			--��Ƭ
	},
	-- �ı��׵��������boss����-Modifiled by DinhHQ - 20120314
	[4]=--����boss
	{			
		[1]={{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=15},},
		[2]={{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=100},},
		[3]={{szName="��Ч�ɲ�",tbProp={6,1,1181,1,0,0},nCount=1,nRate=20},},
		[4]={{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=20},},
		[5]={{szName="Į������",tbProp={6,1,1448,1,0,0},nCount=1,nRate=20},},
		[6]={{szName="�׵���",tbProp={6,1,1617,1,0,0},nCount=1,nRate=20},},
		[7]={{szName="�������ε�",tbProp={6,1,2379,1,0,0},nCount=1,nRate=20},},
		[8]={{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=20},},
		[9]={{szName="������յ�",tbProp={6,1,2397,1,0,0},nCount=1,nRate=20},},
		[10]={{szName="��Գ��",tbProp={6,1,2351,1,0,0},nCount=1,nRate=40},},
	},
}

-- 2011.03.23
YDBZ_tbaward_item_ex = 
{
	[1] = {szName="�׵��ر�",tbProp={6,1,2805,1,0,0}},		-- �׵��ر�p�д��޸�
}

--
-- NPC����к���
-- NPC�������еĺ��壺��������ID�����֡��ȼ������С��Ƿ�BOSS(0,1)��������λ��
YDBZ_NPC_ATTRIDX_PROCEED		= 1			-- NPC��������
YDBZ_NPC_ATTRIDX_ID			= 2			-- NPC��ID
YDBZ_NPC_ATTRIDX_NAME		= 3			-- NPC����
YDBZ_NPC_ATTRIDX_LEVEL		= 4			-- NPC�ȼ�
YDBZ_NPC_ATTRIDX_SERIES		= 5			-- NPC����
YDBZ_NPC_ATTRIDX_ISBOSS		= 6			-- �Ƿ�BOSS
YDBZ_NPC_ATTRIDX_COUNT		= 7			-- NPC����
YDBZ_NPC_ATTRIDX_POSITION	= 8			-- NPCλ��
--

YDBZ_SCRIPT_NPC_DEATH 	= "\\script\\missions\\yandibaozang\\npc_death.lua"
YDBZ_SCRIPT_PLAYER_DEATH = "\\script\\missions\\yandibaozang\\player_death.lua"
--
---- ����
YDBZ_map_series = {
	0,	-- ��
	1,	-- ľ
	2,	-- ˮ
	3,	-- ��
	4,	-- ��
};


YDBZ_mapfile_trap =
{
	{"\\settings\\maps\\yandibaozang\\trap\\a","\\script\\missions\\yandibaozang\\trap\\a",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\a"},
	{"\\settings\\maps\\yandibaozang\\trap\\b","\\script\\missions\\yandibaozang\\trap\\b",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\b"},
	{"\\settings\\maps\\yandibaozang\\trap\\c","\\script\\missions\\yandibaozang\\trap\\c",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\c"},
}