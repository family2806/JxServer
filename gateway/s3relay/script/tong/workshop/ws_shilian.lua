Include("\\script\\tong\\workshop\\workshop_head.lua")

IncludeLib("SETTING")

TASKID_GET_TIME = 2347
aLevelTime = {}
aLevelOutputCoef = {}
aLevelCost= {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\shilian_level_data.txt", "shilianLevelData")
	if b1~=1 then
		print("�����������������ļ�ʧ�ܣ�")
		return
	end
	local nRowCount = TabFile_GetRowCount("shilianLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("shilianLevelData", y, "LEVEL"))
		aLevelTime[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "TIME"))
		aLevelOutputCoef[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "OUTPUT_COEF"))	
		aLevelCost[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "COST"))
	end
	--TabFile_UnLoad("shilianLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
	if MODEL_GAMESERVER == 1 then		--ֻ��GAMESERVER ���е�
		Include("\\script\\item\\techan_dahuandan.lua");
	end;

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "�������ܹ�") ~= 1 then
		return 0
	end
	local aryszContent = {
		"��Ҫ��ȡ����������/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"��ȡ����ľ��/#use_xiulianmuren("..nTongID..","..nWorkshopID..")",
	}
	-- Խ�ϰ�ȡ���󻹵�
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent,"��ô󻹵�/#use_dahuandan("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent,"�´ΰ�/cancel");
	
	Say("<#>�������ܹܣ�����һ���������ֵĴ�������Ҫ��־��ǿ������Σ�գ�������󣬲��ܴﵽ���˵ĳɼ�!", getn(aryszContent), aryszContent)
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (GetTask(TASKID_GET_TIME) == TONG_GetDay(nTongID))then
		Say("<#>�������ܹܣ�������Ѿ���ȡ���ˣ������������ɣ�", 0)
		return 0;		
	end
	_dbgMsg("ʣ����ȡ����*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>�������ܹܣ��������Ƶ��������Ѿ��������������������ɣ�", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>���ﷻ�ܹܣ�����Ҫ����<color=yellow>"..aLevelCost[nLevel].."<color>�㹱�׶ȣ��������������÷����߾��鷭����Сʱ��", 2, 
		"�ð�/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "����/cancel");
--	if (GetNpcExpRate() > 100) then
--		Say("<#>�������ܹܣ��Բ���˫�������ڼ䲻��ʹ����������", 0)
--		return
--	end
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelCost[nLevel]) then
		Say("<#>�������ܹܣ��Բ�����Ĺ��׶Ȳ��㣡", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>�������ܹܣ����ϴ�Ҫ�Ķ�����û���������Ե�Ƭ�̣�", 0)
		return
	end
	
	if CalcFreeItemCellCount() < floor(aLevelTime[nLevel] * 2) then
		Talk(1, "", format("Ϊȷ���Ʋ���ȫ�������� %d ��λ.", floor(aLevelTime[nLevel] * 2)));
		return 
	end
	
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);	
end

--------------------------------------------------
--/////////////////////////
--����ľ��
--
--/////////////////////////
VALUE_MUREN_CONTRIBUTION = 100
function use_xiulianmuren(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
	Say("<#>�������ܹܣ�˵���������ķ�����Ȼ����ʵս������һ������������Ҳ������ô���׵ģ������ҷ�����һ��ľ�ˣ���������ʱ��ص�������ֻҪ�Ҽ��������ľ�˱����ٻ���һ��ľ������������������ɻ�ô������飬�����������ȼ�Խ������������ľ�˵ľ���ֵ��Խ�ߡ��������<color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color>�㹱�׶�����һ������Ҫ����", 3,
	"����һ������ľ��/#sl_sure2muren("..nTongID..","..nWorkshopID..")",
	"��������ľ��/sl_helpmuren",
	"������/cancel")
	else
			Talk(1,"","��ȡ��Ʒʱ��Ϊÿ��12h30��22h!")
			return
	end
	
end

function sl_helpmuren()
	Say("<#>�������ܹܣ�ʹ������ľ�˿����ٻ���һ��ľ��NPC����������ܻ��100���顣�������ȼ�Խ������������ľ�˵ľ���ֵ��Խ�ߣ�������105���߼���110�򣻰˼���115�򣻾ż���120��ʮ����130�򣩡�Ҫע����ǣ����ľ��ֻ���Լ���ܲ��ܻ�þ��飬���˴��ǲ��ܻ���κξ���ġ�", 0)
end

function sl_sure2muren(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>�������ܹܣ��Բ��������ڰ���������Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0)
		Msg2Player("������ͣ�������޷�ʹ�á�")
		return
	end
	
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>�������ܹܣ�������ᶼû�룬�������", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 5) then
		Say("<#>�������ܹܣ��Բ��������ڰ����������ʹ�õȼ�û�дﵽ5�����޷���øð���ز���", 0)
		Msg2Player("����ʹ�õȼ�û�дﵽ5���������޷�ʹ�á�")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_MUREN_CONTRIBUTION )) then
		Say("<#>�������ܹܣ����������ľ���ѷַ���ϣ������������ɣ�", 0)
		return
	end
	
	if (GetContribution() < VALUE_MUREN_CONTRIBUTION or AddContribution(-VALUE_MUREN_CONTRIBUTION) ~= 1)then
		Say("<#>�������ܹܣ��Բ������ĸ��˹��׶Ȳ���<color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color>�㣬�޷�������ز�����Ŭ����ȡ���˹��׶ȡ�", 0)
		Msg2Player("���˹��׶Ȳ��㣬�����޷�ʹ�á�")
		return 
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "װ����Ҫ������λ.");
		return 
	end
	
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_MUREN_CONTRIBUTION ))
	
	local nItemIndex = AddItem(6,1,1085,1,1,0)
	SetSpecItemParam(nItemIndex, 1, nTongID)
	SetSpecItemParam(nItemIndex, 2, nUseLevel)
	SyncItem(nItemIndex)
	Msg2Player("���ɹ�������һ������ľ�ˡ�")
	Say("<#>�������ܹܣ����ɹ�������һ������ľ�ˡ�", 0)
