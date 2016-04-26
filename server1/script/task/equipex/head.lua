
-- ====================== �ļ���Ϣ ======================

-- ������Եonline Խ�ϰ���������ű�ͷ�ļ�
-- Edited by bel
-- 2008/05/07 AM 11:02

-- ======================================================

IncludeLib("ITEM");						-- ��Ʒ��֧��
IncludeLib("TASKSYS");					-- ����ϵͳ��֧��
Include("\\script\\lib\\equipex.lua");	-- ������������װ��֧�ֵ�ͷ�ļ�
Include("\\script\\task\\system\\task_debug.lua");		-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_head.lua");		-- ����WriteTaskLog��Ϣ

ID_EQUIPEX_TASK		= 2536;             -- ��¼�������������
ID_EQUIPEX_FINISH	= 2540;             -- ��¼������������״̬
ID_EQUIPEX_TOTAL  	= 2541;             -- ��¼���������Ƿ�ȫ�����
ID_EQUIPEX_TASK_RANDOMSEED	= 2539;  	-- ��¼�ƽ���������

GLB_EQUIPEX_CLOSE 	= 1244  			-- �����ر��õ���ʱ����
TASK_CHECKITEM_NUM 	= 202;				-- ������ʱ��¼����Ʒ ID ����
TAKS_CHECKITEM_MAX 	= 20;				-- ������ʱ��¼����Ʒ ID �����
TASK_CHECKITEM_START 		= 203;		-- ������ʱ��¼����Ʒ ID ��ʼ������
NUM_PAY_TOPITEMTOPERFECT	= 1000;		-- ��Ʒ�İ��������������շѣ���λ����
NUM_PAY_PERFECTITEM_REVERT 	= 500;


-- ��ͨ�İ�������
aryItem = {
	--   ���������  ��ͨ�����  ��������������   ��ͨ����������   ��Ҫ�̶�������
	[1]	= {211, 165, "�����İ���֮�ջ�ʯָ��", "����֮�ջ�ʯָ��", 105},
	[2] = {213, 167, "�����İ���֮��Ѫʯ��ָ", "����֮��Ѫʯ��ָ", 102},
	[3] = {210, 164, "�����İ���֮����ʯ����", "����֮����ʯ����", 114},
	[4] = {212, 166, "�����İ���֮���ʯ����", "����֮���ʯ����", 101},
}

-- ��Ʒ�İ�������
aryTopItem = {
	--   ���������  ��ͨ�����  ��������������   ��ͨ����������
	[1]	= {425, 409, "[����] ��Ʒ ����֮�ջ�ʯָ��", "[��Ʒ] ����֮�ջ�ʯָ��"},
	[2] = {427, 411, "[����] ��Ʒ ����֮��Ѫʯ��ָ", "[��Ʒ] ����֮��Ѫʯ��ָ"},
	[3] = {424, 408, "[����] ��Ʒ ����֮����ʯ����", "[��Ʒ] ����֮����ʯ����"},
	[4] = {426, 410, "[����] ��Ʒ ����֮���ʯ����", "[��Ʒ] ����֮���ʯ����"},	
}

aryNeedItem = {
	--      ��Ʒ����          ����  ����  ϸ��  �ȼ�  ����  �ƽ�  ����  ������Ӽ�¼
	[1] = {{"2 �ջ�ʯ",        4,   963,    1,   -1,   -1,    0,   2,    0},
		   {"1 ��ʯ�ᾧ",      4,   967,    1,   -1,   -1,    0,   1,    0},
		   {"10 ��ˮ��",       4,   238,    1,   -1,   -1,    0,   10,   0},
		   {"����֮�ջ�ʯָ��", 0,   0,      0,   -1,   -1,  165,   1,    1}},
		   	
	[2] = {{"2 ������ ",        4,   965,    1,   -1,   -1,    0,   2,    0},
		   {"3 ��Ѫʯ",        4,   966,    1,   -1,   -1,    0,   3,    0},
		   {"10 ��ˮ��",       4,   240,    1,   -1,   -1,    0,   10,   0},
		   {"����֮��Ѫʯ��ָ ", 0,   0,      0,   -1,   -1,  167,   1,    1}},
		   	
	[3] = {{"2 ���",          4,   964,    1,   -1,   -1,    0,   2,    0},
		   {"1 ��ʯ��Ƭ",      4,   968,    1,   -1,   -1,    0,   1,    0},
		   {"5 ��ˮ��",        4,   239,    1,   -1,   -1,    0,   5,    0},
		   {"1 ���ؿ�ʯ",      6,   1,    398,   -1,   -1,    0,   1,    0},
		   {"����֮����ʯ����", 0,   0,      0,   -1,   -1,  164,   1,    1}},
		   	
	[4] = {{"10 �i���ʯ",       4,   969,    1,   -1,   -1,    0,   10,   0},
		   {"1 ��ʹ����",     6,   1,    888,   -1,   -1,    0,   1,    0},
		   {"1 8������",       6,   1,    147,    8,   -1,    0,   1,    0},
		   {"����֮���ʯ����", 0,   0,      0,   -1,   -1,  166,   1,    1}},
}


