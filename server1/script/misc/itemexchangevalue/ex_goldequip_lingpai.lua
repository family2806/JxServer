-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 兑换新装备令牌（紫蟒等）
-- 文件名　：ex_goldequip_lingpai.lua
-- 创建者　：子非魚
-- 创建时间：2010-06-22 11:02:54

-- ======================================================


IncludeLib("ITEM")
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_head.lua")	-- 兑换新装备令牌（紫蟒等）
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua");

function exchange_lingpai2goldequip()
	local aryDescribe =
	{
		"<dec><npc>你想换什么装备?",
		format("青驹装备/#take_xp_equip_1(1, %d)", 905),
		format("云鹿装备/#take_xp_equip_1(2, %d)", 1135),
		format("苍狼装备/#take_xp_equip_1(3, %d)", 1365),
		format("玄猿装备/#take_xp_equip_1(4, %d)", 1595),
		format("紫莽装备/#take_xp_equip_1(5, %d)", 1825),
		format("金乌套装/#take_xp_equip_1(6, %d)", 2055),
---		format("白虎套装/#take_xp_equip_1(7, %d)", 2285),
---		format("赤麟套装/#take_xp_equip_1(8, %d)", 2515),
		format("五黄套装/#take_xp_equip_91(9, %d)", 1),
---		format("马虎套装/#take_xp_equip_101(10, %d)", 194),
---		format("炎皇套装/#take_xp_equip_111(11, %d)", 422),
		"稍候回来/no",
	};
	
	CreateTaskSay(aryDescribe);
end

----------------------------新加入五黄 马虎 炎黄---------------------------------
function take_xp_equip_91(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "好像大侠忘记带令牌了?")
		return
	end
	
	CreateTaskSay({"<dec><npc>大侠想换以下那个派系的装备:", 
						format("少林拳/#take_xp_equip_92(%d,%d, 1)", n_g, n_d),
						format("少林棍/#take_xp_equip_92(%d,%d, 2)", n_g, n_d),
						format("少林刀/#take_xp_equip_92(%d,%d, 3)", n_g, n_d),
						format("天王锤/#take_xp_equip_92(%d,%d, 4)", n_g, n_d),
						format("天王枪/#take_xp_equip_92(%d,%d, 5)", n_g, n_d),
						format("天王刀/#take_xp_equip_92(%d,%d, 6)", n_g, n_d),
						format("峨眉剑/#take_xp_equip_92(%d,%d, 7)", n_g, n_d),
						format("峨眉掌/#take_xp_equip_92(%d,%d, 8)", n_g, n_d),
						format("峨眉辅助/#take_xp_equip_92(%d,%d, 9)", n_g, n_d),
						format("翠烟刀/#take_xp_equip_92(%d,%d, 10)", n_g, n_d),
						format("翠烟内/#take_xp_equip_92(%d,%d, 11)", n_g, n_d),
						format("五毒掌/#take_xp_equip_92(%d,%d, 12)", n_g, n_d),
						format("下一页/#take_xp_equip_911(%d,%d)", n_g, n_d),
						"稍候回来 /no"});
end

function take_xp_equip_911(n_g, n_d)
	CreateTaskSay({"<dec><npc>你想换以下那个派系的装备:", 
						format("五毒刀/#take_xp_equip_92(%d,%d, 13)", n_g, n_d),
						format("五毒诅咒/#take_xp_equip_92(%d,%d, 14)", n_g, n_d),
						format("唐门飞刀/#take_xp_equip_92(%d,%d, 15)", n_g, n_d),
						format("唐门弩/#take_xp_equip_92(%d,%d, 16)", n_g, n_d),
						format("唐门镖/#take_xp_equip_92(%d,%d, 17)", n_g, n_d),
						format("唐门陷阱/#take_xp_equip_92(%d,%d, 18)", n_g, n_d),
						format("丐帮掌/#take_xp_equip_92(%d,%d, 19)", n_g, n_d),
						format("丐帮棍/#take_xp_equip_92(%d,%d, 20)", n_g, n_d),
						format("天忍战/#take_xp_equip_92(%d,%d, 21)", n_g, n_d),
						format("天忍诅咒/#take_xp_equip_92(%d,%d, 22)", n_g, n_d),
						format("天忍魔/#take_xp_equip_92(%d,%d, 23)", n_g, n_d),
						format("下一页/#take_xp_equip_912(%d,%d)", n_g, n_d),
						"稍候回来/no"});
