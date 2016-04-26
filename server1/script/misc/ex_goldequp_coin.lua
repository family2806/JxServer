-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 黄金装备牌子兑换黄金装备
-- 文件名　：ex_goldequp_coin.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-21 13:59:02

-- ======================================================

Include("\\script\\lib\\composelistclass.lua")
IncludeLib("LEAGUE")

local tbGoldEquip_Coin = {
	[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "继业金牌", tbProp = {6,1,2075,1,0,0}, nCount = 100}},
		tbProduct = {szName = "继业玄武黄金铠", nQuality = 1, tbProp = {0,22}},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "梦龙金牌", tbProp = {6,1,2076,1,0,0}, nCount = 100}},
		tbProduct = {szName = "梦龙玄丝发带", nQuality = 1, tbProp = {0,3}},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "冥幻金牌", tbProp = {6,1,2077,1,0,0}, nCount = 100}},
		tbProduct = {szName = "冥幻幽蛊暗衣", nQuality = 1, tbProp = {0,62}},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "地魄金牌", tbProp = {6,1,2078,1,0,0}, nCount = 100}},
		tbProduct = {szName = "地魄五行连环冠", nQuality = 1, tbProp = {0,86}},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "无尘金牌", tbProp = {6,1,2079,1,0,0}, nCount = 100}},
		tbProduct = {szName = "无尘玉女素心冠", nQuality = 1, tbProp = {0,41}},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "碧海金牌", tbProp = {6,1,2080,1,0,0}, nCount = 100}},
		tbProduct = {szName = "碧海红铃金丝带", nQuality = 1, tbProp = {0,53}},
	},
	[7] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "雾幻金牌", tbProp = {6,1,2081,1,0,0}, nCount = 100}},
		tbProduct = {szName = "雾幻之松风雪影靴", nQuality = 1, tbProp = {0,140}},
	},
	[8] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "魔嗜金牌", tbProp = {6,1,2082,1,0,0}, nCount = 100}},
		tbProduct = {szName = "魔嗜之血玉七杀佩", nQuality = 1, tbProp = {0,114}},
	},
	[9] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "僧帽金牌", tbProp = {6,1,2203,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "梦龙正红僧帽",
			[1]	= {szName = "梦龙正红僧帽", nQuality = 1, tbProp = {0,1}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得<color=yellow>梦龙正红僧帽<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
			
	},
	[10] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "幽胧金牌", tbProp = {6,1,2204,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "幽胧之赤蝎秘装",
			[1]	= {szName = "幽胧之赤蝎秘装", nQuality = 1, tbProp = {0,57}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得<color=yellow>幽胧之赤蝎秘装<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		},
	},
	[11] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "魔煞金牌", tbProp = {6,1,2205,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "魔煞之举火燎天腕",
			[1]	= {szName = "魔煞之举火燎天腕", nQuality = 1, tbProp = {0,104}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得<color=yellow>魔煞之举火燎天腕<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		}
	},
	[12] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "敌忾金牌", tbProp = {6,1,2206,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "敌忾之缠莽腰带",
			[1]	= {szName = "敌忾之缠莽腰带", nQuality = 1, tbProp = {0,98}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得<color=yellow>敌忾之缠莽腰带<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},

}

local tbGoldEquip_Coin_2 = {
		[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "撼天金牌", tbProp = {6,1,2237,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "撼天之虎头紧束腕",
			[1]	= {szName = "撼天之虎头紧束腕", nQuality = 1, tbProp = {0,19}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得<color=yellow>撼天之虎头紧束腕<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "天光金牌", tbProp = {6,1,2238,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "天光之束天缚地环",
			[1]	= {szName = "天光之束天缚地环", nQuality = 1, tbProp = {0,80}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得 <color=yellow>天光之束天缚地环<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "碧海金牌", tbProp = {6,1,2239,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "碧海之红铃波",
			[1]	= {szName = "碧海之红铃波", nQuality = 1, tbProp = {0,54}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得  <color=yellow>碧海之红铃波<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "无魔金牌", tbProp = {6,1,2240,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "无魇之冰晶指环",
			[1]	= {szName = "无魇之冰晶指环", nQuality = 1, tbProp = {0,38}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得  <color=yellow>无魇之冰晶指环<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "凌岳金牌", tbProp = {6,1,2241,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "凌岳之天地玄黄戒",
			[1]	= {szName = "凌岳之天地玄黄戒", nQuality = 1, tbProp = {0,120}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得  <color=yellow>凌岳之天地玄黄戒<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "霜晶金牌", tbProp = {6,1,2242,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "霜晶之风暴指环",
			[1]	= {szName = "霜晶之风暴指环", nQuality = 1, tbProp = {0,130}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("恭喜高手%s 获得  <color=yellow>霜晶之风暴指环<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
}
function ex_goldequp_coin()
	if not tbComposeGoldEquipCoin then
		tbComposeGoldEquipCoin = tbComposeListClass:new("tbComposeGoldEquipCoin", %tbGoldEquip_Coin);
	end
	
	local szTitle = "<dec><npc>".."阁下想兑换什么金牌?";
		
	local tbSay = tbComposeGoldEquipCoin:MakeOptByProductName("фi");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "结束对话/OnCancel");
	
	CreateTaskSay(tbSay)
end

function ex_goldequp_coin_2()
	if not tbComposeGoldEquipCoin_b then
		tbComposeGoldEquipCoin_b = tbComposeListClass:new("tbComposeGoldEquipCoin_b", %tbGoldEquip_Coin_2);
	end
	
	local szTitle = "<dec><npc>".."阁下想兑换什么金牌?";
		
	local tbSay = tbComposeGoldEquipCoin_b:MakeOptByProductName("фi");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "结束对话/OnCancel");
	
	CreateTaskSay(tbSay)
end

