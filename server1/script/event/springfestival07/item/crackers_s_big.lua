Include([[\script\event\springfestival07\head.lua]]);

GOODSNAME = "大号特别鞭炮";
FREECELLCOUNT = 0;
EXPVALUE = 3000;
TAB_GOODS = {
{"5级玄晶矿石",5,	147	,	0.674	},
{"6级玄晶矿石",6,	147	,	0.12	},
{"7级玄晶矿石",7,	147	,	0.005	},
{"蓝水晶",1,	238	,	0.06	},
{"绿水晶",1,	240	,	0.06	},
{"紫水晶",1,	239	,	0.06	},
{"定国青纱长衫",2,	159	,	0.003	},
{"定国钨砂发冠",2,	160	,	0.003	},
{"定国赤绢软靴",2,	161	,	0.003	},
{"定国紫藤护腕",2,	162	,	0.003	},
{"定国银蚕腰带",2,	163	,	0.003	},
{"安邦冰晶石项链",2,	164	,	0.0015	},
{"安邦菊花石指环",2,	165	,	0.0015	},
{"安邦田黄石玉佩",2,	166	,	0.0015	},
{"安邦鸡血石戒指",2,	167	,	0.0015	},
};

function main()
	if (sf07_isgoodsactive() == 0) then
		Say("此物品只可在春节使用.", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>只有50级以上的充值玩家<color> 才可以使用爆竹.", 0);
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
	local str = "你已打开1个<color=yellow>"..GOODSNAME.."<color>?";
	if (nExp <= 0) then
		Say("你得到 <color=yellow>"..EXP_MAXIMUM.."<color> 经验,不能再使用爆竹了!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = str.."你得到 <color=yellow>"..nExp.."<color> 经验.";
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
			str = str.."得到1<color=yellow>"..TAB_GOODS[i][1].."<color>.";
			break;
		end;
	end;
	CastSkill(764, 3);
	Msg2Player(str);
end;