function main_talk()
	
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	
	local aryTalk = {};
	
	if GetGlbValue(GLB_EQUIPEX_CLOSE)==1 then
		Say("���ع��� : �������ˣ������ٰ�����!", 0);
		return
	end;
	
	tinsert(aryTalk, "<dec><npc>���ܰ���ʲô��������������װ���� ");
	
	if nTask>=4 and nFinish==1 then
		tinsert(aryTalk, "������������찲��װ��./ib_nexttask_talk");
	else
		tinsert(aryTalk, "���������������װ������/main_task_talk");
	end;
	
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(aryTalk, "����ָ���������װ��/ib_nexttask_revert");
	end;
	
--	tinsert(aryTalk, "��ӵ��[��Ʒ��]�������Σ������ǿ����/top_equipex_dialog");
--	tinsert(aryTalk, "��ӵ��[��Ʒ��]�����������Σ�����һ�ԭ��/top_revert_dialog");
	tinsert(aryTalk, "�뿪/OnExit");
	
	CreateTaskSay(aryTalk);
end;


function main_task_talk()
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	if nTask==0 then
		CreateTaskSay({"<dec><npc>���������Ե���Ұ������.",
					   "��ʼ������������/main_task_001",
					   "�뿪/OnExit"});
	end;
	
	if nTask>0 and nTask<=4 and nFinish==0 then
		main_task_give();
	end;
	
	if nTask>0 and nTask<4 and nFinish==1 then
		if nTask==1 then main_task_002(); end;
		if nTask==2 then main_task_003(); end;
		if nTask==3 then main_task_004(); end;
	end;
	
end;



function main_task_001()
	SetTask(ID_EQUIPEX_TASK, 1);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>��������{{����֮�ջ�ʯָ��}}. �����ȥ��{{2 �ջ�ʯ}} ��{{1 ��ʯ�ᾧ}}, ��{{10 ��ˮ��}}, ��˵���������, ��ȥ��������Ȼ��������� {{����֮�ջ�ʯָ��}} .",
				   "������/OnExit"});	
end;

function main_task_002()
	SetTask(ID_EQUIPEX_TASK, 2);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>�������{{����֮��Ѫʯ��ָ }}, �����ȥ��{{2 ������}, {{3 ��Ѫʯ}}, ��{{10 ��ˮ��}}. ��˵���������, ��ȥ��������Ȼ��������� {{����֮��Ѫʯ��ָ }}.",
				   "������/OnExit"});	
end;

function main_task_003()
	SetTask(ID_EQUIPEX_TASK, 3);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>�������{{����֮����ʯ����}}, �����ȥ��{{2 ���}} ��{{1 ��ʯ��Ƭ}}, ��{{5 ��ˮ��}} ��{{1 ���ؿ�ʯ}}, ��˵���������, ��ȥ��������Ȼ��������� {{����֮����ʯ����}}.",
				   "������/OnExit"});	
end;

function main_task_004()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>�������{{�������ʯ����}}. �����ȥ��{{10 �i���ʯ}}, {{1 ��ʹ����}} ��{{1 8������}}, �Ͳ�Ȼ���������{{�������ʯ����}}.",
				   "������/OnExit"});	
end;

function main_task_give()
	local nTask = equipexTaskState();
	
	local aryTaskNeed = {}; 
	
	if nTask>0 and nTask<=4 then
		aryTaskNeed = aryNeedItem[nTask];
	end;
	
	local szTask = "";
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		szTask = szTask.."<color=yellow>"..aryTaskNeed[i][1].."<color><enter>";
	end;
	
	local szTalk = {};
	tinsert(szTalk, "<dec><npc>���ռ������� <enter><enter>"..szTask);
	tinsert(szTalk, "��������������ԭ��/giveTaskNeedDialog");
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(szTalk, "�Ҳ������������./ib_nexttask_cancel");
	end;
	tinsert(szTalk, "�뿪/OnExit");
	
	CreateTaskSay(szTalk);
