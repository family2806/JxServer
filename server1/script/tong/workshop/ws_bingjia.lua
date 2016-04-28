Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelScale = {}
aLevelStoneValue = {}
aLevelLingPaiPrice	=	{};		--BossÕÙ»½·ûµÈ¼¶°ï»á×Ê½ğĞèÇó
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\bingjia_level_data.txt", "bingjiaLevelData")
	if b1~=1 then
		print("§äc tÖp config binh gi¸p ph­êng thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("bingjiaLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "OUTPUT_COEF"))
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "SCALE"))
		aLevelStoneValue[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "STONE_VALUE"))	
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LINGPAI_PRICE"))
	end
	--TabFile_UnLoad("bingjiaLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
	if MODEL_GAMESERVER == 1 then	--GAMESERVER ²ÅÓĞµÄ
		Include("\\script\\item\\techan_zijingao.lua");
	end;

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n Binh gi¸p ph­êng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"NhËn TrÊn bang chi th¹ch/#use_g_1".."("..nTongID..","..nWorkshopID..")",
		"ChÕ t¹o trang bŞ/#use_g_2".."("..nTongID..","..nWorkshopID..")",
	}
	
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "NhËn Tö kim cµo/#use_zijingao("..nTongID..","..nWor);
	elseif(GetProductRegion() == "vn") then
		tinsert(aryszContent, "NhËn lÖnh bµi gäi Boss/#use_g_4_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "Kh«ng cÇn ®©u/cancel");
	
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ÏëÖÆÔìÉñÃØÀûÆ÷ , ³ıÁËĞèÒª±ØĞëµÄ²ÄÁÏ£¬»¹ĞèÒªÕòÅÉÖ®Ê¯¡£ÕòÅÉÖ®Ê¯Îª¿ÉÒÔÎüÊÕÌìµØÁéÆø£¬ÈÕÔÂ¾«»ªµÄÎïÆ·£¬¿ÉÒÔÌá¸ß³É¹¦µÄ¸ÅÂÊ¡£!", 
		getn(aryszContent), 
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------
--//////////////////
--×Ï½ğ¸ä
--Ã¿´Î¹ºÂò8giê (8*60)£¬Ê±¼ä¼Çµ½TaskID1739
--µ±½ÇÉ«ÔÚÌÒ»¨µºÊ±£¬ÓĞ³ÌĞò¸øÓëÍÚ³öµÄÎïÆ·£¬²¢¿Û³ıÊ±¼ä£¬Í¬ÆÕÍ¨¿ó¸ä


function use_zijingao(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º¡°±ø¼×³öÆ·£¬±ØÊô¼ÑÆ·£¡¡±Õâ¾ä»°ÄãÌı¹ıÃ´£¿¸Ã×Ï½ğ¸äÄÜÈÃÄãÔÚÌÒ»¨µºÉÏÍÚ¿ó£¬Ëü±ÈÌÒ»¨ÒşÊ¿¶µÊÛµÄÆÕÍ¨¿ó¸ä¸ü¼á¹ÌÓë¸ü·æÀû£¬ËüÄÜÈÃÄãÍÚµÃ¸üÉî¸ü¿ì¸üÊ¡Á¦£¬¸üÓĞ¿ÉÄÜÍÚµ½6¼¶ÒÔÉÏµÄĞş¾§ÓëÉñÃØ¿óÊ¯µÈÆÕÍ¨¿ó¸äËùÍÚ²»µ½µÄ¿óÊ¯¡£Ã¿Ò»¸ö×Ï½ğ¸ä¾ù¿ÉÊ¹ÓÃ8giê £¬ÏÖÔÚÒ»¸ö×Ï½ğ¸äÖ»Òª»¨·Ñ<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color> ®iÓm cèng hiÕn, ng­¬i ®ång ı kh«ng?", 4,
	"<#>TiÕp nhËn 1 Tö Kim Cµo/#bj_sure2zijingao("..nTongID..","..nWorkshopID..")",
	"<#>Tra xem thêi gian cßn l¹i cña Tö Kim Cµo/bj_checktime_zijin",
	"<#> T×m hiÓu Tö Kim Cµo/bj_help_zijigao",
	"<#>Rêi khái/cancel")
end

function bj_help_zijigao()
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng£ºÄã¿ÉÒÔÊ¹ÓÃ×Ï½ğ¸äÔÚÌÒ»¨µºÉÏÍÚ¿ó£¬×Ï½ğ¸äËùÄÜÍÚµ½µÄ¿óÊ¯µÈ¼¶±ÈÆÕÍ¨¿ó¸äÒª¸ß£¬µ«Òª×¢ÒâµÄÊÇ×Ï½ğ¸äÓëÆÕÍ¨µÄ¿ó¸ä²»ÄÜÒ»ÆğÊ¹ÓÃ£¬µ±ÄãÍ¬Ê±ÓµÓĞÁ½ÕßÊ±£¬»áÏÈÏûºÄÍê×Ï½ğ¸äµÄÊ±¼ä£¬Ö®ºó²ÅÏûºÄÆÕÍ¨¿ó¸äµÄÊ±¼ä¡£", 0)
end

function bj_sure2zijingao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º¶Ô²»Æğ£¬ÄúËùÔÚ°ï»áµÄ±ø¼×·»Ä¿Ç°´¦ÓÚÔİÍ£×´Ì¬¡£±ØĞë°ï»á½«Õ½±¸»ù½ğµÄÊıÄ¿Ôö¼Óµ½ÖÜÎ¬»¤Õ½±¸»ù½ğÒÔÉÏ£¬²ÅÄÜÔÚµ±ÈÕÍí24£º00ÖØĞÂ¿ªÆô×÷·»¡£", 0)
		Msg2Player("<#>T¸c Ph­êng t¹m ng­ng ho¹t ®éng, chøc n¨ng nµy kh«ng thÓ sö dông.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£ºÄãÁ¬°ï»á¶¼Ã»Èë£¬À´Õâ¸ÉÂğ£¿", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--»ñµÃÊ¹ÓÃµÈ¼¶
	if (nUseLevel < 7) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º¶Ô²»Æğ£¬ÄúËùÔÚ°ï»á±ø¼×·»µÄÊ¹ÓÃµÈ¼¶Ã»ÓĞ´ïµ½7¼¶£¬ÎŞ·¨»ñµÃ¸Ã°ï»áÌØ²ú¡£", 0)
		Msg2Player("<#>§¼ng cÊp sö dông cña t¸c ph­êng ch­a ®¹t cÊp 7 th× ch­a sö dông ®­îc.")
		return
	end
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_ZIJIGAO_CONTRIBUTION )) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º½ñÌìµÄ×Ï½ğ¸äÒÑ·Ö·¢Íê±Ï£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
		return
	end
	
	if (GetContribution() < VALUE_ZIJIGAO_CONTRIBUTION or AddContribution(-VALUE_ZIJIGAO_CONTRIBUTION) ~= 1)then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º¶Ô²»Æğ£¬ÄúµÄ¸öÈË¹±Ï×¶È²»×ã<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color> ®iÓm, kh«ng thÓ ®æi lÊy bang vËt.", 0)
		Msg2Player("<#>§iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ, kh«ng thÓ sö dông chøc n¨ng nµy.")
		return 0
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_ZIJIGAO_CONTRIBUTION ))
	nRestH, nRestM = addzijingao_main();
	Msg2Player("<#>B¹n ®· mua thµnh c«ng 1 Tö Kim Cµo, thêi gian sö dông cßn l¹i lµ "..nRestH.."giê "..nRestM.."phót.")
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng£ºÄú³É¹¦¹ºÂòÁËÒ»¸ö×Ï½ğ¸ä£¬ÄãÄ¿Ç°¿ÉÍÚ¿óÊ±¼äÎª"..nRestH.."giê "..nRestM.."phót.", 0)
end

