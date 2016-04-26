-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ���ת��ͷ�ļ�
-- �ļ�������task_head.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-02-04 16:21:20

-- ======================================================
--print(10e6)


TB_LEVEL_REMAIN_PROP = {
		--[�ȼ�level] = { {magicpoint, prop, resist}<,{}>};
			}

function Load_TransLifeSetting()
	
	local b1 = TabFile_Load("\\settings\\task\\metempsychosis\\translife.txt", "TransLifeSetting")
	if b1~=1 then
		print("Load TransLifeSetting Failed!")
		return
	end
	local nRowCount = TabFile_GetRowCount("TransLifeSetting", "LEVEL")
	
	for y = 2, nRowCount do
		local n_level = tonumber(TabFile_GetCell("TransLifeSetting", y, "LEVEL"));
		
		local tb = {};
		
		for z = 1, 5 do
			
			local n_magicpoint = tonumber(TabFile_GetCell("TransLifeSetting", y, "MAGICPOINT"..z));
			local n_prop = tonumber(TabFile_GetCell("TransLifeSetting", y, "PROP"..z));
			local n_resist = tonumber(TabFile_GetCell("TransLifeSetting", y, "RESIST"..z));
			local n_addskilll = tonumber(TabFile_GetCell("TransLifeSetting", y, "SKILLLIMIT"..z));
			
			if (n_magicpoint) then
				tb[getn(tb) + 1] = {n_magicpoint, n_prop, n_resist, n_addskilll};
			end
			
		end
		
		if (n_level ~= nil) then
			TB_LEVEL_REMAIN_PROP[n_level] = tb;
		end
	end	
end

Load_TransLifeSetting()

TB_LEVEL_LIMIT = {160, 170, 180, 200, 200};
TB_TRANSTIME_LIMIT = {90, 180, 180, 180, 180};
-- 4ת��Ҫ����������
TBITEMNEED_4 = {
	[1] = {szName = "������", tbProb = {6,1,2973}, nCount = 999},	-- ������
	[2] = {szName = "<����������-����ķ�>", tbProb = {6,1,2974}, nCount = 1},  -- ����������������ķ�
	}

TB_TRANSLIFE_ERRORMSG = { 
	[1] = "<dec><npc>����������������Ҫ��������������װ��!",
	[2] = "<dec><npc>����Ǯ������ <color=red>100000000<color>.",
	[3] = "<dec><npc>����������������Ҫ",
	[4] = "<dec><npc>��λ����δѧ��<���������� - ����ƪ>, ��Ʒ�����������.",
	[5] = "<dec><npc>��λ�������������ȼ������ȥ�������� .",
	[6] = "<dec><npc>�������������� ��Ҫ�չ�����",
	[7] = "<dec><npc><���������� - �ķ�ƪ> ���ֻ������5�㣬����ѧ����.",
	[8] = "<dec><npc>ɱ������δ���! ��ɺ������� .",
	[9] = "<dec><npc>��ʹ����δ���! ��ɺ�������.",
	[10]= "<dec><npc>Ұ������δ���! ��ɺ�������.",
	[11]= "<dec><npc>Ұ�Ż��ȡ������Ļ��ᡣ��������������.",
	[12]= "<dec><npc>2�������ļ��Ϊ %d ��.",
	[13]= "<dec><npc>ת��4��Ҫ<color=red> 20000 �� <color> ������׼����������.",
	[14]= "<dec><npc>ת��4��Ҫ<color=red> 999 <color> ����������׼����������.",
	[15]= "<dec><npc>ת��4��Ҫ<color=red> ���������� - ����ķ�<color>, ����׼����������.",
}

-- �����������������ֵ
TB_BASE_STRG = {35,20,25,30,20};
TB_BASE_DEX = {25,35,25,20,15};
TB_BASE_VIT = {25,20,25,30,25};
TB_BASE_ENG = {15,25,25,20,40};

ZHUANSHENG_DESC		= "METEMPSYCHOSIS";
ZHUANSHENG_TUITION	= 100000000;	-- ת������JXB
ZHUANSHENG_XIANDAN_MINEXP	= 2*10e8;	-- �����ɵ�����Ҫ20��
ZHUANSHENG_XIANDAN_BASEEXP		= 10e6;	-- �����ɵ���λ�� 1000w
ZHUANSHENG_ITEM_BEGIN	= 20090420---20090420;		-- �����ɵ���ʼʱ�� 0��
ZHUANSHENG_ITEM_ENDLE	= 20090503;		-- �����ɵ�����ʱ�� 24��
ZHUANSHENG_ITEM_EXTIME	= 20090601;		-- �ɵ���Чʹ��ʱ��

LG_SHITULEAGUE = 1;				-- ʦͽս��
LG_WLLSLEAGUE = 5;				-- ��������ս��

TSK_ZHUANSHENG_FLAG = 2547;
TSK_ZHUANSHENG_1 = 2548;	-- ת�� ������������Ե�����������ӵ��ֽڿ�ʼ���α���𡢱���������������
TSK_ZHUANSHENG_2 = 2549;			-- ת�� ������������Ե��������������ֽڱ�����������ԣ������ֽ�δʹ��
TSK_ZHUANSHENG_XIANDAN	= 2581;		-- ���������ɵ�
TSK_ZHUANSHENG_AWARD	= 2582;		-- byte1:3תǰ10����ȡ����;1:δ��,255:����ȡ


TSK_KILLER_ID = 1082;
TSK_MESSENGER_FENG = 1201;
TSK_MESSENGER_SHAN = 1202;
TSK_MESSENGER_QIAN = 1203;
TSK_TASKLINK_STATE = 1028;
TSK_TASKLINK_CancelTaskLevel = 2571;
TSK_TASKLINK_CancelTaskExp1 = 2570;
TSK_TASKLINK_CancelTaskExp2 = 2575;

TSK_ZHUANSHENG_GRE = {2577, 2578, 2579}	-- ÿ��ת����ѡ�ȼ��Ϳ���
TSK_ZHUANSHENG_LASTTIME = 2580;			-- ��������ת����ServerTime ����ǣ����1700-0-0��Ŀǰ��������
TSKM_ZHUANSHENG_RESISTID = 199;			-- ��ʱ���ѡ�����ӵĿ���
--���Ա�ţ�0����1������2:����3:�磬4:����
TB_BASE_RESIST = {
	[0] = "���",
	[1] = "����",
	[2] = "����",
	[3] = "�׷�",
	[4] = "�շ�",
	}

TSK_TRANSLIFE_4 = 2908		-- �����Ƿ������4ת����	
TSK_LEAVE_SKILL_POINT_4 = 2909		-- ����ʣ���4ת���ܵ�ʣ�༼�ܵ�	
TSK_USED_SKILL_POINT_4 = 2899		-- �����Ѿ�ʹ���˶��ټ��ܵ�
TSK_LAST_UP_LEVEL_4 = 2910		-- �������һ�θ���4ת���ܵ�ʣ�༼�ܵ�ĵȼ� 
ZHUANSHENG_TUITION_4	= 200000000;	-- ��4��ת������JXB
CLEAR_SKILL_4_PRICE = 10000000	-- 4ת���ܵ�ϴ��ļ۸�
TB_SKILL_4 = {{1123,0},{1124,0},{1125,0},{1126,0},{1127,0},{1128,0},{1129,0},{1130,0}}		-- ����4ת���ܵ����id

NSTARTLEVEL_4 = 105		-- 4ת���ܴ�105����ʼ��ü��ܵ�
NPERPOINTNEEDLEVEL = 5  -- ÿ5�����һ�����ܵ