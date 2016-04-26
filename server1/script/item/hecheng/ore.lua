if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

Convert = {
--========��������==================================--
--����ԭ�Σ�:loadSettings()
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���������ļ������м�ֵ���ļ��㡣�ú�����������
--settings/event/chinesenewyear/giftlvlup.txt��
--settings/event/chinesenewyear/bounslist.txt�ļ���
--Ȼ������������ļ��ֱ�����������������ļ�ֵ�����
--��������һ���Ʒ�ļ�ֵ����
--������
--	��
--����ֵ��
--	��
--������
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__oretabfile = new(KTabFile,"/settings/item/004/itemvalue/ore.txt","ORE")
	end	
}

MAXGIVENUM = 50  --���Ը��������
TF_ORE_WORTH = 2

Convert:loadSettings()

--========��������==================================--
--����ԭ�Σ�ComputeWorth(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���ݸ���������Ʒ����������ֵ����
--������
--	nCount��������������������
--����ֵ��
--	�ɹ��򷵻ؼ�ֵ�������򷵻�nil
--������
--	��
--==================================================--
function ComputeWorth(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local mark = 0

	if(nCount == 0) then
		Talk(1,"GiveUIForOre","<#>��ɶ�׶����ţ���ô�ϳ�࿣�")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit(i)
		local g,d,p,lvl = GetItemProp(itemIdx)

		if (mark ~= 0) then
			if (mark ~= lvl) then

				Talk(1,"GiveUIForOre","<#>�����Ķ���ɶ�׶���������ȼ�����ͬ�")
				return nil
			end
		end
		mark = lvl

		if (lvl > 4) then
			Talk(1, "GiveUIForOre", "<#>������������ʯ�ȼ�̫�ߣ��������ҵ�������Χ��")
			return nil
		end
		if(g ~= 6 or p ~= 147) then --�������
			Talk(1, "GiveUIForOre", "<#>�����Ķ���ɶ�׶�������������ʯ��")
			return nil
		end
		function checkGiftCount(idx,count)  --������ص��ߵ�����
			local num = GetItemStackCount(idx)
			if(count + num > MAXGIVENUM) then -- ����̫��
				Talk(1,"GiveUIForOre","<#>����Ķ���̫�࣬�����尡��ѣ�Ρ���")
				return nil
			end
			return num
		end
		local num = checkGiftCount(itemIdx,maxCount)
		if(not num) then
			return nil
		else
			maxCount = maxCount + num
			worth = worth + num * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl))
		end

	end

	return worth, mark
end
--========��������==================================--
--����ԭ�Σ�GiveUIForOre()
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�򿪸�����棬���ںϳɼ��������������ٵĶԻ�
--���á�
--������
--	��
--����ֵ��
--	��
--������
--	��
--==================================================--
function GiveUIForOre()
	GiveItemUI("������ʯ�ϳ�","�����50��ͬһ�ȼ���������ʯ������Ʒ���ڣ��Ϳ��Ժϳɳ���Ӧ��ֵ��Ӧ�����ĸ�һ�ȼ���������ʯ��", "OreLevelUp", "onCancel" );
end

--========��������==================================--
--����ԭ�Σ�OreLevelUp(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���ѡ������������Ʒ֮�󣬵���������棬�˺���Ϊ
--�ø��������ȷ����ť֮��Ļص�������
--������
--	��������е�����Ʒ����������������������ӵ�������
--����ֵ��
--	��
--������
--	��
--==================================================--
function OreLevelUp(nCount)
	local worth, lvl = ComputeWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ��������������
	local num, worth2 = ConvertWorth(worth, lvl)
	local lvl2 = lvl + 1
	
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if (num < 1) then
		Talk(1, "", "��ѽѽ���ϳ�ʧ���ˣ�����ô�ٵ�������ʯ���ϳɸ߼��Ŀ����кܴ��Σ�����أ�")
		return
	end

	if(not num) then  --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"","<#>�ף�ʧ���ˣ�զ���°����⡢�⡢����GM�㱨һ�°ɣ��Ҳ�֪����ô�찡��")
		print("Error: the number of ore is non.")
		return
	end
	
	AddStackItem(num, 6, 1, 147, lvl2, 1, 1, 1)
	WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName()..
					"�����˹�"..worth.."��ֵ����"..lvl.."�ȼ���������ʯ���ϳɵõ�"..
					num.."��"..lvl2.."�ȼ���������ʯ��ϵͳ�õ�"..
					worth-worth2.."ʣ���ֵ����")
	Talk(1, "", "��ϳɳ���<color=yellow>"..num.."<color>��<color=yellow>"..lvl2.."<color>�ȼ���������ʯ��")
	Msg2Player("������"..num.."��������ʯ")
	return
end

function ConvertWorth(worth, lvl)
	local lvlworth = tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	count = floor(worth / lvlworth)
	value = count * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	if ( random( lvlworth) < (worth - value) and (worth - value) ~= 0) then
		count = count + 1
	end
	return count, value
end


function main()
	Talk(1, "GiveUIForOre", "�ϳɸ߼�������ʯ��ÿ��������<color=yellow>50<color>��<color=yellow>ͬһ�ȼ�<color>��������ʯ���Ϳ��Ժϳɳ���һ�ȼ���������ʯ�����ǣ����ֻ�ܺϳɳ��ȼ�Ϊ<color=yellow>5<color>��������ʯ��")
	return
end

function onCancel()
end