end

function take_xp_equip_912(n_g, n_d)
	CreateTaskSay({"<dec><npc>你想换以下那个派系的装备:", 
						format("武当气/#take_xp_equip_92(%d,%d, 24)", n_g, n_d),
						format("武当剑/#take_xp_equip_92(%d,%d, 25)", n_g, n_d),
						format("昆仑刀/#take_xp_equip_92(%d,%d, 26)", n_g, n_d),
						format("昆仑剑/#take_xp_equip_92(%d,%d, 27)", n_g, n_d),
						format("昆仑诅咒/#take_xp_equip_92(%d,%d, 28)", n_g, n_d),
						format("返回/#take_xp_equip_91(%d,%d)", n_g, n_d),
						"稍候回来/no"});
end

function take_xp_equip_92(n_g, n_d, n_p)
	local n_count = 5;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>大侠想换下面那个派系的装备:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "稍候回来 /no");
	CreateTaskSay(aryDescribe);
end

-----------马虎

function take_xp_equip_101(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "好像大侠忘记带令牌了?")
		return
	end
	
	CreateTaskSay({"<dec><npc>大侠想换以下那个派系的装备:", 
						format("大马虎通用装备/#take_xp_equip_102(%d,%d, 1)", n_g, n_d),
						"稍候回来 /no"});
end

function take_xp_equip_102(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>大侠想换下面那个派系的装备:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "稍候回来 /no");
	CreateTaskSay(aryDescribe);
end

---------炎帝装备
function take_xp_equip_111(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "好像大侠忘记带令牌了?")
		return
	end
	
	CreateTaskSay({"<dec><npc>大侠想换以下那个派系的装备:", 
						format("燧人通用装备/#take_xp_equip_112(%d,%d, 1)", n_g, n_d),
						format("伏羲通用装备/#take_xp_equip_112(%d,%d, 2)", n_g, n_d),
						format("女娲通用装备/#take_xp_equip_112(%d,%d, 3)", n_g, n_d),
						format("祝融通用装备/#take_xp_equip_112(%d,%d, 4)", n_g, n_d),
						format("神农通用装备/#take_xp_equip_112(%d,%d, 5)", n_g, n_d),
						"稍候回来 /no"});
end

function take_xp_equip_112(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>大侠想换下面那个派系的装备:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "稍候回来 /no");
	CreateTaskSay(aryDescribe);
end
--------------------------------------------------------------------------------

function take_xp_equip_1(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "好像大侠忘记带令牌了?")
		return
	end
	
	CreateTaskSay({"<dec><npc>大侠想换以下那个派系的装备:", 
						format("少林拳/#take_xp_equip_2(%d,%d, 1)", n_g, n_d),
						format("少林棍/#take_xp_equip_2(%d,%d, 2)", n_g, n_d),
						format("少林刀/#take_xp_equip_2(%d,%d, 3)", n_g, n_d),
						format("天王锤/#take_xp_equip_2(%d,%d, 4)", n_g, n_d),
						format("天王枪/#take_xp_equip_2(%d,%d, 5)", n_g, n_d),
						format("天王刀/#take_xp_equip_2(%d,%d, 6)", n_g, n_d),
						format("峨眉剑/#take_xp_equip_2(%d,%d, 7)", n_g, n_d),
						format("峨眉掌/#take_xp_equip_2(%d,%d, 8)", n_g, n_d),
						format("翠烟刀/#take_xp_equip_2(%d,%d, 9)", n_g, n_d),
						format("翠烟内/#take_xp_equip_2(%d,%d, 10)", n_g, n_d),
						format("五毒掌/#take_xp_equip_2(%d,%d, 11)", n_g, n_d),
						format("五毒刀/#take_xp_equip_2(%d,%d, 12)", n_g, n_d),
						format("下一页/#take_xp_equip_11(%d,%d)", n_g, n_d),
						"稍候回来 /no"});
