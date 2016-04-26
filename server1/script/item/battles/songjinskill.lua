
-- 宋金特殊技能
-- by Bel
-- 2008.03.06

Include("\\script\\lib\\common.lua");

sjskill_tbSkill = {
	[462]	= {nLevel_Low = 2,	nLevel_High = 10,	nTime = 60,	szTips = "连续%s 恢复生命 %d 点"},
	[463]	= {nLevel_Low = 2,	nLevel_High = 10,	nTime = 60, szTips = "连续%s 恢复内力%d 点"},
	[464]	= {nLevel_Low = 1,	nLevel_High = 10,	nTime = 60, szTips = "连续%s 恢复生命 , 没半秒恢复%d 点"},
	[465]	= {nLevel_Low = 1, 	nLevel_High = 10,	nTime = 60, szTips = "连续%s 恢复内力, 没半秒恢复%d 点"},
	[466]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s 减少杀枪: %d%%"},
	[467]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s 减少中毒: %d%%"},
	[468]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s 减少动作慢: %d%%"},
	[469]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s 减少耀眼: %d%%"},
	[471]	= {nLevel_Low = 2, 	nLevel_High = 10,	nTime = 60, szTips = "连续%s 恢复生命 %d 点以及连续%s 恢复内力 %d 点"},
	[472]	= {nLevel_Low = 1, 	nLevel_High = 10,	nTime = 60, szTips = "连续%s 恢复生命 , 每半秒恢复%d点以及连续%s恢复内力，没半秒恢复%d 点"},
	[473]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s 防守：增%d%%"},
	[474]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s 抗毒：增 %d%%"},
	[475]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s 抗冰: 增 %d%%"},
	[476]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s 抗火: 增 %d%%"},
	[477]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s 抗雷: 增 %d%%"},
	[478]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s 抗所有： 增 %d%%"},
	[479]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s 平常内功杀枪: 增 %d 点"},
	[480]	= {nLevel_Low = 1, 	nLevel_High = 5, 	nTime = 60, szTips = "%s 毒杀内功: 增 %d 点"},
	[481]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s 冰杀内功: 增 %d 点"},
	[482]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s 火杀内功: 增 %d 点"},
	[483]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s 雷杀内功: 增%d 点"},
	[485]	= {nLevel_Low = 1, 	nLevel_High = 5, 	nTime = 60, szTips = "%s 毒杀外功: 增%d 点"},
	[486]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s 冰杀外功: 增 %d 点"},
	[487]	= {nLevel_Low = 5, 	nLevel_High = 10,	nTime = 60, szTips = "%s 杀枪外功: 增 %d%%"},
	[488]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "连续%s 生命达上限增%d 点"},
	[489]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "连续%s 内功达上限增%d 点"},
	[490]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "连续%s 生命达上限增: %d 点以及连续%s内功达上限增: %d 点"},
	[493]	= {nLevel_Low = 1, 	nLevel_High = 3, 	nTime = 60, szTips = "%s 转移速度：增%d%%"},
	[495]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s 致命率: 增 %d%%"},
	[496]	= {nLevel_Low = 1, 	nLevel_High = 2, 	nTime = 60, szTips = "%s 武功出招:增 %d%%"},
	[498]	= {nLevel_Low = 10, nLevel_High = 30, 	nTime = 60,	szTips = "%s 火杀外功: 增 %d 点"},
	[499]	= {nLevel_Low = 10, nLevel_High = 30, 	nTime = 60,	szTips = "%s 雷杀外功: 增%d 点"},
};

function sjskill_addskill(nTaskId, nLevel_Low, nLevel_High, nTime, tbTips)
	if ((not nTaskId) or (not sjskill_tbSkill[nTaskId])) then
		return 1;
	end
	if not nLevel_Low then
		nLevel_Low = sjskill_tbSkill[nTaskId].nLevel_Low;
	end
	if not nLevel_High then
		nLevel_Low = sjskill_tbSkill[nTaskId].nLevel_High;
	end
	if not nTime then
		nLevel_Low = sjskill_tbSkill[nTaskId].nTime;
	end
	
	local nLevel	= random(nLevel_Low,nLevel_High);
	AddSkillState(nTaskId, nLevel, 0, floor(18 * nTime));
	
	local szTips	= sjskill_tbSkill[nTaskId].szTips;
	for i = 1, getn(tbTips) do
		if (type(tbTips[i]) == "number") then
			tbTips[i] = floor(tbTips[i] * nLevel);
		end
	end
	Msg2Player(format("不变获得<color=yellow>"..szTips.."<color>", unpack(tbTips)));
