MONEY_ADDLIFETIME = 1000000

function main()
	Say("聊天室"..",".."请设置姓名 ".."!", 2, "可以，我输入/pay_chatroom_enter","结束对话/OnCancel");
	return 1;
end

function pay_chatroom_enter()
	AskClientForString("pay_chatroom_time", "", 1, 20, "请输入聊天室名字"); 
end

function pay_chatroom_time(roomname)

	-- 聊天室充值不需要交费
	if (ChatRoom_FindRoom(roomname) == 0) then
		Msg2Player("<#>聊天室" .. roomname .. "不存在")
	else
		ChatRoom_AddTime(roomname)
	end
end


function OnCancel()
end
