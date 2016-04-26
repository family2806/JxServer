--两湖区 天王帮 码头帮众对话

function main(sel)
	UTask_tw = GetTask(3);
	if (UTask_tw >= 60*256+20) and (GetFaction() == "天王") then
	Say("天王帮众：要出岛去哪里？", 3, "巴陵县/yes", "青螺岛/yes1", "不出岛/no")
	else
	Say("天王帮众：要出岛去哪里？", 2, "巴陵县/yes", "不出岛/no")
	end
end;

function yes()
	if (GetFaction() == "天王") then						--如果玩家是天王帮弟子，坐船不收钱
		Say("天王帮众：兄弟，坐好了！", 2, "好嘞/ok1","不出岛/no")
	else
	Say("天王帮众：不是本帮兄弟，坐船可不是免费的。", 1, "好吧/ok2")
	end
end;

function yes1()
if (GetFaction() == "天王帮") then						--如果玩家是天王帮弟子，坐船不收钱
	Say("天王帮众：青螺岛可不好闯，你准备好了吗？", 1, "准备好了/ok3")
else	
	Say("天王帮众：不是本帮兄弟，坐船可不是免费的。", 1, "好吧/ok4")
end;
end;

function no()
end;

function ok1()
NewWorld(53, 1793, 3159)						--回巴陵县
SetFightState(1)							--转换为战斗状态
end;

function ok2()
if (GetCash() >= 100) then						--参考值
	Pay(100)
	NewWorld(53, 1793, 3159)					--回巴陵县
	SetFightState(1)						--转换为战斗状态
else
	Say("天王帮众：没钱还到处乱逛？你是初进江湖的吧？", 0)		
end;
end;

function ok3()
NewWorld(68, 1634, 3242)						--去青螺岛
SetFightState(1)							--转换为战斗状态
end;

function ok4()
if (GetCash() >= 500) then						--参考值
	Pay(500)
	NewWorld(68, 1634, 3242)					--去青螺岛
	SetFightState(1)						--转换为战斗状态
else
	Say("天王帮众：没钱还到处乱逛？", 0)		
end;
end;
