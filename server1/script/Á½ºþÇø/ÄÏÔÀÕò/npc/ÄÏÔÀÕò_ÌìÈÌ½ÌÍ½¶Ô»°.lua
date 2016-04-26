--两湖区 南岳镇 天忍教徒对话

function main(sel)
Talk(2, "select", "天忍教徒：本教信奉大金国的国教萨满教，教主乃是国师完颜宏烈，他性情狂傲，智谋过人，就连大金皇帝对他也礼让三分。", "本教高手无数，招募了大批金宋两国的高手，可谓藏龙卧虎。");
end;

function select()
Say("天忍教徒：想加入本教吗？", 2, "加入/yes", "不加入/no");
end;


function yes()
if (GetSeries() ~= 3) then								--如果玩家不属于火系
	Say("天忍教徒：你不属于火系，不能加入本门。", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于火系的某一门派
		Say("天忍教徒：只有不属于任何门派的人，才能加入本教。", 0)
	else
		if (GetLevel() >= 10) then						--等级达到十级
			SetFaction("天忍教")      					--玩家加入天忍教
			--NewWorld(45, x, y)						--把玩家传送到门派入口
			--SetFightState(1)						--玩家转换成战斗状态
			--SetRevPos(ID)	 						--设置重生点
			--SetTask(4, 10)
			Say("欢迎你加入天忍教！",0)  
		else
			Say("天忍教徒：本教弟子都是精英之辈，像你这样的新手，本教是不收的。", 0)
		end		
	end	
end
end;	

function no()
end;

