function main()
	if ( GetTask(1201) == 10 ) then
		SetPos(1563,3118);
		Msg2Player("����Ҫ��������ٶԻ�")
	elseif ( GetTask(1201) == 20 ) then
		SetPos(1559,3113);
	elseif ( GetTask(1201) == 30 or GetTask(1201) == 25 or GetTask(1201) == 0 ) then
		SetPos(1563,3118);
		Msg2Player("�Բ���Ŀǰ�㲻�ܽ���.")
	end
end;