Include("\\script\\lib\\compose_jinnang.lua")

Include("\\script\\lib\\string.lua")

local hongbao_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>ֻ����Щԭ���ǲ��ܶһ���������ģ��㻹����ȥ��ԭ���ҹ���.<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="��", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 3},
			{szName="»", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 3},
			{szName="��", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 3},
			{nJxb = 8e4}
		},
		tbProduct = 
		{
			szName="�������", tbProp={6, 1, 1892, 1, 0, 0}, nExpiredTime = 20090223,
		},
	},
	[2] =
	{
		szFailMsg = "<color=red>ֻ����Щԭ���ǲ��ܶһ���������ģ��㻹����ȥ��ԭ���ҹ���!<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="��", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 2},
			{szName="»", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 2},
			{szName="��", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 2},
			{szName="�̱���",tbProp={6, 1, 1891, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="���ƺ��", tbProp={6, 1, 1893, 1, 0, 0}, nExpiredTime = 20090223,
		}
	},
}

function newyear0901_hongbao_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	
	if (newyear0901_hongbao_IsActDate() ~= 1) then
		return Talk(1, "", "�������.")
	end
	
	tbFormulaList = tbFormulaList or %hongbao_tbFormulaList
	newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_hongbao_Compose:MakeOptByProductName("���뻻", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."����ѹ��Ǯ�����16-01-2009��15-02-2009. ��ڼ䣬Ҫ�õ��������־�Ҫ�ռ������䣻�ռ��챦����Եõ�»�֡�������������Щ�ֶһ���������ͷ��ƺ������ȡ����ͱ���м�ֵ����Ʒ.");
	tinsert(tbSay , getn(tbSay)+1, "�����Ի�OnCancel");
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


--ֻ�ڶԻ�ʱ����һ��
function newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_hongbao_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_hongbao_Compose", tbFormulaList)
	end
end
