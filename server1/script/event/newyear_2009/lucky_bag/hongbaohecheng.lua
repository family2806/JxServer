Include("\\script\\lib\\compose_jinnang.lua")

Include("\\script\\lib\\string.lua")

local hongbao_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>只用这些原料是不能兑换兴旺礼包的，你还是先去把原料找够吧.<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="福", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 3},
			{szName="禄", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 3},
			{szName="寿", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 3},
			{nJxb = 8e4}
		},
		tbProduct = 
		{
			szName="兴旺红包", tbProp={6, 1, 1892, 1, 0, 0}, nExpiredTime = 20090223,
		},
	},
	[2] =
	{
		szFailMsg = "<color=red>只用这些原料是不能兑换发财礼包的，你还是先去把原料找够吧!<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="福", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 2},
			{szName="禄", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 2},
			{szName="寿", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 2},
			{szName="绿宝珠",tbProp={6, 1, 1891, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="发财红包", tbProp={6, 1, 1893, 1, 0, 0}, nExpiredTime = 20090223,
		}
	},
}

function newyear0901_hongbao_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	
	if (newyear0901_hongbao_IsActDate() ~= 1) then
		return Talk(1, "", "活动结束了.")
	end
	
	tbFormulaList = tbFormulaList or %hongbao_tbFormulaList
	newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_hongbao_Compose:MakeOptByProductName("我想换", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."好运压岁钱包活动从16-01-2009到15-02-2009. 活动期间，要得到福和寿字就要收集蓝宝箱；收集红宝箱可以得到禄字。大侠可以用这些字兑换兴旺红包和发财红包来领取经验和别的有价值的物品.");
	tinsert(tbSay , getn(tbSay)+1, "结束对话OnCancel");
	CreateTaskSay(tbSay);
end

function newyear0901_hongbao_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end


--只在对话时产生一次
function newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_hongbao_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_hongbao_Compose", tbFormulaList)
	end
end
