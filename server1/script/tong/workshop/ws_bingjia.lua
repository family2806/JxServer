Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelScale = {}
aLevelStoneValue = {}
aLevelLingPaiPrice	=	{};		--Boss�ٻ����ȼ�����ʽ�����
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\bingjia_level_data.txt", "bingjiaLevelData")
	if b1~=1 then
		print("��c t�p config binh gi�p ph��ng th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("bingjiaLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "OUTPUT_COEF"))
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "SCALE"))
		aLevelStoneValue[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "STONE_VALUE"))	
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LINGPAI_PRICE"))
	end
	--TabFile_UnLoad("bingjiaLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
	if MODEL_GAMESERVER == 1 then	--GAMESERVER ���е�
		Include("\\script\\item\\techan_zijingao.lua");
	end;

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "T�ng qu�n Binh gi�p ph��ng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"Nh�n Tr�n bang chi th�ch/#use_g_1".."("..nTongID..","..nWorkshopID..")",
		"Ch� t�o trang b�/#use_g_2".."("..nTongID..","..nWorkshopID..")",
	}
	
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "Nh�n T� kim c�o/#use_zijingao("..nTongID..","..nWor);
	elseif(GetProductRegion() == "vn") then
		tinsert(aryszContent, "Nh�n l�nh b�i g�i Boss/#use_g_4_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "Kh�ng c�n ��u/cancel");
	
	Say("<#>T�ng qu�n Binh gi�p ph��ng: �������������� , ������Ҫ����Ĳ��ϣ�����Ҫ����֮ʯ������֮ʯΪ��������������������¾�������Ʒ��������߳ɹ��ĸ��ʡ�!", 
		getn(aryszContent), 
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------
--//////////////////
--�Ͻ��
--ÿ�ι���8gi� (8*60)��ʱ��ǵ�TaskID1739
--����ɫ���һ���ʱ���г�������ڳ�����Ʒ�����۳�ʱ�䣬ͬ��ͨ���


function use_zijingao(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n Binh gi�p ph��ng�������׳�Ʒ��������Ʒ������仰������ô�����Ͻ�����������һ������ڿ������һ���ʿ���۵���ͨ�������������������������ڵø�������ʡ�������п����ڵ�6�����ϵ����������ؿ�ʯ����ͨ������ڲ����Ŀ�ʯ��ÿһ���Ͻ�����ʹ��8gi� ������һ���Ͻ��ֻҪ����<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color> �i�m c�ng hi�n, ng��i ��ng � kh�ng?", 4,
	"<#>Ti�p nh�n 1 T� Kim C�o/#bj_sure2zijingao("..nTongID..","..nWorkshopID..")",
	"<#>Tra xem th�i gian c�n l�i c�a T� Kim C�o/bj_checktime_zijin",
	"<#> T�m hi�u T� Kim C�o/bj_help_zijigao",
	"<#>R�i kh�i/cancel")
end

function bj_help_zijigao()
	Say("<#>T�ng qu�n Binh gi�p ph��ng�������ʹ���Ͻ�����һ������ڿ��Ͻ�������ڵ��Ŀ�ʯ�ȼ�����ͨ���Ҫ�ߣ���Ҫע������Ͻ������ͨ�Ŀ�䲻��һ��ʹ�ã�����ͬʱӵ������ʱ�������������Ͻ���ʱ�䣬֮���������ͨ����ʱ�䡣", 0)
end

function bj_sure2zijingao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng���Բ��������ڰ��ı��׷�Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0)
		Msg2Player("<#>T�c Ph��ng t�m ng�ng ho�t ��ng, ch�c n�ng n�y kh�ng th� s� d�ng.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng��������ᶼû�룬�������", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 7) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng���Բ��������ڰ����׷���ʹ�õȼ�û�дﵽ7�����޷���øð���ز���", 0)
		Msg2Player("<#>��ng c�p s� d�ng c�a t�c ph��ng ch�a ��t c�p 7 th� ch�a s� d�ng ���c.")
		return
	end
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_ZIJIGAO_CONTRIBUTION )) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng��������Ͻ���ѷַ���ϣ������������ɣ�", 0)
		return
	end
	
	if (GetContribution() < VALUE_ZIJIGAO_CONTRIBUTION or AddContribution(-VALUE_ZIJIGAO_CONTRIBUTION) ~= 1)then
		Say("<#>T�ng qu�n Binh gi�p ph��ng���Բ������ĸ��˹��׶Ȳ���<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color> �i�m, kh�ng th� ��i l�y bang v�t.", 0)
		Msg2Player("<#>�i�m c�ng hi�n c� nh�n kh�ng ��, kh�ng th� s� d�ng ch�c n�ng n�y.")
		return 0
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_ZIJIGAO_CONTRIBUTION ))
	nRestH, nRestM = addzijingao_main();
	Msg2Player("<#>B�n �� mua th�nh c�ng 1 T� Kim C�o, th�i gian s� d�ng c�n l�i l� "..nRestH.."gi� "..nRestM.."ph�t.")
	Say("<#>T�ng qu�n Binh gi�p ph��ng�����ɹ�������һ���Ͻ�䣬��Ŀǰ���ڿ�ʱ��Ϊ"..nRestH.."gi� "..nRestM.."ph�t.", 0)
