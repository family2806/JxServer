--description: ������ ������ɽ������
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 10*256+20) and (GetItemCount("K� Huy�t Th�ch ") < 3) then
		AddEventItem(91)
		Msg2Player("�õ�һ��K� Huy�t Th�ch ")
		AddNote("��������ɽ�����ҵ�һ��K� Huy�t Th�ch . ")
	end
end;	
