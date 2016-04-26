--两湖区 南岳镇 路人谷之兰对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","完了，真完了，应该是从我这有一位英雄豪杰可以进入小镇吗？想不到我哥哥被疾病夺去了性命，真是可惜。诶，还是去问问别人吧.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("谷之兰：独孤夫人真有福气，丈夫是一个人人景仰的大英雄，真叫人羡慕。",0)
return
end;

if (i == 1) then
Say("谷之兰：女人一辈子最重要的就是不要嫁错人，我将来也要嫁给一个铁骨柔情的大侠。",0)
end;

end;

