Include("\\script\\baoruongthanbi\\head.lua");
function DefinitionKey_main()
	GiveItemUI("重新鉴定万能钥匙", "重新鉴定万能钥匙", "ConfirmDefinitionKey", "OnCancel");
end

function ConfirmDefinitionKey(nCount)
		if (nCount < 1) then
			return
		end
		if (nCount > 6) then -- cho phep bo bao duy nhat 3 vat pham
			Talk(1, "", "大侠丢的东西太多了，我眼睛都花了!");
			return
		end
		local lag1, lag2, lag3, lag4 = 0, 0, 0, 0 
		local nCountBox, nCountKey, nCountNHB, nCountTHB = 0, 0, 0, 0
		local  nIndexBox, nIndexKey =0, 0
		for i=1, nCount do
			local nItemIndex = GetGiveItemUnit(i)	--取回Item Index 物品
			local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
			if (parttype ~= 30036 and parttype ~= 30037 and parttype ~= 30038 and parttype ~= 30039) then
				Talk(1, "","大侠请放入正确的物品 !");
				return
			end
				if (parttype == 30036) then--箱子
					lag1 = 1
					nIndexBox = nItemIndex
					nCountBox = nCountBox +1
				end
				if (parttype == 30037) then--钥匙
					lag2 = 1
					nIndexKey = nItemIndex
					nCountKey = nCountKey +1
				end
				if (parttype == 30038) then--二虎符
					lag3 = 1
					nCountNHB = nCountNHB + 1
					--nIndexHB = nItemIndex
				end
				if (parttype == 30039) then--三虎符
					lag4 = 1
					--nIndexHB = nItemIndex
					nCountTHB = nCountTHB + 1
				end
		end--for
		if (nCountBox > 1 or nCountKey > 1 or nCountNHB > 4 or nCountTHB > 4) then
				Talk(1, "", "大侠请放入数量正确的物品!");
				return
		end
		if (lag3 ==1 and lag4 ==1) then
			Talk(1,"","大侠只能使用一种符而已!")
			return
		end
		if (lag1==1 and lag2 == 1 and (lag3 ==1 or lag4 ==1)) then
				--nGblBoxValue = GetBoxValue(nIndexBox)--取回箱子的价值
				if (lag3 == 1) then--user 使用二虎符
					RemoveAllItem(nCount, nIndexBox)
					AddNewKeyValue(nCountNHB, nIndexBox,nIndexKey, 2)
					
				end
				if (lag4 ==1) then--user 使用三虎符
					RemoveAllItem(nCount, nIndexBox)
					AddNewKeyValue(nCountTHB, nIndexBox, nIndexKey, 3)
					
				end
		else
			Talk(1, "", "大侠请放入正确的物品!");
			return
		end
end


function AddNewKeyValue(nCountHB, nIndexBox, nIndexKey, nType)
		local nBoxValue = GetBoxValue(nIndexBox)--取回箱子的价值
		local num2 = floor(nBoxValue/ 1000)--取回箱子的头两个价值
		local num3 = floor(nBoxValue/ 100)--取回箱子的头3个价值
		local num4 = floor(nBoxValue/ 10)--取回箱子的头4个价值
		--local num5 = floor(nBoxValue/ 1)--取回箱子的头5个价值
		local nValue = 0
		local nRandomKeyValue = random(1, 100)
		if (nCountHB==4) then
			nValue = 100
		elseif (nCountHB==3) then
			nValue = 75
		elseif (nCountHB==2) then
			nValue = 50
		else
			nValue = 25
		end
		if (nValue == 100) then--so luong bua bo vao la 4
			if (nRandomKeyValue <= 10) then--check ty le random <= 10 do....
				if (nType==2) then--neu user 使用二虎符就 add key 与箱子的三个号对应
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num3)
					SyncItem(nItemIndex)
					Msg2Player("恭喜大侠获得3个号的钥匙")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 3号钥匙type 1")
				else--nguoc lai neu su dung tam ho bua thi add key dung voi 4 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num4)
					SyncItem(nItemIndex)
					Msg2Player("恭喜大侠获得4个号的钥匙")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 4号钥匙type 1")
				end--check user su dung loai ho bua
			else--ty le random lon hon 10
				if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 2 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num2)
					SyncItem(nItemIndex)
					Msg2Player("恭喜大侠获得2个号的钥匙")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 2号钥匙type 1")
				else--nguoc lai neu su dung tam ho bua thi add key dung voi 3 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num3)
					SyncItem(nItemIndex)
					Msg2Player("恭喜大侠获得3个号的钥匙")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 3号钥匙type 1")
				end--check user su dung loai ho bua
			end--check ran dom max key value
		elseif (nRandomKeyValue <= nValue ) then--neu gia tri random <= nValue% thi...
			if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 2 so cua box
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, num2)
				SyncItem(nItemIndex)
				Msg2Player("恭喜大侠获得2个号的钥匙")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 2号钥匙type 1")
			else--nguoc lai neu su dung tam ho bua thi add key dung voi 3 so cua box
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, num3)
				SyncItem(nItemIndex)
				Msg2Player("恭喜大侠获得3个号的钥匙")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 3号钥匙type 1")
			end--check user su dung loai ho bua
		elseif (nRandomKeyValue > nValue and nValue >= 75) then--neu user bo vao 3 ho bua v?gia tri random lon hon cho phep
			if (nType==2) then--neu user su dung nhi ho bua thi add key random 2 so
				local nVarRandom = random(10,99)
				if (nVarRandom == num2) then
					nVarRandom = nVarRandom + 1
				end
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, nVarRandom)
				SyncItem(nItemIndex)
				Msg2Player("恭喜大侠获得2个号的钥匙")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 2号钥匙type 2")
			else--nguoc lai neu su dung tam ho bua thi add key random3 so 
				local nVarRandom = random(100,999)
				if (nVarRandom == num2) then
					nVarRandom = nVarRandom + 1
				end
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, nVarRandom)
				SyncItem(nItemIndex)
				Msg2Player("恭喜大侠获得3个号的钥匙")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定获得的钥匙 3号钥匙type 2")
			end--check user su dung loai ho bua
		else--ko phu hop gia tri random, bo vao it hon 3 la bua
			RemoveItemByIndex(nIndexBox)
			RemoveItemByIndex(nIndexKey)
			Talk(1,"","鉴定失败,损失完材料 !")
			Msg2Player("鉴定失败 !")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."鉴定Key失败, 扣完材料")
		end--check value
end

function OnCancel()
end
