--������ ����������������Ƽ�ʱ�ű�
-- Update: Dan_Deng(2003-08-16)

function OnTimer()
	StopTimer()						--������ʱ
	Msg2Player("���ʱ���ѵ���")
	SetTask(38,SetByte(GetTask(38),1,80))
end;
