--·£¶ñÊ¹
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")
--¶¨ÒåÈ«¾Ö±äÁ¿¼ÇÂ¼Íæ¼ÒÒª³Í·£ÄÇ¸ö³ÇÊÐ
nGlobalCityIndex = 0

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("Sè liÖu sai lÇm . ", 0)
		return
	end
	--¶ÁÈ¡´æÅÌÎÄ¼þ£¬±£Ö¤Ö»¶ÁÈ¡Ò»´Î
	loadsavevalue()
	
	local aryszContent = 
	{
		"<> Ph¹t ¸c khiÕn cho : Ta lµ trõng ph¹t ng­êi xÊu ®Ých sø gi¶ , ta cã thÓ gióp ng­¬i c¸i g× ?",
		"<> TuÇn tra c¸c Thµnh thÞ chiÕn c«ng /onchecknum",
		"<> Trõng ph¹t chiÕm lÜnh ph­îng t­êng bang héi /onpunish_fengxiang",
		"<> Trõng ph¹t chiÕm lÜnh thµnh ®« bang héi /onpunish_chengdu",
		"<> Trõng ph¹t chiÕm lÜnh §¹i Lý bang héi /onpunish_dali",
		"<> Trõng ph¹t chiÕm lÜnh biÖn kinh bang héi /onpunish_bianjing",
		"<> Trõng ph¹t chiÕm lÜnh t­¬ng d­¬ng bang héi /onpunish_xiangyang",	
		"<> Trõng ph¹t chiÕm lÜnh D­¬ng Ch©u bang héi /onpunish_yangzhou",
		"<> Trõng ph¹t chiÕm lÜnh tr­íc khi an bang héi /onpunish_linan",		
		"<> Ta ch¼ng qua lµ tíi ®i d¹o mét chót /oncancel",
	}
	
	--¿ÉÒÔ²»¿ÉÒÔÓÃÊý×éÀ´ÊµÏÖ
	local aryCallBackFun = {
		"/onpunish_fengxiang",
		"/onpunish_chengdu",
		"/onpunish_dali",
		"/onpunish_bianjing",
		"/onpunish_xiangyang",
		"/onpunish_yangzhou",
		"/onpunish_linan"
	}
	local nNum
	for nCityIndex=1, 7 do
		strTongName = GetCityOwner(nCityIndex)
		if (strTongName == nil or strTongName == "") then
			aryszContent[nCityIndex + 2] = "<>"..arraycityindextoname[nCityIndex].."§· v« bang, kh«ng thÓ tiÕn hµnh/oncancel"
		else
			nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
			aryszContent[nCityIndex + 2] = "<>Trõng ph¹t Bang héi"..strTongName.."chiÕm Thµnh"..arraycityindextoname[nCityIndex].."(ChiÕn c«ng:"..nNum..")"..aryCallBackFun[nCityIndex]
		end
	end	
	
	Say(aryszContent[1], 9,	aryszContent[2],aryszContent[3],aryszContent[4],aryszContent[5],aryszContent[6],aryszContent[7],aryszContent[8],aryszContent[9], aryszContent[10]);
end 

function onpunish()
	--¸ù¾ÝµØÍ¼Ë÷Òý³Í·£
	if (nGlobalCityIndex < 1) then
		Say("<> kh«ng cã muèn trõng ph¹t Thµnh thÞ ", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<> Thµnh thÞ <color=red>"..arraycityindextoname[nIndex].."<color> kh«ng ng­êi chiÕm lÜnh , kh«ng c¸ch nµo tiÕn hµnh trõng ph¹t ", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--´ò¿ª¸øÓë½çÃæ
	GiveItemUI( "§Ò giao ph¹t ¸c lµm ", "Trõng ph¹t Thµnh thÞ "..arraycityindextoname[nGlobalCityIndex]..", Thµnh thÞ chiÕm lÜnh bang héi "..strCityTongName..", tr­íc m¾t nªn thµnh ®Ých chiÕn c«ng v× :"..nNum, "onsubmitconfirm", "oncancel" )
end

function onconfirm(nIndex)
	local strCityTongName = GetCityOwner(nIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<> Thµnh thÞ <color=red>"..arraycityindextoname[nIndex].."<color> kh«ng ng­êi chiÕm lÜnh , kh«ng c¸ch nµo tiÕn hµnh trõng ph¹t ", 0)
		return
	end

	--¸øÈ«¾Ö±äÁ¿¸³Öµ
	nGlobalCityIndex = nIndex	
	strMsg={	
		"<> ChiÕm lÜnh <color=red>"..arraycityindextoname[nIndex].."<color> Thµnh thÞ ®Ých bang héi lµ :<color=red>"..strCityTongName.."<color>, ng­¬i nhÊt ®Þnh ph¶i sö dông ph¹t ¸c lµm sao ? ",
		"<> X¸c ®Þnh /onpunish",
		"<> Ta suy nghÜ mét chót n÷a /oncancel"		
	};
	
	Say(strMsg[1], 2, strMsg[2], strMsg[3]);
end

function onpunish_fengxiang()
	onconfirm(1)
end

function onpunish_chengdu()
	onconfirm(2)
end

function onpunish_dali()
	onconfirm(3)
end

function onpunish_bianjing()
	onconfirm(4)
end

function onpunish_xiangyang()
	onconfirm(5)
end

function onpunish_yangzhou()
	onconfirm(6)
end

function onpunish_linan()
	onconfirm(7)
end
		
function oncancel()
	return
end

function onchecknum()
	--²éÑ¯¸÷°ï»áÉÍÉÆÁîµÄÊýÁ¿
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo1 = ""
	local strInfo2 = ""
	for nCityIndex=1, 4 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<><color=red>"..arraycityindextoname[nCityIndex].."<color> kh«ng ng­êi chiÕm lÜnh , chiÕn c«ng v× :<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<> ChiÕm lÜnh <color=red>"..arraycityindextoname[nCityIndex].."<color> ®Ých bang héi lµ :<color=red>"..strTongName.."<color>, Thµnh thÞ chiÕn c«ng v× :<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 1) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 2) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		elseif (nCityIndex == 3) then
		    strInfo1 = arr[nCityIndex]
		elseif (nCityIndex == 4) then
		    strInfo1 = strInfo1.."<enter>"..arr[nCityIndex]
		end
	end
	
	--Talk(4, "onchecknum1", arr[1], arr[2], arr[3], arr[4])
	Talk(2, "onchecknum1", strInfo, strInfo1)
