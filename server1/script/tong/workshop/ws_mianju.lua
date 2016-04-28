Include("\\script\\tong\\workshop\\workshop_head.lua")
--Í­Ç®¼ÛÖµÁ¿=200W
aLevelOutputCoef = {}
aLevelScale = {}
aLevelContributionCoef = {}
aLevelCoinShop = {}
aLevelContributionShop = {}
WEIZHUANG_LEVEL = 5	--Î±×°Ãæ¾ßµÈ¼¶ÒªÇó
TEAMMASK_LEVEL = 3	--ChÕ t¹o mÆt n¹ ®éi ngòµÈ¼¶ÒªÇó
TONGMASK_LEVEL = 7	--ChÕ t¹o mÆt n¹ bang héiµÈ¼¶ÒªÇó
aPriceTeamMask = {}	--¶ÓÎéÃæ¾ßÑù×Ó¶ÔÓ¦µÄ¼Û¸ñ
aPriceTongMask = {} --°ï»áÃæ¾ßÑù×Ó¶ÔÓ¦µÄ¼Û¸ñ
PRICEMASK_WEIZHUANG = 1000
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\mianju_level_data.txt", "mianjuLevelData")
	if b1~=1 then
		print("§äc tÖp config vÒ t¸c ph­êng mÆt n¹ thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("mianjuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("mianjuLevelData", y, "LEVEL"))
		aLevelCoinShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "COIN_SHOP"))
		aLevelContributionShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_SHOP"))		
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "SCALE"))
		aLevelOutputCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "OUTPUT_COEF"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_COEF"))
	end
	--TabFile_UnLoad("mianjuLevelData")
	--·ÇRelay¶Ë¼ÓÔØFeatureÅäÖÃÎÄ¼ş
	if MODEL_RELAY ~= 1 then
		b1 = TabFile_Load("\\settings\\item\\feature_data.txt", "FeatureData")
		if b1~=1 then
			print("§äc tÖp config feature_data thÊt b¹i!")
			return
		end
		nRowCount = TabFile_GetRowCount("FeatureData")
		for y = 2, nRowCount do
			local nFeature = tonumber(TabFile_GetCell("FeatureData", y, "FEATURE"))
			aPriceTeamMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TEAM_MASK_PRICE"))		
			aPriceTongMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TONG_MASK_PRICE"))		
		end
	end
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n DŞ dung ph­êng") ~= 1 then
		return 0
	end
	Say("<#>Tæng qu¶n DŞ dung ph­êng£º¿´ÎÒÆßÊ®¶ş±ä£¡Ö»ÓĞÏë²»µ½£¬Ã»ÓĞ±ä²»ÁË¡£\n¸÷Ê½Ãæ¾ß£¬Ó¦ÓĞ¾¡ÓĞ£¬À´¿´¿´ÂŞ£¡", 3, "Ta muèn xem thö /#use_g_1_ok("..nTongID..","..nWorkshopID..")", 
		"MÆt n¹ ®Æc biÖt/#SpecialMask("..nTongID..","..nWorkshopID..")", "Kh«ng cÇn ®©u/cancel");
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬½ñÌìµÄÃæ¾ßÒÑ¾­Âô¹âÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
		return 0;
	end
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function SpecialMask(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÄãÒªÖÆ×÷Ê²Ã´Ãæ¾ß£¿", 4, "MÆt n¹ ngôy trang/#Mask_WeiZhuang("..nTongID..","..nWorkshopID..")",
		"MÆt n¹ Tæ ®éi/#Mask_Team("..nTongID..","..nWorkshopID..")", "MÆt n¹ Bang héi/#Mask_Tong("..nTongID..","..nWorkshopID..")",
		"Kh«ng cÇn ®©u/cancel")
end

