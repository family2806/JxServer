--两湖区 南岳镇 客栈老板对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","客官请进，别怕别怕，虽然在客厅里放着几口棺材，但是我仍然开门迎客也是为了医病。我怕的不是那个。呵呵，小店很安全，当然在乱世中这个收费肯定要高一点.")		 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		return
	end
	
Say("客栈老板：看客官的样子，也是个在刀口上讨生活的人吧？我们这里经常会有江湖中人出入，都是上山拜访独孤大侠的。",0);

end;

