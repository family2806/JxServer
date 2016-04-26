--越南飞云任务:活动开始后新人物达到规定的等级（60级，90级，100级），则可到NPC处领取相应的奖励
--			a.	玩家达到60级后，可以到临安铁匠处(坐标166/191) 对话并领取奖励，奖励为具有两个
--				隐藏属性（属性随机）的蓝色装备一个(戒指或护身符/项链或玉佩/玉镯)；
--			b.	玩家达到90级后，可以到襄阳铁匠处(坐标195/205) 对话并领取奖励,奖励为具有三个隐藏
--				属性（属性随机）的蓝色武器一个(武器种类视玩家门派而定)；
--			c.	玩家达到100级后，可以到襄阳刘蕴古处(坐标201/199) 对话并领取奖励，奖励为飞云神马一匹。


--Date:		November fifteenth 2006
--Author:	liaozhishan
--Right:	Kingsoft all rights reserved@
--file:		yuenan_feiyunrenwu.lua

if (not __H_V_FEIYUNACTION__) then	--__H_V_FEIYUNACTION__
	__H_V_FEIYUNACTION__ = 1;

Include([[\script\lib\gb_taskfuncs.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl60.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl90.lua]]);

--	Date define field: following lines lies date defination;
V_FY_SZ_ACTIONNAME = "v_feiyun06_permanent";	-- 越南永久性活动
V_FY_TK_GETSIGN = 1781;

tab_Reference = {
	[60] = {60, 150, 160},
	[90] = {90, 150, 190},
	[100] = {100, 160, 190},
};

--	common interface following
function v_fy_is_active()	-- Active check up
	do return 0 end		-- 活动已结束，永久关闭 by 子非魚
	if (gb_GetTask(V_FY_SZ_ACTIONNAME, 1) ~= 0) then
		return 0;
	end;
	return 1;
end;

function v_fy_is_newrole()	--make sure Role is of new type 
	local nPoint = GetExtPoint(6);
	local nBit = GetBit(nPoint, 7);
	if (nBit == 1) then
		return 1;
	end;
	return 0;
end;

--	check if he has gotten the level prize;
--	return value: has gotten return 1; in opposition return 0
function v_fy_is_got(nLevel)
	if (not tab_Reference[nLevel]) then
		return 0;
	end;
	
	local UWorld1781 = GetTask(V_FY_TK_GETSIGN);
	if (UWorld1781 >= 250) then
		return 0
	end;
	local table = tab_Reference[nLevel];
	for i = 1, getn(table) do
		if (UWorld1781 == table[i]) then
			return 0;
		end;
	end;
	return 1;
end;

--	check get prize
--	return value: yes return 1; no return 0;
function v_fy_awardcheck(nLevel)
	if (GetLevel() < nLevel) then
		Say("你还未达到等级要求!", 0);
		return 0;
	end;
	
	if (v_fy_is_got(nLevel) == 0) then
		Say("您已领取奖励，不能继续领取了!", 0);
		return 0;
	end;
	
	if (v_fy_is_newrole() == 0) then
		Say("您不是从新账号玩，不能领奖.", 0);
		return 0;
	end;
	return 1;
end;

--	add a number into task
function v_fy_tkvalueadd(nTaskID, nAddend)
	SetTask(nTaskID, ( GetTask(nTaskID) + nAddend ) );
	SyncTaskValue( nTaskID );
end;

--	common interface above

--	field level 60:	Prize when a role level up at 60:
function v_fy_60_entrance()
	Say("金兵势力猛如洪水，襄阳即将失守！皇上已召集各地英雄义士商谈，同时送一件知音装备给各位已达到60级的英雄豪杰。", 2, 
	"领取60级奖励/v_fy_60_next",
	"顺便路过看看而已!/no");
end;

function v_fy_60_next()
	local tab_Content = {
		"我想领戒指/v_fy_60_ring",
		"我想领取玉佩 (香囊)/v_fy_60_yu",
		" 护身符(项链)/v_fy_60_necklace",
		"离开/no"
	};
	Say("你想领取什么奖励?", getn(tab_Content), tab_Content);
end;

function v_fy_60_ring()	--领取60级的戒指
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_vn_fy_ring[nSeries]));
	local Index2 = random(1, getn(tab_vn_fy_ring[nSeries][Index1]));
	local str = "您获得1 <color=yellow>苏母绿戒指?color>";
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	AddItemEx(4,tab_vn_fy_ring[nSeries][Index1][Index2],0, 0,3,0, 6,0,200, 6,6,6,6,0,0)
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_necklace()	--领取60级的护身符(项链)
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local tab_award = tab_vn_fy_hushenhu;
	if (nSex == 1) then	-- 如果是个女角色
		tab_award = tab_vn_fy_xianglian;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "琥珀护身符";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,1, 6,0,200, 6,6,6,6,0,0);
	elseif (nSex == 1) then	-- 如果是个女角色
		szItemName = "绿松石项链";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,0, 6,0,200, 6,6,6,6,0,0);
	end;
	local str = "您获得 <color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_yu()	--领取60级的项链
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	
	local tab_award = tab_vn_fy_yupei;
	if (nSex == 1) then	-- 如果是个男角色
		tab_award = tab_vn_fy_xiangrang;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "青玉玉佩";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,1, 6,2,200, 6,6,6,6,0,0)
	elseif (nSex == 1) then	-- 如果是个男角色
		szItemName = "紫苏香囊";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,0, 6,0,200, 6,6,6,6,0,0)
	end;
	local str = "您获得<color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 90:
