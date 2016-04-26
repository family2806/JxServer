/*
if not AMULET then
	AMULET = 1
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
function ComputeAmuletWorth(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local wnum = 0

	if(nCount == 0) then
		Talk(1, "GiveUIForThing", "<#>ɶ�������������ɶѽ��")
		return nil
	end
	for i=1, nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g, d, p, l, f = GetItemProp(itemIdx)

		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=2 and d~=6 ))) then --�������  
			Talk(1, "GiveUIForThing", "<#>�������Ϻ�׶���ѽ��զ������࿣�")
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
					Talk(1,"GiveUIForThing", "<#>����Ķ���̫�࣬�����尡��")
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
		Talk(1, "GiveUIForThing", "<#>�Բ���������Ҫһ�������������")
		return nil
	end
	if (wnum == 0) then
		Talk(1, "GiveUIForThing", "<#>�Բ��𣬱���Ҫһ���·�������������")
		return nil
	end

	return worth, det, par, lvl, five
end

--========��������==================================--
--����ԭ�Σ�ConvertBonus(nCount)
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
function ConvertAmulet(nCount)
	local worth, d, p, lvl, five = ComputeAmuletWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ�Ľ���
	local idx = Convert:convertamulet(worth, five)
	if(not idx) then --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"GiveUIForThing", "<#>��ô��ʧ�ܰ��������ܣ�������ô���£���������������")
		return
	end

	for i=1,nCount do  --�۳����е���
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	return PayAmulet(idx, d, p, lvl, five)
end

--========��������==================================--
--����ԭ�Σ�PayAmulet(bonusIdx)
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
function PayAmulet(bonusIdx, det, par, level, five)
	if (det == 2) then
		if ((par >=0 and par <= 6) or (par >= 14 and par <= 20)) then
			par = 1
		else
			par = 0
		end
	end
	local num = tonumber(Convert.__amulettabfile:getCell(TF_BONUS_SEED, bonusIdx))
	local _nSeed = SetRandSeed(num)
	
	AddItem(0, 4, par, level, five,
						Convert.__amulettabfile:getCell(TF_BONUS_P1,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P2,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P3,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P4,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P5,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P6,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P7,bonusIdx))
	SetRandSeed(_nSeed)
	WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName()..
			"���һ��õ�"..amuletmsg[par + 1][level].."����ֵ��Ϊ��"..
			Convert.__amulettabfile:getCell(TF_BONUS_WORTH,bonusIdx))
	Talk(1, "", "<#>��ϳɳ���һ��"..amuletmsg[par + 1][level])
	Msg2Player("����һ��"..amuletmsg[par + 1][level])
	return
end
