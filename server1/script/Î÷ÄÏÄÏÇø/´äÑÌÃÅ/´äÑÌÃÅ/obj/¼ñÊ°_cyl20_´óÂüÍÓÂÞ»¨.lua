-- ������Ʒ �������޻� ����20������
-- by��Dan_Deng(2003-07-26)

Include("\\Script\\Global\\TimerHead.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") and (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--����20�������в��ܼ�˵���
		i = GetTimerId()
		if (i ~= 0) and (i ~= 8) then		-- ���м�ʱ����������
			Talk(1,"","����������������ܰ�?")
			return
		end
		SetPropState()
		AddEventItem(1)
		Msg2Player("ժһ��������޻�. ")
		if (i == 0) then									-- ��δ�ж��������ж�
			SetTimer(3 * CTime * FramePerSec, 8)									--��ʱ����Ϊ��Сʱ��3��ʱ����
			SetTask(6,20*256+20)				-- ������Ϊ�ж���һ�׶�
--			PutMessage("��е�����һ�����ԣ��Ѿ��ж��ˡ�")
			Msg2Player("��е�����һ�����ԣ��Ѿ��ж���. ")
		end
	else
		Msg2Player("������ժ��һ�������޻�")
		Msg2Player("�ոմ�����������͸е�����һ�������������ж������������ֻ���. ")
	end
end;
