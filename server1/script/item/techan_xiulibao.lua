IncludeLib("SETTING"); --����SETTING�ű�ָ���
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

ITEMPARAM_LIMITDATE = 2
ITEMPARAM_TONGID = 1
function main(nItemIndex)
local szTongName , nTongID = GetTongName()

	if (xiulibao_checkdate(nItemIndex) == -1) then
		Say("<#>������ѹ�ʹ�����ޣ����ܹ���ʹ�ã�", 0)
		Msg2Player("���������ʹ�����ޣ����ˡ�")
		return
	end
	--������ָ��
	--��%d���RepairCallBackǰ�������������ص�ʱ����: nItemIdx, nPrice, nItemPrice������Ĳ�������Say(...)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..")")
	return 1
end

function xiulibao_checkdate(nItemIndex)
	local nItemdate = GetItemParam(nItemIndex, 1);
	if (GetCurServerTime() <= nItemdate) then
		return 1;
	else
		return -1;
	end;
end

function GetDesc(nItem)
	local nEndYear = GetItemParam(nItem, 2) + 2000;
	local nEndMMDD = GetItemParam(nItem, 3);
	local nEndMon = floor(nEndMMDD / 100);
	local nEndDay = mod(nEndMMDD, 100);
	local nEndHour = GetItemParam(nItem, 4);

	return "\nʹ�ý�ֹ����Ϊ��<color=blue>200"..nEndYear.."��"..nEndMonth.."��"..nEndDay.."��<color>";
end

--�ο�ws_tiangong.lua
function RepairCallBack(nItemIdx, nPrice, nItemPrice, nParam)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local quality = GetItemQuality(nItemIdx)
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�	
	if (quality == 1 or quality == 4)then
		if (quality == 4 and GetPlatinaLevel(nItemIdx) >= 6) then
			Say("�����������Ʒ", 0);
			return 1
		end
		
		local nItemLevel = GetItemLevel(nItemIdx);
		--ÿ�;öȵļ۸�
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur
		local nCostlyPrice = nCheapPrice * 3; -- ���޵�����
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("<#>", 3, 
		"����װ����"..nCheapPrice.."�����;ö��½�"..nLostDur.."��/#Cheap_Repair("..nItemIdx..","..nCheapPrice..")",
		"����װ����"..nCostlyPrice.."��/#Costly_Repair("..nItemIdx..","..nCostlyPrice..")",
		"������/cancel")
		return	
	end	
	Say("<#>�����װ���軨�ѣ�"..nPrice.."������Ҫ������", 2, 
	"����/#TG_Repair("..nItemIdx..","..nPrice..")",
	"������/cancel")
end

--����
function Costly_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		-- Msg2Player("�޸�װ����")
		SetCurDurability(nItemIdx, nCurMaxDur)
		WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��("..nCostPrice..")�����ӣ����޻ƽ�װ��(ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>����������㣡", 0)
		return
	end
end
--����
function Cheap_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
	else
		Say("<#>����������㣬�������������ɣ�", 0)
		return
	end
end
--����
function TG_Repair(nItemIdx, nCostPrice)
	if (GetCash() < nCostPrice) then
		Say("<#>����������㣬�������������ɣ�", 0)
		return
	end
	Pay(nCostPrice)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
end