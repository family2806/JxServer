--西北南区 凤翔府 路人20乞丐对话 世界任务

function main(sel)

--UTask_world36 = GetTask(64);

if (UTask_world36 == 0) then 
Talk(3, "select", "乞丐：唉……", "小哥，怎么在这唉声叹气的？", "乞丐：看你是外地来的吧，没见到官府前的告示吗？这几天朝廷派枢密使大人来视察，所有乞丐都不能上街乞讨，说是有碍市容，你说这枢密使大人视察跟俺们这些要饭的有什么关系，这几天做不成生意，俺一家大小可怎么过啊。")
return
end;

--if (UTask_world36 == 1) then 
Say("乞丐：看你是外地来的吧，没见到官府前的告示吗？这几天朝廷派枢密使大人来视察，所有乞丐都不能上街乞讨，说是有碍市容，你说这枢密使大人视察跟俺们这些要饭的有什么关系，这几天做不成生意，俺一家大小可怎么过啊。", 0)
--end;

end;


function select()
Say("看他怪可怜的……", 2, "给钱/accept", "不给钱/refuse");
end;


function accept()

if (GetCash() > 1000) then							--参考值
	Talk(2, "select1", "小哥，我这里有些银子，你先拿去救救急。", "乞丐：俺俩萍水相逢，你就给我这么多银子，真是一个仗义的人！这么着吧，我虽然以乞讨为生，但是看尽人间眼色，也算有不少跑江湖的经验了，就传给你一些用来防身吧！")	
else
	Say("乞丐：看来你也不富裕啊，还是算了吧，你的好意我心领了。", 0)
end;

end;


function refuse()
end;


function select1()
Pay(GetCash()/3)
AddOwnExp(1000)	
SetTask(64, 1)
end;