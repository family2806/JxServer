-- ��ɽѩ��
-- By: Feimingzhi(2007-05-08)
-- Content:90���������ʹ����ɽѩ��ֱ������120����

IncludeLib("SETTING");
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������
Include("\\script\\lib\\pay.lua")


function main( nItemIndex )
    
    local nPLev = GetLevel()
    if nPLev > 90  or nPLev < 10 or IsCharged() < 1 then
        Say("ֻ��10-90��������(����10��90) ����ʹ��.", 0)
        return 1
    end
	
    tl_addPlayerExp(37540000)	--10��0%����120��0%���ܾ���ֵ
	nPLev = GetLevel()
	Msg2Player(format("��ϲ����Ŀǰ���ĵȼ�Ϊ%d.",nPLev))
	WriteLog(format("[ʹ����ɽѩ��]\t%s\tName:%s\tAccount:%s\t �ճ���һ����ɽѩ��.",
			GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
end
--
