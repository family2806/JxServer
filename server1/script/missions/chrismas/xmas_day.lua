-- Created by Danielsun 2006-12-07
-- 圣诞节活动
-- xmas_entry()
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\basic.lua")

TB_SnowMan = {
	-- 1.[成功]雪人名 2.[成功]雪人ID 3.[成功]几率 4.[失败]雪人名 5.[失败]雪人ID 6.[失败]几率 7,金钱 8,换取礼品名 9,换取礼品ID
	{"围蓝围巾的雪人(特别)",  1319,   60,   "围蓝围巾的雪人(普通)",    1322,  40,	1000,	"南瓜饼", 1325},
	{"围红围巾的雪人(特别)",  1320,   60,   "围红围巾的雪人(普通)",    1323,  40,	3000,	"雪糕",	1326},
	{"特别雪人",  					1321,   80,   					 "普通雪人",    1324,  20,	5000,			"火鸡", 1327},
}

TB_Material = {
 --1.物品名	2.数量
 [1319] ={
	["6,1,1312"] = {"雪花",			10	},
	["6,1,1313"] =	{"胡萝卜",		1	},
	["6,1,1314"] =	{"松枝",	2	},
	["6,1,1315"] =	{"圣诞帽",		1	},
	["6,1,1316"] =	{"蓝围巾",	1	},
	},
 [1320] ={
	["6,1,1312"] = {"雪花",			10	},
	["6,1,1313"] =	{"胡萝卜",		1	},
	["6,1,1314"] =	{"松枝",	2	},
	["6,1,1315"] =	{"圣诞帽",		1	},
	["6,1,1317"] =	{"蓝围巾",	1	},
	},
 [1321] ={
	["6,1,1312"] = {"雪花",			10	},
	["6,1,1313"] =	{"胡萝卜",		1	},
	["6,1,1314"] =	{"松枝",	2	},
	["6,1,1315"] =	{"圣诞帽",		1	},
	["6,1,1318"] =	{"蓝围巾",		1	},
	},
}

TB_Message = {
	-- 制作描述
	"堆围蓝围巾的雪人 (特别) 需要 10 堆雪, 1 胡萝卜, 2 松枝, 1 帽子, 1 蓝围巾 和1000两.",
	"堆围红围巾的雪人 (特别) 需要 10 堆雪, 1 胡萝卜, 2 松枝, 1 帽子, 1 蓝围巾 和3000两.",
	"堆雪人 (特别)  需要 10 堆雪, 1 胡萝卜, 2 松枝, 1 帽子, 1 松树 和5000两.",
}

GiftMsg = {
	-- 换取礼物描述
	"换南瓜饼要一个围着红围巾的雪人 (特别)",
	"换雪糕要一个围着蓝围巾的雪人 (特别)",
	"换火鸡需要一个特别雪人",
}

TSKTMP_ITEM_NUMC = 20;

function xmas_entry()
	aryDescribe = {
		"<dec><npc>换圣诞礼物",
		"堆雪人/want_snowman",
		"换礼物/want_gift",
		"我有事情，别的时候再来/cancel",
		}
	CreateTaskSay(aryDescribe)
end
	
function want_snowman()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>活动结束了.", "知道了/cancel"});
		return 
	end;
	aryDescribe = {
		"<dec><npc>有很多种雪人，每种的材料都不一样，你想做哪种?",
		"做围着红围巾的雪人 (特别)/#do_snowman(1)",
		"做围着蓝围巾的雪人 (特别)/#do_snowman(2)",
		"做特别雪人/#do_snowman(3)",
		"我有事情，别的时候再来/cancel",
	}
	CreateTaskSay(aryDescribe)
end

function do_snowman(snown)
	SetTaskTemp(TSKTMP_ITEM_NUMC, snown);
	aryDescribe = TB_Message[snown]
	GiveItemUI("堆雪人",aryDescribe,"do_snow_process","cancel",1)
end