function bj_checktime_zijin()
	local lasttime = GetTask(TASKID_TECHAN_ZIJINGAO)
	if (lasttime < 10) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º¶Ô²»Æğ£¬ÄúµÄ×Ï½ğ¸äÒÑ¾­ÆÆÀÃ²»¿°ÁË£¬Äú»¹ÊÇÂòÒ»Ğ©ĞÂµÄ°É£¡", 0)
	else
		local nRestH, nRestM = GetMinAndSec(lasttime)
		if (nRestH == 0) then
			Say("<#>Tæng qu¶n Binh gi¸p ph­êng£ºÄúµÄ×Ï½ğ¸ä»¹ÄÜÊ¹ÓÃ<color=yellow>"..nRestM.."<color> phót.", 0)
		else
			Say("<#>Tæng qu¶n Binh gi¸p ph­êng£ºÄúµÄ×Ï½ğ¸ä»¹ÄÜÊ¹ÓÃ<color=yellow>"..nRestH.."<color>giê <color=yellow>"..nRestM.."<color> phót.", 0)
		end
	end
end

-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;



--------
----------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£»î¶¯
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --³õÊ¼»¯¿ÉÁìÈ¡Ê¯Í·×Ü¼ÛÖµÁ¿
	return 1
end

function USE_R(nTongID, nWorkshopID, nUse)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (nUse ~= 4) then
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
			return 0
		end	
	else
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
			return 0
		end
		if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
			return 0
		end
		if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) ~= 1) then
			return 0
		end

		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
	end;
	return 1	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end


