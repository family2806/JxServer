-- 文件名　：hechengqizi.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-14 14:32:38

--10 旗的碎片1 + 6 旗的碎片2 + 3 旗的碎片3 + 1 旗的碎片4 + 3 万两	获得：1张战胜旗
--被注：- 原料将会在玩家背包种自动扣除。

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="旗的碎片1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="旗的碎片2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="旗的碎片3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="旗的碎片4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="战胜旗", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>从26-04-2008到24h00 18-05-2008, 打怪将搜集到旗的碎片，可以带旗的碎片到老夫这合成完整的战胜旗.",
		format("我想合成战胜旗/#%s:Compose()", self.szName),
		"我待会再来/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("背包满了，为了物品的安全请整理背包.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("合成1面战胜旗", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "礼官: 祝贺大侠已经合成完整的战胜旗!", 0)
end