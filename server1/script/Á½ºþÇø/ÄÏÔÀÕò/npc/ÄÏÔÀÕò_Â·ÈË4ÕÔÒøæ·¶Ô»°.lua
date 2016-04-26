--两湖区 南岳镇 路人4赵银娣对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","啊。现在镇上有越来越多的人死了却不知原因。老天啊！.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("赵银娣：我好想去学堂念书，可是爹爹不让，说女孩子念书又不能考功名，只是浪费钱。",0)
return
end;

if (i == 1) then
Say("赵银娣：爹爹老是打我，说我是赔钱货，有时还连我娘一起打。如果我像你一样有本事，爹爹是不是就不会再打我了？",0)
end;

end;

