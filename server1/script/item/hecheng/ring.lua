/*
if not RING then
	RING = 1
end

if not SHOSHI then
	Include ("\\script\\item\\hecheng\\shoushihecheng.lua")
end
*/
--========��������==================================--
--����ԭ�Σ�ComputeJewelWorth(nCount)
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
function ComputeRingWorth(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local wnum = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#>ɶ�������������ɶѽ��")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 ))) then --�������  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#>�������Ϻ�׶���ѽ��զ������࿣�")
			return nil
		end
		if(g == 0) then -- ����
			wnum = wnum + 1
			if (wnum > 1) then	--ֻ�ܷ�һ��װ��
				Talk(1, "GiveUIForThing", "<#>��ô��װ�����Ҳ�������Ͱ��������������ô�࡭��")
				return nil
			end
			det = d
			par = p
			lvl = l
			five = f
		else --��������
			function checkGiftCount(idx,count)  --������ص��ߵ�����
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ����̫��
					Talk(1,"GiveUIForRing","<#>����Ķ���̫�࣬�����尡����")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local ll = d - 508
				if(ll ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,ll)
				end
			end
		end
	end
	if(worth ==0) then
		Talk(1,"GiveUIForThing","<#>�Բ���������Ҫһ�������������")
		return nil
	end
	if (wnum == 0) then
		Talk(1,"GiveUIForThing","<#>�Բ��𣬱���Ҫһ��������")
		return nil
	end
	return worth, det, par, lvl, five
end

--========��������==================================--
--����ԭ�Σ�ConvertRing(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�ü�����������һ���Ʒ���˺�������������ȷ����ť
--�ص���
--������
--	nCount����������е���Ʒ����
--����ֵ��
--	��
--������
--	��
--==================================================--
function ConvertRing(nCount)
	local worth, d, p, lvl, five = ComputeRingWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ�Ľ���
	local idx = Convert:convertring(worth, five)
	if(not idx) then --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"GiveUIForThing", "<#>��ô��ʧ�ܰ��������ܣ�������ô���£���������������")
		return
	end
		for i=1,nCount do  --�۳����е���
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		return PayRing(idx, lvl, five)
end

--========��������==================================--
--����ԭ�Σ�PayBonus(bonusIdx)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	����ҷ���settings/event/chinesenewyear/bonuslist.txt
--�е�bonusIdx��Ľ�Ʒ
--������
--	bonusIdx����Ʒ���ţ���tabfile�е�����-1
--����ֵ��
--	��
--������
--	��
--==================================================--
function PayRing(ringIdx, level, five)
	local num = tonumber(Convert.__ringtabfile:getCell(TF_BONUS_SEED, ringIdx))
	local _nSeed = SetRandSeed(num)
	AddItem(0, 3, 0, level, five,
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P1,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P2,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P3,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P4,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P5,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P6,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P7,ringIdx)))

	WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName()..
			"���һ��õ�"..ringmsg[level].."����ֵ��Ϊ��"..
			Convert.__ringtabfile:getCell(TF_BONUS_WORTH,ringIdx))
	Talk(1, "", "��ϳɳ���һö"..ringmsg[level])
	Msg2Player("����һö"..ringmsg[level])
	return
end
