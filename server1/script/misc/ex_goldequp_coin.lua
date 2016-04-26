-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - �ƽ�װ�����Ӷһ��ƽ�װ��
-- �ļ�������ex_goldequp_coin.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 13:59:02

-- ======================================================

Include("\\script\\lib\\composelistclass.lua")
IncludeLib("LEAGUE")

local tbGoldEquip_Coin = {
	[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "��ҵ����", tbProp = {6,1,2075,1,0,0}, nCount = 100}},
		tbProduct = {szName = "��ҵ����ƽ���", nQuality = 1, tbProp = {0,22}},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "��������", tbProp = {6,1,2076,1,0,0}, nCount = 100}},
		tbProduct = {szName = "������˿����", nQuality = 1, tbProp = {0,3}},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "ڤ�ý���", tbProp = {6,1,2077,1,0,0}, nCount = 100}},
		tbProduct = {szName = "ڤ���Ĺư���", nQuality = 1, tbProp = {0,62}},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "���ǽ���", tbProp = {6,1,2078,1,0,0}, nCount = 100}},
		tbProduct = {szName = "��������������", nQuality = 1, tbProp = {0,86}},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "�޳�����", tbProp = {6,1,2079,1,0,0}, nCount = 100}},
		tbProduct = {szName = "�޳���Ů���Ĺ�", nQuality = 1, tbProp = {0,41}},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "�̺�����", tbProp = {6,1,2080,1,0,0}, nCount = 100}},
		tbProduct = {szName = "�̺������˿��", nQuality = 1, tbProp = {0,53}},
	},
	[7] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "��ý���", tbProp = {6,1,2081,1,0,0}, nCount = 100}},
		tbProduct = {szName = "���֮�ɷ�ѩӰѥ", nQuality = 1, tbProp = {0,140}},
	},
	[8] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "ħ�Ƚ���", tbProp = {6,1,2082,1,0,0}, nCount = 100}},
		tbProduct = {szName = "ħ��֮Ѫ����ɱ��", nQuality = 1, tbProp = {0,114}},
	},
	[9] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "ɮñ����", tbProp = {6,1,2203,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "��������ɮñ",
			[1]	= {szName = "��������ɮñ", nQuality = 1, tbProp = {0,1}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���<color=yellow>��������ɮñ<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
			
	},
	[10] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "���ʽ���", tbProp = {6,1,2204,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "����֮��Ы��װ",
			[1]	= {szName = "����֮��Ы��װ", nQuality = 1, tbProp = {0,57}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���<color=yellow>����֮��Ы��װ<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		},
	},
	[11] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "ħɷ����", tbProp = {6,1,2205,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "ħɷ֮�ٻ�������",
			[1]	= {szName = "ħɷ֮�ٻ�������", nQuality = 1, tbProp = {0,104}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s �����<color=yellow>ħɷ֮�ٻ�������<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		}
	},
	[12] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "�������", tbProp = {6,1,2206,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "����֮��ç����",
			[1]	= {szName = "����֮��ç����", nQuality = 1, tbProp = {0,98}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���<color=yellow>����֮��ç����<color>", GetName());
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
		tbMaterial = {{szName = "�������", tbProp = {6,1,2237,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "����֮��ͷ������",
			[1]	= {szName = "����֮��ͷ������", nQuality = 1, tbProp = {0,19}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���<color=yellow>����֮��ͷ������<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "������", tbProp = {6,1,2238,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "���֮���츿�ػ�",
			[1]	= {szName = "���֮���츿�ػ�", nQuality = 1, tbProp = {0,80}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ��� <color=yellow>���֮���츿�ػ�<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "�̺�����", tbProp = {6,1,2239,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "�̺�֮���岨",
			[1]	= {szName = "�̺�֮���岨", nQuality = 1, tbProp = {0,54}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���  <color=yellow>�̺�֮���岨<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "��ħ����", tbProp = {6,1,2240,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "����֮����ָ��",
			[1]	= {szName = "����֮����ָ��", nQuality = 1, tbProp = {0,38}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���  <color=yellow>����֮����ָ��<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "��������", tbProp = {6,1,2241,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "����֮������ƽ�",
			[1]	= {szName = "����֮������ƽ�", nQuality = 1, tbProp = {0,120}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���  <color=yellow>����֮������ƽ�<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "˪������", tbProp = {6,1,2242,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "˪��֮�籩ָ��",
			[1]	= {szName = "˪��֮�籩ָ��", nQuality = 1, tbProp = {0,130}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("��ϲ����%s ���  <color=yellow>˪��֮�籩ָ��<color>", GetName());
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
	
	local szTitle = "<dec><npc>".."������һ�ʲô����?";
		
	local tbSay = tbComposeGoldEquipCoin:MakeOptByProductName("��i");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "�����Ի�/OnCancel");
	
	CreateTaskSay(tbSay)
end

function ex_goldequp_coin_2()
	if not tbComposeGoldEquipCoin_b then
		tbComposeGoldEquipCoin_b = tbComposeListClass:new("tbComposeGoldEquipCoin_b", %tbGoldEquip_Coin_2);
	end
	
	local szTitle = "<dec><npc>".."������һ�ʲô����?";
		
	local tbSay = tbComposeGoldEquipCoin_b:MakeOptByProductName("��i");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "�����Ի�/OnCancel");
	
	CreateTaskSay(tbSay)
end

