Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelRepairScale = {}
aLevelRepairLevel = {}
aLevelEnhanceAdd = {}
aLevelContributionCoef = {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\tiangong_level_data.txt", "tiangongLevelData")
	if b1~=1 then
		print("�����칤���������ļ�ʧ�ܣ�")
		return
	end
	local nRowCount = TabFile_GetRowCount("tiangongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("tiangongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "OUTPUT_COEF"))
		aLevelRepairScale[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_SCALE"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "CONTRIBUTION_COEF"))
		aLevelRepairLevel[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_LEVEL"))
		aLevelEnhanceAdd[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "ENHANCE_ADD"))
	end
	--TabFile_UnLoad("tiangongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "�칤���ܹ�") ~= 1 then
		return 0
	end
	local aryszContent = {
		"װ����ͨ����/#repair_ok1".."("..nTongID..","..nWorkshopID..")",
		"װ��ǿ������/#repair_ok2".."("..nTongID..","..nWorkshopID..")",
		"��ȡ�����/#use_xiulibao("..nTongID..","..nWorkshopID..")",
		"������/cancel"
	}
	Say("<#>�칤���ܹܣ������������ð����õı���������ȻҲ���ɶ��칤֮����ά����", getn(aryszContent), aryszContent);
	return 1;
end

--------------------------------------------------------------------------------------------
VALUE_XIULIBAO_CONTRIBUTION = 50	--�Ͻ����Ҫ�ĸ��˹��׶�
function use_xiulibao(nTongID, nWorkshopID)
	Say("�칤���ܹܣ��������߽�����װ�����ǻᾭ�����ɣ�������ֻҪ��һ�������������سǣ�����������װ����ʱ��ֻҪʹ���������������ڵ���һ������װ���ˡ���Ȼ������װ��ʱ���ĵĲ���ǮҲ����Ҫ���ġ�һ�����������ʹ��һ�����ڵ�ʱ�䣬��ֻ��Ҫ����<color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color>�㹱�׶ȾͿ����ˣ���ô�����Ķ��˰ɣ�", 3,
	"����һ�������/#tg_sure2xiulibao("..nTongID..","..nWorkshopID..")",
	"���������/tg_helpxiulibao",
	"���˰�/cancel")
end

function tg_helpxiulibao()
	Say("�칤���ܹܣ����������������ʱ��ص�����װ����ֻҪ�Ҽ����ʹ�ñ�������ڵ�����һ������װ������Ҫע���������ȻҪ������ѡ�һ�����������ʹ��һ�����ڣ�ʱ����㹺��ʼ���㣬����һ����ܶ�Ļ�Ҳ��û���õģ�һ������ֻҪ��һ���ͺ��ˡ�", 0)
end

function tg_sure2xiulibao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>�Բ��������ڰ����칤��Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0)
		Msg2Player("������ͣ�������޷�ʹ�á�")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>������ᶼû�룬�������", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 4) then
		Say("<#>�Բ��������ڰ���칤����ʹ�õȼ�û�дﵽ4�����޷���øð���ز���", 0)
		Msg2Player("����ʹ�õȼ�û�дﵽ4���������޷�ʹ�á�")
		return
	end
	if (GetContribution() < VALUE_XIULIBAO_CONTRIBUTION or AddContribution(-VALUE_XIULIBAO_CONTRIBUTION) ~= 1)then
		Say("�Բ������ĸ��˹��׶Ȳ���<color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color>�㣬�޷�������ز�����Ŭ����ȡ���˹��׶ȡ�", 0)
		Msg2Player("���˹��׶Ȳ��㣬�����޷�ʹ�á�")
		return 0
	end
	local nItemIndex = AddItem(6,1,1084,1,1,0);
	local nTime = GetCurServerTime() + 7 * 24 * 60 * 60;
	local nDate = FormatTime2Number(nTime);
	local nYear = floor(nDate/100000000);
	local nMMDD = floor( mod(nDate, 100000000) / 10000 );
	local nHour = floor( mod(nDate, 10000) / 100 );
	SetSpecItemParam(nItemIndex, 1, nTime);
	SetSpecItemParam(nItemIndex, 2, nYear);
	SetSpecItemParam(nItemIndex, 3, nMMDD);
	SetSpecItemParam(nItemIndex, 4, nHour);
	SyncItem(nItemIndex);
	Msg2Player("���ɹ�������һ���������Ŀǰ��Чʱ��Ϊ7�졣")
	Say("���ɹ�������һ���������Ŀǰ��Чʱ��Ϊ7�졣", 0)
end
--------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��칤
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ���ղ�����ֵ��
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
		return 0
	end
	return 1
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function repair_ok1(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function repair_ok2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>�칤���ܹܣ�����̫æ�ˣ����ܸ���ǿ�����������������ɣ�", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 2)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..","..nWorkshopID..","..nUse..")")
end

function CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>�칤���ܹܣ�Ŀǰ�ȼ����칤���в�����������װ����", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>�칤���ܹܣ�Ŀǰ�ȼ����칤���в�����������װ����", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>�칤���ܹܣ��׽�װ����������.", 0)
		return
	end
		
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�	
	if (quality == 1)then
		local nItemLevel = GetItemLevel(nItemIdx);
		--ÿ�;öȵļ۸�
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur * aLevelRepairScale[nLevel]/100;
		local nCostlyPrice = nCheapPrice * 3; -- ���޵�����
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("�칤���ܹܣ�<#>", 3, "����װ����"..nCostlyPrice.."�������Ĺ��׶ȣ�"..(nCostContribution*3).."��/#Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..(nCostContribution*3)..")", 
		"����װ����"..nCheapPrice.."�������Ĺ��׶ȣ�"..nCostContribution.."�㣬�;ö��½�"..nLostDur.."��/#Cheap_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCheapPrice..","..nCostContribution..")", "������/cancel")
		return	
	end
	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>�칤���ܹܣ������װ���軨�ѣ�"..nCostlyPrice.."�������Ĺ��׶ȣ�<color=yellow>"..nCostContribution.."<color>�㣬��Ҫ������", 2, "����/#TG_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..nCostContribution..")", "������/cancel")
