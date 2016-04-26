Include("\\script\\baoruongthanbi\\head.lua");
function KeyUpgrade_main()
	GiveItemUI("��������Կ��", "��������Կ��", "ConfirmKeyUpgrade", "OnCancel", 1);
end

function ConfirmKeyUpgrade(nCount)
		if (nCount > 20) then -- cho phep bo bao duy nhat 3 vat pham
			Talk(1, "", "�������Ķ���̫���ˣ����۾���������! ");
			return
		end
		local lag1, lag2, lag3, lag4,lag5 = 0, 0, 0, 0, 0
		local nIndexKey, nIndexBox, nIndexNTF, nIndexDLF, nIndexTHF =0, 0, 0, 0, 0
		local nCountBox, nCountKey, nCountNTF, nCountDLF, nCountTHF = 0, 0, 0, 0, 0 
		local nValueRateNTF, nValueRateDLF, nValueRateTHF = 0, 0, 0
		for i=1, nCount do
			local nItemIndex = GetGiveItemUnit(i)	--ȡ��Item Index ��Ʒ
			local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
			if (parttype ~= 30036 and parttype ~= 30037 and parttype ~= 30040 and parttype ~= 30041 and parttype ~= 30042) then
				Talk(1, "", "�����������ȷ����Ʒ !");
				return
			end
			if (parttype == 30036) then--����
					lag1 = 1
					nIndexBox = nItemIndex
					nCountBox = nCountBox + 1
			end
			if (parttype == 30037) then--Կ��
					lag2 = 1
					nIndexKey = nItemIndex
					nCountKey = nCountKey + 1
			end
			if (parttype == 30040) then--���ķ�
					lag3 = 1
					nIndexNTF = nItemIndex
					nCountNTF = nCountNTF + 1
			end
			if (parttype == 30041) then--�����
					lag4 = 1
					nIndexDLF = nItemIndex
					nCountDLF = nCountDLF + 1
			end
			if (parttype == 30042) then--���з�
					lag5 = 1
					nIndexTHF = nItemIndex
					nCountTHF = nCountTHF + 1
			end
		end--for check
		if (nCountBox > 1 or nCountKey > 1) then
			Talk(1, "", "���������������ȷ����Ʒ!");
			return
		end
		if (lag3 ==1 and (lag4==1 or lag5 ==1)) then
				Talk(1, "", "����ֻ��ʹ��һ�ַ�����!");
				return		
		end
		if (lag4 ==1 and (lag3==1 or lag5 ==1)) then
				Talk(1, "", "����ֻ��ʹ��һ�ַ�����!");
				return		
		end
		if (lag5 ==1 and (lag3==1 or lag4 ==1)) then
				Talk(1, "", "����ֻ��ʹ��һ�ַ�����!");
				return		
		end
		if (CheckUserInputKey(nIndexKey)==2) then--neu user in put key 2 so
			if (nCountNTF > 2 or nCountDLF > 2 or nCountTHF > 2 or nCount > 4) then--���user inout ��������
				Talk(1, "", "���������������ȷ����Ʒ!");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 5
			nValueRateDLF = nCountDLF * 15
			nValueRateTHF = nCountTHF * 30
		elseif (CheckUserInputKey(nIndexKey) ==3) then--neu user input key 3 so
			if (nCountNTF > 10 or nCountDLF > 10 or nCountTHF > 10 or nCount > 12) then--��� user inout��������
				Talk(1, "", "���������������ȷ����Ʒ !");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 1
			nValueRateDLF = nCountDLF * 3
			nValueRateTHF = nCountTHF * 6
		else--user in put key ko hop le
				Talk(1, "", "������ӵ��һ������Կ��, ����Ϊ������������!");
				return
		end--end check user input key
		if (lag1 == 1 and lag2 == 1 and (lag3==1 or lag4 ==1 or lag5 ==1)) then
			local nKeyValue = GetKeyValue(nIndexKey)
			if (lag3==1) then-- ʹ�����ķ�
					GetKeyUpgraded(nValueRateNTF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
					RemoveAllItem(nCount, nIndexBox)
			end
			if (lag4==1) then--ʹ�õ����
				GetKeyUpgraded(nValueRateDLF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
			if (lag5==1) then--ʹ�����з�
				GetKeyUpgraded(nValueRateTHF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
				
		else
			Talk(1, "", "�����������ȷ��Ʒ!");
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
		Talk(1,"","������ӵ��һ������Կ��, ����Ϊ������������ !")
		return
	end
	if (nRandomVar <=nRate) then
		if (nType == 2) then--user  ��2������3��
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox3)
			SyncItem(nItemIndex)
			Msg2Player("��ϲ�������3���ŵ�Կ��")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."���ر���"..GetAccount().."\t"..GetName().."\t".."����Կ���յ�3��Կ�� type 1")
		end--user  ��3���ŵ������ĸ���
		if (nType == 3) then
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox4)
			SyncItem(nItemIndex)
			Msg2Player("��ϲ�������4���ŵ�Կ��")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."���ر���"..GetAccount().."\t"..GetName().."\t".."����Կ���յ�4��Կ�� type 1")
		end--end check nType
		
	else--ty le ko cho phep
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, nKeyValue)
			SyncItem(nItemIndex)
			Msg2Player("����ʧ��, ����������Ʒ")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."���ر���"..GetAccount().."\t"..GetName().."\t".."����Կ��ʧ��")
	end--random
end
