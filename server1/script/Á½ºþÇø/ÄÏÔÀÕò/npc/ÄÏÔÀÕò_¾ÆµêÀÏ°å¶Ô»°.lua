--两湖区 南岳镇 酒店老板对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","客官请留步，我们小店不敢开门了。今日小镇上的人莫名而死，我们这里也死了几个过路的客人。现在官府正在调查，小人现在很怕因此不能继续开店了.")		 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		return
	end

Say("酒店老板：自从衡山派的独孤大侠做了武林盟主之后，咱们这个小小的南岳镇就变得热闹起来了。镇上经常会有一些刀客剑侠出现，我这小酒馆的生意也比以前好多了。",0);

end;