end;


-- ÿһ���������ʱ�Ĵ���
function main_task_finish()
	
	local nTask = equipexTaskState();
	local nRandomSeed = 0;
	local nGold = 0;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- �Ƿ�ɾ����Ʒ��ȷ
	local i=0;

	-- ɾ����������Ҫ����Ʒ
	for i=1, nItem do
		nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
		
		-- �쳣���������ɾ�����ɹ�����ֱ�ӽ������ɻ�û���
		if nResult~=1 then
			Say("���������󣬲������!", 0);
			return
		end;
		
	end;
			
	if nTask>0 and nTask<=4 then
		
		nGold = aryItem[nTask][1];
		
		nRandomSeed = GetTask(ID_EQUIPEX_TASK_RANDOMSEED);
		
		-- AddItemEx ָ����Ҫ���ƽ���� -1
		AddItemEx(4, nRandomSeed, 1, 0, nGold - 1, 0, 0, 0, 0, 0);
		
		CDebug:MessageOut("����ɹ�1������������� :"..nGold.." �������:"..nRandomSeed);
		WriteTaskLog("����ɹ�1�������������:"..nGold.." �������:"..nRandomSeed);
		
	end;
	
	SetTask(ID_EQUIPEX_FINISH, 1);
	
	Msg2Player("��ϲ����: <color=yellow>"..aryItem[nTask][3].."<color>!");
	
	-- ��������������ɣ���������ζ���������Ϊ���һ���Ѿ����״̬
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		SetTask(ID_EQUIPEX_TASK, 4);
	end;
	
	if nTask==4 then
		SetTask(ID_EQUIPEX_TOTAL, 1);
	end;
	
end;


function equipexTaskState()
	return GetTask(ID_EQUIPEX_TASK);
end;


function giveTaskNeedDialog()
	GiveItemUI("��������", "������Ҫ��ԭ��!", "checkTaskNeed", "OnExit");
end;


