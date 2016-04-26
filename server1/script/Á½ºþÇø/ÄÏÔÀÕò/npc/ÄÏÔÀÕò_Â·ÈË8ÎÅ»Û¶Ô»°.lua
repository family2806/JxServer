--两湖区 南岳镇 路人8闻慧对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","因为这个怪病反锁了上衡山的路，我没有脸见独孤大侠了.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		return
	end

Say("闻慧：你也是上山拜访独孤大侠的吗？他可是我的偶像，你要是见着他，麻烦让他给我签个名。？",0)

end;

