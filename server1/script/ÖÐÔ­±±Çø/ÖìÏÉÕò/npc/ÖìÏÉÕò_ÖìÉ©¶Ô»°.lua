--description: ���ִ�_��ɩ
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==0)  then
		Say("����û�п����Ҽ��Ǹ���������ȥ�ˡ��ߣ�����û���Ҳ�������˵��������ܵ���һ���ǵ�����Ⱦ�ȥ�ˡ����ܰ��Ұ����һ���ô?", 2, "���ԣ��Ұ���/yes", "���������˷��޵��� /no")
	elseif (UTask_world46==2)  then
		Talk(1,"","��һ����ȥ�Ⱦ���!")
	else
		Talk(1,"","�����ϰ��գ�����Ҫ���ٷ��ƣ�ֻҪһ�����ȵ����Ӿ���. ")
	end
end

function yes()
	Talk(1,"","��һ����ȥ�Ⱦ���!")
	SetTask(74,2)
	AddNote("�����񣺰���ɩ���Ϲ�. ")
	Msg2Player("�����񣺰���ɩ���Ϲ�. ")
end

function no()
end