function checkTaskNeed(nCount)
	local aryTaskNeed = aryNeedItem[equipexTaskState()];

	-- ��������Ҫ��Ʒ�� MAP
	local aryNeed = {};
	
	-- ����Ҫɾ����Ʒ������
	local aryDelItem = {};		
	
	-- ��������Ҫ����Ʒ����
	local nNeed = getTaskCollectNum();

	-- ������Ҫ����Ʒ���
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	print(-100, w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality);
	-- ��Ҵ���������Ʒ���
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	print(1000, nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex);
	-- �����Ʒ��Ҫ��¼������ӣ����¼���
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- ��ʵ����Ʒ����
	local nRealCount, nCheckCount = 0, 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- �����Ʒ������Ҫ�ҵ�����������ֱ�ӷ���
	if nRealCount ~= nNeed then
		Say("�������Ʒ��������ȷ!", 0);
		return 0;
	end;
	
	-- ������������Ҫ��Ʒ�� MAP
	for i=1, getn(aryTaskNeed) do
		
		w_Genre      = aryTaskNeed[i][2];
		w_Detail     = aryTaskNeed[i][3];
		w_Particular = aryTaskNeed[i][4];
		w_Level      = aryTaskNeed[i][5];
		w_GoodsFive  = aryTaskNeed[i][6];
		w_GoodsNum   = aryTaskNeed[i][8];
		
		w_Quality    = aryTaskNeed[i][7];
		
		nRandomSeedRecord = aryTaskNeed[i][9];
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;

		tmpNeedKey = tostring(w_Quality)..","..
					 tostring(w_Genre)..","..
					 tostring(w_Detail)..","..
					 tostring(w_Particular);
		
		-- ���û����� MAP KEY ���ʼ��
		if aryNeed[tmpNeedKey] then
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		else
			aryNeed[tmpNeedKey]={};
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		end;
		CDebug:MessageOut("����ɵ���Ʒ����: ["..tmpNeedKey.."]:"..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		CDebug:MessageOut("�����Ʒ:"..tmpGetKey);
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
				
				CDebug:MessageOut("�����Ʒ:"..tmpGetKey);
			
				-- ���������Ʒ����Ҫ�ж����л��ߵȼ���
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				CDebug:MessageOut("��Ʒ����:"..tmpGetKey.."level:"..tmpLevel.."  five:"..tmpFive);
				CDebug:MessageOut("������� :"..tmpGetKey.."level:"..aryNeed[tmpGetKey][j][1].."  five:"..aryNeed[tmpGetKey][j][2]);
				
				-- ������Ӧ�� KEY �����к͵ȼ������ϵĻ�
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- ���������������Ʒ��Ҫ��¼������ӣ����¼
					-- ��¼�ĸ�ʽΪ��[������][����������][����������]
					if aryNeed[tmpGetKey][j][5]==1 then
						
						-- �������ƽ��Ƿ��б�����
						local nExpiredTime = ITEM_GetExpiredTime(nIndex);
						if nExpiredTime > 0 then
							CreateTaskSay({"<dec><npc>�͹ٷ����װ������!",
										   "�Ҹ�����!/OnExit"});
							return
						end;
						
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTask(ID_EQUIPEX_TASK_RANDOMSEED, nRandomSeed);
					end;
										
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					CDebug:MessageOut("�����Ʒ:"..tmpGetKey.." ͨ��!");
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- ��շ�������������
			aryDelItem = {};
			
			Say("�������Ʒ����ȷ!", 0);
			return 0;
		end;
		
	end;
	
	-- ����ǲ������е���Ʒ����ȷ
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("�������Ʒ����ȷ!", 0);
				return 0;
			end;
		end;
	end;
	
	-- ��¼һ���ж��ٸ���Ʒ��Ҫɾ��
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("�о���Ҫɾ������Ʒ:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("��Ҫɾ��:"..aryDelItem[i]);
	end;
	
	-- �������ʱ�Ĵ���
	main_task_finish();
	
	return 1;

end;

-- ����һ����������Ҫ����Ʒ����
function getTaskCollectNum()
	local aryTaskNeed = aryNeedItem[equipexTaskState()];
	local nNum = 0;
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		nNum = nNum + aryTaskNeed[i][8];
	end;
	
	return nNum;
end;


-- ��һ������������Ʒ����ת����һ�� STRING �� KEY���Լ����صȼ�������
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
CDebug:MessageOut("�����Ʒ aaa:"..nGenre..","..nDetail..","..nParticular);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- ������һ��������������а��������
function ib_nexttask_talk()
	CreateTaskSay({"<dec><npc>����һ����������������������죬����.",
				   "������������������� - �ջ�ʯָ��/#ib_nexttask_main(1)",
				   "������������������� - ��Ѫʯ��ָ/#ib_nexttask_main(2)",
				   "������������������� - ����ʯ����/#ib_nexttask_main(3)",
				   "������������������� - �i���ʯ����/#ib_nexttask_main(4)",
				   "��������./OnExit"});	
end;


-- ���¸���ҿ�ʼһ������
function ib_nexttask_main(nSelect)
	if nSelect==1 then main_task_001(); end;
	if nSelect==2 then main_task_002(); end;
	if nSelect==3 then main_task_003(); end;
	if nSelect==4 then main_task_004(); end;
end;


-- ȡ������
function ib_nexttask_cancel()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 1);
	Msg2Player("<color=yellow>����ȡ���˴�����<color>!");
end;


-- ���Ҫ��ԭװ���ĶԻ�
function ib_nexttask_revert()
	CreateTaskSay({"<dec><npc>ʲô������þ����������������İ������β����ʺ��㣿�����Ǻðɣ��ҿ��԰���{{��ԭ}}��{{��ͨ�İ�������}}��{{����Ҳ����ԭ�����е㲻һ��}}��˭��֪���أ����������Ҫ������ˣ������������һ�������İ�������ʱ��������Ҫ���Ѻܶ�ľ����ģ�",
				   "���뻹ԭ����֮�ջ�ʯָ��/#ib_nexttask_revert_talk(1)",
				   "���뻹ԭ����֮��Ѫʯ��ָ/#ib_nexttask_revert_talk(2)",
				   "���뻹ԭ����֮����ʯ����/#ib_nexttask_revert_talk(3)",
				   "���뻹ԭ����֮���ʯ����/#ib_nexttask_revert_talk(4)",
				   "����������/OnExit"});
end;

-- ��ԭ��ȷ�Ϲ���
function ib_nexttask_revert_talk(nId)
	CreateTaskSay({"<dec><npc>�����Ҫ����������İ������λ�ԭ��ԭ�������������ֻ�������ˣ�Ҫ���㿴�Ű�����ֹ��Ѱɣ��ҵ�Ҫ�󲻶࣬{300 ��������}���У���������ͷ���Һ��ڿ��治���װ���",
				   "�ǵģ������Ѿ�/#ib_nexttask_revert_dialog("..nId..")",
				   "����������/OnExit"});
end;


-- �����������
function ib_nexttask_revert_dialog(nId)
	if GetCash()<3000000 then
		CreateTaskSay({"<dec><npc>��λ<sex>����ȷ�������ϴ��� {300 ����}��", "�����Ի�/OnExit"});
	else
		GiveItemUI("���谲������", "�뽫���"..aryItem[nId][3].."�Ž�ȥ", "ib_nexttask_revert_main", "OnExit");
	end;	
end;


-- ��ԭ��������
function ib_nexttask_revert_main(nCount)
	
	local nIndex = 0;
	local nQuality = 0;
	local nSelect = 0;
	local nResult = 0;
	local nCreateResult = 0;
	local aryCreateIndex = {};
	local i = 0;
	
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>�ҿ�����Ҫ{{һ��}}������{{��������}}�͹���Ŷ�����ټ�鿴����",
					   "�����Ի�/OnExit"});
		return
	end;
	
	nIndex = GetGiveItemUnit(nCount);
	nQuality = GetGlodEqIndex(nIndex);
	
	for i=1, 4 do
		if nQuality==aryItem[i][1] then
			nSelect = i;
			break;
		end;
	end;
	
	if nSelect==0 then
		CreateTaskSay({"<dec><npc>�ҿ�����Ҫ{{һ��}}������{{��������}}�͹���Ŷ�����ټ�鿴����",
					   "�����Ի�/OnExit"});
		return
	end;
	
	-- ��ʼ������ʱװ���������Ƿ����
	nCreateResult, aryCreateIndex = createLikeEquip(nIndex, aryItem[nSelect][2], aryItem[nSelect][5], 10);
	
	if nCreateResult>0 then

		-- ��ɾ��ԭ���Ļƽ�װ��
		nResult = RemoveItemByIndex(nIndex);
		
		-- �쳣����ɾ����Ʒ���ɹ�ʱ
		if nResult~=1 then
			CreateTaskSay({"<dec><npc>��ѽ~���㿴�������Ϻ�Ϳ�˰ɣ���ԭ��Ȼʧ���ˣ����ǲ�����˼�����´��������Կ���",
						   "�����Ի�/OnExit"});	
			WriteTaskLog("[���ش���]��ԭ��һ����������ʧ�ܣ�"..aryItem[nSelect][4]);
			return
		end;
		
		CDebug:MessageOut("�õ���һ����ȷ����ţ�"..nCreateResult);
		
		AddItemByIndex(nCreateResult);
		
		WriteTaskLog("��ԭ��һ���������γɹ���"..aryItem[nSelect][4]);
		
		-- ɾ�����ɵ���ʱװ����������ȷ���Ǹ�
		for i=1, getn(aryCreateIndex) do
			if aryCreateIndex[i]~=nCreateResult then
				RemoveItemByIndex(aryCreateIndex[i]);
			end;
		end;

		CreateTaskSay({"<dec><npc>���ã������������Ľ����{"..aryItem[nSelect][3].."}�ָ�����ԭ�������ӣ����Ҫ�ú��ˣ�",
				       "�����Ի�/OnExit"});	
		-- ��Ǯ
		Pay(3000000);
		Msg2Player("��֧���������� <color=yellow>300 ���ֹ���<color>��");
		       		
	else
		CreateTaskSay({"<dec><npc>��ѽ~���㿴�������Ϻ�Ϳ�˰ɣ���ԭ{��Ȼʧ����}�����ǲ�����˼����ô�Űɣ��ֹ���{ֻ������}�����´��������Կ���",
					   "�����Ի�/OnExit"});	
					   
		-- ɾ�����ɵ���ʱװ��
		for i=1, getn(aryCreateIndex) do
			RemoveItemByIndex(aryCreateIndex[i]);
		end;
		
		-- ��Ǯ
		Pay(1500000);
		Msg2Player("��֧���������� <color=yellow>150 ���ֹ���<color>��");

		WriteTaskLog("��ԭ��������ʱʧ�ܣ�"..aryItem[nSelect][4]);		
	end;
	
	return
	