end

function EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nCurDur = GetCurDurability(nItemIdx)
	local nFixDur = nMaxDur - nCurDur
	_dbgMsg("ʣ�������ֵ��"..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0)then
		Say("<#>�칤���ܹܣ�����ʵ��æ���ˣ������ٸ���ǿ�����������������ɣ�", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>�칤���ܹܣ�Ŀǰ�ȼ����칤���в�����������װ����", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>�칤���ܹܣ�Ŀǰ�ȼ����칤���в�����������װ����", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>�칤���ܹܣ��׽�װ����������.", 0)
		return
	end
	
	local nDurPrice = GetRepairDurPrice(nItemIdx);
	--ǿ������ӳɵļ�ֵ
	if (nPrice < 0)then
		nPrice = 0
	end
	local nDstDur = floor(nMaxDur * (1+aLevelEnhanceAdd[nLevel]/100))
	if (nDstDur > 255) then
		nDstDur = 255;
	end
	if (nCurDur > nMaxDur)then
		nFixDur = floor(nDstDur - nCurDur)
	else
		nFixDur = floor(nDstDur - nMaxDur)
	end
	if (nFixDur <= 0)then
		Say("<#>�칤���ܹܣ���װ���Ѳ�����ǿ���ˣ�", 0)
		return
	end	
	local nEnhancePrice = nDurPrice * nFixDur * 1.5
	nPrice = nPrice + nEnhancePrice
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�	
	if (quality == 1)then
		nFixDur = nMaxDur - nCurDur
		if (nFixDur < 0)then
			nFixDur = 0
		end
--		if (GetOrgMaxDurability(nItemIdx) ~= nMaxDur)then
--			Say("<#>�칤���ܹܣ�����;ö�����ʧ��װ������ǿ������")
--			return
--		end
		local nItemLevel = GetItemLevel(nItemIdx);
		--ÿ�;öȵļ۸�
		local nDurPrice = 100 * nItemLevel * nItemLevel
		--��ͨ����Ӧ��۸�
		local nCheapPrice = nDurPrice * nFixDur;
		--ǿ������
		if (nCurDur > nMaxDur)then
			nFixDur = floor(nDstDur - nCurDur)
		else
			nFixDur = floor(nDstDur - nMaxDur)
		end	
		if (nFixDur <= 0)then
			Say("<#>�칤���ܹܣ���װ���Ѳ�����ǿ���ˣ�", 0)
			return
		end	
		--����ǿ������۸�
		local nEnhancePrice = nDurPrice * nFixDur * 1.5
		--ǿ�����������޵ļ۸���	
		nEnhancePrice = nEnhancePrice*3	
		--�ܼ�
		nCheapPrice = nCheapPrice *3 + nEnhancePrice
		--���ۺ�
		local nPayPrice = floor(nCheapPrice * aLevelRepairScale[nLevel]/100)
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		Say("<#>�칤���ܹܣ�ǿ�������װ���軨�ѣ�"..nPayPrice.."�������Ĺ��׶ȣ�<color=yellow>"..nCostContribution..
		"<color>�㣬ǿ����װ���;�Ϊ "..nDstDur, 2, "����/#EH_Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nPayPrice..
				","..nCostContribution..","..nEnhancePrice..")", "������/cancel")
		return	
	end	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>�칤���ܹܣ�ǿ�������װ���軨�ѣ�"..nCostlyPrice.."�������Ĺ��׶ȣ�<color=yellow>"..nCostContribution.."<color>�㣬ǿ����װ���;�Ϊ "..nDstDur, 2, "����/#Enhance_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..
			","..nCostContribution..","..nEnhancePrice..")", "������/cancel")
