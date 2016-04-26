Include([[\script\event\springfestival07\head.lua]]);

function main()
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>只有50级以上的充值玩家<color>才可以使用爆竹.",0);
		return 1;
	end;
	
	if (sf07_isgoodsactive() == 0) then
		Say("此物品只能在春节使用.", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() < FREECELLCOUNT) then
		Say("请先整理背包!", 0);
		return 1;
	end;
	
	local nExp = EXPVALUE * UNIT_WAN;
	local nRemained = EXP_MAXIMUM - GetTask(TASKID_TOTALEXP);
	if (nExp > nRemained) then
		nExp = nRemained;
	end;
	local str = "你已打开<color=yellow>"..GOODSNAME.."<color>?";
	if (nExp <= 0) then
		Say("你得到<color=yellow>"..EXP_MAXIMUM.."<color> 经验, 不能再使用爆竹了!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = str.."你得到<color=yellow>"..nExp.."<color> 经验.";
	SetTask(TASKID_TOTALEXP, GetTask(TASKID_TOTALEXP) + nExp);
	
	if (TAB_GOODS and getn(TAB_GOODS) > 0) then
		for i = 1, getn(TAB_GOODS) do
			AddItem(TAB_GOODS[i][2], TAB_GOODS[i][3], TAB_GOODS[i][4], TAB_GOODS[i][5],0,0,0);
			str = str.."你得到1 <color=yellow>"..TAB_GOODS[i][1].."<color>.";
		end;
	end;
	CastSkill(764, 3);
	Msg2Player(str);
end;