function main()
	if ( GetTask(1202) == 10 ) then
		SetPos(1337,3154);
		Msg2Player("����Ҫ��������ٶԻ�")
	elseif ( GetTask(1202) == 20 ) then
		SetPos(1340,3148);
	elseif ( GetTask(1202) == 30 or GetTask(1202) == 25 or   GetTask(1202) == 0 ) then
		SetPos(1337,3154);
		Msg2Player("�Բ���Ŀǰ�㲻�ܽ���.")
	end
end;