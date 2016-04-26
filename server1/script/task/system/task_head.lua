
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����ϵͳ�ص�����ͷ�ļ�
-- Edited by peres
-- 2005/07/04 PM 19:59

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ��Ʒ��֧��
IncludeLib("ITEM");

-- �������Ĵ���֧��
Include("\\script\\task\\random\\task_head.lua");


-- ������̼䴫������ ID ����ʱ������
TASK_TEMP_ID = 201;

-- ������ʱ��¼����Ʒ ID ����
TASK_CHECKITEM_NUM = 202;

-- ������ʱ��¼����Ʒ ID ��ʼ������
TASK_CHECKITEM_START = 203;

-- ������ʱ��¼����Ʒ ID �����
TAKS_CHECKITEM_MAX = 20;


TaskID_Table = {
	CanCancel    = 4,
	TaskText_Row = 5,
}

-- ���������ı����
Condition = {

	TaskType_Row    = 1,
	TaskDesc_Row    = 2,
	
	TaskStart       = "����ʼ",	
	TaskEnd         = "�������",
	LevelMore       = "�ȼ�����",
	LevelLess       = "�ȼ�С��",
	LevelEqual      = "�ȼ�����",
	ValueMore       = "��������",
	ValueLess       = "����С��",
	ValueEqual      = "��������",
	ReputeMore      = "��������",
	HaveItem        = "������Ʒ",
	
	CanRestart      = "���ظ���ʼ",

}

-- �������ݵı����
Entity = {

	TaskType_Row          = 1,
	Goods_Genre_Row       = 2,
	Goods_Detail_Row      = 3,
	Goods_Particular_Row  = 4,
	Goods_Level_Row       = 5,
	Goods_GoodsFive_Row   = 6,
	Goods_Quality_Row     = 7,
	Goods_GoodsNum_Row    = 8,
	Goods_DelGoods_Row    = 9,
	Goods_RecordSeed_Row  = 10,
	Money_Row             = 11,
	KillNpcName_Row       = 12,
	DropItemRate_Row      = 13,
	TalkNpcName_Row       = 14,
	TalkNpcMap_Row        = 15,
	TaskText_Row          = 16,
	
	Collect               = "�ռ���Ʒ",
	CollectGoldItem       = "�ռ��ƽ�װ��",
	CollectNpcItem		  = "ɱ�ֵ�����Ʒ",
	KillNpc               = "ɱ��",
	TalkNpc               = "�Ի�",

}

-- �������ı����
Award = {

	AwardType_Row         = 1,
	AwardText_Row         = 2,
	Goods_Genre_Row       = 3,
	Goods_Detail_Row      = 4,
	Goods_Particular_Row  = 5,
	Goods_Level_Row       = 6,
	Goods_GoodsFive_Row   = 7,
	Goods_Quality_Row     = 8,
	Goods_RandomSeed_Row  = 9,
	Goods_GoodsNum_Row    = 10,
	MoneyNum_Row          = 11,
	ExpNum_Row            = 12,
	ReputeNum_Row         = 13,
	AwardTask_Row         = 14,
	SelectTask_Row        = 15,
	ArrayID_Row           = 16,
	ArrayRate_Row         = 17,
	AlliedAward_Row       = 18,
	
	Money                 = "��Ǯ",
	Exp                   = "����",
	Goods                 = "��Ʒ",
	GoldItem              = "�ƽ�װ��",
	Task                  = "��ʼ����",
	RandomTask            = "����������",  -- ����Ľ������ͣ������ض��Ĺ��̲���һ���������
	AlliedAwardIndex      = "��������",      -- ����Ľ������ͣ�ֱ������������������ϣ����ɷ�һģһ���Ľ���
	TreasureMap           = "�ر�ͼ",        -- ����Ľ������ͣ������ض��Ĺ��̸���ҷ�һ�Ųر�ͼ
	
}

-- ������ʱ�����Ĵ洢 ID ����
TmpType = {
	
	Collect        = "Collect",
	CollectGold    = "CollectGold",
	KillNpc        = "KillNpc",
	TalkNpc        = "TalkNpc",
	ItemNpc        = "ItemNpc",
	ItemRate       = "ItemRate",
	ItemSeed       = "ItemSeed",

}

