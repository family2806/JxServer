--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/22
--73	UTask_world45
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 0) then		-- ��������
		Say("�㿴���ҵ�С�������ҽ���ȥ���ǣ����˺ܾö�����������ȥ������Ҳ�������ҵ��ĵ�Ҫ��! ", 2, "�Ұ���ȥ��/yes", "�Ҳ��ܰ���/no")
	elseif (UTask_world45 == 1) then
		Talk(1,"","�鷳���������!")
	elseif (UTask_world45 >= 10) then
		Talk(1,"","лл������ҵ���.")
	else				-- ������Ի�
		Talk(1,"","�ҵ�С�����ǵ�Ƥ!")
	end	
end

function yes()
	Talk(1,"","�鷳����! ")
	SetTask(73,1)
	AddNote("�����񣺰��������һ�С��. ")
	Msg2Player("�����񣺰��������һ�С��. ")
end

function no()
end
