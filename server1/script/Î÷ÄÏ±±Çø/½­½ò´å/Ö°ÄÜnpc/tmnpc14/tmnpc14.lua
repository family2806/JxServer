--description: ���Ž������Ԫ�˾� 50������ 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+40) then
		Talk(1,""," �ȿȿȣ��ȿȿȡ�����������������İ�����һ���������̾���������!")
	else
		Talk(1,"","���޶���Ů��ֻ��һ��������������ѧ��")
	end
end;
