-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - HïngB¸ThiªnH¹Àñ¹ÙNPC¶Ô»°
-- ÎÄ¼şÃû¡¡£ºnpc_dailog.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-05-20 18:30:39

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\task\\system\\task_string.lua");

tbZhuHe = 
{
	[1] = 
	{
		szComposeTitle =  "§æi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "Hïng", tbProp = {6,1,2062,1}},
			{szName = "B¸", tbProp = {6,1,2063,1}},
			{szName = "Thiªn", tbProp = {6,1,2064,1}},
			{szName = "H¹", tbProp = {6,1,2065,1}},
			{szName = "§ång Cæ", tbProp = {6,1,2067,1}},
		},
		tbProduct = 
		{szName = "T©n B¶n Cæ", tbProp = {6,1,2068,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
	
	[2] = 
	{
		szComposeTitle =  "§æi",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "Hïng", tbProp = {6,1,2062,1}},
			{szName = "B¸", tbProp = {6,1,2063,1}},
			{szName = "Thiªn", tbProp = {6,1,2064,1}},
			{szName = "H¹", tbProp = {6,1,2065,1}},
			{szName = "Hoµng Kú", tbProp = {6,1,2066,1}},
		},
		tbProduct = 
		{szName = "T©n B¶n Kú", tbProp = {6,1,2069,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
}


tbBirthday0905.tbZhuHe = tbComposeListForJinNang:new("tbBirthday0905_Compose", tbZhuHe)
tbXinwu =
{
	[1] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "HïngĞÄ½£", tbProp = {6, 1, 2070, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="50Íò EXP (1 HïngĞÄ½£)",
			[1]	= {nExp = 500000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 500000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 500000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[2] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "B¸ÍõÇ¹", tbProp = {6, 1, 2071, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="200 Íò EXP (1 B¸ÍõÇ¹)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[3] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "Thiªn²Ğµ¶", tbProp = {6, 1, 2072, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="200 Íò EXP (1 Thiªn²Ğµ¶)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[4] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "H¹ÈÕ¹­", tbProp = {6, 1, 2073, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="300 Íò EXP (1 H¹ÈÕ¹­)",
			[1]	= {nExp = 3000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 3000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 3000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0
			else
				return 1
			end
			
		end
	},
	[5] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "HïngĞÄ½£", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B¸ÍõÇ¹", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			
		},
		tbProduct = 
		{
			szName="800 Íò EXP (5 HïngĞÄ½£ + 2 B¸ÍõÇ¹)",
			[1]	= {nExp = 8000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 8000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 8000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[6] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "HïngĞÄ½£", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B¸ÍõÇ¹", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thiªn²Ğµ¶", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="1200 Íò EXP (5 HïngĞÄ½£ + 2 B¸ÍõÇ¹ + 1 Thiªn²Ğµ¶)",
			[1]	= {nExp = 12000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 12000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 12000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[7] =
	{
		szFailMsg = "Sè l­îng kh«ng ®ñ, tËp hîp cho ®ñ råi quay l¹i nhĞ!",
		tbMaterial = 
		{
			[1]	= {szName = "HïngĞÄ½£", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B¸ÍõÇ¹", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thiªn²Ğµ¶", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
			[4]	= {szName = "H¹ÈÕ¹­", tbProp = {6, 1, 2073, 1, 0, 0}, nCount = 1},
			
		},
		tbProduct = 
		{
			szName="2000 Íò EXP (5 HïngĞÄ½£+2 B¸ÍõÇ¹+1 Thiªn²Ğµ¶+1 H¹ÈÕ¹­)",
			[1]	= {nExp = 20000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 20000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 20000000 > 1000000000) then
				Msg2Player("§¹i hiÖp ®· nhËn ®­îc kinh nghiÖm giíi h¹n cao nhÊt råi, kh«ng thÓ tiÕp tôc nhËn thªm n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},	
}

function tbBirthday0905:OnDailogMain2(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbZhuHe then
--		
--	end

	local szTitle = format("Ho¹t ®éng “Chµo mõng phiªn b¶n míi” diÔn ra tõ %s ®Õn %s. Ng­¬i muèn t×m hiÓu ho¹t ®éng nµo?", "19/06/2009", "19/07/2009");
	
	local tbSay = self.tbZhuHe:MakeOptByProductName("ÔÚH¹Ïë§æi", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay)
end

tbBirthday0905.tbXinwu = tbComposeListForJinNang:new("tbBirthday0905_Compose_chuangguan", tbXinwu)
function tbBirthday0905:OnDailogMain3(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbXinwu then
--		
--	end

	local szTitle = "¿ªÃÅĞÅÎï»î¶¯´Ó 19/06/2009 µ½ 24:00 19/07/2009.ÔÚ´ËÆÚ¼ä¸÷Î»¿ÉÒÔÍ¨¹ıÔÚĞÅÊ¹´¦´³¹ØÊÕ¼¯HïngĞÄ½£, B¸ÍõÇ¹, Thiªn²Ğµ¶, H¹ÈÕ¹­µÈĞÅÎï. ÓÃÕâĞ©ĞÅÎïÀ´»»È¡Ğí¶àÓÕÈËµÄ½±Àø.";
	
	local tbSay = self.tbXinwu:MakeOptByProductName("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay)
end

function tbBirthday0905:GetJinnang()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng­¬i ch­a ®ñ ®iÒu kiÖn ®Ó nhËn vËt phÈm nµy")
		return
	end
	
	if self.tbTask:if_taked_jinnang() ~= 0 then
		Say("LÔ Quan"..":".."Ta nhí kh«ng nhÇm th× ng­¬i ®· nhËn råi?",1, "ThËt ng¹i qu¸! T¹i h¹ quªn mÊt./OnCancel")
		return 
	end
	local tbItem = {szName="CÈm nang sù kiÖn", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.tbTask.item_expiredtime1, tbParam = {self.tbTask.item_expiredtime1, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Birthday0905")
	self.tbTask:set_task(self.tbTask.tsk_jinnangsj,1);
end


function tbBirthday0905:OnDailogMain4()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	local tbSay = {};
	local szTitle = format(" {{²¶·Ê´Ìâ¬}}»î¶¯ ´Ó %s  µ½ %s. ÔÚ´ËÆÚ¼äÄúÊäÈë{{·Ê´Ìâ¬} ¾Í½«»ñµÃÒ»Ğ©ÓÕÈËµÄ½±Àø. {{·Ê´Ìâ¬} ³öÏÖÔÚ7¸ö´ó³ÇÊĞºÍ8¸öĞÂÊÖ´å. Ã¿Thiªn×î¶àÖ»ÄÜ²¶20Ö»{{·Ê´Ìâ¬}.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay);
end


function tbBirthday0905:OnDailogMain5()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
	end
	local tbSay = {};
	local szTitle = format(" {{ĞÂÊÖ°ïÖú}}»î¶¯´Ó %s µ½ %s. ÔÚ´ËÆÚ¼ä1-79µÄÓ¢Hïng¿ÉÒÔÔÚNPCµÄ8¸öĞÂÊÖ´å {{Õ½ĞÄ×ğÕß}} ½Ó½üÀñ¹Ù½ÓÊÜ {{ĞÂÊÖ°ïÖú}} Í¬Ê±²Î¼Ó {{²¶·Ê´Ìâ¬}}»î¶¯. ²Î¼ÓĞÂÊÖ°ïÖú»î¶¯¿ÉÒÔÊ¹¸÷Î»ÔÚ½­ºşÉÏĞĞÏÀ¸ü¼ÓË³Àû","19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay);
end

