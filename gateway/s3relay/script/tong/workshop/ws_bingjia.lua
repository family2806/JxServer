Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelScale = {}
aLevelStoneValue = {}
aLevelLingPaiPrice	=	{};		--Boss�ٻ����ȼ�����ʽ�����
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\bingjia_level_data.txt", "bingjiaLevelData")
	if b1~=1 then
		print("���ر������������ļ�ʧ�ܣ�")
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
	if SVR_CheckUse(nTongID, nWorkshopID, "���׷��ܹ�") ~= 1 then
		return 0
	end
	local aryszContent = {
		"��ȡ���֮ʯ/#use_g_1".."("..nTongID..","..nWorkshopID..")",
		"����װ��/#use_g_2".."("..nTongID..","..nWorkshopID..")",
	}
	
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "��ȡ�Ͻ��/#use_zijingao("..nTongID..","..nWor);
	elseif(GetProductRegion() == "vn") then
		tinsert(aryszContent, "��ȡ�����ٻ�Boss/#use_g_4_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "����Ҫ/cancel");
	
	Say("<#>���׷��ܹ�: �������������� , ������Ҫ����Ĳ��ϣ�����Ҫ����֮ʯ������֮ʯΪ��������������������¾�������Ʒ��������߳ɹ��ĸ��ʡ�!", 
		getn(aryszContent), 
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------
--//////////////////
--�Ͻ��
--ÿ�ι���8Сʱ(8*60)��ʱ��ǵ�TaskID1739
--����ɫ���һ���ʱ���г�������ڳ�����Ʒ�����۳�ʱ�䣬ͬ��ͨ���


function use_zijingao(nTongID, nWorkshopID)
	Say("<#>���׷��ܹܣ������׳�Ʒ��������Ʒ������仰������ô�����Ͻ�����������һ������ڿ������һ���ʿ���۵���ͨ�������������������������ڵø�������ʡ�������п����ڵ�6�����ϵ����������ؿ�ʯ����ͨ������ڲ����Ŀ�ʯ��ÿһ���Ͻ�����ʹ��8Сʱ������һ���Ͻ��ֻҪ����<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color>�㹱�׶ȣ�����Ҫһ����", 4,
	"<#>����һ���Ͻ��/#bj_sure2zijingao("..nTongID..","..nWorkshopID..")",
	"<#>��ѯ�Ͻ���ʣ��ʱ��/bj_checktime_zijin",
	"<#>�����Ͻ��/bj_help_zijigao",
	"<#>�뿪/cancel")
end

function bj_help_zijigao()
	Say("<#>���׷��ܹܣ������ʹ���Ͻ�����һ������ڿ��Ͻ�������ڵ��Ŀ�ʯ�ȼ�����ͨ���Ҫ�ߣ���Ҫע������Ͻ������ͨ�Ŀ�䲻��һ��ʹ�ã�����ͬʱӵ������ʱ�������������Ͻ���ʱ�䣬֮���������ͨ����ʱ�䡣", 0)
end

function bj_sure2zijingao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>���׷��ܹܣ��Բ��������ڰ��ı��׷�Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0)
		Msg2Player("<#>������ͣ�������޷�ʹ�á�")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>���׷��ܹܣ�������ᶼû�룬�������", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 7) then
		Say("<#>���׷��ܹܣ��Բ��������ڰ����׷���ʹ�õȼ�û�дﵽ7�����޷���øð���ز���", 0)
		Msg2Player("<#>����ʹ�õȼ�û�дﵽ7���������޷�ʹ�á�")
		return
	end
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_ZIJIGAO_CONTRIBUTION )) then
		Say("<#>���׷��ܹܣ�������Ͻ���ѷַ���ϣ������������ɣ�", 0)
		return
	end
	
	if (GetContribution() < VALUE_ZIJIGAO_CONTRIBUTION or AddContribution(-VALUE_ZIJIGAO_CONTRIBUTION) ~= 1)then
		Say("<#>���׷��ܹܣ��Բ������ĸ��˹��׶Ȳ���<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color>�㣬�޷�������ز�����Ŭ����ȡ���˹��׶ȡ�", 0)
		Msg2Player("<#>���˹��׶Ȳ��㣬�����޷�ʹ�á�")
		return 0
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_ZIJIGAO_CONTRIBUTION ))
	nRestH, nRestM = addzijingao_main();
	Msg2Player("<#>���ɹ�������һ���Ͻ�䣬��Ŀǰ���ڿ�ʱ��Ϊ"..nRestH.."Сʱ"..nRestM.."�֡�")
	Say("<#>���׷��ܹܣ����ɹ�������һ���Ͻ�䣬��Ŀǰ���ڿ�ʱ��Ϊ"..nRestH.."Сʱ"..nRestM.."�֡�", 0)
end

function bj_checktime_zijin()
	local lasttime = GetTask(TASKID_TECHAN_ZIJINGAO)
	if (lasttime < 10) then
		Say("<#>���׷��ܹܣ��Բ��������Ͻ���Ѿ����ò����ˣ���������һЩ�µİɣ�", 0)
	else
		local nRestH, nRestM = GetMinAndSec(lasttime)
		if (nRestH == 0) then
			Say("<#>���׷��ܹܣ������Ͻ�仹��ʹ��<color=yellow>"..nRestM.."<color>���ӡ�", 0)
		else
			Say("<#>���׷��ܹܣ������Ͻ�仹��ʹ��<color=yellow>"..nRestH.."<color>Сʱ<color=yellow>"..nRestM.."<color>���ӡ�", 0)
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
		Say("<#>���׷��ܹܣ���������֮ʯ�ѷַ���ϣ������������ɣ�", 0)
				return 0;
			end
			local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
			TWS_ApplyUse(nTongID, nWorkshopID, 1)
	else
			Talk(1,"","��ȡ��Ʒʱ��Ϊÿ��12H30��22h !")
			return
	end

