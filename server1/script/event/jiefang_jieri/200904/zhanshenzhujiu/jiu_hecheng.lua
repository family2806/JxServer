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
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			{szName="Bao g¹o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N­íc tinh khiÕt", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r­îu", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{nJxb=30000},
		},
		tbProduct = 
		{
			szName="BÇu r­îu",	tbProp={6, 1, 2013, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
	[2] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			{szName="Bao g¹o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N­íc tinh khiÕt", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r­îu", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{szName="Nho t­¬i", 	tbProp={6, 1, 2007, 1, 0, 0}, nCOunt = 1},
		},
		tbProduct = 
		{
			szName="R­îu nho",	tbProp={6, 1, 2014, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
}

function tbJiefang0904_jiu:OnDailogMain(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.")
	end
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	self:MakeComposeClas(%tbFormulaList)
	local tbSay = self.tbComposeList:MakeOptByProductName("§æi", nItemIndex, szDescLink)
	local szTitle	= "<dec>"..szDescLink.."Àñ¹Ù: Õ½Ê¤×£¾Æ»î¶¯´Ó28-04-2009µ½24:00£¬31-05-2009.»î¶¯ÆÚ¼ä£¬´óÏÀ¿ÉÒÔËÑ¼¯ºØÊ¤´ü£¬Men r­îu£¬Èç¹ûĞèÒªµÄ»°»¹¿ÉÔÚÆæÕä¸óÂòNho t­¬i.´óÏÀ¿ÉÒÔÓÃÕâĞ©ÎïÆ·§æiBÇu r­îuºÍR­îu nhoÀ´ÁìÈ¡¾­ÑéÖµ½±ÀøºÍ¸÷ÖÖÓĞ¼ÛÖµµÄÎïÆ·. µ«Òª½÷¼Ç£ºÒû¾Æ¹ı¶ÈÉËÉíÌå.";
	
	
	tinsert(tbSay , 1, szTitle);
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
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