end

function take_xp_equip_11(n_g, n_d)
	CreateTaskSay({"<dec><npc>你想换以下那个派系的装备:", 
						format("唐门飞刀/#take_xp_equip_2(%d,%d, 13)", n_g, n_d),
						format("唐门弩/#take_xp_equip_2(%d,%d, 14)", n_g, n_d),
						format("唐门镖/#take_xp_equip_2(%d,%d, 15)", n_g, n_d),
						format("丐帮掌/#take_xp_equip_2(%d,%d, 16)", n_g, n_d),
						format("丐帮棍/#take_xp_equip_2(%d,%d, 17)", n_g, n_d),
						format("天忍战/#take_xp_equip_2(%d,%d, 18)", n_g, n_d),
						format("天忍魔/#take_xp_equip_2(%d,%d, 19)", n_g, n_d),
						format("武当气/#take_xp_equip_2(%d,%d, 20)", n_g, n_d),
						format("武当剑/#take_xp_equip_2(%d,%d, 21)", n_g, n_d),
						format("昆仑刀/#take_xp_equip_2(%d,%d, 22)", n_g, n_d),
						format("昆仑剑/#take_xp_equip_2(%d,%d, 23)", n_g, n_d),
						format("上一页/#take_xp_equip_1(%d,%d)", n_g, n_d),
						"稍候回来/no"});
end


function take_xp_equip_2(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>大侠想换下面那个派系的装备:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "稍候回来 /no");
	CreateTaskSay(aryDescribe);
end

function take_xp_equip_3(n_g, n_d, n_p, n_x)
	if (CountFreeRoomByWH(2,4,1) < 1) then
		Talk(1, "", "装备不够空位，请整理好再来");
		return
	end
	
	local nLingpaiIdx = GetNextItemIndexInRoom(0, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1, 3);
	local n_bindstate = GetItemBindState(nLingpaiIdx);
	local n_expiredtime = ITEM_GetExpiredTime(nLingpaiIdx);
	
	if (ConsumeItem(3,1, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) ~= 1) then
		Talk(1, "", "好像大侠忘记带令牌了啊 ?")
		return
	end
	
	local nItemIdx = AddGoldItem(0, tbGoldEquip_Lingpai[n_g][n_x][2]);
	
--	越南版本没有此需求
--	if (n_expiredtime ~= 0 ) then
--		ITEM_SetExpiredTime(nItemIdx,86400)
--		SyncItem(nItemIdx)
--	end
	
	if (n_bindstate ~= 0) then
		
		if (n_bindstate == -2) then
			n_new_bindtime = take_xp_equip_calc_binditem(tbLingpai_BindTime[n_g].nBindState);
		else
			n_new_bindtime = n_bindstate;
		end
		
		SetItemBindState(nItemIdx, n_new_bindtime);
	end
	
	Msg2Player("获得"..GetItemName(nItemIdx));
	
	local szLog = format("%s\t%s\t%u",tbLingpai[n_g].szName, GetItemName(nItemIdx), ITEM_GetItemRandSeed(nItemIdx))
	
	_WritePlayerLog("Token Exchange Equip", szLog)
end

TIME_2000_1_1 = 946656000;		-- 2000年1月1日 相对于 1970年1月1日的秒数

function take_xp_equip_calc_binditem(nLingpaiBindTime)
	if (nLingpaiBindTime == -2) then
		return -2;
	end
	local n_new_bindtime = nLingpaiBindTime - 7*24 + floor((GetCurServerTime() - TIME_2000_1_1) / 3600);
	return n_new_bindtime;
end

