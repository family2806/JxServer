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
		szFailMsg = "�������������ռ������ڻ�����!",
		tbMaterial = 
		{
			{szName="�״�", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="�ྻˮ", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="��ĸ", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{nJxb=30000},
		},
		tbProduct = 
		{
			szName="��«��",	tbProp={6, 1, 2013, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
	[2] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "�������������ռ������ڻ�����!",
		tbMaterial = 
		{
			{szName="�״�", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="�ྻˮ", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="��ĸ", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{szName="��������", 	tbProp={6, 1, 2007, 1, 0, 0}, nCOunt = 1},
		},
		tbProduct = 
		{
			szName="���Ѿ�",	tbProp={6, 1, 2014, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
}

function tbJiefang0904_jiu:OnDailogMain(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		return Talk(1, "", "�������.")
	end
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	self:MakeComposeClas(%tbFormulaList)
	local tbSay = self.tbComposeList:MakeOptByProductName("�һ�", nItemIndex, szDescLink)
	local szTitle	= "<dec>"..szDescLink.."���: սʤף�ƻ��28-04-2009��24:00��31-05-2009.��ڼ䣬���������Ѽ���ʤ������ĸ�������Ҫ�Ļ����������������������.������������Щ��Ʒ�һ���«�ƺ����Ѿ�����ȡ����ֵ�����͸����м�ֵ����Ʒ. ��Ҫ���ǣ����ƹ���������.";
	
	
	tinsert(tbSay , 1, szTitle);
	tinsert(tbSay , getn(tbSay)+1, "�����Ի�/OnCancel");
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