end

--////////////////////
--�󻹵�
--
--////////////////////

VALUE_HUANDAN_CONTRIBUTION = 30
tbHUANDAN_ADDEXP = {
[4] = 1.25,
[5] = 1.3,
[6] = 1.35,
[7] = 1.4,
[8] = 1.45,
[9] = 1.5,
[10] = 1.6,
}
TASKID_TECHAN_HUANDAN_EXP = 1741	--�󻹵�ÿ�θ��뾭��ֵ
TASKID_TECHAN_HUANDAN_TIME = 1742	--�󻹵�ʣ��ʹ��ʱ��
function use_dahuandan(nTongID, nWorkshopID)
	local nResttime = GetTask(TASKID_TECHAN_HUANDAN_TIME)
	local nExtpre = GetTask(TASKID_TECHAN_HUANDAN_EXP)
	if (nResttime == 0 and nExtpre ~= 0) then
		SetTask(TASKID_TECHAN_HUANDAN_EXP, 0)
	end
	local szMsg = ""
	if (nResttime ~= 0) then
		local nRestH, nRestM = GetMinAndSec(nResttime)
		szMsg = "����ǰ�Ĵ󻹵�����ʹ��<color=yellow>"..nRestH.."<color>Сʱ<color=yellow>"..nRestM.."<color>�֡�"
	end
	Say("<#>�������ܹܣ���������ĵ�ҩ����������ʹ�������йܹ���ʱ��ø���ľ��飬���ʹ�κμ���ͬ����һ�������顣ÿ�Ŵ󻹵���Ҫ����30����˹��׶ȣ�����ʹ��6Сʱ��"..szMsg, 3,
	"<#>����һ�Ŵ󻹵�/#sl_sure2dahuandan("..nTongID..","..nWorkshopID..")",
	"<#>���ڴ󻹵�/sl_helpdahuandan",
	"<#>������/cancel")
end

function sl_helpdahuandan()
	Say("�������ܹܣ��󻹵�����������ʹ�������йܹ���ʱ��ø���ľ���ֵ������������������������й�ʱ�䣬���Ҵ󻹵��ľ���ӳ�ֻ���������йܵĻ��������Ͻ��еģ��������ĵȼ�Խ����������Ĵ󻹵�����ӳ�Խ�ߣ��ļ���1.25��;�弶��1.3��;������1.35��;�߼���1.4��;�˼���1.45��;�ż���1.5��;ʮ����1.6������", 0)
end