function use_g_1(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
			if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º½ñÌìµÄÕò°ïÖ®Ê¯ÒÑ·Ö·¢Íê±Ï£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
				return 0;
			end
			local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
			TWS_ApplyUse(nTongID, nWorkshopID, 1)
	else
			Talk(1,"","Thêi gian nhËn vËt phÈm lµ tõ 12h30 ®Õn 22h h»ng ngµy !")
			return
	end

end

function use_g_2(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng£ºÄã¿ÉÒÔÔÚÎÒÕâÀïÏâÇ¶×ÏÉ«×°±¸ºÍ´òÔì»Æ½ğ×°±¸£¬·ÅÈëÕò°ïÖ®Ê¯¿ÉÒÔÌá¸ß´òÔì³É¹¦µÄ»úÂÊºÍÌá¸ß×ÏÉ«×°±¸µÄÊôĞÔ£¡", 2, "B¾t ®Çu chÕ t¹o/#compound("..nTongID..","..
		nWorkshopID..",".."2)", "Kh«ng cÇn!/cancel")
end		

function use_g_3(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng£ºÊ¹ÓÃ»áĞÄ´òÔì£¬Äã¿ÉÒÔÏâÇ¶³ö¼«Æ·µÄ×ÏÉ«×°±¸£¬µ«µÃ»¨²»Ğ¡µÄ´ú¼Û£¡", 2, "B¾t ®Çu chÕ t¹o/#compound("..nTongID..","..
		nWorkshopID..",".."3)", "Kh«ng cÇn!/cancel")
end

function use_g_4_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: °ïÅÉ½¨ÉèµÈ¼¶´ïµ½<color=red>2<color> ²ÅÄÜÖÆÔìÕÙ»½BossÁîÅÆ!", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ÎŞÈ¨¹ÜÀí×÷·»£¬²»ÄÜÁìÈ¡ÁìÈ¡ÕÙ»½BossÁîÅÆ!", 0)
		return
	end
	_dbgMsg("Sè lÇn nhËn cßn l¹i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ½ñÌìÒÑ·¢ÍêÕÙ»½bossÁîÅÆÁË£¬Ã÷ÌìÔÙÀ´°É!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ĞèÒªÊ¹ÓÃ<color=water>"..aLevelLingPaiPrice[nLevel].."<color> v¹n ng©n s¸ch kiÕn thiÕt bang ®Ó nhËn 1 lÖnh bµi gäi Boss, ng­¬i ®ång ı kh«ng?", 2,
		"TiÕp nhËn/#use_g_4_ok2".."("..nTongID..","..nWorkshopID..")", "Hñy bá /cancel")
end

function use_g_4_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Ö»ÊÇÒÅº¶£¬°ï»á½¨ÉèÔ¤Ëã²»¹»£¬²»ÄÜÁìÈ¡!", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 4)
end


function compound(nTongID, nWorkshopID, nSel)
	TWS_ApplyUse(nTongID, nWorkshopID, nSel)
end

function _makefun(nTongID, nWorkshopID, nLevelStone)
	return nLevelStone.."cÊp/#stone("..nTongID..","..nWorkshopID..","..nLevelStone..")"
end

