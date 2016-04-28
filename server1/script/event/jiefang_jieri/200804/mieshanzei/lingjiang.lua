-- ÎÄ¼şÃû¡¡£ºlingjiang.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-14 14:34:01

-- °ÑThiÕt Ng­u Lang Nha Béiµ½¸÷ĞÂÊÖ´åµÄÀñ¹ÙNPC ³ö¶Ò»»½±Àø¡£
-- ½±Àø°üÀ¨£ºÒ»ÕÅNg©n phiÕu chiÕn bŞ+1¸ö8Ğş¾§+ÏÂÃæÎïÆ·ÁĞ±íÖĞµÄËæ»úÒ»¸ö

Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_mieshanzei = {}

jiefang_0804_mieshanzei.szName = "jiefang_0804_mieshanzei"

jiefang_0804_mieshanzei.tbRecipe = 
{
	tbItemList = 
	{
		{szName="ThiÕt Ng­u Lang Nha Béi", tbProp={6, 1, 1733}, nCount = 1},		
	},
	nMoney = 0,
	tbAwardItem = 
	{
		[1] = {szName="Ng©n phiÕu chiÕn bŞ", tbProp={6, 1, 1732, 1, 0, 0}, nExpiredTime = 20090111},
		[2] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 8", tbProp={6, 1, 147, 8, 0, 0}},
		[3] = {
			{szName="§éng S¸t B¹ch Kim §iªu Long Giíi", nQuality=1, tbProp={0, 143},nRate = 25},
			{szName="§éng S¸t B¹ch Ngäc Cµn Kh«n Béi", nQuality=1, tbProp={0, 144},nRate = 25},
                     {szName="§éng S¸t B¹ch Kim Tó Phông Giíi", nQuality=1, tbProp={0, 145},nRate = 25},
			{szName="§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn", nQuality=1, tbProp={0, 146},nRate = 25},
		}
	},
}

function jiefang_0804_mieshanzei:main()
	local tbSay = 
	{
		"<dec><npc>½ñÈÕ£¬Ò»ÅúÉ½Ôô³£³£µ½´åÕòÈ¥É§ÈÅ°ÙĞÕ£¬Çé¿öÈÕÒæÑÏÖØ£¬¸÷Î»´óÏÀ³öÁ¦¸Ï×ßÉ½Ôô. ÓĞ»ú»á¼ñµ½<color=yellow>ThiÕt Ng­u Lang Nha Béi<color> ÔÚÉ½ÔôÉíÉÏ, ´ËÍâÀÏ·ò»¹ÓĞºñÀñÏàÔù.",
		format("ÎÒ¼ñµ½ThiÕt Ng­u Lang Nha Béi/#%s:Compose()", self.szName),
		"KÕt thóc ®èi tho¹i/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_mieshanzei:Compose()
	local szMsg = "§¹i hiÖp xin h·y nhanh chãng tham gia ®éi ngò tiªu diÖt s¬n tÆc?"
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose(szMsg, tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "§¹i hiÖp ®· cã thµnh tİch rÊt xuÊt s¾c trong viÖc ®¸nh ®uæi s¬n tÆc, xin h·y nhËn lÊy phÇn th­ëng nµy?", 0)
end