-- ��ȡһ������ļ�Ҫ����
function GetTaskText(taskName)

local strText = TaskId(TaskNo(taskName), 1, TaskID_Table.TaskText_Row);

	if strText==nil then strText=""; end;
	
	return strText;
end;


-- ��ȡһ�������������¼���
function GetTaskEventName(taskName)

local nEventID = GetTaskEventID(taskName)
	return TaskEvent(nEventID, 1, 1);
end;


-- ���һ�������Ƿ����ȡ��
function CheckTaskCanCancel(taskName)
	local nCanCancel = tonumber(TaskId(TaskNo(taskName), 1, TaskID_Table.CanCancel));
	
	if nCanCancel~=nil and nCanCancel~=0 then
		return 1;
	else
		return 0;
	end;
	
end;


-- ѯ���Ƿ�ȡ������
function CancelTaskConfirm(nTaskID)
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
	Say("��ȷ��Ҫȡ���˴�������<color=yellow>"..szText.."<color>��", 
		2,
		"�ǵ�/#CancelTaskMain("..nTaskID..")",
		"����/Task_Exit");
end;


-- ȡ�������������
function CancelTaskMain(nTaskID)
	
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
		SetTaskStatus(taskName, 0);
		CloseTask(taskName);
		
		Msg2Player("���Ѿ��ɹ���ȡ���ˣ�<color=yellow>"..szText.."<color>��");
		
		WriteTaskLog("ȡ��������"..taskName);
		
end;


-- ִ������Ի�
function ShowTaskSay(taskID)

local taskName = TaskName(taskID)

	OnTaskSay_Call(taskName, GetTaskStatus(taskName));
	
end;


-- �öԻ������ʾ�������ϸ��Ϣ
function ShowTaskInfo(taskID)

local taskName = TaskName(taskID);
local strInfo = TaskTalk(taskName, 1, 6);

	Say(strInfo, 1, "����/#BackTaskStart("..TaskNo(taskName)..")");

end;


-- ��������Ի������
function BackTaskStart(taskID)
	OnTaskSay_Call(TaskName(taskID), 0);
end;


