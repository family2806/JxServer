--description: ���̽�20������ С��¿
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+50) and (HaveItem(126) == 0) then
		SetPropState()
		AddEventItem(126)
		Msg2Player("�ҵ���ʧ��С��¿. ")
		AddNote("�ҵ���ʧ��С��¿. ")
	end
end;	
