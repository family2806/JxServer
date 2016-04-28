Include("\\script\\tong\\workshop\\workshop_head.lua")

IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")

TASKID_GET_TIME = 2347
aLevelTime = {}
aLevelOutputCoef = {}
aLevelCost= {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\shilian_level_data.txt", "shilianLevelData")
	if b1~=1 then
		print("��c t�p config th� luy�n ph��ng th�t b�i!")
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
	if SVR_CheckUse(nTongID, nWorkshopID, "T�ng qu�n Th� luy�n ph��ng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"Ta mu�n nh�n Tu th�n ho�n/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"Nh�n ���c M�c nh�n/#use_xiulianmuren("..nTongID..","..nWorkshopID..")",
	}
	-- Խ�ϰ�ȡ���󻹵�
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent,"Nh�n ���c ��i ho�n ��n/#use_dahuandan("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent,"L�n sau v�y/cancel");
	
	Say("<#>T�ng qu�n Th� luy�n ph��ng������һ���������ֵĴ�������Ҫ��־��ǿ������Σ�գ�������󣬲��ܴﵽ���˵ĳɼ�!", getn(aryszContent), aryszContent)
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (GetTask(TASKID_GET_TIME) == TONG_GetDay(nTongID))then
		Say("<#>T�ng qu�n Th� luy�n ph��ng��������Ѿ���ȡ���ˣ������������ɣ�", 0)
		return 0;		
	end
	_dbgMsg("S� l�n nh�n c�n l�i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���������Ƶ��������Ѿ��������������������ɣ�", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n L� ph�m ph��ng: C�n s� d�ng <color=yellow>"..aLevelCost[nLevel].."<color> �i�m c�ng hi�n, Tu Luy�n Ho�n c� th� gi�p nh�n ��i kinh nghi�m trong 30 ph�t.", 2, 
		"���c. /#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "Kh�ng mu�n/cancel");
--	if (GetNpcExpRate() > 100) then
--		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ���˫�������ڼ䲻��ʹ����������", 0)
--		return
--	end
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelCost[nLevel]) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ�����Ĺ��׶Ȳ��㣡", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>T�ng qu�n Th� luy�n ph��ng�����ϴ�Ҫ�Ķ�����û���������Ե�Ƭ�̣�", 0)
		return
	end
	
	if CalcFreeItemCellCount() < floor(aLevelTime[nLevel] * 2) then
		Talk(1, "", format("�� b�o ��m an to�n t�i s�n, xin m�i �� tr�ng %d �.", floor(aLevelTime[nLevel] * 2)));
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
	Say("<#>T�ng qu�n Th� luy�n ph��ng��˵���������ķ�����Ȼ����ʵս������һ������������Ҳ������ô���׵ģ������ҷ�����һ��ľ�ˣ���������ʱ��ص�������ֻҪ�Ҽ��������ľ�˱����ٻ���һ��ľ������������������ɻ�ô������飬�����������ȼ�Խ������������ľ�˵ľ���ֵ��Խ�ߡ��������<color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color> �i�m c�ng hi�n �� ��i, c� ��ng � kh�ng?", 3,
	"��i 1 m�c nh�n/#sl_sure2muren("..nTongID..","..nWorkshopID..")",
	"M�c nh�n l� g�?/sl_helpmuren",
	"Kh�ng c�n ��u/cancel")
	else
			Talk(1,"","Th�i gian nh�n v�t ph�m l� t� 12h30 ��n 22h h�ng ng�y !")
			return
	end
	
end

function sl_helpmuren()
	Say("<#>T�ng qu�n Th� luy�n ph��ng��ʹ������ľ�˿����ٻ���һ��ľ��NPC����������ܻ��100���顣�������ȼ�Խ������������ľ�˵ľ���ֵ��Խ�ߣ�������105���߼���110�򣻰˼���115�򣻾ż���120��ʮ����130�򣩡�Ҫע����ǣ����ľ��ֻ���Լ���ܲ��ܻ�þ��飬���˴��ǲ��ܻ���κξ���ġ�", 0)
