Include("\\script\\baoruongthanbi\\head.lua");
function KeyUpgrade_main()
	GiveItemUI("升级万能钥匙", "升级万能钥匙", "ConfirmKeyUpgrade", "OnCancel", 1);
end

function ConfirmKeyUpgrade(nCount)
		if (nCount > 20) then -- cho phep bo bao duy nhat 3 vat pham
			Talk(1, "", "大侠丢的东西太多了，我眼睛都看花了! ");
			return
		end
		local lag1, lag2, lag3, lag4,lag5 = 0, 0, 0, 0, 0
		local nIndexKey, nIndexBox, nIndexNTF, nIndexDLF, nIndexTHF =0, 0, 0, 0, 0
		local nCountBox, nCountKey, nCountNTF, nCountDLF, nCountTHF = 0, 0, 0, 0, 0 
		local nValueRateNTF, nValueRateDLF, nValueRateTHF = 0, 0, 0
		for i=1, nCount do
			local nItemIndex = GetGiveItemUnit(i)	--取回Item Index 物品
			local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
			if (parttype ~= 30036 and parttype ~= 30037 and parttype ~= 30040 and parttype ~= 30041 and parttype ~= 30042) then
				Talk(1, "", "大侠请放入正确的物品 !");
				return
			end
			if (parttype == 30036) then--箱子
					lag1 = 1
					nIndexBox = nItemIndex
					nCountBox = nCountBox + 1
			end
			if (parttype == 30037) then--钥匙
					lag2 = 1
					nIndexKey = nItemIndex
					nCountKey = nCountKey + 1
			end
			if (parttype == 30040) then--仁心符
					lag3 = 1
					nIndexNTF = nItemIndex
					nCountNTF = nCountNTF + 1
			end
			if (parttype == 30041) then--地灵符
					lag4 = 1
					nIndexDLF = nItemIndex
					nCountDLF = nCountDLF + 1
			end
			if (parttype == 30042) then--天行符
					lag5 = 1
					nIndexTHF = nItemIndex
					nCountTHF = nCountTHF + 1
			end
		end--for check
		if (nCountBox > 1 or nCountKey > 1) then
			Talk(1, "", "大侠请放入数量正确的物品!");
			return
		end
		if (lag3 ==1 and (lag4==1 or lag5 ==1)) then
				Talk(1, "", "大侠只能使用一种符而已!");
				return		
		end
		if (lag4 ==1 and (lag3==1 or lag5 ==1)) then
				Talk(1, "", "大侠只能使用一种符而已!");
				return		
		end
		if (lag5 ==1 and (lag3==1 or lag4 ==1)) then
				Talk(1, "", "大侠只能使用一种符而已!");
				return		
		end
		if (CheckUserInputKey(nIndexKey)==2) then--neu user in put key 2 so
			if (nCountNTF > 2 or nCountDLF > 2 or nCountTHF > 2 or nCount > 4) then--检查user inout 符的数量
				Talk(1, "", "大侠请放入数量正确的物品!");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 5
			nValueRateDLF = nCountDLF * 15
			nValueRateTHF = nCountTHF * 30
		elseif (CheckUserInputKey(nIndexKey) ==3) then--neu user input key 3 so
			if (nCountNTF > 10 or nCountDLF > 10 or nCountTHF > 10 or nCount > 12) then--检查 user inout符的数量
				Talk(1, "", "大侠请放入数量正确的物品 !");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 1
			nValueRateDLF = nCountDLF * 3
			nValueRateTHF = nCountTHF * 6
		else--user in put key ko hop le
				Talk(1, "", "大侠正拥有一个完美钥匙, 我认为不用再升级了!");
				return
		end--end check user input key
		if (lag1 == 1 and lag2 == 1 and (lag3==1 or lag4 ==1 or lag5 ==1)) then
			local nKeyValue = GetKeyValue(nIndexKey)
			if (lag3==1) then-- 使用仁心符
					GetKeyUpgraded(nValueRateNTF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
					RemoveAllItem(nCount, nIndexBox)
			end
			if (lag4==1) then--使用地灵符
				GetKeyUpgraded(nValueRateDLF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
			if (lag5==1) then--使用天行符
				GetKeyUpgraded(nValueRateTHF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
				
		else
			Talk(1, "", "请大侠放入正确物品!");
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
		Talk(1,"","大侠正拥有一个完美钥匙, 我认为不用再升级了 !")
		return
	end
	if (nRandomVar <=nRate) then
		if (nType == 2) then--user  从2级升到3级
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox3)
			SyncItem(nItemIndex)
			Msg2Player("恭喜大侠获得3个号的钥匙")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."升级钥匙收到3号钥匙 type 1")
		end--user  从3个号到升级四个号
		if (nType == 3) then
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox4)
			SyncItem(nItemIndex)
			Msg2Player("恭喜大侠获得4个号的钥匙")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."升级钥匙收到4号钥匙 type 1")
		end--end check nType
		
	else--ty le ko cho phep
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, nKeyValue)
			SyncItem(nItemIndex)
			Msg2Player("升级失败, 还给大侠物品")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."升级钥匙失败")
	end--random
end