end;


-- ��Ʒ��������
function top_equipex_dialog()
	CreateTaskSay({"<dec><npc>�Ѽ�Ʒ����װ�����ң��ҽ���������{{��Ʒ��������װ��}}, ��Ȼ������, {{ÿ�ι�Ǯ"..NUM_PAY_TOPITEMTOPERFECT.."  ����}}, ͬ����?",
				   "�ã������/top_equipex_give",
	               "����������/OnExit"});
end;

function top_equipex_give()
	if GetCash()<NUM_PAY_TOPITEMTOPERFECT*10000 then
		CreateTaskSay({"<dec><npc><sex> ������� {{"..NUM_PAY_TOPITEMTOPERFECT.." ����}} ", "�����Ի�/OnExit"});
	else
		GiveItemUI("����Ʒװ��װ��", "����뼫Ʒ����װ��", "top_equipex_main", "OnExit", 1);
	end;		
end;

function top_equipex_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>��ֻҪ {{1 ��Ʒ����װ��}}�͹��ˣ�����!",
					   "�����Ի�/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	-- �������ƽ��Ƿ��б�����
	local nExpiredTime = ITEM_GetExpiredTime(nIndex);
	if nExpiredTime > 0 then
		CreateTaskSay({"<dec><npc>�͹ٷ����װ������!",
					   "�Ҹ�����!/OnExit"});
		return
	end;
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][2]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>��<sex> �������Ʒ����{{��Ʒ����װ��}}, ����!",
					   "�����Ի�/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_TOPITEMTOPERFECT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- ��ȡ��״̬
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;

	-- AddItemEx ָ����Ҫ���ƽ���� -1
	-- AddGoldItem(0, aryTopItem[nAryIndex][1]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][1] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
	
	Msg2Player("���ѽ������� <color=yellow>"..NUM_PAY_TOPITEMTOPERFECT.." ��Ǯ<color>!");
	Msg2Player("����ɹ�: <color=yellow>"..aryTopItem[nAryIndex][3].."<color>!");
	
	WriteTaskLog("����ɹ�:"..aryTopItem[nAryIndex][3]);
