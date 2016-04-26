Include([[\script\event\springfestival07\head.lua]]);

GOODSNAME = "����ر����";
FREECELLCOUNT = 0;
EXPVALUE = 3000;
TAB_GOODS = {
{"5��������ʯ",5,	147	,	0.674	},
{"6��������ʯ",6,	147	,	0.12	},
{"7��������ʯ",7,	147	,	0.005	},
{"��ˮ��",1,	238	,	0.06	},
{"��ˮ��",1,	240	,	0.06	},
{"��ˮ��",1,	239	,	0.06	},
{"������ɴ����",2,	159	,	0.003	},
{"������ɰ����",2,	160	,	0.003	},
{"���������ѥ",2,	161	,	0.003	},
{"�������ٻ���",2,	162	,	0.003	},
{"������������",2,	163	,	0.003	},
{"�������ʯ����",2,	164	,	0.0015	},
{"����ջ�ʯָ��",2,	165	,	0.0015	},
{"�������ʯ����",2,	166	,	0.0015	},
{"���Ѫʯ��ָ",2,	167	,	0.0015	},
};

function main()
	if (sf07_isgoodsactive() == 0) then
		Say("����Ʒֻ���ڴ���ʹ��.", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ֻ��50�����ϵĳ�ֵ���<color> �ſ���ʹ�ñ���.", 0);
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
	local str = "���Ѵ�1��<color=yellow>"..GOODSNAME.."<color>?";
	if (nExp <= 0) then
		Say("��õ� <color=yellow>"..EXP_MAXIMUM.."<color> ����,������ʹ�ñ�����!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = str.."��õ� <color=yellow>"..nExp.."<color> ����.";
	SetTask(TASKID_TOTALEXP, GetTask(TASKID_TOTALEXP) + nExp);
	
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(TAB_GOODS) do
		nSum = nSum + TAB_GOODS[i][4] * 10000;
		if (nSum >= nSeed) then
			if (TAB_GOODS[i][2] == 1) then
				AddItem(4, TAB_GOODS[i][3], 1, 1,0,0,0);
			elseif (TAB_GOODS[i][2] == 2) then
				AddGoldItem(0, TAB_GOODS[i][3]);
			else
				AddItem(6, 1, TAB_GOODS[i][3], TAB_GOODS[i][2],0,0,0);
			end;
			str = str.."�õ�1<color=yellow>"..TAB_GOODS[i][1].."<color>.";
			break;
		end;
	end;
	CastSkill(764, 3);
	Msg2Player(str);
end;