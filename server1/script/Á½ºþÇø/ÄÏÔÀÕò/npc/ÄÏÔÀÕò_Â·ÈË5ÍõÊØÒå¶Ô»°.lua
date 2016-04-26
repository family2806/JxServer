--两湖区 南岳镇 路人5王守义对话

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知道从哪个寺庙里面来的师太，法力无边，你去问一下吧.")
		 	SetTask(1256, 2)
		 else
		 	Talk(1,"","你又要问那个死人啊？我怎么知道？听说独孤大大侠不准他的独孤雯下山，这个病要害人到什么时候啊")
		 	return		
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知道从哪个寺庙里面来的师太，法力无边，你去问一下吧.");
		return
	end

i = random(0,2)

if (i == 0) then
Say("王守义：听说独孤大侠的夫人是一个红粉英雄，不仅武功高强，还是个大美人哩！",0)
return
end;

if (i == 1) then
Say("王守义：听说独孤大侠和独孤夫人原是仇家，不料彼此相爱，于是尽弃前嫌，结为眷属，在江湖上还被传为一段佳话呢！",0)
return
end;

if (i == 2) then
Say("王守义：独孤大侠的女儿独孤雯经常来镇上玩的，那可是个古灵精怪的调皮鬼！",0)
end;

end;

