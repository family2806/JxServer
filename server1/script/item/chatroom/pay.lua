MONEY_ADDLIFETIME = 1000000

function main()
	Say("Th� cho ph�ng t�n g�u"..",".."Xin ��t t�n ".."!", 2, "���c th�i! �� ta nh�p v�o/pay_chatroom_enter","K�t th�c ��i tho�i/OnCancel");
	return 1;
end

function pay_chatroom_enter()
	AskClientForString("pay_chatroom_time", "", 1, 20, "������Th� cho ph�ng t�n g�u����"); 
end

function pay_chatroom_time(roomname)

	-- Th� cho ph�ng t�n g�u��ֵ����Ҫ����
	if (ChatRoom_FindRoom(roomname) == 0) then
		Msg2Player("<#>Th� cho ph�ng t�n g�u" .. roomname .. "n�y kh�ng t�n t�i")
	else
		ChatRoom_AddTime(roomname)
	end
end


function OnCancel()
end
