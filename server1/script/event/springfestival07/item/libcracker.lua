Include([[\script\event\springfestival07\head.lua]]);

function main()
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ֻ��50�����ϵĳ�ֵ���<color>�ſ���ʹ�ñ���.",0);
		return 1;
	end;
	
	if (sf07_isgoodsactive() == 0) then
		Say("����Ʒֻ���ڴ���ʹ��.", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() < FREECELLCOUNT) then
		Say("����������!", 0);
		return 1;
	end;
	
	local nExp = EXPVALUE * UNIT_WAN;
	local nRemained = EXP_MAXIMUM - GetTask(TASKID_TOTALEXP);
	if (nExp > nRemained) then
		nExp = nRemained;
	end;
	local str = "���Ѵ�<color=yellow>"..GOODSNAME.."<color>?";
	if (nExp <= 0) then
		Say("��õ�<color=yellow>"..EXP_MAXIMUM.."<color> ����, ������ʹ�ñ�����!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = str.."��õ�<color=yellow>"..nExp.."<color> ����.";
	SetTask(TASKID_TOTALEXP, GetTask(TASKID_TOTALEXP) + nExp);
	
	if (TAB_GOODS and getn(TAB_GOODS) > 0) then
		for i = 1, getn(TAB_GOODS) do
			AddItem(TAB_GOODS[i][2], TAB_GOODS[i][3], TAB_GOODS[i][4], TAB_GOODS[i][5],0,0,0);
			str = str.."��õ�1 <color=yellow>"..TAB_GOODS[i][1].."<color>.";
		end;
	end;
	CastSkill(764, 3);
	Msg2Player(str);
end;