function Mask_WeiZhuang(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < WEIZHUANG_LEVEL)then
		Say("Tæng qu¶n DŞ dung ph­êng£º×°±¸Î±×°Ãæ¾ß¿ÉÒÔ»ñµÃÎ±×°¼¼ÄÜ£¬¶Ô´÷ÓĞÃæ¾ßµÄÍæ¼ÒÊ¹ÓÃ´Ë¼¼ÄÜ¿ÉÒÔÎ±×°³ÉËûµÄÑù×Ó¡£²»¹ıÒªÊ¹ÓÃµÈ¼¶´ïµ½<color=red>"..WEIZHUANG_LEVEL.."<color> míi cã thÓ chÕ t¸c lo¹i mÆt n¹ nµy, hiÖn tai vÉn ch­a ®ñ cÊp ",
			1, "Lóc kh¸c ta quay l¹i vËy./cancel")
		return
	end
	Say("Tæng qu¶n DŞ dung ph­êng£º×°±¸Î±×°Ãæ¾ß¿ÉÒÔ»ñµÃÎ±×°¼¼ÄÜ£¬¶Ô´÷ÓĞÃæ¾ßµÄÍæ¼ÒÊ¹ÓÃ´Ë¼¼ÄÜ¿ÉÒÔÎ±×°³ÉËûµÄÑù×Ó¡£ÖÆ×÷Î±×°Ãæ¾ßµÃ»¨·Ñ<color=yellow>"..PRICEMASK_WEIZHUANG.."<color> ®iÓm cèng hiÕn, cã ®ång ı kh«ng?",
			2, "Mäi sù nhê tæng qu¶n vËy/#GetMask1("..nTongID..","..nWorkshopID..")", "Ta chØ hái qua cho biÕt/cancel")
end

function GetMask1(nTongID, nWorkshopID)
	if (GetContribution() < PRICEMASK_WEIZHUANG)then
		Say("Tæng qu¶n DŞ dung ph­êng£ºÄãµÄ¹±Ï×¶È²»¹»ÄØ£¬ÔÙ¶àÎª°ï»á×öĞ©ÊÂÇé°É",1,"Kh«ng ®ñ sao/cancel")
		return
	end	
	AddContribution(-PRICEMASK_WEIZHUANG)
	Say("Tæng qu¶n DŞ dung ph­êng£ºÎ±×°Ãæ¾ßµÄÏŞÊ±Ê±¼äÎª24¸öĞ¡Ê±£¬¿ÉÒÔÊ¹ÓÃ10´ÎÎ±×°¼¼ÄÜ¡£àÅ£¬Ëµ×ö¾Í×öºÃÁË£¬¹¤ÒÕºÜ´¿Êì°É",1,
			"Xin ®a t¹, ta ®i thö ngay ®©y/cancel")
	AddItem(0,11,366,1,0,0)		
	Msg2Player("B¹n nhËn ®­îc mét mÆt n¹ ngôy trang")
end

function Mask_Team(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TEAMMASK_LEVEL)then
		Say("Tæng qu¶n DŞ dung ph­êng£º¶ÓÎéÃæ¾ß¿ÉÒÔÓÉ¶Ó³¤ºÍ¶ÓÔ±ÓÒ¼üµã»÷Ê¹ÓÃ£¬Ê¹ÓÃºó¶ÓÎé³ÉÔ±¶¼±ä³ÉÍ¬Ò»Ä£ÑùÒ»¶ÎÊ±¼ä¡£²»¹ıÒªÊ¹ÓÃµÈ¼¶´ïµ½<color=red>"..TEAMMASK_LEVEL.."<color> míi cã thÓ chÕ t¸c lo¹i mÆt n¹ nµy, hiÖn vÉn ch­a ®ñ cÊp",
			1, "Lóc kh¸c ta quay l¹i vËy./cancel")
		return
	end
	Say("Tæng qu¶n DŞ dung ph­êng£º¶ÓÎéÃæ¾ß¿ÉÒÔÓÉ¶Ó³¤ºÍ¶ÓÔ±ÓÒ¼üµã»÷Ê¹ÓÃ£¬Ê¹ÓÃºó¶ÓÎé³ÉÔ±¶¼±ä³ÉÍ¬Ò»Ä£ÑùÒ»¶ÎÊ±¼ä¡£ÖÆ×÷¶ÓÎéÃæ¾ßµÃ»¨·ÑÒ»¶¨µÄ¹±Ï×¶È£¬»¹µÃ·ÅÈëÒ»¸öÃæ¾ß·»²ú³öµÄÃæ¾ß×öÄ£¾ß£¬×÷³öµÄ¶ÓÎéÃæ¾ß¾ÍÊÇ·ÅÈëÃæ¾ßµÄÑù×Ó£¬ÄãĞèÒªÂğ£¿",
			2, "Mäi sù nhê tæng qu¶n vËy/#GetMask2("..nTongID..","..nWorkshopID..")", "Ta chØ hái qua cho biÕt/cancel")
