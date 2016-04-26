-- 炎帝图腾碎片
-- by 小浪多多
-- 2008.02.25
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..

Include("\\script\\lib\\composeclass.lua");

function YDBZ_tradeYandiTuTeng()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	local tbarytalk = {
		format("<npc>收集够9块碎片后拿给我，我将帮你合成一个碎片图腾，你现在想合成吗?\n 装备有<color=yellow>%s<color> 图腾碎片",nCount),
		"我想换炎帝图腾/YDBZ_SureDoTrade",
		"我只是路过/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTrade()
	local tbarytalk = {
		format("<npc>收集够9块碎片后拿给我，我将帮你合成一个碎片图腾. 你确定想合成吗?",nCount),
		"对，谢谢姑娘/YDBZ_DoTrade",
		"我只是路过/NoChoice",
	}
	CreateTaskSay(tbarytalk);	
end
function YDBZ_DoTrade()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	if nCount < 9 then
		Say("装备不够9块图腾碎片!!!",0);
		return 0;
	end
	ConsumeEquiproomItem(9,6,1,1685,-1);
	AddItem(6,1,1606,1,0,0);
	Msg2Player("恭喜你获得1<color=yellow> 炎帝图腾<color>");
end

function YDBZ_tradeYandiLingQi()
	
	local tbarytalk = {
		"<dec>请选择换取方式:",
		"2 炎帝图腾/#YDBZ_SureDoTradeLingQi(1)",
		"2 炎帝图腾 + 1 xu/#YDBZ_SureDoTradeLingQi(2)",
		"我只是路过/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTradeLingQi(n_sel)
	local tbFormula = {
			[1] = {
						tbMaterial = {{tbProp = {6,1,1606, -1}, szName = "炎帝图腾", nCount = 2}},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "炎帝令旗"},
			},
			[2] = {
						tbMaterial = {
							{tbProp = {6,1,1606, -1}, szName = "炎帝图腾", nCount = 2},
							{tbProp = {4,417,1, -1}, szName = "铜钱", nCount = 1},
						},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "炎帝令旗"},
			},
	};
	
	--如果输入为空，使用默认值
	local szLogTitle	= "yandi_tradeLingQi";
	
	local tbMaterial	= tbFormula[n_sel].tbMaterial
	local tbProduct		= tbFormula[n_sel].tbProduct
	
	local nComposeCount = 1
	
	local nFreeItemCellLimit = 1
	
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("为确保财产安全，请确保装备还剩%d 空位.", nFreeItemCellLimit))
		return 0
	end
	
	if tbComposeClass:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = tbFormula.szFailMsg or "<color=red>大侠带的原料不足!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if tbComposeClass:ConsumeMaterial(tbMaterial, nComposeCount, szLogTitle) ~= 1 then
		Msg2Player("制造失败，失去一些原料.")
		return 0;
	end
	local n_ran = random(100);
	if (n_sel == 1 and n_ran > 60) then
		Msg2Player("制造失败，失去制造原料.");
		return
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, szLogTitle, nComposeCount)
	end
	
end


function YDBZ_tradeXuanYuanLing()
	local n_count = CalcItemCount(3, 6, 1, 2532, -1);
	if (n_count >= 100) then
		ConsumeItem(3, 100, 6,1,2532, -1);
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2351,1,0,0}, szName = "玄猿令"}, "yandi_tradeXuanyuan");
	else
		CreateTaskSay({format("<dec>%s还剩: <enter>%s", "换玄猿令" ,format("%d %s", 100, "炎帝令旗")), "我知道了!/NoChoice"});
	end
end