end;


-- ��Ʒ�������ԭ
function top_revert_dialog()
	CreateTaskSay({"<dec><npc>��������{{��������װ��[��Ʒ]}} �����ˣ��ҿ��԰��� {{�ָ�ԭװ}} ��{{��Ʒ����װ��}}, {{֮ǰһ��������}}. {{����Ϊ "..NUM_PAY_PERFECTITEM_REVERT.." ����}}, c? ��ng ? kh�ng?",
				   "̫���ˣ������ /top_revert_give",
	               "����������/OnExit"});	
end;


function top_revert_give()
	if GetCash()<NUM_PAY_PERFECTITEM_REVERT*10000 then
		CreateTaskSay({"<dec><npc><sex> ������� {{"..NUM_PAY_PERFECTITEM_REVERT.." ����}} ", "�����Ի�/OnExit"});
	else
		GiveItemUI("������������װ�� [��Ʒ]", "�������������װ��[��Ʒ]", "top_revert_main", "OnExit", 1);
	end;		
	
end;


function top_revert_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>��ֻҪ {{1 ��Ʒ����װ��[��Ʒ]}} �Ϳ�����, ����!",
					   "�����Ի�/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	CDebug:MessageOut("��������װ����Ʒ:"..nQuality);
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][1]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>��<sex> �������Ʒ����{{��������װ��[��Ʒ]}}, ����!",
					   "�����Ի�/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_PERFECTITEM_REVERT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- ��ȡ��״̬
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;
	
	-- AddGoldItem(0, aryTopItem[nAryIndex][2]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][2] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
		
	Msg2Player("���ѽ������� <color=yellow>"..NUM_PAY_PERFECTITEM_REVERT.." ��Ǯ<color>!");
	Msg2Player("�ɹ��ָ�ԭװ: <color=yellow>"..aryTopItem[nAryIndex][4].."<color>!");
	
	WriteTaskLog("�ɹ��ָ�ԭװ:"..aryTopItem[nAryIndex][4]);		
end;


function OnExit()
	
end;
