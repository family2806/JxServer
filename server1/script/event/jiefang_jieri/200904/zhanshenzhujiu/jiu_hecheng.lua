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
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			{szName="Bao g�o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N��c tinh khi�t", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r��u", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{nJxb=30000},
		},
		tbProduct = 
		{
			szName="B�u r��u",	tbProp={6, 1, 2013, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
	[2] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			{szName="Bao g�o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N��c tinh khi�t", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r��u", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{szName="Nho t��i", 	tbProp={6, 1, 2007, 1, 0, 0}, nCOunt = 1},
		},
		tbProduct = 
		{
			szName="R��u nho",	tbProp={6, 1, 2014, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
}

function tbJiefang0904_jiu:OnDailogMain(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.")
	end
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	self:MakeComposeClas(%tbFormulaList)
	local tbSay = self.tbComposeList:MakeOptByProductName("��i", nItemIndex, szDescLink)
	local szTitle	= "<dec>"..szDescLink.."���: սʤף�ƻ��28-04-2009��24:00��31-05-2009.��ڼ䣬���������Ѽ���ʤ����Men r��u�������Ҫ�Ļ��������������Nho t��i.������������Щ��Ʒ��iB�u r��u��R��u nho����ȡ����ֵ�����͸����м�ֵ����Ʒ. ��Ҫ���ǣ����ƹ���������.";
	
	
	tinsert(tbSay , 1, szTitle);
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
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
