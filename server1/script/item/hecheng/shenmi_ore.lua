MAXNUM_GIFT = 10

function main()
	Talk(1, "GiveUIForShenmi_Ore", "�ϳ����ؿ�ʯ��ÿ�η���<color=yellow>10<color>��<color=yellow>10��<color>�ļ�����������Ϳ��Ժϳɳ�һ�����ؿ�ʯ��")
	return
end

function GiveUIForShenmi_Ore()
		GiveItemUI("���ؿ�ʯ�ϳ�","���������Ʒ���ڷ���10��10���ļ�����������Ϳ��Ժϳ�һ�����ؿ�ʯ��", "Covert_ShenmiOre", "onCancel" );
end

function Covert_ShenmiOre(nCount)
	local q = 0
	local d = 0
	local num = 0
	local maxCount = 0
	if (nCount == 0) then
		Talk(1, "GiveUIForShenmi_Ore", "<#>ɶ�������������ɶѽ��")
		return 
	end
	if (nCount >10 ) then
		Talk(1, "GiveUIForShenmi_Ore", "<#>��������Ʒ��Ŀ���񲻶ԣ�������ٷŰɣ�")
		return l
	end
	
	for i = 1, nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d ~= 518) then
			Talk(1, "GiveUIForShenmi_Ore","<#>�������Ϻ�׶���������ô������࿣�" )
			return 
		end
			function checkGiftCount(idx,count)  --������ص��ߵ�����
				local num = GetItemStackCount(idx)
				if(count + num > MAXNUM_GIFT) then -- ����̫��
					Talk(1, "GiveUIForShenmi_Ore", "<#>����Ķ���̫�࣬������,�Ρ���")
					return nil
				end
				return num
			end
		num = checkGiftCount(itemIdx,maxCount)
		if (not num) then
			return 
		else
			maxCount = maxCount + num
		end
	end
	if (maxCount ~= 10) then
		Talk(1, "GiveUIForShenmi_Ore", "<#>����ļ�������������Ŀ����Ү��")
		return 
	else
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit( i ))
		end
		AddItem(6, 1, 398, 1, 1, 1, 1)
		Talk(1, "", "��ϲ��ϳɳ���һ�����ؿ�ʯ��")
		Msg2Player("����һ�����ؿ�ʯ")
		return
	end
end

function onCancel()
end