end

function RepairCallBack(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	elseif (nUse == 2)then
		EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	end
end

function TG_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	if (GetCash() < nCostPrice) then
		Say("<#>�칤���ܹܣ�����������㣬�������������ɣ�", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>�칤���ܹܣ���Ĺ��׶Ȳ��㣬Ҫʹ�ð����ʩ����ȻҪ�԰���й��ײ��У�", 0)
		return
	end
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
	--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
end

function Enhance_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	if (GetCash() < nCostPrice) then
		Say("<#>�칤���ܹܣ�����������㣬�������������ɣ�", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>�칤���ܹܣ���Ĺ��׶Ȳ��㣬Ҫʹ�ð����ʩ����ȻҪ�԰���й��ײ��У�", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	EH_SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx) * (1+aLevelEnhanceAdd[nLevel]/100))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
end
--����
function Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>�칤���ܹܣ���Ĺ��׶Ȳ��㣬Ҫʹ�ð����ʩ����ȻҪ�԰���й��ײ��У�", 0)
		return
	end
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("�޸�װ����")
		SetCurDurability(nItemIdx, nCurMaxDur)
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��("..nCostPrice..")�����ӣ�("..nCostContribution..")�㹱�׶ȣ����޻ƽ�װ��(ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>�칤���ܹܣ�����������㣬�������������ɣ�", 0)
		return
	end
end
--����
function Cheap_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>�칤���ܹܣ���Ĺ��׶Ȳ��㣬Ҫʹ�ð����ʩ����ȻҪ�԰���й��ײ��У�", 0)
		return
	end
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		AddContribution(-nCostContribution)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��("..nCostPrice..")�����ӣ�"..nCostContribution.."�㹱�׶ȣ����޻ƽ�װ��(ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nFixMaxDur..")���;ö������½�"..nLostDur.."��");
	else
		Say("<#>�칤���ܹܣ�����������㣬�������������ɣ�", 0)
		return
	end
end
--ǿ������
function EH_Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>�칤���ܹܣ���Ĺ��׶Ȳ��㣬Ҫʹ�ð����ʩ����ȻҪ�԰���й��ײ��У�", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("�޸�װ����")
		EH_SetCurDurability(nItemIdx, nCurMaxDur* (1+aLevelEnhanceAdd[nLevel]/100))
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
		WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��("..nCostPrice..")�����ӣ�("..nCostContribution..")�㹱�׶ȣ�ǿ�����޻ƽ�װ��(ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>�칤���ܹܣ�����������㣬�������������ɣ�", 0)
		return
	end
end

function cancel()
end

else
-----------------����ǿͻ���---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>û�а��"	
	end
	local bOpen	--�Ƿ���
	local bPause --�Ƿ���ͣ
	local nCurLevel --��ǰ�ȼ�
	local nUseLevel --��ǰʹ�õȼ�
	local nOpenFund --��ǰ��������
	local nMaintainFund --��ǰά������
	local nScale  --��ǰά��װ��������
	local dAdvanceRepairCount	--��ǰÿ��ǿ�������������
	local nAdvanceEnhance --��ǰǿ�������;öȳ������޵İٷֱ�
	local szRepairKind --��ǰ��ά�޵�װ��Ʒ��
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelRepairScale[nUseLevel] / 10)
			dAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])
			nAdvanceEnhance = aLevelEnhanceAdd[nUseLevel]
			if(aLevelRepairLevel[nUseLevel] == 1) then
				szRepairKind = "<color=white>��װ<color>��<color=water>��װ<color>"
			elseif(aLevelRepairLevel[nUseLevel] == 2) then
				szRepairKind = "<color=white>��װ<color>��<color=water>��װ<color>��<color=Violet>��װ<color>"
			else
				szRepairKind = "<color=white>��װ<color>��<color=water>��װ<color>��<color=Violet>��װ<color>��<color=gold>�ƽ�װ��<color>"
			end
		else
			nScale = "--"
			dAdvanceRepairCount = "--"
			nAdvanceEnhance = "--"
			szRepairKind = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextAdvanceRepairCount,nNextAdvanceEnhance,szNextRepairKind
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then		
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextScale = format("%.1f",aLevelRepairScale[nUseLevel + 1] / 10) --�¼�ά��װ��������
		dNextAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --�¼�ÿ��ǿ�������������
		nNextAdvanceEnhance = aLevelEnhanceAdd[nUseLevel + 1]
		if(aLevelRepairLevel[nUseLevel + 1] == 1) then
			szNextRepairKind = "<color=white>��װ<color>��<color=water>��װ<color>"
		elseif(aLevelRepairLevel[nUseLevel + 1] == 2) then
			szNextRepairKind = "<color=white>��װ<color>��<color=water>��װ<color>��<color=Violet>��װ<color>"
		else
			szNextRepairKind = "<color=white>��װ<color>��<color=water>��װ<color>��<color=Violet>��װ<color>��<color=gold>�ƽ�װ��<color>"
		end
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextAdvanceRepairCount = "--"
		szNextRepairKind = "<color=Violet>--<color>"
		nNextAdvanceEnhance = "--"
	end
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>��ͣ" elseif bOpen == 1 then state="<color=green>����" else state="<color=red>�ر�" end
		local szMsg = "����״̬��"..state.."<color>\n"..
			"�����ȼ���<color=gold>"..nCurLevel.."<color>��\n"..
			"��ǰʹ�õȼ���<color=gold>"..nUseLevel.."<color>��\n"..
			"��ά�޵�װ�����ࣺ"..szRepairKind.."\n"..
			"ά��װ���Żݶȣ�<color=gold>"..nScale.."<color>��\n"..
			"ǿ�������;öȳ������ޣ�<color=gold>"..nAdvanceEnhance.."%<color>\n"..
			"ÿ��ǿ������������ߣ�<color=gold>"..dAdvanceRepairCount.."<color>��\n"..		
			"ÿ��ά������ս������<color=gold>"..nMaintainFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nOpenFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һʹ�õȼ�<color>\n"..
			"<color=water>��ά�޵�װ�����ࣺ"..szNextRepairKind.."\n"..
			"ά��װ���Żݶȣ�<color=Violet>"..nNextScale.."<color>��\n"..
			"ǿ�������;öȳ������ޣ�<color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"ÿ��ǿ������������ߣ�<color=Violet>"..dNextAdvanceRepairCount.."<color>��\n"..	
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	else
		local szMsg = "����״̬��<color=water>δ����<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һ�ȼ�<color>\n"..
			"<color=water>��ά�޵�װ�����ࣺ"..szNextRepairKind.."\n"..
			"ά��װ���Żݶȣ�<color=Violet>"..nNextScale.."<color>��\n"..
			"ǿ�������;öȳ������ޣ�<color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"ÿ��ǿ������������ߣ�<color=Violet>"..dNextAdvanceRepairCount.."<color>��\n"..	
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	end
end

end