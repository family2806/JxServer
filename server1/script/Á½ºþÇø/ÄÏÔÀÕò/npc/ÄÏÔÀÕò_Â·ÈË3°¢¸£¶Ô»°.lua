--两湖区 南岳镇 路人3阿福对话

function main(sel)

	if ( GetTask(1256) == 1) then
	
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看。.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","你来的真是时候。我们赶快找到这个病的根源！让人很担心啊.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2) then
		Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		return
	end

Say("想上衡山学武，做一个想独孤大侠那样的人，锄强扶弱，替天行道，多么威风！",0)

end;