-- ��ȡһ����������Ҫ�������������
function GetTaskFinishConditionNum(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nRightCheck = nRow;
	local i=0;
	
	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		-- ������ռ����������Ʒ�������򲻼���
		if strType==Entity.CollectNpcItem then
			nRightCheck = nRightCheck - 1;
		end;
	end;
	
	return nRightCheck;
end;


-- ��ȡһ��������Ѽ���������Ʒ���ǻƽ�װ��
-- ����ֵ��1 Ϊ��Ʒ��2 Ϊ�ƽ�װ����nil Ϊû�ռ�����
function GetTaskCollectType(taskName)

local nRow, nCol = TaskEntityMatrix(taskName);	
local checkType = nil;
local i=0;

	-- �����������һƽ�װ����������ͨ��Ʒ
	for i=1, nRow do
		
		-- �ǻƽ�װ��
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
			checkType=2;
		end;
		
		-- ����ͨ��Ʒ
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
			checkType=1;
		end;
		
	end;
	
	return checkType;
	
end;

-- ����һ���������ռ����͵���Ʒ����
-- ��Ʒ�������ͣ�{nGenre, nDetail, nParticular, nLevel, nGoodsFive, nNum, nIsDel}
-- �ƽ�װ���������ͣ�{nQuality, nNum, nIsDel}
function GetTaskCollectArray(taskName, nType)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
local nQuality, nGoodsNum, nDelGoods = 0,0,0;

local nRow, nCol = TaskEntityMatrix(taskName);
local aryCollect = {}
local i=0;

	if (nType==1) then
		for i=1, nRow do
		
			nGenre      = tonumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
			nDetail     = tonumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
			nParticular = tonumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
			nLevel      = tonumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
			nGoodsFive  = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nGenre,
						 nDetail,
						 nParticular,
						 nLevel,
						 nGoodsFive,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	if (nType==2) then
		for i=1, nRow do
			nQuality    = tonumber(TaskEntity(taskName, i, Entity.Goods_Quality_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nQuality,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	return aryCollect;

end;

-- ȡ��һ��������Ҫ�ռ���Ʒ������
function GetTaskCollectNum(taskName)

local nNum = 0;
local strType = "";
local nRow, nCol = TaskEntityMatrix(taskName);

local i=0;

	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nNum = nNum + nGoodsNum;
		end;
	end;
	
	return nNum;
	
end;


-- ȡ��һ�����ռ���Ʒ������
function GetTaskCollectRow(taskName)

local aryRow = {}
local nRow, nCol = TaskEntityMatrix(taskName);
local i=0;

	for i=1, nRow do
	
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
		
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
		
			if aryRow[i]==nil then rawset(aryRow, i, {}); end;
			
			rawset(aryRow, i, {nGoodsNum, 0});
		end;
		
	end;
	
	return aryRow;

end;


-- ��������������ڣ�ֻ����ôκ�������ʵ�������ķ���
-- ���������string:taskName ��������������
-- ���������nAlliedTask ��ѡ����������ǿգ������������������������
function PayAwardMain(taskName, nAlliedTask)

	local nRow, nCol = TaskAwardMatrix(taskName);
	local nResult = 0; -- �����Ľ��������п�ʼ������Ļ��򷵻� 1
	local i=0;
	
	local aryAward = {{}};
	local strType = "";
	local strArray = "";
	local strArrayRate = "";
	
	local nIsArray = 0; -- �ж��Ƿ�������
	
	local nAdd = 0; -- �������ʱ�ۼӵı���
	local nRandom = 0; -- ȡ�����ֵ
	
	local nIsTaskStart = 0;  -- �Ƿ�ʼ������


	-- ����ǿգ���������������������ô˹���������
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;
	
		CDebug:MessageOut(taskName.."����ʼ���轱��");
	
		for i=1, nRow do
		
			strType = TaskAward(taskName, i, Award.AwardType_Row);
			strArray = TaskAward(taskName, i, Award.ArrayID_Row);
			strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
			
			-- �������������������
			if strArray~="" then
			
				CDebug:MessageOut(taskName.."�Ľ������������顣");
				
				-- ������鲻�������ʼ������
				if aryAward[tonumber(strArray)]==nil then
					CDebug:MessageOut(taskName.."��ʼ���������飺"..tonumber(strArray));
					rawset(aryAward, tonumber(strArray), {}); 
				end;
				
				 rawset(aryAward[tonumber(strArray)],
				 		getn(aryAward[tonumber(strArray)])+1,
				 		{i,tonumber(strArrayRate)}
				 		);
				 		
				 nIsArray = 1;
			else
				nResult = PayAward(taskName, i, strType, nAlliedTask);
				-- �����Ƿ�ʼ����
				if nResult==1 then nIsTaskStart = 1; end;
			end;
		
		end;
		
		-- ������������������飬��������鷢������
		if nIsArray==1 then
			CDebug:MessageOut(taskName.."�����б���������飬��ʼ�������鷢��������");
			for i=1, getn(aryAward) do
				if PayAwardForArray(taskName, aryAward[i], nAlliedTask)==1 then
					nResult = 1;
					nIsTaskStart = 1;
				end;
			end;
		
		end;
		
		
		-- ���������û�п�ʼ������Ļ���չ��������ɺ�ĶԻ�
		if nIsTaskStart==0 then
			CDebug:MessageOut(taskName.." ����û�п�ʼ����������ý�������ʱ�ĶԻ�");
			CreateTaskSay({TaskTalk(taskName, 1, 5),
						  "�����Ի�/OnTaskExit"
						  });
			return 1;
		end;
		
		return 1;
		
end;


-- ������ͳһϸ�ڴ������
-- �������Ϊ��������֡������кš���������
-- ���������nAlliedTask ��ѡ����������ǿգ������������������������
function PayAward(taskName, nRow, strType, nAlliedTask)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nNum = 0,0,0,0,0,0,0;
local nMoney, nExp = 0,0
local nRandomItemIndex = 0;  -- �������������������
local nRandomTaskID = 0;  -- ��������������������

-- �����Ʒ��Ҫ��¼������ӣ����¼���
local nRandomSeedRecord = 0;

-- ���������	
local nRandomSeed = 0;

local strAlliedTask = ""; -- ����������������
local nAlliedRow, nAlliedCol = 0,0;
local strAlliedType = "";
local strShowName = "";  -- �����ʾ��������

local strTask = "";
local strText = "";

local nResult = 0;

local i=0;

	-- �쳣����
	if taskName=="" or taskName==nil then
		-- д LOG
		WriteTaskLog("�Ƿ��ĵ����˷������̣�");		
		return
	end;

	-- ����ǿգ���������������������ô˹���������
	if nAlliedTask~=nil and nAlliedTask~=0 then
		strShowName = TaskName(nAlliedTask);
	else
		strShowName = taskName;
	end;
	
	-- �쳣����
	if strShowName==nil then strShowName=""; end;

	-- ��������������ǽ�Ǯ
	if strType==Award.Money then		
		nMoney = TaskAward(taskName, nRow, Award.MoneyNum_Row);
		
		if nMoney==nil or nMoney=="" then nMoney=0; end;
		
		Earn(nMoney);
		
		Msg2Player("���õ���<color=White>"..GetTaskText(strShowName).."<color>�Ľ�����<color=green>��Ǯ"..nMoney.."<color>");
		CDebug:MessageOut(strShowName.."������轱��Ϊ��Ǯ��"..nMoney);
	end;
	
	-- ��������������Ǿ���
	if strType==Award.Exp then
		nExp = TaskAward(taskName, nRow, Award.ExpNum_Row);
		AddOwnExp(nExp);
		
		Msg2Player("���õ���<color=White>"..GetTaskText(strShowName).."<color>�Ľ�����<color=green>����"..nExp.."<color>");
		CDebug:MessageOut(strShowName.."������轱��Ϊ���飺"..nExp);
	end;

	-- �����������������Ʒ
	if strType==Award.Goods then
	
		nGenre      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Genre_Row));
		nDetail     = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Detail_Row));
		nParticular = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Particular_Row));
		nLevel      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Level_Row));
		nGoodsFive  = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsFive_Row));
		nNum        = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsNum_Row));
		
		-- ��������Ʒ����
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		for i=1, nNum do
			AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
		end;
		
		Msg2Player("���õ���<color=White>"..GetTaskText(strShowName).."<color>�Ľ�����<color=green>��Ʒ"..strText..nNum.."��<color>");
		
		-- д LOG
		WriteTaskLog("������"..strShowName.."�������Ʒ��"..strText);
		
		CDebug:MessageOut(strShowName.."������轱��Ϊ��Ʒ����ƷΪ��"..strText);
	end;
		
	-- ��������������ǻƽ�װ��
	if strType==Award.GoldItem then
	
		nQuality = tonumber(TaskAward(taskName, nRow, Award.Goods_Quality_Row));
		nRandomSeedRecord = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_RandomSeed_Row));
		
		if nRandomSeedRecord~=-1 then
			nRandomSeed = GetTmpValue(taskName, TmpType.ItemSeed..nRandomSeedRecord);
			-- AddItemEx ָ����Ҫ���ƽ���� -1
			AddItemEx(4, nRandomSeed, 1, 0, nQuality - 1, 0, 0, 0, 0, 0);
			CDebug:MessageOut(strShowName.."������轱��Ϊ�ƽ�װ�������Ϊ��"..nQuality.." �������Ϊ��"..nRandomSeed);
		else
			AddGoldItem(0, nQuality);
		end;

		-- ��������Ʒ����
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		Msg2Player("���õ���<color=White>"..GetTaskText(strShowName).."<color>�Ľ������ƽ�װ����<color=Orange>"..strText.."<color>");
		
		-- д LOG
		WriteTaskLog("������"..strShowName.."�����һ���ƽ�װ����"..nQuality);
		
		CDebug:MessageOut(strShowName.."������轱��Ϊ�ƽ�װ�������Ϊ��"..nQuality);
	end;
	
	-- ������������ǿ�ʼһ������
	if strType==Award.Task then
		strTask = TaskAward(taskName, nRow, Award.AwardTask_Row);
		nResult = ApplyTask(strTask);
		CDebug:MessageOut(strShowName.."������轱��Ϊ��ʼ��������Ϊ��"..strTask.." ����ʼ���Ϊ��"..nResult);
		return 1;
	end;
	
	-- ������������ǲ���һ������������
	if strType==Award.RandomTask then
		
		-- ѡ��һ���ڶ�����������
		nRandomTaskID = TaskNo(selectNextTask());
		
		if nRandomTaskID~=nil and nRandomTaskID~=0 then
			-- ����һ���������
			nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
			SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
			
			-- ͬ����Ʒħ������
			SyncItem(nRandomItemIndex);

			Msg2Player("���õ���<color=White>"..GetTaskText(strShowName).."<color>�Ľ�����<color=green>�������һ����<color>");
			CDebug:MessageOut(strShowName.."������轱��Ϊһ��������ᣬ��������Ϊ��"..nRandomTaskID.." ����Ϊ��"..nRandomItemIndex);
		else
			CDebug:MessageOut(strShowName.."�������������ʧ�ܣ�");
		end;
		
	end;
	
	
	-- ������������ǲر�ͼ
	if strType==Award.TreasureMap then
		-- ����һ�Ųر�ͼ
		CreateTreasureMap();
		
		Msg2Player("���õ���<color=White>"..GetTaskText(strShowName).."<color>�Ľ�����<color=green>�ر�ͼһ����<color>");
		
		-- д LOG
		WriteTaskLog("������"..strShowName.."�����һ�Ųر�ͼ��");
	end;
	
	
	-- ������������ǽ�������
	if strType==Award.AlliedAwardIndex then

		-- ��ȡ����������
		strAlliedTask = TaskAward(taskName, nRow, Award.AlliedAward_Row);
		
		CDebug:MessageOut(taskName.."�Ľ�������Ϊ����������"..strAlliedTask);
		
		-- ���Լ�����ת����һ�����ִ���ȥ
		PayAwardMain(strAlliedTask, TaskNo(taskName));
		
	end;
	
	return 0;