end

function sl_sure2muren(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ��������ڰ���������Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0)
		Msg2Player("T�c ph��ng �ang t�m ng�ng ho�t ��ng.")
		return
	end
	
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng��������ᶼû�룬�������", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 5) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ��������ڰ����������ʹ�õȼ�û�дﵽ5�����޷���øð���ز���", 0)
		Msg2Player("��ng c�p s� d�ng t�c ph��ng ch�a �� c�p 5, kh�ng th� s� d�ng ch�c n�ng n�y.")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_MUREN_CONTRIBUTION )) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng�����������ľ���ѷַ���ϣ������������ɣ�", 0)
		return
	end
	
	if (GetContribution() < VALUE_MUREN_CONTRIBUTION or AddContribution(-VALUE_MUREN_CONTRIBUTION) ~= 1)then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ������ĸ��˹��׶Ȳ���<color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color> �i�m, kh�ng th� ��i l�y bang v�t.", 0)
		Msg2Player("�i�m c�ng hi�n c� nh�n kh�ng ��, kh�ng th� s� d�ng ch�c n�ng n�y.")
		return 
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "H�nh trang ph�i c� hai � tr�ng.");
		return 
	end
	
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_MUREN_CONTRIBUTION ))
	
	local nItemIndex = AddItem(6,1,1085,1,1,0)
	SetSpecItemParam(nItemIndex, 1, nTongID)
	SetSpecItemParam(nItemIndex, 2, nUseLevel)
	SyncItem(nItemIndex)
	Msg2Player("��i th�nh c�ng 1 M�c Nh�n.")
	Say("<#>T�ng qu�n Th� luy�n ph��ng����i th�nh c�ng 1 M�c Nh�n.", 0)
	tbLog:PlayerActionLog("TinhNangKey","NhanLenhBaiMocNhan")
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
		szMsg = "��i ho�n ��n c�a ng��i hi�n t�i c�n c� th� s� d�ng trong <color=yellow>"..nRestH.."<color> gi� <color=yellow>"..nRestM.."<color> ph�t."
	end
	Say("<#>T�ng qu�n Th� luy�n ph��ng����������ĵ�ҩ����������ʹ�������йܹ���ʱ��ø���ľ��飬���ʹ�κμ���ͬ����һ�������顣ÿ�Ŵ󻹵���Ҫ����30����˹��׶ȣ�����ʹ��6gi� ��"..szMsg, 3,
	"<#>Mua 1 vi�n ��i ho�n ��n/#sl_sure2dahuandan("..nTongID..","..nWorkshopID..")",
	"<#>��i ho�n ��n l� g�/sl_helpdahuandan",
	"<#>Kh�ng c�n ��u/cancel")
end

function sl_helpdahuandan()
	Say("T�ng qu�n Th� luy�n ph��ng���󻹵�����������ʹ�������йܹ���ʱ��ø���ľ���ֵ������������������������й�ʱ�䣬���Ҵ󻹵��ľ���ӳ�ֻ���������йܵĻ��������Ͻ��еģ��������ĵȼ�Խ����������Ĵ󻹵�����ӳ�Խ�ߣ��ļ���1.25��;�弶��1.3��;������1.35��;�߼���1.4��;�˼���1.45��;�ż���1.5��;ʮ����1.6������", 0)
end

