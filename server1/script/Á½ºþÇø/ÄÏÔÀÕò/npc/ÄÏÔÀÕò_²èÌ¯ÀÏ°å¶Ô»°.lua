--两湖区 南岳镇 茶摊老板对话

function main(sel)
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知道从哪个寺庙里面来的师太，法力无边，你去问一下吧.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","你来打听关于死者的消息是吧？诶，最近衡山脚下有很多人死了。不知道新的进展吗，你去问问别人吧.")
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知道从哪个寺庙里面来的师太，法力无边，你去问一下吧.")
		return
	end;
		 
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","茶摊老板：客官，来到衡山脚下，一定要尝尝我们这里的云雾茶。")
	elseif (i == 1) then
		Talk(1,"","茶摊老板：“名山名水出名茶”，云雾茶是我们衡山的特产，久负盛名，早在唐代就被列为贡品。")
	else
		Talk(1,"","茶摊老板：云雾茶滋味醇厚，香气浓郁，纯而不淡，浓而不涩。沏上一壶，不仅可以生津解乏，还能够消暑解毒呢。")
	end
end
