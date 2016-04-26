--两湖区 巴陵县 洞庭湖码头船夫2对话
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)
Say("船夫：俗话说的好，靠山吃山，靠水吃水。这八百里洞庭湖，就是我们渔民的衣食父母。你要坐船吗？", 2, "去天王岛/yes", "不坐/no");
end;

function yes()
if (GetLevel() >= 5) then						--等级达到十级
	if (GetFaction() == "tianwang") then				--如果玩家是天王帮弟子，坐船不收钱
		Say("船夫：原来是天王帮的兄弟，好说！坐我的船不用钱，坐好了！", 1, "多谢了/ok1")
	else	
		Say("船夫：天王岛？寻常人可靠近不得，要去的话，你得多给些银子。", 1, "好吧/ok2")
	end
else		
	Say("船夫：对不起，没到五级的新手不能坐船出村。", 0)
end
end;

function no()
end;


function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)								--转换为非战斗状态
end;


function ok2()
if (GetCash() >= 100) then							--参考值
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--转换为非战斗状态	
else
	Say("船夫：想去天王岛，没有银子可不行。", 0)		
end
end;