end

function bj_checktime_zijin()
	local lasttime = GetTask(TASKID_TECHAN_ZIJINGAO)
	if (lasttime < 10) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng���Բ��������Ͻ���Ѿ����ò����ˣ���������һЩ�µİɣ�", 0)
	else
		local nRestH, nRestM = GetMinAndSec(lasttime)
		if (nRestH == 0) then
			Say("<#>T�ng qu�n Binh gi�p ph��ng�������Ͻ�仹��ʹ��<color=yellow>"..nRestM.."<color> ph�t.", 0)
		else
			Say("<#>T�ng qu�n Binh gi�p ph��ng�������Ͻ�仹��ʹ��<color=yellow>"..nRestH.."<color>gi� <color=yellow>"..nRestM.."<color> ph�t.", 0)
		end
	end
end

-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;



--------
----------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ������ȡʯͷ�ܼ�ֵ��
	return 1
end

function USE_R(nTongID, nWorkshopID, nUse)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (nUse ~= 4) then
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
			return 0
		end	
	else
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
			return 0
		end
		if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
			return 0
		end
		if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) ~= 1) then
			return 0
		end

		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
	end;
	return 1	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end


function use_g_1(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
			if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng����������֮ʯ�ѷַ���ϣ������������ɣ�", 0)
				return 0;
			end
			local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
			TWS_ApplyUse(nTongID, nWorkshopID, 1)
	else
			Talk(1,"","Th�i gian nh�n v�t ph�m l� t� 12h30 ��n 22h h�ng ng�y !")
			return
	end

end

function use_g_2(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n Binh gi�p ph��ng�����������������Ƕ��ɫװ���ʹ���ƽ�װ�����������֮ʯ������ߴ���ɹ��Ļ��ʺ������ɫװ�������ԣ�", 2, "B�t ��u ch� t�o/#compound("..nTongID..","..
		nWorkshopID..",".."2)", "Kh�ng c�n!/cancel")
end		

function use_g_3(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n Binh gi�p ph��ng��ʹ�û��Ĵ��죬�������Ƕ����Ʒ����ɫװ�������û���С�Ĵ��ۣ�", 2, "B�t ��u ch� t�o/#compound("..nTongID..","..
		nWorkshopID..",".."3)", "Kh�ng c�n!/cancel")
end

function use_g_4_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>T�ng qu�n Binh gi�p ph��ng: ���ɽ���ȼ��ﵽ<color=red>2<color> ���������ٻ�Boss����!", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng: ��Ȩ����������������ȡ��ȡ�ٻ�Boss����!", 0)
		return
	end
	_dbgMsg("S� l�n nh�n c�n l�i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng: �����ѷ����ٻ�boss�����ˣ�����������!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n Binh gi�p ph��ng: ��Ҫʹ��<color=water>"..aLevelLingPaiPrice[nLevel].."<color> v�n ng�n s�ch ki�n thi�t bang �� nh�n 1 l�nh b�i g�i Boss, ng��i ��ng � kh�ng?", 2,
		"Ti�p nh�n/#use_g_4_ok2".."("..nTongID..","..nWorkshopID..")", "H�y b� /cancel")
end

function use_g_4_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>T�ng qu�n Binh gi�p ph��ng: ֻ���ź�����Ὠ��Ԥ�㲻����������ȡ!", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 4)
end


function compound(nTongID, nWorkshopID, nSel)
	TWS_ApplyUse(nTongID, nWorkshopID, nSel)
end

function _makefun(nTongID, nWorkshopID, nLevelStone)
	return nLevelStone.."c�p/#stone("..nTongID..","..nWorkshopID..","..nLevelStone..")"
end

