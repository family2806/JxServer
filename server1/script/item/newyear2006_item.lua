
-- ====================== �ļ���Ϣ ======================

-- ������Եonline 2006 Ԫ�����������گ���ļ�
-- Edited by peres
-- 2005/12/22 PM 15:12

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ���� 2006 Ԫ���ͷ�ļ�
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- �������Ĵ���֧��
Include("\\script\\task\\random\\task_head.lua");

function main()

Say("��������گ�飺������������λ��Ϊ�������˾��Ľ��������½��м�������ǡ��ũ�����꽫����Ԫ���ѽڣ���ί�������´���Ϊ��λ����Ԫ�����񣬴�ҿ�����<color=yellow>12��30����1��1��<color>��ȡ�����ף�ϼҰ������������⣡ ���� ���½�",
	7,
	"��ȡÿ�յİ�Сʱ˫������/getDoubleExp",
	"��ȡÿ�յľ��齱��/getMoreExp_Confirm",
	"��ȡÿ�յ��������/getTaskBook",
	"����������񴥷����ʷ�������Ϣ/getRandomTaskInfo",
	"�йذ׾��������Ϣ/getBaijuInfo",
	"������ͭǮ�����µ���/getCoppercashInfo",
	"�Ķ����/OnExit");
	
	return 1;

end;


function getDoubleExp()

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNewYearTime()==0 then
		Say("�����Ѿ�����Ԫ����Ŷ��", 0);
		return
	end;

	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("ֻ�� 80 �����ϵ��˲�����ȡ˫������Ŷ��", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);	
		
	elseif GetTask(ID_GETDOUBLEEXP_NUM)>=1 then
	
		Say("������Ѿ���ȡ����˫��������Ŷ��", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);
			
	end;
	
	-- 80 �����ϵ���ÿ�������ȡһ�� 8 Сʱ����˫��
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("���õ���<color=green> 8 Сʱ��˫�����飡<color>");
		WriteTaskLog("�õ��� 8 Сʱ��˫�����飡");
		
	else
		Say("ֻ�� 80 �����ϵ��˲�����ȡ˫������Ŷ��", 0);
	end;

end;


function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNewYearTime()==0 then
		Say("�����Ѿ�����Ԫ����Ŷ��", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("����Ԫ���ֻ�г忨�û����ܲ���Ŷ��", 0);
		return
	end;
	
	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("ֻ�� 80 �����ϵ��˲�����ȡ����������Ŷ��", 0);
		return
	end;
	
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	elseif GetTask(ID_GETTASKBOOK_NUM)>=1 then
	
		Say("������Ѿ���ȡ����һ���������Ŷ��", 0);
		return
		
	else
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	end;
	
	-- ѡ��һ���ڶ�����������
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- ����һ���������
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- ͬ����Ʒħ������
	SyncItem(nRandomItemIndex);

	Msg2Player("���õ���<color=green>�������һ����<color>");
	
	WriteTaskLog("�õ���һ��������ᣬ���Ϊ��"..nRandomTaskID);
	
end;


-- ѯ������Ƿ���ȡ����
function getMoreExp_Confirm()
	Say("����<color=yellow>2005��12��30����2006��1��1��<color>�ڼ䣬ÿ�����߶����ö����������͵Ĵ������顣<color=yellow>������֮��ÿ������һ��<color>����������ȡ����֮�������Ҫ<color=yellow>���߳���1Сʱ<color>����Ҫ������ȡ��",2,
		"�ð�����Ҫ��ȡ/getMoreExpMain",
		"�����ٵ�һ�°�/OnExit");
	return
end;


-- ��ȡÿ�յľ���
function getMoreExpMain()

local nExp = countMoreExpNum();

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNewYearTime()==0 then
		Say("�����Ѿ�����Ԫ����Ŷ��", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("����Ԫ���ֻ�г忨�û����ܲ���Ŷ��", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- ����ֻ���� 5 ��
		else
			addPlayerExpForLimit(nExp, 0); -- ������
		end;
		
		Msg2Player("���õ���Ԫ����ľ��齱����<color=yellow>"..nExp.."<color> �㾭�飡");
		
		writeMoreExpData();  -- ��¼��ȡ������������
	
		WriteTaskLog("�õ�ÿ�յĽ������飺"..nExp);
		
	else
		Say("�����ڵ��������ܹ���ȡÿ�յľ��飬��12��30����1��1���ڼ䣬ÿ�����߶����ö����������͵Ĵ������顣<color=yellow>������֮��ÿ������һ��<color>����������ȡ����֮�������Ҫ<color=yellow>���߳���1Сʱ<color>Ŷ��", 0);
		return
	end;


end;


-- ��ȡͭǮ����ʾ
function getCoppercashInfo()

	Say("�����ٰ���������ʿ�¿�����ʥ�����顢�������͡�������Ů��ѱ¹��һ����ߣ�ͬʱ���ص��н����˴�Ҳ�½�����ɫ������У������������ѩ����У����Ҹ����㷷���½���һ�ֿ����Լ��༭ף�����Ե����⿨����ӭ���ǰȥѡ����", 0);
	return
	
end;


function getBaijuInfo()

	Say("���� <color=yellow>2005��12��30����2006��1��1��<color> ÿ��<color=red>0��00~18��00<color>��ʹ�ð׾���һ���õľ��齫���������ܰ׾���һ���������Ƚ��� 1.5 ����", 0);
	return

end;


function getRandomTaskInfo()

	Say("���� <color=yellow>2005��12��30����2006��1��1��<color> �����������񴥷����ʷ����ĺ���", 0);
	return

end;



function OnExit()

end;