function sl_sure2dahuandan(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>�������ܹܣ��Բ��������ڰ���������Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0)
		Msg2Player("������ͣ�������޷�ʹ�á�")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>�������ܹܣ�������ᶼû�룬�������", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 4) then
		Say("<#>�������ܹܣ��Բ��������ڰ����������ʹ�õȼ�û�дﵽ4�����޷���øð���ز���", 0)
		Msg2Player("����ʹ�õȼ�û�дﵽ4���������޷�ʹ�á�")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_HUANDAN_CONTRIBUTION )) then
		Say("<#>�������ܹܣ�����Ĵ󻹵��ѷַ���ϣ������������ɣ�", 0)
		return
	end
	
	if (GetContribution() < VALUE_HUANDAN_CONTRIBUTION or AddContribution(-VALUE_HUANDAN_CONTRIBUTION) ~= 1)then
		Say("<#>�������ܹܣ��Բ������ĸ��˹��׶Ȳ���<color=yellow>"..VALUE_HUANDAN_CONTRIBUTION.."<color>�㣬�޷�������ز�����Ŭ����ȡ���˹��׶ȡ�", 0)
		Msg2Player("���˹��׶Ȳ��㣬�����޷�ʹ�á�")
		return 
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_HUANDAN_CONTRIBUTION ))

	local nRestH, nRestM = adddahuandan_main(nUseLevel)
	Msg2Player("<#>��ɹ�������һ�Ŵ󻹵�����Ŀǰ�Ĵ󻹵�Ч��ʱ��Ϊ"..nRestH.."Сʱ"..nRestM.."�֡�")
	Say("<#>�������ܹܣ���ɹ�������һ��6Сʱ����ӳ�"..tbHUANDAN_ADDEXP[nUseLevel].."���Ĵ󻹵�����Ŀǰ�Ĵ󻹵�Ч��ʱ��Ϊ"..nRestH.."Сʱ"..nRestM.."�֡�", 0)
end


----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelOutputCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal)--��ʼ������ȡ˫��
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelTime[nLevel] * 50)
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nCost = aLevelCost[nLevel]
	if (GetContribution() < nCost) then
		return
	end
	SetTask(TASKID_GET_TIME, TONG_GetDay(nTongID))
	local nCount = floor(aLevelTime[nLevel] * 2)
	AddContribution(-nCost)
	Msg2Player("��������"..nCost.."�㹱�׶ȣ�")
	for i = 1, nCount do 
		AddItem(6,1,1076,1,0,0)
	end
	--AddSkillState(440, 1, 1, aLevelTime[nLevel] * 3600 * 18)
	Msg2Player("������"..nCount.."�����������裡")
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
	local nPrice  --��ǰ��ȡ˫������Ĺ��׶�
	local dDoubleExpCount	--��ǰÿ����ȡ˫�����������������
	local nTime	--��ǰ˫������ʱ��
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelCost[nUseLevel]
			dDoubleExpCount = format("%.2f", aLevelOutputCoef[nUseLevel] / aLevelOutputCoef[1])
			nTime = aLevelTime[nUseLevel]
		else
			nPrice = "--"
			dDoubleExpCount = "--"
			nTime = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextDoubleExpCount,nNextTime
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextPrice = aLevelCost[nUseLevel + 1] --�¼���ȡ˫������Ĺ��׶�
		dNextDoubleExpCount = format("%.2f", aLevelOutputCoef[nUseLevel + 1] / aLevelOutputCoef[1]) --�¼�ÿ����ȡ˫�����������������
		nNextTime = aLevelTime[nUseLevel + 1] --�¼�˫������ʱ��
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextDoubleExpCount = "--"
		nNextTime = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>��ͣ" elseif bOpen == 1 then state="<color=green>����" else state="<color=red>�ر�" end
		local szMsg = "����״̬��"..state.."<color>\n"..
			"�����ȼ���<color=gold>"..nCurLevel.."<color>��\n"..
			"��ǰʹ�õȼ���<color=gold>"..nUseLevel.."<color>��\n"..
			"ÿ����ȡ˫����������������ߣ�<color=gold>"..dDoubleExpCount.."<color>��\n"..	
			"˫������ʱ�䣺<color=gold>"..nTime.."<color>Сʱ\n"..
			"��ȡ˫���������蹱�׶ȣ�<color=gold>"..nPrice.."<color>\n"..
			"ÿ��ά������ս������<color=gold>"..nMaintainFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nOpenFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һʹ�õȼ�<color>\n"..
			"<color=water>ÿ����ȡ˫����������������ߣ�<color=Violet>"..dNextDoubleExpCount.."<color>��\n"..
			"˫������ʱ�䣺<color=Violet>"..nNextTime.."<color>Сʱ\n"..
			"��ȡ˫���������蹱�׶ȣ�<color=Violet>"..nNextPrice.."<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	else
		local szMsg = "����״̬��<color=water>δ����<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һ�ȼ�<color>\n"..
			"<color=water>ÿ����ȡ˫����������������ߣ�<color=Violet>"..dNextDoubleExpCount.."<color>��\n"..	
			"˫������ʱ�䣺<color=Violet>"..nNextTime.."<color>Сʱ\n"..
			"��ȡ˫���������蹱�׶ȣ�<color=Violet>"..nNextPrice.."<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	end
end

end