function USE_G_2(nTongID, nWorkshopID, nChose)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nChose == 1)then --���֮ʯ
		Sale(166, CURRENCYTYPE_CONTRIBUTION, aLevelScale[nLevel], "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
	elseif(nChose == 2)then --��ͨ����
		FoundryItem(4)
	elseif(nChose == 3)then	--���Ĵ���
		FoundryItem(2)
	elseif(nChose == 4) then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." ti�u t�n "..aLevelLingPaiPrice[nLevel].." v�n ng�n s�ch ki�n thi�t bang �� ��i l�y 1 l�nh b�i g�i Boss c�p "..nLevel.."!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	end	
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("Gi� tr� l��ng c�n l�i"..nValue)
	local nLevel = GetItemLevel(nItemIdx)
	local nOutputValue = aLevelStoneValue[nLevel]
	if (nValue < nOutputValue)then
		CloseShop()
		Say("<#>T�ng qu�n Binh gi�p ph��ng���Բ��𣬽�������֮ʯ�Ѿ������ˣ������������ɣ�", 0)
		return 0
	end	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nOutputValue)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelStoneValue[nLevel]/10000)
	return 1
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
	local nScale  --��ǰ��ȡ���֮ʯ�ۿ�
	local dStoneCount	--��ǰÿ�ջ�ȡ���֮ʯ�������
	local nPrice  --��ǰ��ȡboss�ٻ����Ľ������
	local dTokenCount	--��ǰÿ��boss�ٻ��������������
	local nDoubleOdds  --��ǰ�ٻ���2���ƽ�Boss�ļ���
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dStoneCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
		else
			nScale = "--"
			dStoneCount = "--"
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextStoneCount, nNextPrice, dNextTokenCount,nNextDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"	
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --�¼���ȡ���֮ʯ�ۿ�
		dNextStoneCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --�¼�ÿ�ջ�ȡ���֮ʯ�������
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --�¼���ȡboss�ٻ����Ľ������
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --�¼�ÿ��boss�ٻ��������������
		nNextDoubleOdds = 160 - nCurLevel * 10 --�¼��ٻ���2���ƽ�Boss�ļ���
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextStoneCount = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T�m ng�ng" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>��ng c�a" end
		local szMsg = "Tr�ng th�i t�c ph��ng: "..state.."<color>\n"..
			"��ng c�p t�c ph��ng: <color=gold>"..nCurLevel.."<color>\n"..
			"��ng c�p s� d�ng hi�n t�i: <color=gold>"..nUseLevel.."<color>\n"..
			"S� l��ng tr�n bang chi th�ch m�i ng�y t�ng l�n: <color=gold>"..dStoneCount.."<color> l�n\n"..		
			"Gi� �u ��i ��i Tr�n Bang Chi Th�ch: <color=gold>"..nScale.."<color> ph�n tr�m\n"..
			"S� l�nh b�i g�i Boss t�o ra m�i ng�y t�ng l�n: <color=gold>"..dTokenCount.."<color> l�n\n"..	
			"X�c su�t l�nh b�i g�i ra Boss th� 2: <color=gold>1/"..nDoubleOdds.."<color>\n"..		
			"Ng�n s�ch ki�n thi�t c�n �� ��i l�nh b�i g�i Boss: <color=gold>"..nPrice.." v�n<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=gold>"..nMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=gold>"..nOpenFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t �� n�ng c�p: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p s� d�ng k� ti�p <color>\n"..
			"<color=water>S�n l��ng tr�n bang chi th�ch m�i ng�y t�ng l�n: <color=Violet>"..dNextStoneCount.."<color> l�n\n"..	
			"��i �i�m �u ��i Tr�n bang chi th�ch: <color=Violet>"..nNextScale.."<color> ph�n tr�m\n"..
			"X�c su�t l�nh b�i g�i ra Boss th� 2: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			"Ng�n s�ch ki�n thi�t c�n �� ��i l�nh b�i g�i Boss: <color=Violet>"..nNextPrice.." v�n<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	else
		local szMsg = "Tr�ng th�i t�c ph��ng: <color=water>δ����<color>\n"..
			"Ng�n s�ch ki�n th�t c�n �� x�y d�ng: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p k� ti�p <color>\n"..
			"<color=water>S�n l��ng tr�n bang chi th�ch m�i ng�y t�ng l�n: <color=Violet>"..dNextStoneCount.."<color> l�n\n"..	
			"��i �i�m �u ��i Tr�n bang chi th�ch: <color=Violet>"..nNextScale.."<color> ph�n tr�m\n"..
			"X�c su�t l�nh b�i g�i ra Boss th� 2: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			"Ng�n s�ch ki�n thi�t c�n �� ��i l�nh b�i g�i Boss: <color=Violet>"..nNextPrice.." v�n<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	end
end
------------------------------
end