end

function Mask_Tong(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TONGMASK_LEVEL)then
		Say("Tæng qu¶n DŞ dung ph­êng£º°ï»áÃæ¾ß¿ÉÒÔÓÉ°ïÖ÷ºÍ³¤ÀÏÓÒ¼üµã»÷Ê¹ÓÃ£¬Ê¹ÓÃºó°ï»á³ÉÔ±¶¼±ä³ÉÍ¬Ò»Ä£ÑùÒ»¶ÎÊ±¼ä¡£²»¹ıÒªÊ¹ÓÃµÈ¼¶´ïµ½<color=red>"..TONGMASK_LEVEL.."<color>míi cã thÓ chÕ t¸c lo¹i mÆt n¹ nµy, hiÖn vÉn ch­a ®ñ cÊp.",
			1, "Lóc kh¸c ta quay l¹i vËy./cancel")
		return
	end
	local nFigure = TONGM_GetFigure(nTongID, GetName())
	if (nFigure ~= TONG_MASTER and nFigure ~= TONG_ELDER)then
		Say("Tæng qu¶n DŞ dung ph­êng£º°ïÀïµÄ¹æ¾ØÊÇÖ»ÓĞ°ïÖ÷ºÍ³¤ÀÏÃÇ²ÅÄÜÀ´ÈÃÎÒÖÆ×÷°ï»áÃæ¾ß£¬ÄãµÄÉí·İ»¹²»¹»ÄØ¡£", 1, 
			"ThËt lµ tiÕc qu¸/cancel")
		return
	end
	Say("Tæng qu¶n DŞ dung ph­êng£º°ï»áÃæ¾ß¿ÉÒÔÓÉ°ïÖ÷ºÍ³¤ÀÏÓÒ¼üµã»÷Ê¹ÓÃ£¬Ê¹ÓÃºó°ï»á³ÉÔ±¶¼±ä³ÉÍ¬Ò»Ä£ÑùÒ»¶ÎÊ±¼ä¡£ÖÆ×÷°ï»áÃæ¾ßµÃ»¨·ÑÒ»¶¨µÄ¹±Ï×¶È£¬»¹µÃ·ÅÈëÒ»¸öÃæ¾ß·»²ú³öµÄÃæ¾ß×öÄ£¾ß£¬×÷³öµÄ°ï»áÃæ¾ß¾ÍÊÇ·ÅÈëÃæ¾ßµÄÑù×Ó£¬ÄãĞèÒªÂğ£¿",
			2, "Mäi sù nhê tæng qu¶n vËy/#GetMask3("..nTongID..","..nWorkshopID..")", "Ta chØ hái qua cho biÕt/cancel")
end

--¶ÓÎéÃæ¾ß
function GetMask2(nTongID, nWorkshopID)
	GiveItemUI("ChÕ t¹o mÆt n¹ ®éi ngò","Tæng qu¶n DŞ dung ph­êng£ºÇë·ÅÈëÒ»¸öMÆt n¹ phæ th«ng×÷ÎªÄ£¾ß£¬ÖÆ×÷³É¹¦Ä£¾ß»áÏûºÄµô", "MakeMask2", "onCancel" );