end

function use_g_2(nTongID, nWorkshopID)
	Say("<#>���׷��ܹܣ����������������Ƕ��ɫװ���ʹ���ƽ�װ�����������֮ʯ������ߴ���ɹ��Ļ��ʺ������ɫװ�������ԣ�", 2, "��ʼ����/#compound("..nTongID..","..
		nWorkshopID..",".."2)", "��������/cancel")
end		

function use_g_3(nTongID, nWorkshopID)
	Say("<#>���׷��ܹܣ�ʹ�û��Ĵ��죬�������Ƕ����Ʒ����ɫװ�������û���С�Ĵ��ۣ�", 2, "��ʼ����/#compound("..nTongID..","..
		nWorkshopID..",".."3)", "��������/cancel")
end

function use_g_4_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>���׷��ܹ�: ���ɽ���ȼ��ﵽ<color=red>2<color> ���������ٻ�Boss����!", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>���׷��ܹ�: ��Ȩ����������������ȡ��ȡ�ٻ�Boss����!", 0)
		return
	end
	_dbgMsg("��ȡ������ʣ * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>���׷��ܹ�: �����ѷ����ٻ�boss�����ˣ�����������!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>���׷��ܹ�: ��Ҫʹ��<color=water>"..aLevelLingPaiPrice[nLevel].."<color> ���Ὠ��Ԥ����һ���ٻ�boss���ƣ���ͬ����?", 2,
		"����/#use_g_4_ok2".."("..nTongID..","..nWorkshopID..")", "����/cancel")
end

function use_g_4_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>���׷��ܹ�: ֻ���ź�����Ὠ��Ԥ�㲻����������ȡ!", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 4)
end


function compound(nTongID, nWorkshopID, nSel)
	TWS_ApplyUse(nTongID, nWorkshopID, nSel)
end

function _makefun(nTongID, nWorkshopID, nLevelStone)
	return nLevelStone.."��/#stone("..nTongID..","..nWorkshopID..","..nLevelStone..")"
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
		local szMsg = GetName().." ���� "..aLevelLingPaiPrice[nLevel].." ���Ὠ��Ԥ������ȡһ���ٻ�boss����"..nLevel.."!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	end	
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("ʣ�������ֵ��"..nValue)
	local nLevel = GetItemLevel(nItemIdx)
	local nOutputValue = aLevelStoneValue[nLevel]
	if (nValue < nOutputValue)then
		CloseShop()
		Say("<#>���׷��ܹܣ��Բ��𣬽�������֮ʯ�Ѿ������ˣ������������ɣ�", 0)
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
		return "<color=water>û�а��"	
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
		if bPause == 1 then state="<color=yellow>��ͣ" elseif bOpen == 1 then state="<color=green>����" else state="<color=red>�ر�" end
		local szMsg = "����״̬��"..state.."<color>\n"..
			"�����ȼ���<color=gold>"..nCurLevel.."<color>��\n"..
			"��ǰʹ�õȼ���<color=gold>"..nUseLevel.."<color>��\n"..
			"ÿ�ջ�ȡ���֮ʯ������ߣ�<color=gold>"..dStoneCount.."<color>��\n"..		
			"��ȡ���֮ʯ�Żݶȣ�<color=gold>"..nScale.."<color>��\n"..
			"Boss�ٻ����ղ����������: <color=gold>"..dTokenCount.."<color>��\n"..	
			"�ٻ����ٳ���2��Boss�ļ���: <color=gold>1/"..nDoubleOdds.."<color>\n"..		
			"��ȡBoss�ٻ������轨�����: <color=gold>"..nPrice.."��<color>\n"..
			"ÿ��ά������ս������<color=gold>"..nMaintainFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nOpenFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һʹ�õȼ�<color>\n"..
			"<color=water>ÿ�ջ�ȡ���֮ʯ������ߣ�<color=Violet>"..dNextStoneCount.."<color>��\n"..	
			"��ȡ���֮ʯ�Żݶȣ�<color=Violet>"..nNextScale.."<color>��\n"..
			"�¸��ȼ��ٻ���2���ƽ�boss�ļ���: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			"�¸��ȼ���ȡboss�ٻ����Ľ������: <color=Violet>"..nNextPrice.."��<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	else
		local szMsg = "����״̬��<color=water>δ����<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һ�ȼ�<color>\n"..
			"<color=water>ÿ�ջ�ȡ���֮ʯ������ߣ�<color=Violet>"..dNextStoneCount.."<color>��\n"..	
			"��ȡ���֮ʯ�Żݶȣ�<color=Violet>"..nNextScale.."<color>��\n"..
			"�ٻ����ٳ���2��Boss�ļ���: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			"��ȡBoss�ٻ������轨�����: <color=Violet>"..nNextPrice.."��<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	end
end
------------------------------
end