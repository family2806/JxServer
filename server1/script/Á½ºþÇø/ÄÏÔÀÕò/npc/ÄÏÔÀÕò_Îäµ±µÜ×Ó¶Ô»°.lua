--两湖区 南岳镇 武当弟子对话

function main(sel)
Talk(3, "select", "武当弟子：天下武学，北宗少林，南崇武当，你想必听说过吧？", "本派武功讲究以静制动，以柔克刚，以短胜长，以慢击快、以意运气，以气运身，后发制人。冲虚恬淡，以无为胜有为，以无形胜有形，方是武学最高的境界。", "本派武功有“五不传”，即柔骨质脆、心险、好斗、狂酒、轻露者，不传。");
end;


function select()
Say("武当弟子：想加入本门吗？", 2, "加入/yes", "不加入/no");
end;


function yes()
if (GetSeries() ~= 4) then								--如果玩家不属于土系
	Say("武当弟子：你不属于土系，不能加入本派。", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于土系的某一门派
		Say("武当弟子：只有不属于任何门派的人，才能加入本派。", 0)
	else
		if (GetLevel() >= 10) then						--等级达到十级
			SetFaction("武当派")      					--玩家加入武当
			--NewWorld(mapID, x, y)						--把玩家传送到门派入口
			--SetFightState(1)						--玩家转换成战斗状态
			--SetRevPos(ID)	 						--设置重生点
			--SetTask(5, 10)
			Say("欢迎你加入武当派！",0)  
		else
			Say("武当弟子：学武之道，欲速则不达。你初入江湖，还是先好好历练历练吧！", 0)
		end		
	end	
end
end;	

function no()
end;