end

--°ï»áÃæ¾ß
function GetMask3(nTongID, nWorkshopID)
	GiveItemUI("ChÕ t¹o mÆt n¹ bang héi","Tæng qu¶n DŞ dung ph­êng£ºÇë·ÅÈëÒ»¸öMÆt n¹ phæ th«ng×÷ÎªÄ£¾ß£¬ÖÆ×÷³É¹¦Ä£¾ß»áÏûºÄµô", "MakeMask3", "onCancel" );
end

--¶ÓÎéÃæ¾ß
function MakeMask2(nCount)		
	if(nCount <= 0) then
		Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÉ¶¶¼²»¸ø°³£¬ÄãÏë¸ÉÉ¶Ñ½£¿", 1, "Ha ha, ®ét nhiªn ta quªn mÊt./cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÄãÖ»Òª·ÅÒ»¸öÃæ¾ß×÷Ä£¾ß¾ÍĞĞÁË£¬·ÅÕâÃ´¶à¶«Î÷¸ÉÉ¶£¿", 1, "õm, ta biÕt råi/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --´íÎóµÀ¾ß
		Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÄã...Äã¸øÎÒµÄÊÇÃæ¾ßÂğ£¬ÎÒÃ»ÓĞÑÛ»¨°É£¿",1,"¤i, ta ®­a nhÇm råi, tr¶ l¹i cho ta./cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬Äã·ÅÈëµÄÃæ¾ß²»·ûºÏÒªÇó", 1, "Ta ®æi mét c¸i vËy./cancel")
		return
	end
	local nPrice = aPriceTeamMask[nFeature]
	if (not nPrice)then
		Say("Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬²»ÄÜÒÔ´ËÄ£¾ßÖÆ×÷¶ÓÎéÃæ¾ß", 1, "Ta ®æi mét c¸i vËy./cancel")
		return
	end	
	Say("Tæng qu¶n DŞ dung ph­êng£ºÒÔ´ËÄ£¾ßÖÆ×÷µÄ¶ÓÎéÃæ¾ßÒªÏûºÄ¹±Ï×¶È<color=yellow>"..nPrice.."<color> ®iÓm cèng hiÕn, nÕu ng­¬i ®ång ı th× ta sÏ ®éng thñ vËy.",
		2, "Lµm phiÒn tæng qu¶n råi./#TeamMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "§Ó ta suy nghÜ l¹i./cancel")
end

--°ï»áÃæ¾ß
function MakeMask3(nCount)		
	if(nCount <= 0) then
		Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÉ¶¶¼²»¸ø°³£¬ÄãÏë¸ÉÉ¶Ñ½£¿",1, "Ha ha, ®ét nhiªn ta quªn mÊt./cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÄãÖ»Òª·ÅÒ»¸öÃæ¾ß×÷Ä£¾ß¾ÍĞĞÁË£¬·ÅÕâÃ´¶à¶«Î÷¸ÉÉ¶£¿",1, "õm, ta biÕt råi/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --´íÎóµÀ¾ß
		Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÄã...Äã¸øÎÒµÄÊÇÃæ¾ßÂğ£¬ÎÒÃ»ÓĞÑÛ»¨°É£¿",1,"¤i, ta ®­a nhÇm råi, tr¶ l¹i cho ta./cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬Äã·ÅÈëµÄÃæ¾ß²»·ûºÏÒªÇó", 1, "Ta ®æi mét c¸i vËy./cancel")
		return
	end
	local nPrice = aPriceTongMask[nFeature]
	if (not nPrice)then
		Say("Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬²»ÄÜÒÔ´ËÄ£¾ßÖÆ×÷°ï»áÃæ¾ß", 1, "Ta ®æi mét c¸i vËy./cancel")
		return
	end	
	Say("Tæng qu¶n DŞ dung ph­êng£ºÒÔ´ËÄ£¾ßÖÆ×÷µÄ°ï»áÃæ¾ßĞèÒªÏûºÄ°ï»á½¨Éè»ù½ğ<color=yellow>"..nPrice.."<color> ®iÓm cèng hiÕn, nÕu ng­¬i ®ång ı th× ta sÏ ®éng thñ vËy.",
		2, "Lµm phiÒn tæng qu¶n råi./#TongMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "§Ó ta suy nghÜ l¹i./cancel")
end

function TeamMaskMake(nFeature, nPrice, nItemIdx)
	if (GetContribution() < nPrice)then
		Say("Tæng qu¶n DŞ dung ph­êng£ºÒÔÕâÖÖÃæ¾ßÎªÄ£¾ßÖÆ×÷¶ÓÎéÃæ¾ßĞèÒª<color=yellow>"..nPrice.."<color> ®iÓm cèng hiÕn. §iÓm cèng hiÕn cña ng­¬i kh«ng ®ñ, h·y gãp søc cho bang héi tr­íc ®·.",
			1,"Kh«ng ®ñ sao/cancel")
		return
	end
	--ÔÙ´Î¼ì²éitem
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --´íÎóµÀ¾ß
		Msg2Player("MÆt n¹ mÉu cña ng­¬i ®©u?:W")
		return
	end
	--É¾³ıÔ­ÁÏ
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("MÆt n¹ mÉu cña ng­¬i ®©u?:W")
		return
	end	
	Say("Tæng qu¶n DŞ dung ph­êng£º¶ÓÎéÃæ¾ß¿ÉÒÔ°Ñ¶ÓÎéÈ«Ìå³ÉÔ±±ä³ÉÍ¬Ò»Ä£Ñù2¸öĞ¡Ê±¡£àÅ£¬Ëµ×ö¾Í×öºÃÁË£¬¹¤ÒÕºÜ´¿Êì°É",
		1, "Xin ®a t¹, ta ®i thö ngay ®©y/cancel")		
	local nIdx = AddItem(6,1,1108,1,0,0)
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	AddContribution(-nPrice)
	Msg2Player("NhËn ®­îc mét mÆt n¹ ®éi ngò")
end

function TongMaskMake(nFeature, nPrice, nItemIdx)
	local _,nTongID = GetTongName()
	if (nTongID == 0)then
		return
	end
	if (TONG_GetBuildFund(nTongID) < nPrice)then
		Say("Tæng qu¶n DŞ dung ph­êng£ºÒÔÕâÖÖÃæ¾ßÎªÄ£¾ßÖÆ×÷°ï»áÃæ¾ßĞèÒª<color=yellow>"..nPrice.."<color> ®iÓm ng©n s¸ch kiÕn thiÕt. Ng©n s¸ch kiÕn thiÕt kh«ng ®ñ!",
			1,"Kh«ng ®ñ sao/cancel")
		return
	end
	--ÔÙ´Î¼ì²éitem
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --´íÎóµÀ¾ß
		Msg2Player("MÆt n¹ mÉu cña ng­¬i ®©u?:W")
		return
	end
	--É¾³ıÔ­ÁÏ
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("MÆt n¹ mÉu cña ng­¬i ®©u?:W")
		return
	end		
	Say("Tæng qu¶n DŞ dung ph­êng£º°ï»áÃæ¾ß¿ÉÒÔ°Ñ°ï»áÈ«ÌåÔÚÏß³ÉÔ±±ä³ÉÍ¬Ò»Ä£Ñù3¸öĞ¡Ê±¡£àÅ£¬Ëµ×ö¾Í×öºÃÁË£¬¹¤ÒÕºÜ´¿Êì°É",
		1, "Xin ®a t¹, ta ®i thö ngay ®©y/cancel")
	local nIdx = AddItem(6,1,1109,1,0,0)
	if (nIdx <= 0) then return end
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	TONG_ApplyAddBuildFund(nTongID, -nPrice)
	local szMsg = GetName().." tiªu hao "..nPrice.." v¹n ng©n s¸ch kiÕn thiÕt bang ®Ó chÕ t¹o mÆt n¹ bang h«i."
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddEventRecord(nTongID, szMsg)
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£»î¶¯
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelOutputCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal)
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
		return 0
	end
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_buy_1(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬½ñÌìµÄÃæ¾ßÒÑ¾­Âô¹âÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelScale[nLevel]	
	Sale(aLevelCoinShop[nLevel], CURRENCYTYPE_COIN, nScale, "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function use_buy_2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬½ñÌìµÄÃæ¾ßÒÑ¾­Âô¹âÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelContributionCoef[nLevel] --Ö±½ÓÓÃ¹±Ï×¶ÈµÈ¼¶ÏµÊı×÷´òÕÛÏµÊı
	Sale(aLevelContributionShop[nLevel], CURRENCYTYPE_CONTRIBUTION, nScale, "BuyCallBack2(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("Sè nhËp vµo cßn l¹i *100: "..nValue)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬½ñÌìµÄÃæ¾ßÒÑ¾­Âô¹âÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	--Í­Ç®´òÕÛ»¨·Ñ¹±Ï×¶È=Ãæ¾ßÔ­¼Û*(1-´òÕÛÏµÊı)*1Í­Ç®µÄ¼ÛÖµÁ¿/10000*¹±Ï×¶ÈµÈ¼¶ÏµÊı
	local nContribution = (nPrice - floor(aLevelScale[nLevel]/100*nPrice))*200*aLevelContributionCoef[nLevel]/100
	if (GetContribution() < nContribution)then
		CloseShop()
		Msg2Player(format("§iÓm cèng hiÕn kh«ng ®ñ, cÇn ph¶i cã %d ®iÓm cèng hiÕn!", nContribution))
		return 0
	end
	AddContribution(-nContribution)
	Msg2Player(format("§­îc ­u ®·i nªn chØ tiªu hao %d ®iÓm cèng hiÕn!", nContribution))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nContribution)
	return 1
end

function BuyCallBack2(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>Tæng qu¶n DŞ dung ph­êng£º¶Ô²»Æğ£¬½ñÌìµÄÃæ¾ßÒÑ¾­Âô¹âÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nPrice)
	return 1
end

function USE_G_2(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n DŞ dung ph­êng£ºÒ»°ãµÄÃæ¾ßÊÇÔÛÃÇ°ï»á×ÔÖÆµÄ£¬ÓÃ¹±Ï×¶È¾Í¿ÉÒÔ»»È¡£»ÖÆ×÷¾«ÃÀµÄÃæ¾ßÊÇ·ÂÖÆÒ×ÈİÊõÊ¿ÊÖ·¨µÄ£¬ÒªÓÃÍ­Ç®¹ºÂò£¬²»¹ı»áÓĞÕÛ¿ÛÅ¶£¡", 2, 
		--"Í­Ç®¹ºÂò/#use_buy_1("..nTongID..","..nWorkshopID..")", 
		"Dïng ®iÓm cèng hiÕn ®Ó ®æi/#use_buy_2("..nTongID..","..nWorkshopID..")", 
		"Kh«ng mua ®©u/cancel");
end

function cancel()
end

else
-----------------Èç¹ûÊÇ¿Í»§¶Ë---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh«ng cã bang héi"
	end
	local bOpen	--ÊÇ·ñ¿ªÆô
	local bPause --ÊÇ·ñÔİÍ£
	local nCurLevel --µ±Ç°µÈ¼¶
	local nUseLevel --µ±Ç°Ê¹ÓÃµÈ¼¶
	local nOpenFund --µ±Ç°¿ªÆôÏûºÄ
	local nMaintainFund --µ±Ç°Î¬»¤ÏûºÄ
	local szCoinMask = {"--","MÆt n¹ phæ th«ng","MÆt n¹ Boss s¸t thñ","MÆt n¹ Boss ®¹i Hoµng Kim","MÆt n¹ Boss ®¹i Hoµng Kim","MÆt n¹ trung niªn","MÆt n¹ thanh niªn","MÆt n¹ thiÕu niªn","MÆt n¹ anh hïng","MÆt n¹ ngµy xu©n","MÆt n¹ ngµy xu©n"} --µ±Ç°Í­Ç®ÄÜÂòµÄÃæ¾ßÖÖÀà
	local nContriMask --µ±Ç°¹±Ï×¶ÈÄÜÂòµÃÃæ¾ßÖÖÀà
	local nScale  --µ±Ç°¹ºÂòÃæ¾ßÓÅ»İ¶È
	local dMaskCount	--µ±Ç°Ã¿ÈÕÃæ¾ß²ú³ö×ÜÁ¿Ìá¸ß
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen) 
		if(nUseLevel > 0)then
			nContriMask = nUseLevel * 7
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel] / aLevelOutputCoef[1])	
		else
			nContriMask ="--"
			nScale = "--"
			dMaskCount = "--"			
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ĞÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ĞÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextMaskCount,szNextCoinMask,nNextContriMask
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éı¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		szNextCoinMask = szCoinMask[nUseLevel + 2]	--ÏÂ¼¶Í­Ç®ÄÜÂòµÄÃæ¾ßÖÖÀà
		nNextContriMask = (nUseLevel + 1) * 7	--ÏÂ¼¶¹±Ï×¶ÈÄÜÂòµÃÃæ¾ßÖÖÀà
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --ÏÂ¼¶¹ºÂòÃæ¾ßÓÅ»İ¶È
		dNextMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel + 1] / aLevelOutputCoef[1]) --ÏÂ¼¶Ã¿ÈÕÃæ¾ß²ú³ö×ÜÁ¿Ìá¸ß
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		szNextCoinMask = "--"
		nNextContriMask = "--"
		nNextScale = "--"
		dNextMaskCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T¹m ngõng" elseif bOpen == 1 then state="<color=green>Khai më" else state="<color=red>§ãng cöa" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>\n"..
			"S¶n l­îng mÆt n¹ s¶n xuÊt hµng ngµy t¨ng lªn: <color=gold>"..dMaskCount.."<color> lÇn\n"..		
			"§æi ®iÓm ­u ®·i mÆt n¹: <color=gold>"..nScale.."<color> phÇn tr¨m\n"..
			"TiÒn ®ång mua mÆt n¹ t¨ng lªn: <color=gold>"..szCoinMask[nUseLevel + 1].."<color>\n"..
			"Lo¹i mÆt n¹ dïng ®iÓm cèng hiÕn ®æi: <color=gold>"..nContriMask.."<color> lo¹i\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp sö dông kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng mÆt n¹ hµng ngµy t¨ng lªn: <color=Violet>"..dNextMaskCount.."<color> lÇn\n"..		
			"§æi ®iÓm ­u ®·i mÆt n¹: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"TiÒn ®ång mua mÆt n¹ t¨ng lªn: <color=Violet>"..szNextCoinMask.."<color>\n"..
			"Lo¹i mÆt n¹ dïng ®iÓm cèng hiÕn ®æi: <color=Violet>"..nNextContriMask.."<color> lo¹i\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Î´½¨Á¢<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng mÆt n¹ hµng ngµy t¨ng lªn: <color=Violet>"..dNextMaskCount.."<color> lÇn\n"..		
			"§æi ®iÓm ­u ®·i mÆt n¹: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"TiÒn ®ång mua mÆt n¹ t¨ng lªn: <color=Violet>"..szNextCoinMask.."<color>\n"..
			"Lo¹i mÆt n¹ dïng ®iÓm cèng hiÕn ®æi: <color=Violet>"..nNextContriMask.."<color> lo¹i\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end

end