function USE_G_2(nTongID, nWorkshopID, nChose)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nChose == 1)then --Õò°ïÖ®Ê¯
		Sale(166, CURRENCYTYPE_CONTRIBUTION, aLevelScale[nLevel], "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
	elseif(nChose == 2)then --ÆÕÍ¨´òÔì
		FoundryItem(4)
	elseif(nChose == 3)then	--»áĞÄ´òÔì
		FoundryItem(2)
	elseif(nChose == 4) then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." tiªu tèn "..aLevelLingPaiPrice[nLevel].." v¹n ng©n s¸ch kiÕn thiÕt bang ®Ó ®æi lÊy 1 lÖnh bµi gäi Boss cÊp "..nLevel.."!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	end	
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("Gi¸ trŞ l­îng cßn l¹i"..nValue)
	local nLevel = GetItemLevel(nItemIdx)
	local nOutputValue = aLevelStoneValue[nLevel]
	if (nValue < nOutputValue)then
		CloseShop()
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng£º¶Ô²»Æğ£¬½ñÌìµÄÕò°ïÖ®Ê¯ÒÑ¾­Âô¹âÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡", 0)
		return 0
	end	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nOutputValue)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelStoneValue[nLevel]/10000)
	return 1
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
	local nScale  --µ±Ç°»»È¡Õò°ïÖ®Ê¯ÕÛ¿Û
	local dStoneCount	--µ±Ç°Ã¿ÈÕ»»È¡Õò°ïÖ®Ê¯×ÜÁ¿Ìá¸ß
	local nPrice  --µ±Ç°»»È¡bossÕÙ»½·ûµÄ½¨Éè»ù½ğ
	local dTokenCount	--µ±Ç°Ã¿ÈÕbossÕÙ»½·û²ú³ö×ÜÁ¿Ìá¸ß
	local nDoubleOdds  --µ±Ç°ÕÙ»½³ö2¸ö»Æ½ğBossµÄ¼¸ÂÊ
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dStoneCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
		else
			nScale = "--"
			dStoneCount = "--"
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ĞÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ĞÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextStoneCount, nNextPrice, dNextTokenCount,nNextDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éı¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"	
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --ÏÂ¼¶»»È¡Õò°ïÖ®Ê¯ÕÛ¿Û
		dNextStoneCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --ÏÂ¼¶Ã¿ÈÕ»»È¡Õò°ïÖ®Ê¯×ÜÁ¿Ìá¸ß
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --ÏÂ¼¶»»È¡bossÕÙ»½·ûµÄ½¨Éè»ù½ğ
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --ÏÂ¼¶Ã¿ÈÕbossÕÙ»½·û²ú³ö×ÜÁ¿Ìá¸ß
		nNextDoubleOdds = 160 - nCurLevel * 10 --ÏÂ¼¶ÕÙ»½³ö2¸ö»Æ½ğBossµÄ¼¸ÂÊ
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextStoneCount = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T¹m ngõng" elseif bOpen == 1 then state="<color=green>Khai më" else state="<color=red>§ãng cöa" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>\n"..
			"Sè l­îng trÊn bang chi th¹ch mçi ngµy t¨ng lªn: <color=gold>"..dStoneCount.."<color> lÇn\n"..		
			"Gi¸ ­u ®·i ®æi TrÊn Bang Chi Th¹ch: <color=gold>"..nScale.."<color> phÇn tr¨m\n"..
			"Sè lÖnh bµi gäi Boss t¹o ra mçi ngµy t¨ng lªn: <color=gold>"..dTokenCount.."<color> lÇn\n"..	
			"X¸c suÊt lÖnh bµi gäi ra Boss thø 2: <color=gold>1/"..nDoubleOdds.."<color>\n"..		
			"Ng©n s¸ch kiÕn thiÕt cÇn ®Ó ®æi lÖnh bµi gäi Boss: <color=gold>"..nPrice.." v¹n<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp sö dông kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng trÊn bang chi th¹ch mçi ngµy t¨ng lªn: <color=Violet>"..dNextStoneCount.."<color> lÇn\n"..	
			"§æi ®iÓm ­u ®·i TrÊn bang chi th¹ch: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"X¸c suÊt lÖnh bµi gäi ra Boss thø 2: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			"Ng©n s¸ch kiÕn thiÕt cÇn ®Ó ®æi lÖnh bµi gäi Boss: <color=Violet>"..nNextPrice.." v¹n<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Î´½¨Á¢<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng trÊn bang chi th¹ch mçi ngµy t¨ng lªn: <color=Violet>"..dNextStoneCount.."<color> lÇn\n"..	
			"§æi ®iÓm ­u ®·i TrÊn bang chi th¹ch: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"X¸c suÊt lÖnh bµi gäi ra Boss thø 2: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt cÇn ®Ó ®æi lÖnh bµi gäi Boss: <color=Violet>"..nNextPrice.." v¹n<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end
------------------------------
end