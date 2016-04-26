
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���鲹���ͷ�ļ�
-- Edited by peres
-- 2005/12/21 AM 11:23

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

IncludeLib( "FILESYS" );

Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- ��������ľ����

ID_2005EXPISPAY = 2333; -- ��¼�Ƿ��Ѿ���ȡ

-- 2005 �� 12 ��ͣ����������������
function getExpiationExp_200512()

local nYear  = tonumber(date("%y"));
local nMonth = tonumber(date("%m"));
local nDay   = tonumber(date("%d"));

	-- �ж��Ƿ�忨
	if IsCharged()==0 then
		Say("�治����˼����������ֻ�� <color=yellow>��ֵ���<color>�ſ��Բμ�!", 0);
		return
	end;
	
	-- �жϵȼ��Ƿ���� 50 ��
	if GetLevel()<50 then
		Say("�治����˼����������ֻ�� <color=yellow>50�����ϵ����<color> �ſ��Բμ�!", 0);
		return
	end;
	
	-- �ж��Ƿ��Ѿ���ȡ����
	if GetTask(ID_2005EXPISPAY)~=0 then
		Say("�û�Ǵ�Ļ����Ѿ�������������ˣ���Ҫ��ô̰����!", 0);
		return
	end;
	
	-- �ж��Ƿ�������ڣ�2005/12/23 ~ 2005/12/31
	if nYear==5 and nMonth==12 and nDay>=23 and nDay<=31 then
		compensateExp();
		return
	else
		Say("�治����˼����β�����Ǵ�<color=yellow>23/12/2005<color>��ʼ��<color=yellow>31/12/2005<color>, ����<color=yellow>������<color>, ���ȥ��!", 0);
		return	
	end;

end;


-- ���������������
function compensateExp()

local nExp = getRedeemeExp();

	SetTask(ID_2005EXPISPAY, 1);  -- д�������������д�����ټӾ��飬�Է����������ˢ����

	addPlayerExp(nExp);
	
	Say("��β������õ�: <color=yellow>"..nExp.."<color> ����!", 0);
	
	Msg2Player("��β������õ�:<color=yellow>"..nExp.."<color> ����!");
	
	WriteTaskLog("���鲹����еõ�"..nExp.." ����!");

end;


-- ��ȡӦ�ò����ľ���
function getRedeemeExp()

local nLevel = GetLevel();

	return nLevel * 8 * 20000;
	
end;


-- ����Ҽ�ָ���ľ��飬��������
function addPlayerExp(myExpValue)
	tl_addPlayerExp(myExpValue)	
end;


--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)

	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;

	WriteLog(" [���������¼]"..date(" [%y �� %m �� %d ��  %H ʱ%M ��]").." [���룺"..GetAccount().."] [����:"..GetName().."]"..strMain);
end;