end

function onchecknum1()
	--²éÑ¯¸÷°ï»áÉÍÉÆÁîµÄÊýÁ¿
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo = ""
	local strInfo1 = ""
	for nCityIndex=5, 7 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<><color=red>"..arraycityindextoname[nCityIndex].."<color> kh«ng ng­êi chiÕm lÜnh , Thµnh thÞ chiÕn c«ng v× :<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<> ChiÕm lÜnh <color=red>"..arraycityindextoname[nCityIndex].."<color> ®Ých bang héi lµ :<color=red>"..strTongName.."<color>, Thµnh thÞ chiÕn c«ng v× :<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 5) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 6) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		else
		    strInfo1 = arr[nCityIndex]
		end
	end
	
	--Talk(3, "", arr[5], arr[6], arr[7])
	Talk(2, "", strInfo, strInfo1)
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("Ng­¬i kh«ng cã nãi ®ãng ph¹t ¸c lµm ")
		return
	end
	
	--ÅÐ¶ÏÎïÆ·ÊÇ·ñÎª·£¶ñÁî
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit( i )
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_PUNISHMEDIAL_NGENTYPE or
			DetailType ~= AEXP_PUNISHMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_PUNISHMEDIAL_PARTYPE) then
				Msg2Player("<> ng­¬i thËt gièng nh­ cã ®å kh«ng ph¶i lµ ph¹t ¸c lµm yªu ")
				return 0			
		end
	end
	
	local nTotalNum = 0
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--if (nNum < 0) then
	--	nNum = 0
	--end
	
	local nSpareNum = nNum - nTotalNum
	--if (nSpareNum < 0) then
	--	nSpareNum = 0
	--end
	
	SetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex], nSpareNum)
	local strCityTongName = GetCityOwner(nGlobalCityIndex);	
	--¶ÔtabÎÄ¼þ½øÐÐÐ´
	CityData[nGlobalCityIndex] = CityData[nGlobalCityIndex] + nTotalNum
	if (CityData[nGlobalCityIndex] > AEXP_REDUCEMAX_SAVE) then
		CityData[nGlobalCityIndex] = 0		
		WriteLog("["..date("%Y-%m-%d %X").."] bang héi :"..strCityTongName.." Thµnh thÞ :"..arraycityindextoname[nGlobalCityIndex].." bëi v× "..GetAccount().."("..GetName()..") ®Ò giao liÔu "..nTotalNum.." c¸ ph¹t ¸c lµm , v­ît qua mÖt mái kÕ tån m©m sè l­îng . tr­íc mÆt th­ëng thiÖn lµm sè l­îng v× :"..nSpareNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
		savevalue()
	end	
	
	Say("<> Thµnh thÞ <color=red>"..arraycityindextoname[nGlobalCityIndex].."<color>, chiÕm lÜnh bang héi :<color=red>"..strCityTongName.."<color>, ng­¬i ®Ò giao liÔu "..nTotalNum.." c¸ ph¹t ¸c lµm ®èi víi nã trõng ph¹t , tr­íc m¾t nªn Thµnh thÞ chiÕn c«ng v× :<color=red>"..nSpareNum.."<color>",0)
end
