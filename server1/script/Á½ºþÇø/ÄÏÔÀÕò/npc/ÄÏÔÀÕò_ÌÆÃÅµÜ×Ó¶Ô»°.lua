--两湖区 南岳镇 唐门弟子对话

function main(sel)
Talk(4, "select", "唐门弟子：本门雄踞川蜀，凭借暗器和火器独步武林，饮誉江湖达数百年之久。", "江湖中人谈本门而色变，可见本门的厉害！", "什么武林正道、民族大义，全都是狗屁！咱们只按照自己的牌理出牌，既不愿与那些所谓的名门正派结交，也不屑与邪魔歪道为伍。", "想加入本门可不是一件容易的事，存心不良的人咱们可不要！");
end;


function select()
Say("唐门弟子：想加入本门吗？", 2, "加入/yes", "不加入/no");
end;


function yes()
if (GetSeries() ~= 1) then								--如果玩家不属于木系
	Say("唐门弟子：你不属于木系，不能加入本门。", 0)
else
	if (GetFaction() ~= "") then							--如果玩家已经属于木系的某一门派
		Say("唐门弟子：只有不属于任何门派的人，才能加入本门。", 0)
	else
		if (GetLevel() >= 10) then						--等级达到十级
			SetFaction("唐门")      					--玩家加入唐门
			NewWorld(25, 3972, 5247)					--把玩家传送到门派入口
			SetFightState(1)						--玩家转换成战斗状态
			SetRevPos(15)	 						--设置重生点
			SetTask(2, 10)
			Say("欢迎你加入唐门！",0)  
		else
			Say("唐门弟子：你等级不够，还是等修练到十级之后再来找我吧！", 0)			
		end		
	end		
end
end;	

function no()
end;

