-- ÎÄ¼şÃû¡¡£ºhechengqizi.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-14 14:32:38

--10 M¶nh cê 1 + 6 M¶nh cê 2 + 3 M¶nh cê 3 + 1 M¶nh cê 4 + 3 ÍòÁ½	»ñµÃ£º1ÕÅL¸ Cê ChiÕn Th¾ng
--±»×¢£º- Ô­ÁÏ½«»áÔÚÍæ¼Ò±³°üÖÖ×Ô¶¯¿Û³ı¡£

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="M¶nh cê 1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="M¶nh cê 2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="M¶nh cê 3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="M¶nh cê 4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="L¸ Cê ChiÕn Th¾ng", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>´Ó26-04-2008µ½24h00 18-05-2008, ´ò¹Ö½«ËÑ¼¯µ½ÆìµÄËéÆ¬£¬¿ÉÒÔ´øÆìµÄËéÆ¬µ½ÀÏ·òÕâºÏ³ÉÍêÕûµÄL¸ Cê ChiÕn Th¾ng.",
		format("ÎÒÏëºÏ³ÉL¸ Cê ChiÕn Th¾ng/#%s:Compose()", self.szName),
		"Ta sÏ ghĞ l¹i sau/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("Tói hµnh trang ®· ®Çy, h·y dän dÑp hµnh trang ®Ó b¶o ®¶m an toµn cho vËt phÈm.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("ºÏ³É1ÃæL¸ Cê ChiÕn Th¾ng", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "Àñ¹Ù: ×£ºØ´óÏÀÒÑ¾­ºÏ³ÉÍêÕûµÄL¸ Cê ChiÕn Th¾ng!", 0)
end