-- ������һ������ɽѩ����
-- By: Feimingzhi(2007-05-08)
-- Content:
--��ڼ䣬����2007��06��01�շ�����ά����2007��07��01��24��֮���½��Ľ�ɫ�����ʸ�μӡ�������һ���� �ڻ�ڼ��ڣ��������½�ɫ���ȼ��ﵽ90���� �����116��Ұ�����������޼�ϵ�������񣩾Ϳ��������ִ�͸�����е���ٴ����һ����ɽѩ������¼LOG��
--һ����ɫֻ����ȡһ�Ρ�
--90���Լ�90�����µ���ң�ʹ����ɽѩ������������120 ����
--
-- 	��ٶԻ����
--ֻ����2007��06��01�շ�����ά����2007��07��01��24��֮��Ż���֡�������һ��ѡ�

SUPERPLAYERACT_BIGENTIME = 20070601     --������һ��ʼ����
SUPERPLAYERACT_ENDTIME = 20070701       --������һ��������
SUPERPLAYERACT_LevRequest = 90          --������һ��ɫ����ȼ�
SUPERPLAYERACT_TaskTime = 116             --Ҫ��Ұ���������ٶ��ٴ�
SUPERPLAYERACT_TaskDataKey = 1044       --�洢Ұ���������������key
TSK_SUPERPLAYERACT = 1816               --�洢�Ƿ���ȡ������
TSXL_ITEM_ID = 1431                     --��ɽѩ������ƷID
SUPERPLAYERACT_ExtPoint = 4             --Ҫ���½��ʺ�
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua")    --����Ұ������

function SuperPlayerAct2007()
    local tDiaStr = 
    {
        "�˻�������<color=green>01-06-2007<color>��<color=green>01-07-2007<color>�ڼ��½� ",
        format("���л���μ�'�������'�. �ڻ�ڼ䣬��������(���½��˻���)�����ﵽ<color=yellow>%s<color> �����<color=yellow>",SUPERPLAYERACT_LevRequest),
        format("%s<color> Ұ������(������)�����Ե�������к����ִ����ٴ���ȡ1��<yellow=color>��ɽѩ��<color>.",	SUPERPLAYERACT_TaskTime)
    }
   Say( format("%s%s%s",tDiaStr[1],tDiaStr[2],tDiaStr[3]),
   		3,
   		"��ȡ��ɽѩ��/SuperPlayerAct_WinMedal",
   		"��ɽѩ����ʲô��/SuperPlayerAct_ItemDes",
   		"�����Ի�/OnCancel")
end
--
function SuperPlayerAct_WinMedal()

	local nDay = tonumber(GetLocalDate("%Y%m%d"))
    local szMsg = "";
    if nDay < SUPERPLAYERACT_BIGENTIME and nDay > SUPERPLAYERACT_ENDTIME then
        Msg2Player("���ź����ʱ�������.")
        return 0;
    end;
     
    if GetExtPoint(SUPERPLAYERACT_ExtPoint) ~= 1 then
    	szMsg = "���ϧ�������½��˻������ܲμӴ˻!";
        Say(szMsg,
        	2,
        	"����/main",
        	"�����Ի�/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nLev = GetLevel()
    if nLev < SUPERPLAYERACT_LevRequest then
    	szMsg = format("δ�� %s��, �ȵ� %s����������.",SUPERPLAYERACT_LevRequest,SUPERPLAYERACT_LevRequest)
        Say(szMsg,
        	2,
        	"����/main",
        	"�����Ի�/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nTaskEDTime = GetTask(SUPERPLAYERACT_TaskDataKey)
    --local nTaskEDTime = tl_counttasklinknum(1)
    
    if nTaskEDTime < SUPERPLAYERACT_TaskTime then
    	szMsg = format("���ϧ��û�����һ�� %s Ұ��������, ������ȡ��ɽѩ��.",SUPERPLAYERACT_TaskTime)
        Say(szMsg,2,"����/main","�����Ի�/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    if  GetTask( TSK_SUPERPLAYERACT ) > 0 then
        Say("���ϧ���������Ѿ����������.",2,"����/main","�����Ի�/OnCancel")
        return 0
    end
    local nItemIdx = AddItem( 6, 1, TSXL_ITEM_ID, 1, 0, 0 )
    if nItemIdx > 0 then
        SetTask( TSK_SUPERPLAYERACT, 1 )
        Say("������ɽѩ����Ҫ�úñ��棡!",0)
        Msg2Player("��õ�1����ɽѩ��.")
        WriteLog(format("[������һ] \t%s\tName:%s\tAccount:%s\t �õ�1����ɽѩ��",
		GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
    else
        Say("�������ˣ�������ȡ��Ʒ!",2,"����/main","�����Ի�/OnCancel")
    end
end
--
function SuperPlayerAct_ItemDes()
    Say("��ɽѩ��: <enter>50��90�� (����50��90��)����ʹ�ý����������Լ��ĵȼ�.",2,"����/SuperPlayerAct2007","�����Ի�/OnCancel")
end
--
function OnCancel()
end