end;


-- ���ݴ�������������ѡȡһ�������������
-- ���������taskName��������  aryAward{nRow, nRate}����������
-- ���������nAlliedTask ��ѡ����������ǿգ������������������������
function PayAwardForArray(taskName, aryAward, nAlliedTask)

local strType = "";

local nAdd = 0;
local nResult = 0;
local nRandom = 0;
local nIsTaskStart = 0; -- �ж�ʼ�Ƿ�������ʼ
local i=0;

local RATE_ADD = 100; -- ���ʶ��� 100 ���Է�ֹ����С��

	-- ����ǿգ���������������������ô˹���������
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;

	for i=1, getn(aryAward) do
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
	end;
	
	nRandom = random(1, nAdd);
	
	CDebug:MessageOut(taskName.."����ȡ��һ���������"..nRandom);
	
	if nAdd~=10000 then -- ���������Ӳ��� 10000 ���ݴ���
		print(taskName.."�Ľ��������д����");
		nRandom=1; 
	end;
	
	nAdd = 0;
	
	-- ����������Ķ�������ȥ
	for i=1, getn(aryAward) do
		
		strType = TaskAward(taskName, aryAward[i][1], Award.AwardType_Row);
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
		
		if nAdd>=nRandom then
			CDebug:MessageOut(taskName.."������������ȡ�õ� "..aryAward[i][1].."��");
			nResult = PayAward(taskName, aryAward[i][1], strType, nAlliedTask);
			
			if nResult==1 then
				nIsTaskStart = 1;
			end;
			
			break;
		end;
	end;
	
	return nIsTaskStart;
	