end

function add462()
	sjskill_addskill(462, 2, 10, 0.5, {"半秒",500});
end

function add463()
	sjskill_addskill(463, 2, 10, 0.5, {"半秒", 500});	-- 半秒是12帧?
end

function add464()
	sjskill_addskill(464, 1, 10, 30, {"30 秒", 100});
end

function add465()
	sjskill_addskill(465, 1, 10, 30, {"30 秒",100});
end

function add466()
	sjskill_addskill(466, 1, 4, 60, {"1 分钟", 10});
end

function add467()
	sjskill_addskill(467, 1, 4, 60, {"1 分钟", 10});
end

function add468()
	sjskill_addskill(468, 1, 4, 60, {"1 分钟", 10});
end

function add469()
	sjskill_addskill(469, 1, 4, 60, {"1 分钟", 10});
end

function add471()
	sjskill_addskill(471, 2, 10, 0.5, {"半秒", 500, "半秒", 500});
end

function add472()
	sjskill_addskill(472, 1, 10, 30, {"30 秒", 100, "30 秒", 100});
end

function add472_1()
	sjskill_addskill(472, 1, 10, 60, {"1 分钟", 100, "1 分钟", 100});
end

function add472_2()
	sjskill_addskill(472, 2, 10, 60, {"1 分钟", 500, "1 分钟", 500});
end

function add473()
	sjskill_addskill(473, 1, 7, 60, {"1 分钟", 10});
end

function add474()
	sjskill_addskill(474, 1, 7, 60, {"1 分钟", 10});
end

function add475()
	sjskill_addskill(475, 1, 7, 60, {"1 分钟", 10});
end

function add476()
	sjskill_addskill(476, 1, 7, 60, {"1 分钟", 10});
end

function add477()
	sjskill_addskill(477, 1, 7, 60, {"1 分钟", 10});
end

function add478()
	sjskill_addskill(478, 1, 4, 60, {"1 分钟", 10});
end

function add479()
	sjskill_addskill(479, 10, 20, 60, {"1 分钟", 10});
end

function add480()
	sjskill_addskill(480, 1, 5, 60, {"1 分钟", 10});
end

function add481()
	sjskill_addskill(481, 10, 20, 60, {"1 分钟", 10});
end

function add482()
	sjskill_addskill(482, 10, 20, 60, {"1 分钟", 10});
end

function add483()
	sjskill_addskill(483, 10, 20, 60, {"1 分钟", 10});
end

function add485()
	sjskill_addskill(485, 1, 5, 60, {"1 分钟", 10});
end

function add486()
	sjskill_addskill(486, 1, 4, 60, {"1 分钟", 10});
end

function add487()
	sjskill_addskill(487, 5, 10, 60, {"1 分钟", 10});
end

function add487_1()
	sjskill_addskill(487, 1, 5, 60, {"1 分钟", 10});
end

function add488()
	sjskill_addskill(488, 10, 20, 60, {"1 分钟", 100});
end

function add489()
	sjskill_addskill(489, 10, 20, 60, {"1 分钟", 100});
end

function add490()
	sjskill_addskill(490, 10, 20, 30, {"30 秒", 100, "30 秒", 100});
end

function add490_1()
	sjskill_addskill(490, 10, 20, 60, {"1 分钟", 100, "1 分钟", 100});
end

function add493()
	sjskill_addskill(493, 1, 3, 60, {"1 分钟", 10});
end

function add495()
	sjskill_addskill(495, 10, 20, 60, {"1 分钟", 10});
end

function add496()
	sjskill_addskill(496, 1, 2, 60, {"1 分钟", 10});
end

function add498()
	sjskill_addskill(498, 10, 30, 60, {"1 分钟", 10});
end

function add499()
	sjskill_addskill(499, 10, 30, 60, {"1 分钟", 10});
end