function main()
	if ( GetTask(1203) == 10 ) then
		SetPos(1414,3197);
		Msg2Player("����Ҫ��������ٶԻ�")
	elseif ( GetTask(1203) == 21 ) then
		SetPos(1414,3197);
		Msg2Player("�����ͼ�����ٶԻ���Ȼ���������")
	elseif ( GetTask(1203) == 20 ) then
		SetPos(1414,3191);
		Msg2Player("���뿪�õ�ͼ����������")
	elseif ( GetTask(1203) == 30 or GetTask(1203) == 25 or   GetTask(1203) == 0 ) then
		SetPos(1414,3197);
		Msg2Player("�Բ���Ŀǰ�㲻�ܽ���.")
	end
end