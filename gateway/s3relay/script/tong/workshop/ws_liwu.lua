Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelHongBaoCoef = {}
aLevelHongBaoPrice = {}
aLevelPriceBag = {}		--������ĸ���Ļ��ѹ��׶�
--aLevelPartnerLevel = {} --������ĸ����ͬ��ȼ�����
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\liwu_level_data.txt", "liwuLevelData")
	if b1~=1 then
		print("�����������������ļ�ʧ�ܣ�")
		return
	end
	local nRowCount = TabFile_GetRowCount("liwuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("liwuLevelData", y, "LEVEL"))
		aLevelHongBaoCoef[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "OUTPUT_COEF"))
		aLevelHongBaoPrice[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE"))
		aLevelPriceBag[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE_BAG"))
		--aLevelPartnerLevel[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PARTNER_LEVEL"))
	end
	--TabFile_UnLoad("liwuLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
if MODEL_GAMESERVER == 1 then
IncludeLib("PARTNER")
end

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "���ﷻ�ܹ�") ~= 1 then
		return 0
	end
	Say("<#>���ﷻ�ܹܣ������ʹ��������о�ϲ��������ڲ�����Ҫ�վ��մ�����", 2, 
	"��ȡ���/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")", "������ĸ��/#partner_bag".."("..nTongID..
	","..nWorkshopID..")", "������/cancel");
	return 1;
end

function partner_bag(nTongID, nWorkshopID)
	local nBagLevel = GetPartnerBagLevel()
	if (nBagLevel >=10 )then
		Say("<#>���ﷻ�ܹܣ������ĸ���Ѿ�������ˣ��ٴ�ͱ�������", 1, "֪����/cancel")
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nBagLevel >= nLevel)then
		Say("���ﷻ�ܹܣ����������ĸ��Ϊ"..nBagLevel.."����Ŀǰ�����ﷻ��ʹ�õȼ������ܹ����������ĸ����", 
			1, "����ֻ���պ�����/cancel")
			return
	end
	Say("���ﷻ�ܹܣ����������ĸ��Ϊ"..nBagLevel.."��������<color=yellow>"..aLevelPriceBag[nBagLevel+1].."<color>�㹱�׶��ҾͿ��԰�����ĸ������һЩ���費��Ҫ�أ�",2,
		"̫���ˣ����������/#YaoBag("..nTongID..","..nWorkshopID..")", "�Ȳ�����/cancel")
end

function YaoBag(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nToLevel = GetPartnerBagLevel()+1
	if (nToLevel > nLevel)then
		Say("���ﷻ�ܹܣ�Ŀǰ�����ﷻ��ʹ�õȼ������ܹ����������ĸ����", 
			1, "����ֻ���պ�����/cancel")
			return
	end
	if (GetContribution() < aLevelPriceBag[nToLevel])then
		Say("<#>���ﷻ�ܹܣ���Ĺ��׶Ȳ����أ��ٶ�Ϊ�����Щ�����", 1, "��Ȼ������/cancel")
		return
	end
	AddContribution(-aLevelPriceBag[nToLevel])
	SetPartnerBagLevel(nToLevel)
	Say("<#>���ﷻ�ܹܣ������ҵ����հɣ����ȿ�ȡ���ϣ��㿴�����"..nToLevel.."����ĸ���Ѿ��ӹ����ˣ��Ժ���������������", 1, 
		"��Ȼ�����鴫��/cancel")
	Msg2Player("�����ĸ������"..nToLevel.."�����ռ�õ�������")
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelHongBaoCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ������ȡ�����
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nHongbaoLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nHongbaoLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelHongBaoPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
			local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	_dbgMsg("ʣ�������*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
			if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>���ﷻ�ܹܣ��Բ��𣬽������Ʒ�Ѿ�������ϣ������������ɣ�", 0)
				return 0;
			end
	Say("<#>���ﷻ�ܹܣ�����Ҫ����<color=yellow>"..aLevelHongBaoPrice[nLevel].."<color>�㹱�׶Ȼ�ȡһ�����", 2, 
		"�ð�/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "����/cancel");
	else
		Talk(1,"","ϵͳ���� !")
			return
	end
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		Say("<#>���ﷻ�ܹܣ��Բ�����Ĺ��׶Ȳ��㣬������ȡ����أ�", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>���ﷻ�ܹܣ���Ҫ�Ķ�����û���������Ե�Ƭ�̣�", 0)
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "װ����Ҫ������λ.");
		return 
	end
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		return
	end
	AddContribution(-aLevelHongBaoPrice[nLevel]);
	Msg2Player("��������"..aLevelHongBaoPrice[nLevel].."�㹱�׶ȣ�����˰�����غ��һ����");
	AddItem(6, 1, 1021, 1, 0, 0, 0);
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
	local nPrice  --��ǰ��ȡ���غ���Ĺ��׶�
	local dHongBaoCount	--��ǰÿ�����غ���ղ�����������
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelHongBaoPrice[nUseLevel]
			dHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel] / aLevelHongBaoCoef[1])	
		else
			nPrice = "--"
			dHongBaoCount = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextHongBaoCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextPrice = aLevelHongBaoPrice[nUseLevel + 1] --�¼���ȡ���غ���Ĺ��׶�
		dNextHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel + 1] / aLevelHongBaoCoef[1]) --�¼�ÿ�����غ���ղ�����������
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextHongBaoCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>��ͣ" elseif bOpen == 1 then state="<color=green>����" else state="<color=red>�ر�" end
		local szMsg = "����״̬��"..state.."<color>\n"..
			"�����ȼ���<color=gold>"..nCurLevel.."<color>��\n"..
			"��ǰʹ�õȼ���<color=gold>"..nUseLevel.."<color>��\n"..
			"���غ���ղ�����������ߣ�<color=gold>"..dHongBaoCount.."<color>��\n"..		
			"��ȡ���غ�����蹱�׶ȣ�<color=gold>"..nPrice.."<color>\n"..
			"ÿ��ά������ս������<color=gold>"..nMaintainFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nOpenFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һʹ�õȼ�<color>\n"..
			"<color=water>���غ���ղ�����������ߣ�<color=Violet>"..dNextHongBaoCount.."<color>��\n"..	
			"��ȡ���غ�����蹱�׶ȣ�<color=Violet>"..nNextPrice.."<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	else
		local szMsg = "����״̬��<color=water>δ����<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һ�ȼ�<color>\n"..
			"<color=water>���غ���ղ�����������ߣ�<color=Violet>"..dNextHongBaoCount.."<color>��\n"..	
			"��ȡ���غ�����蹱�׶ȣ�<color=Violet>"..nNextPrice.."<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	end
end

end