function main()
	if ( GetTask(1201) == 10 ) then
		SetPos(1563,3118);
		Msg2Player("首先要与区域驿官对话")
	elseif ( GetTask(1201) == 20 ) then
		SetPos(1559,3113);
	elseif ( GetTask(1201) == 30 or GetTask(1201) == 25 or GetTask(1201) == 0 ) then
		SetPos(1563,3118);
		Msg2Player("对不起，目前你不能进关.")
	end
end;