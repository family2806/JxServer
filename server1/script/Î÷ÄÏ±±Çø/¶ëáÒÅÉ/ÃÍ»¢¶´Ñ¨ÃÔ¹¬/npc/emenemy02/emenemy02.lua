--description: �������ͻ���Ѩ����
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em >= 20*256+50) and (UTask_em < 20*256+53) then	
		UTask_em = UTask_em + 1
		SetTask(1,UTask_em)
		if (UTask_em == 20*256+53) then
			Talk(1,"","�׻�����Ȼ�׺������Ǳ����շ��������Ժ����ڹԹԵؽ����ˡ������ѳ�������Ի�ȥ������!")
			SetTask(1,20*256+80)
			Msg2Player("��ϲ���ո��ͻ�")
			AddNote(" �ں�ɽ�ͻ���������3�δ�ܰ׻������ɹ��ո��ͻ�")
		else
			Msg2Player("���Ѵ�ܰ׻��������ǰ׻���ͷӲ����һ�����ո���. ")
		end
	end
end;
