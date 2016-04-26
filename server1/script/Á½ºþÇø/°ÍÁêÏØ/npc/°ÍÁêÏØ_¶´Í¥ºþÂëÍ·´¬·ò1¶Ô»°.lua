--两湖区 巴陵县 洞庭湖码头船夫1对话
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)
	Say("船夫：我从小就在湖边长大，我爷爷和我爹都是渔民，这洞庭湖区就没有我不熟的地方。你要坐船吗？", 2, "去天王岛/yes", "不坐/no")
end;

function yes()
	if (GetLevel() >= 5) then						--等级达到十级
		if (GetFaction() == "tianwang") then				--如果玩家是天王帮弟子，坐船不收钱
			Say("船夫：原来是天王帮的兄弟，放心好了，我免费送兄弟去！", 1, "多谢了/ok1")
		else	
			Say("船夫：哟，那可不是寻常人去的地方，去可以，你得多给些银子。", 1, "好吧/ok2")
		end
	else		
		Talk(1,"","船夫：对不起，没到十级的新手不能坐船出村。")
	end
end;

function no()
end;

function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)					--转换为非战斗状态
end;

function ok2()
if (GetCash() >= 100) then							--参考值
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--转换为非战斗状态	
else
	Say("船夫：我可不能白跑一次船。", 0)		
end
end;
