--description: 青螺岛码头船夫
--author: yuanlan	
--date: 2003/4/28


function main()

if (GetFaction() == "tianwang") then					--如果玩家是天王帮弟子，坐船不收钱
	Say("你是天王帮的弟子坐船免费", 2, "尊令!/yes", "不 /no")
else	
	Say("那里十分危险！如果客官想去的话要加一点钱!", 2, "坐/yes1", "不坐/no")
--	Talk(1,"","天王帮众：你不是本帮弟子，怎么混到本帮禁地来的？！")
end;

end;


function yes()
NewWorld(59, 1425, 3472)						--回天王岛
SetFightState(0)							--转换为非战斗状态
end;


function yes1()
if (GetCash() >= 500) then						--参考值
	Pay(500)
	NewWorld(59, 1425, 3472)					--回天王岛
	SetFightState(0)						--转换为非战斗状态
else
	Say("没钱就赶快走!", 0)		
end;
end;


function no()
end;