function sl_sure2dahuandan(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ��������ڰ���������Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0)
		Msg2Player("T�c ph��ng �ang t�m ng�ng ho�t ��ng.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng��������ᶼû�룬�������", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 4) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ��������ڰ����������ʹ�õȼ�û�дﵽ4�����޷���øð���ز���", 0)
		Msg2Player("��ng c�p s� d�ng t�c ph��ng ch�a �� c�p 4, kh�ng th� s� d�ng ch�c n�ng n�y.kh�ng th� s� d�ng ch�c n�ng n�y")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_HUANDAN_CONTRIBUTION )) then
		Say("<#>T�ng qu�n Th� luy�n ph��ng������Ĵ󻹵��ѷַ���ϣ������������ɣ�", 0)
		return
	end
	
	if (GetContribution() < VALUE_HUANDAN_CONTRIBUTION or AddContribution(-VALUE_HUANDAN_CONTRIBUTION) ~= 1)then
		Say("<#>T�ng qu�n Th� luy�n ph��ng���Բ������ĸ��˹��׶Ȳ���<color=yellow>"..VALUE_HUANDAN_CONTRIBUTION.."<color> �i�m, kh�ng th� ��i l�y bang v�t.", 0)
		Msg2Player("�i�m c�ng hi�n c� nh�n kh�ng ��, kh�ng th� s� d�ng ch�c n�ng n�y.")
		return 
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_HUANDAN_CONTRIBUTION ))

	local nRestH, nRestM = adddahuandan_main(nUseLevel)
	Msg2Player("<#>Nh�n ���c 1 vi�n ��i ho�n ��n, th�i gian s� d�ng l�: "..nRestH.."gi� "..nRestM.."ph�t.")
	Say("<#>T�ng qu�n Th� luy�n ph��ng����ɹ�������һ��6gi� ����ӳ�"..tbHUANDAN_ADDEXP[nUseLevel].." l�n, th�i gian c�n l�i l� "..nRestH.."gi� "..nRestM.."ph�t.", 0)
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
	Msg2Player("B�n ti�u t�n "..nCost.." �i�m c�ng hi�n!")
	for i = 1, nCount do 
		AddItem(6,1,1076,1,0,0)
	end
	--AddSkillState(440, 1, 1, aLevelTime[nLevel] * 3600 * 18)
	Msg2Player("B�n ��t ���c"..nCount.." Tu th�n ho�n!")
end

function cancel()
end

else
-----------------����ǿͻ���---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh�ng c� bang h�i"	
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
		if bPause == 1 then state="<color=yellow>T�m ng�ng" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>��ng c�a" end
		local szMsg = "Tr�ng th�i t�c ph��ng: "..state.."<color>\n"..
			"��ng c�p t�c ph��ng: <color=gold>"..nCurLevel.."<color>\n"..
			"��ng c�p s� d�ng hi�n t�i: <color=gold>"..nUseLevel.."<color>\n"..
			"Gi�i h�n m�i ng�y s� ng��i nh�n ���c nh�n ��i kinh nghi�m t�ng l�n:  <color=gold>"..dDoubleExpCount.."<color> l�n\n"..	
			"Th�i gian nh�n ��i kinh nghi�m: <color=gold>"..nTime.."<color>gi� \n"..
			"�i�m c�ng hi�n ti�u hao �� nh�n nh�n ��i kinh nghi�m: <color=gold>"..nPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=gold>"..nMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=gold>"..nOpenFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t �� n�ng c�p: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p s� d�ng k� ti�p <color>\n"..
			"<color=water>Gi�i h�n s� l��ng ng��i nh�n nh�n ��i kinh nghi�m t�ng l�n: <color=Violet>"..dNextDoubleExpCount.."<color> l�n\n"..
			"Th�i gian nh�n ��i kinh nghi�m: <color=Violet>"..nNextTime.."<color>gi� \n"..
			"�i�m c�ng hi�n ti�u hao �� nh�n nh�n ��i kinh nghi�m: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	else
		local szMsg = "Tr�ng th�i t�c ph��ng: <color=water>δ����<color>\n"..
			"Ng�n s�ch ki�n th�t c�n �� x�y d�ng: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p k� ti�p <color>\n"..
			"<color=water>Gi�i h�n s� l��ng ng��i nh�n nh�n ��i kinh nghi�m t�ng l�n: <color=Violet>"..dNextDoubleExpCount.."<color> l�n\n"..	
			"Th�i gian nh�n ��i kinh nghi�m: <color=Violet>"..nNextTime.."<color>gi� \n"..
			"�i�m c�ng hi�n ti�u hao �� nh�n nh�n ��i kinh nghi�m: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	end
end

end