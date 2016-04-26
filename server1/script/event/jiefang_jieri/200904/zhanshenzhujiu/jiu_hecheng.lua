Include("\\script\\lib\\baseclass.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

if not tbJiefang0904_jiu then
	tbJiefang0904_jiu = tbBaseClass:new()
end

tbFormulaList = 
{
	[1] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "数量不够，等收集够了在回来吧!",
		tbMaterial = 
		{
			{szName="米袋", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="洁净水", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="酒母", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{nJxb=30000},
		},
		tbProduct = 
		{
			szName="葫芦酒",	tbProp={6, 1, 2013, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
	[2] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "数量不够，等收集够了在回来吧!",
		tbMaterial = 
		{
			{szName="米袋", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="洁净水", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="酒母", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{szName="新鲜葡萄", 	tbProp={6, 1, 2007, 1, 0, 0}, nCOunt = 1},
		},
		tbProduct = 
		{
			szName="葡萄酒",	tbProp={6, 1, 2014, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
}

function tbJiefang0904_jiu:OnDailogMain(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		return Talk(1, "", "活动结束了.")
	end
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	self:MakeComposeClas(%tbFormulaList)
	local tbSay = self.tbComposeList:MakeOptByProductName("兑换", nItemIndex, szDescLink)
	local szTitle	= "<dec>"..szDescLink.."礼官: 战胜祝酒活动从28-04-2009到24:00，31-05-2009.活动期间，大侠可以搜集贺胜袋，酒母，如果需要的话还可在奇珍阁买新鲜葡萄.大侠可以用这些物品兑换葫芦酒和葡萄酒来领取经验值奖励和各种有价值的物品. 但要谨记：饮酒过度伤身体.";
	
	
	tinsert(tbSay , 1, szTitle);
	tinsert(tbSay , getn(tbSay)+1, "结束对话/OnCancel");
	CreateTaskSay(tbSay)
--	if tbItemJingnianshijian then
--		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
--	end
	
end

function tbJiefang0904_jiu:MakeComposeClas(tbFormulaList)
	if  type(self.tbComposeList) ~= "table" then
		self.tbComposeList = tbComposeListForJinNang:new("tbJiefang0904_jiu_Compose", tbFormulaList)
	end
end


function tbJiefang0904_jiu:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	return (jf0904_act_dateS <= nCurDate and nCurDate < jf0904_act_dateE);
end

function OnCancel()
end