end;


-- �����ж϶Ի������Ƿ������
function CheckTalkCanFinish(taskName)

local nTalkNpc = 0;
local nOrder = 0;
local nFinish = 0;

	if GetTmpValue(taskName, TmpType.KillNpc) ~= nil then
		CDebug:MessageOut(taskName.." �ж϶Ի������Ƿ������ɣ�ɱ���������ʱ������Ϊ�ա�");
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.KillNpc);	
	end;
	if GetTmpValue(taskName, TmpType.Collect) ~= nil then
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.Collect);
	end;
	if GetTmpValue(taskName, TmpType.TalkNpc) ~= nil then
		nOrder = nOrder + 1;
		nTalkNpc = 1;
	end;
	
	if nOrder>1 then
		if nFinish + 1 == nOrder then
			CDebug:MessageOut(taskName.." �Ի�����������");
			return 1;
		else
			return nil;
		end;
	else
		return 1;
	end;

end;


-- ��������ѡ��Ի�
function CreateTalkTask()

local nNpcIndex = GetLastDiagNpc();
local NpcName  = ""

local x, y, subworld = GetNpcPos(nNpcIndex);
local mapName = SubWorldName(subworld);

local aryTask = EnumTaskList();

local aryTaskText = {"������ʲô�أ�"};