function v_fy_90_entrance()
	Say("金兵气势猛如洪水，襄阳即将失守！皇上召集英雄侠士救国，同时送1件礼物给已达90级的英雄豪杰.", 2, 
	"领取90级奖励/v_fy_90_next",
	"顺便来看看!/no");
end;

v_fy_90_tab_weapon = {
	["cuiyan"] = {"大风刀", "吞日斩"},
	["emei"] = {"玄铁剑(峨眉剑)", "玄铁剑 (峨眉气"},
	["tangmen"] = 	 {"霸王镖", "碎月刀", "孔雀翎"},
	["wudu"] = {"大风刀(五毒掌)", "大风刀(五毒刀)"},
	["tianwang"] = {"破天戟", "破天锤", "大风刀"},
	["shaolin"] = {"大风刀", "金箍棒"},
	["wudang"] = {"玄铁剑(武当剑)", "玄铁剑(武当气"},
	["kunlun"] = {"大风刀", "玄铁剑"},
	["gaibang"] = 	 {"金箍棒(丐帮掌)", "经办(丐帮棍)"},
	["tianren"] = {"破天戟(天忍戟)", "破天戟(天忍掌)"}
};

function v_fy_90_next()
	local player_Faction = GetFaction();	-- Get Faction Name
--	player_Faction = "tianren";
	if (not player_Faction or not v_fy_90_tab_weapon[player_Faction]) then		-- skip if role not in Faction
		Say("请你先加入门派再来找我.", 0);
		return
	end;

	local tab_Content = {}
	for i = 1, getn(v_fy_90_tab_weapon[player_Faction]) do
		tinsert(tab_Content, "我想领取"..v_fy_90_tab_weapon[player_Faction][i].."/#v_fy_90_weapon([["..player_Faction.."]],"..i..")");
	end;
	tinsert(tab_Content, "离开/no");

	Say("你想领取什么奖励", getn(tab_Content), tab_Content);
end;

-- Get tanle
function v_fy_90_gettable(player_Faction)
	if (player_Faction == "cuiyan") then
		return tab_vn_fy_cym, tab_vn_fy_cym_add
	elseif(player_Faction == "emei") then
		return tab_vn_fy_emp, tab_vn_fy_emp_add
	elseif(player_Faction == "tangmen") then
		return tab_vn_fy_tm, tab_vn_fy_tm_add
	elseif(player_Faction == "wudu") then
		return tab_vn_fy_wdj, tab_vn_fy_wdj_add
	elseif(player_Faction == "tianwang") then
		return tab_vn_fy_twb, tab_vn_fy_twb_add
	elseif(player_Faction == "shaolin") then
		return tab_vn_fy_slp, tab_vn_fy_slp_add
	elseif(player_Faction == "wudang") then
		return tab_vn_fy_wdp, tab_vn_fy_wdp_add
	elseif(player_Faction == "kunlun") then
		return tab_vn_fy_klp, tab_vn_fy_klp_add
	elseif(player_Faction == "gaibang") then
		return tab_vn_fy_gb, tab_vn_fy_gb_add
	elseif(player_Faction == "tianren") then
		return tab_vn_fy_trj, tab_vn_fy_trj_add
	end;
	return nil;
end;

-- Get the prize of level up to 90
function v_fy_90_weapon(player_Faction, i)
	if (v_fy_awardcheck(90) == 0) then
		return
	end;
	
	local table = {};
	local _t = {};
	table, _t = v_fy_90_gettable(player_Faction);
	if (not table or not _t) then
		return
	end;
	local nIndex = random(1, getn(table[i]));
	local str = "您获得<color=yellow>"..v_fy_90_tab_weapon[player_Faction][i].."<color>.";
	if (player_Faction == "emei" or player_Faction == "wudang")  then
		str = "您获得<color=yellow>玄铁剑<color>.";
	elseif (player_Faction == "gaibang") then
		str = "您获得<color=yellow>金箍棒<color>.";
	elseif (player_Faction == "wudu") then
		str = "您获得<color=yellow>大风刀<color>.";
	elseif (player_Faction == "tianren") then
		str = "您获得<color=yellow>破天戟<color>.";
	end;
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 90);
	AddItemEx(_t[i][1],table[i][nIndex],_t[i][3], _t[i][4],_t[i][5],_t[i][6], _t[i][7],_t[i][8],_t[i][9], _t[i][10],_t[i][11],_t[i][12],_t[i][13],_t[i][14],_t[i][15]);
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 100:
function v_fy_100_entrance()
	Say("金兵势力猛如洪水，襄阳即将失守！皇上已召集天下英雄义士商量，同时送出飞云神马来感谢各位英雄。.", 2, 
	"领取100级奖励/v_fy_100_next",
	"顺便看看而已!/no");
end;

function v_fy_100_next()
	if (v_fy_awardcheck(100) == 0) then
		return
	end;
	
	-- 加一匹神马
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 100);
	AddItem(0, 10, 8, 1, 0, 0, 0);
	Msg2Player("您获得<color=yellow>飞云天马color>");
end;


function no()
end;


end;	--__H_V_FEIYUNACTION__
