Include("\\script\\baoruongthanbi\\head.lua");
function KeyUpgrade_main()
	GiveItemUI("N©ng CÊp Ch×a Khãa V¹n N¨ng", "N©ng CÊp Ch×a Khãa V¹n N¨ng", "ConfirmKeyUpgrade", "OnCancel", 1);
end

function ConfirmKeyUpgrade(nCount)
		if (nCount > 20) then -- cho phep bo bao duy nhat 3 vat pham
			Talk(1, "", "§¹i hiÖp bá nhiÒu thø qu¸, ta xem hoa c¶ m¾t ! ");
			return
		end
		local lag1, lag2, lag3, lag4,lag5 = 0, 0, 0, 0, 0
		local nIndexKey, nIndexBox, nIndexNTF, nIndexDLF, nIndexTHF =0, 0, 0, 0, 0
		local nCountBox, nCountKey, nCountNTF, nCountDLF, nCountTHF = 0, 0, 0, 0, 0 
		local nValueRateNTF, nValueRateDLF, nValueRateTHF = 0, 0, 0
		for i=1, nCount do
			local nItemIndex = GetGiveItemUnit(i)	--È¡»ØItem Index ÎïÆ·
			local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
			if (parttype ~= 30036 and parttype ~= 30037 and parttype ~= 30040 and parttype ~= 30041 and parttype ~= 30042) then
				Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng vËt phÈm !");
				return
			end
			if (parttype == 30036) then--Ïä×Ó
					lag1 = 1
					nIndexBox = nItemIndex
					nCountBox = nCountBox + 1
			end
			if (parttype == 30037) then--Ô¿³×
					lag2 = 1
					nIndexKey = nItemIndex
					nCountKey = nCountKey + 1
			end
			if (parttype == 30040) then--ÈÊĞÄ·û
					lag3 = 1
					nIndexNTF = nItemIndex
					nCountNTF = nCountNTF + 1
			end
			if (parttype == 30041) then--µØÁé·û
					lag4 = 1
					nIndexDLF = nItemIndex
					nCountDLF = nCountDLF + 1
			end
			if (parttype == 30042) then--ÌìĞĞ·û
					lag5 = 1
					nIndexTHF = nItemIndex
					nCountTHF = nCountTHF + 1
			end
		end--for check
		if (nCountBox > 1 or nCountKey > 1) then
			Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng sè l­îng vËt phÈm !");
			return
		end
		if (lag3 ==1 and (lag4==1 or lag5 ==1)) then
				Talk(1, "", "§¹i hiÖp chØ nªn sö dông 1 lo¹i Phï mµ th«i !");
				return		
		end
		if (lag4 ==1 and (lag3==1 or lag5 ==1)) then
				Talk(1, "", "§¹i hiÖp chØ nªn sö dông 1 lo¹i Phï mµ th«i !");
				return		
		end
		if (lag5 ==1 and (lag3==1 or lag4 ==1)) then
				Talk(1, "", "§¹i hiÖp chØ nªn sö dông 1 lo¹i Phï mµ th«i !");
				return		
		end
		if (CheckUserInputKey(nIndexKey)==2) then--neu user in put key 2 so
			if (nCountNTF > 2 or nCountDLF > 2 or nCountTHF > 2 or nCount > 4) then--¼ì²éuser inout ·ûµÄÊıÁ¿
				Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng sè l­îng vËt phÈm !");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 5
			nValueRateDLF = nCountDLF * 15
			nValueRateTHF = nCountTHF * 30
		elseif (CheckUserInputKey(nIndexKey) ==3) then--neu user input key 3 so
			if (nCountNTF > 10 or nCountDLF > 10 or nCountTHF > 10 or nCount > 12) then--¼ì²é user inout·ûµÄÊıÁ¿
				Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng sè l­îng vËt phÈm !");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 1
			nValueRateDLF = nCountDLF * 3
			nValueRateTHF = nCountTHF * 6
		else--user in put key ko hop le
				Talk(1, "", "§¹i hiÖp ®ang së höu 1 Ch×a Khãa hoµn h¶o, ta thiÕt nghÜ kh«ng cÇn n©ng cÊp thªm n÷a !");
				return
		end--end check user input key
		if (lag1 == 1 and lag2 == 1 and (lag3==1 or lag4 ==1 or lag5 ==1)) then
			local nKeyValue = GetKeyValue(nIndexKey)
			if (lag3==1) then-- Ê¹ÓÃÈÊĞÄ·û
					GetKeyUpgraded(nValueRateNTF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
					RemoveAllItem(nCount, nIndexBox)
			end
			if (lag4==1) then--Ê¹ÓÃµØÁé·û
				GetKeyUpgraded(nValueRateDLF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
			if (lag5==1) then--Ê¹ÓÃÌìĞĞ·û
				GetKeyUpgraded(nValueRateTHF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
				
		else
			Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng vËt phÈm !");
			return
		end--check user input item
		
end


function GetKeyUpgraded(nRate, nIndexBox, nKeyValue, nType)
	local nRandomVar = random(1,100)
	local nBoxValue = GetBoxValue(nIndexBox)
	local numBox3 = floor(nBoxValue/100)
	local numBox4 = floor(nBoxValue/10)
	--Msg2Player("nType: "..nType)
	--Msg2Player("nRate: "..nRate)
	--Msg2Player("nRandomVar: "..nRandomVar)
	if (nType > 3) then
		Talk(1,"","§¹i hiÖp ®ang së höu 1 Ch×a khãa hoµn h¶o, ta thiÕt nghÜ kh«ng nªn n©ng cÊp lªn n÷a !")
		return
	end
	if (nRandomVar <=nRate) then
		if (nType == 2) then--user  ´Ó2¼¶Éıµ½3¼¶
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox3)
			SyncItem(nItemIndex)
			Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 3 m· sè")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn Bİ"..GetAccount().."\t"..GetName().."\t".."N©ng CÊp Key nhËn ®­îc Key 3 sè type 1")
		end--user  ´Ó3¸öºÅµ½Éı¼¶ËÄ¸öºÅ
		if (nType == 3) then
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox4)
			SyncItem(nItemIndex)
			Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc ch×a khãa cã chøa 4 m· sè")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn Bİ"..GetAccount().."\t"..GetName().."\t".."N©ng CÊp Key nhËn ®­îc Key 4 sè type 1")
		end--end check nType
		
	else--ty le ko cho phep
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, nKeyValue)
			SyncItem(nItemIndex)
			Msg2Player("N©ng cÊp thÊt b¹i, xin tr¶ l¹i ®¹i hiÖp vËt phÈm")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn Bİ"..GetAccount().."\t"..GetName().."\t".."N©ng CÊp Key thÊt b¹i")
	end--random
end