local i=0;

	if nNpcIndex==nil then return 0; end;

	if aryTask==nil then return 0; end;
	
	NpcName = GetNpcName(nNpcIndex);
	
	-- ̨�����Ҫת������ NPC NAME
	NpcName = NpcName2Replace(NpcName);
	
	for i=1, getn(aryTask) do
		if OnTaskNpcTalk(NpcName, mapName, aryTask[i])==1 then
			rawset(aryTaskText,
					getn(aryTaskText)+1,
					"��������"..GetTaskEventName(aryTask[i]).."��/#ShowTaskSay("..TaskNo(aryTask[i])..")");
		end;
	end;
	
	rawset(aryTaskText, getn(aryTaskText)+1, "����ԭ���ĶԻ�/NpcDialog");
	
	if getn(aryTaskText)>2 then
		SelectSay(aryTaskText);
		return 1;
	else
		return 0;
	end;

end;


-- ѡ���ռ�ɱ����Ʒ�������Ʒ����ÿɱһ��ָ���Ĺ�ʱ����
function SelectCollectItemTask(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nItemRate = tonumber(GetTmpValue(taskName, "ItemRate"));
	
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
	local szText = "";
	local nRandom = 0;
	
	if nItemRate==0 or nItemRate==nil then return end;
	
	CDebug:MessageOut(taskName.." �õ�ɱ�ֵ�����Ʒ�ĸ��ʣ�"..nItemRate);
	
		if nRate~=nil or nRate~="" then
			nRandom = random(1, 100);
			if nRandom<=tonumber(nItemRate) then
				
				for i=1, nRow do
					strType = TaskEntity(taskName, i, Entity.TaskType_Row);
					if strType==Entity.CollectNpcItem then
						nGenre      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
						nDetail     = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
						nParticular = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
						nLevel      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
						nGoodsFive  = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
						szText      = TaskEntity(taskName, i, Entity.TaskText_Row);
					end;
				end;
				
				AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
				Msg2Player("��õ���һ����<color=green>"..szText.."<color>��");
				
			end;
		end;
end;


-- ��һ������������Ʒ����ת����һ�� STRING �� KEY���Լ����صȼ�������
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
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


-- ת��һ����Ʒ�ı�ʶΪ���֣������Ϊ n ������ nil �򷵻� -1
function TranItemNumber(num)

	if num=="n" or num=="" or num==nil then
		return -1;
	end;
	
	if strfind(tostring(num), "/")~=nil then
		return tostring(num);
	end;
	
	return tonumber(num);

end;


-- ǿ�ƽ�һ������ת���ɺϷ����ַ���
function TranEnableString(strMain)

	if strMain==nil then
		return "";
	else
		return strMain;
	end;

end;


-- ö�ٵ�ǰ���ڽ��е����񣬷���һ������������
function EnumTaskList()

local aryTask = {}

-- ��ȡ��һ��������
local taskName = FirstTask();

	-- �����ǰû��������ֱ�ӷ���
	if taskName==nil then return nil; end;
	
	rawset(aryTask, getn(aryTask)+1, taskName);
	
	while (taskName~=nil) do
		taskName = NextTask();
		rawset(aryTask, getn(aryTask)+1, taskName);
	end;
	
	return aryTask;

end;


-- ͬ������ϵͳ��ռ�õ����б���
function SyncTaskSystemValus()

local nStart, nEnd = 2000, 2300; -- ��ʼ�ͽ����ķ�Χ
local i=0;

	for i=nStart, nEnd do
		SyncTaskValue(i);
	end;

end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)

	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;

	WriteLog("[����ϵͳ��¼]"..date("[%y��%m��%d��%Hʱ%M��]").."[�˺ţ�"..GetAccount().."][��ɫ��"..GetName().."]"..strMain);
end;


function Task_Exit()

end;