function do_snow_process(nItemCount)
	local nItemNumC = GetTaskTemp(TSKTMP_ITEM_NUMC);
	local nItemPart = TB_SnowMan[nItemNumC][2]
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material[nItemPart] do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	
	--检测物品匹配
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		if(GetCash() < TB_SnowMan[nItemNumC][7]) then
			aryDescribe = {
				"<dec><npc>堆雪人需要有"..TB_SnowMan[nItemNumC][7].."钱，你身上的钱不够",
				"知道了/cancel"
				}
			CreateTaskSay(aryDescribe)
			return
		end
		
		if (TB_Material[nItemPart][szItemKey] == nil) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", 这个"..GetItemName(nCurItemIdx)..",我不需要这个你拿回去吧",
												"我重做!/#do_snowman("..nItemNumC..")",
												"我一会回来./cancel"	}	);
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		tb_enhanceitem_count[szItemKey][2] = nCurItemName;
		if(tb_enhanceitem_count[szItemKey][1] > TB_Material[nItemPart][szItemKey][2] ) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", 我要不了这么多<color=yellow>"..nCurItemName.."<color>请把用不到的放出去.",
													"我重做!/#do_snowman("..nItemNumC..")",
													"我一会回来./cancel"	}	);
				return
		end
	end
	
	for szkey, tb_item in TB_Material[nItemPart] do
			if (tb_enhanceitem_count[szkey][1] ~= TB_Material[nItemPart][szkey][2]) then
				CreateTaskSay( { "<dec><npc>你忘记放原料了 <color=yellow>"..tb_enhanceitem_count[szkey][2].."<color>不够。原料不够，我做不了.",
			"我重做!/#do_snowman("..nItemNumC..")",
			"我一会回来./cancel"	}	);
				return
			end
	end
		
	--删材料
	for i=1, nItemCount do
		local nIdx = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog("[堆雪人]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t 删除物品失败\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	Pay(TB_SnowMan[nItemNumC][7])
	
	 --给物品
	 local str = "";
	 PItem = random() * 100;
	if(PItem < TB_SnowMan[nItemNumC][3]) then
	 
		str = "制作成功<color=yellow>"..TB_SnowMan[nItemNumC][1].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][2],1,0,0)
	else
		str = "制作成功<color=yellow>"..TB_SnowMan[nItemNumC][4].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][5],1,0,0)
	end
	Msg2Player(str)
	WriteLog("[堆雪人]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str);
end

function want_gift()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>活动结束了.", "知道了/cancel"});
		return 
	end;
	aryDescribe = {"<dec><npc>兑换如下相应的礼物:\n 系着蓝围巾的雪人---南瓜饼\n 系着红围巾的雪人---雪糕\n 特别雪人---火鸡 \n 选择兑换礼物",
								 "南瓜饼/#do_gift(1)",
								 "雪糕/#do_gift(2)",
								 "火鸡/#do_gift(3)",
								 "暂时不需要/cancel",
		}
		CreateTaskSay(aryDescribe)
end

function do_gift(ngift)
		local Gcount = CalcEquiproomItemCount(6,1,TB_SnowMan[ngift][2],1)
		if(Gcount == 0) then
			Talk(1,"","你身上没有"..TB_SnowMan[ngift][1]..". 不能兑换礼物"..TB_SnowMan[ngift][8]..".")
		else  
			ConsumeEquiproomItem(1,6,1,TB_SnowMan[ngift][2],1)
			AddItem(6,1,TB_SnowMan[ngift][9],1,0,0)
			Msg = "你成功兑换"..TB_SnowMan[ngift][8]
			Msg2Player(Msg)
			WriteLog("[堆雪人]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t exchange "..GetItemName(GetGiveItemUnit(i)).." for "..TB_SnowMan[ngift][8]);
		end
end


function pack(...)
	return arg
end

function cancel()
	SetTaskTemp(TSKTMP_ITEM_NUMC, 0);
end