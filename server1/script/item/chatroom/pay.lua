MONEY_ADDLIFETIME = 1000000

function main()
	Say("������"..",".."���������� ".."!", 2, "���ԣ�������/pay_chatroom_enter","�����Ի�/OnCancel");
	return 1;
end

function pay_chatroom_enter()
	AskClientForString("pay_chatroom_time", "", 1, 20, "����������������"); 
end

function pay_chatroom_time(roomname)

	-- �����ҳ�ֵ����Ҫ����
	if (ChatRoom_FindRoom(roomname) == 0) then
		Msg2Player("<#>������" .. roomname .. "������")
	else
		ChatRoom_AddTime(roomname)
	end
end


function OnCancel()
end
