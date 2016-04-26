Include("\\script\\tong\\workshop\\workshop_head.lua");

if (MODEL_GAMESERVER == 1) then --�����GameServer
-- �����������ͷ�ļ�
Include("\\script\\task\\system\\task_main.lua");
Include([[\script\tong\workshop\tongcolltask.lua]]);
end

aLevelCoef = {}

aLevelRenWuPrice = {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\tianyi_level_data.txt", "tianyiLevelData")
	if b1~=1 then
		print("�����������������ļ�ʧ�ܣ�")
		return
	end
	local nRowCount = TabFile_GetRowCount("tianyiLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("tianyiLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("tianyiLevelData", y, "OUTPUT_COEF"))
		aLevelRenWuPrice[nLevel] = tonumber(TabFile_GetCell("tianyiLevelData", y, "PRICE"))
	end
	--TabFile_UnLoad("tianyiLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "���ⷻ�ܹ�") ~= 1 then
		return 0
	end
	Say("<#>���ⷻ�ܹܣ����������⣬��;�԰��գ��м��мǣ�", 3, 
		"��ȡ�������/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"������������/#use_g_1_ok22".."("..nTongID..","..nWorkshopID..")",
		"������/cancel");
	return 1;
end

----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ������ȡ������
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
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelRenWuPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	_dbgMsg("ʣ����ȡ����*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>���ⷻ�ܹܣ��������������ѷַ���ϣ������������ɣ�", 0)
		return 0;
			end
			Say("<#>S? d�ng <color=yellow>"..aLevelRenWuPrice[nLevel].."<color> ���׶ȶһ�һ��żȻ���ƣ���ͬ����?", 2,
			"���뻻/#use_g_1_ok21".."("..nTongID..","..nWorkshopID..")",
			"���� /cancel")
	else
		Talk(1,"","��ȡ��Ʒʱ��Ϊÿ��12h30��22h!")
			return
	end
	Say("<#>����Ҫ����<color=yellow>"..aLevelRenWuPrice[nLevel].."<color>�㹱�׶Ȼ��һ������������ƣ�ȷ����", 2,
		"��Ҫ��ȡ/#use_g_1_ok21".."("..nTongID..","..nWorkshopID..")",
		"ȡ��/cancel")
end

function use_g_1_ok22(nTongID, nWorkshopID)--��ȡ������������
	nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	if (nLevel < 4) then
		Say("���ⷻ�ܹܣ����ⷻ�ȼ��ﵽ<color=yellow>4<color>��ʱ���ܲ��������������ơ���Ҫ��Щʲô��", 2, "�˽�������������/tong_tylp_aobut", "�뿪/cancel");
		return
	end;
	Say("���ⷻ�ܹܣ������������Щ�ر�����񣬲��������������Ӿ��飬���ҿ�����������һ����PKֵ��Ҫ���Կ���", 7, 
	"����������������/tong_tylp_aobut", 
	"����������������/#tong_tylp_tobuy("..nLevel..")",
	"�˽��������������/tong_tylp_knowabout",
	"��Ҫ��һ������/tong_tylp_turn",
	"���Ѿ��õ��㹻�ļ���/tong_tylp_award",
	"ȡ������/tong_tylp_giveup",
	"��Ҫ�뿪/cancel");
end;

function tong_tylp_turn()
	local nLPLvl = get_lp_lvl();
	if (0 == nLPLvl) then
		Say("��Ŀǰû��������������", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nContri, nConLimit, nMax;
	nContri = GetContribution();
	nConLimit = tab_buyLingPai_gxd[nLPLvl] / 10;
	if (nContri < nConLimit) then
		Say("ת��һ��<color=yellow>"..nLPLvl.."��<color>����������Ҫ<color=yellow>"..nConLimit.."��<color>���׶ȣ�ԭ���Ƽ۸��ʮ��֮һ������Ĺ��׶Ȳ�����", 0);
		return
	end;
	rwlp_cleartask()	--������������
	for i = 1, 10 do
		nLevel = 1;
		nWorkshopIdx = random(1, 7); -- ���һ������
		
		if (nLPLvl == 1) then
			nLevel = random(1, 3);
		elseif (nLPLvl == 2) then
			nLevel = random(4, 6);
		elseif (nLPLvl == 3) then
			nLevel = random(7, 8);
		end;
		
		nCount = random(1, 9);
		nMax = get_workshop_count(nWorkshopIdx, nLevel);
		if (nCount > nMax) then
			nCount = nMax;
		end;
		if (nCount > 0) then
			break
		end;
	end;
	AddContribution(-1 * nConLimit);
	Msg2Player("��������<color=yellow>"..nConLimit.."��<color>���׶������һ���µ�<color=yellow>"..nLPLvl.."��������������");
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	nt_SetTask(TASK_LP_COUNT, nCount);
	Say("��������<color=yellow>"..nConLimit.."��<color>���׶������һ���µ�<color=yellow>"..nLPLvl.."��<color>�����������񡣱����<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>����������ѣ�ԭ�������Ͼ��Ͽ�����ȡһ��������û���뾩��Ҫ�󣬳��˾�����Ҫ�е�����ʿ�ļ��顣Խ����������ʦ֮�ˣ���ȡ�����Ļ����Խ���鷳��Ϊ��ȥ��<color=yellow>"..nCount.."λ "..nLevel.."<color>�����ϲ�ͬ����<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>��������ǵļ��顣", 1, "�ã���һ��������Ϊ/cancel")
end;

function get_lp_lvl()
	if (GetTask(TASK_LP_COUNT) == 0) then	--���û�а��������������
		return 0;
	end;
	local nLPLvl = ceil(GetTask(TASK_LP_ZONGGUANLEVEL) / 3);
	if (nLPLvl > 3) then
		nLPLvl = 3;
	elseif (nLPLvl < 1) then
		nLPLvl = 1;
	end;
	return nLPLvl;
end;

function tong_tylp_giveup()	--ȡ������
	if (GetTask(TASK_LP_COUNT) == 0) then
		Say("���ⷻ�ܹܣ��Ǻǣ������û����������������̸��ȡ���أ�", 0)
		return
	end;
	nt_SetTask(TASK_LP_COUNT, 0);
	rwlp_cleartask()	--������������
	Msg2Player("���ⷻ�ܹܣ����Ѿ�ȡ����<color=yellow>������������<color>����")
end;

function tong_tylp_tobuy(nLevel)--������������
	if (1 == TONG_GetPauseState(nTongID, nWorkshopID)) then
		Say("���ⷻ�ܹܣ��Բ��������ڰ�������Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0);
		Msg2Player("������ͣ���޷�����ز���");
		return
	end;
	
	local tab_selete = {};
	--�i�������� pk - Modified by DinhHQ - 20110810
--	tinsert(tab_selete, "�һ�һ������/#tong_tylp_buy( 1 )");
--	if (nLevel >= 7) then
--		tinsert(tab_selete, "�һ�2������/#tong_tylp_buy( 2 )")
--	end
	if (nLevel >= 9) then
		tinsert(tab_selete, "����3������/#tong_tylp_buy( 3 )")
	end
	
	tinsert(tab_selete, "��Ҫ�뿪/cancel");
	Say("���ⷻ�ܹܣ��������Ѷȴӵ͵��߷�Ϊ1��3�����ƣ�1��������Ҫ100�㹱�׶���ɺ���Ի��30����ֵ�Լ�����2��PKֵ��2��������Ҫ150�㹱�׶���ɺ���Ի��40����ֵ�Լ�����5��PKֵ��3��������Ҫ200�㹱�׶���ɺ���Ի��60����ֵ�Լ�����10��PKֵ����Ҫ������һ�֣�", getn(tab_selete), tab_selete);
end;

function tong_tylp_knowabout()
	if (GetTask(TASK_LP_COUNT) == 0) then	--���û�а��������������
		Say("��Ŀǰû��������������", 0);
		return
	end;
	local nNeedCount = GetTask(TASK_LP_COUNT);
	local nGetCount = rwlp_getjuanshucount();
	if (nGetCount >= nNeedCount and nGetCount > 0) then
		Say("���Ѿ��ռ����㹻��ļ��飬�Ͻ���ȥ�����ⷻ�ܹܰɡ�", 0);
	end;
	Say("���ܹ���Ҫ�ڲ�ͬ��<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."��<color>�ܹܴ��ռ�<color=yellow>"..nNeedCount.."��<color>���飬��ֻ��<color=yellow>"..nGetCount.."��<color>���顣�ú�Ŭ��Ŷ��", 0);
end;

tab_buyLingPai_gxd = {100, 150, 200};
function tong_tylp_buy(nLPLvl1)--��������ʵ��
	local nLPLvl = tonumber(nLPLvl1);
	local nAttr = GetContribution();
	if (nAttr < tab_buyLingPai_gxd[nLPLvl]) then
		Say("���ⷻ�ܹܣ��Բ������ĸ��˹��׶Ȳ���<color=yellow>"..tab_buyLingPai_gxd[nLPLvl].."<color>���޷�������ز�����Ŭ����ȡ���˹��׶ȡ�", 0);
		Msg2Player("���˹��׶Ȳ��㣬�޷�����ز���");
		return
	end;
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "װ����Ҫ2����λ.");
		return 
	end
	
	AddContribution(-tab_buyLingPai_gxd[nLPLvl]);
	
	_, nTongID = GetTongName();
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, 5);
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(tab_buyLingPai_gxd[nLPLvl]));
	
	nGoodIdx = 1101 + nLPLvl;
	--AddItem();
	local nRandomItemIndex = AddItem(6, 1, nGoodIdx, 0, 1, 0, 0);	--��Ʒ��id����
	SetSpecItemParam(nRandomItemIndex, 1, nLPLvl);	--�����Ƶȼ���¼
	SyncItem(nRandomItemIndex); -- ͬ����Ʒħ������
	
	Msg2Player("��������"..tostring(tab_buyLingPai_gxd[nLPLvl]).."�㹱�׶ȣ�");
	Msg2Player("<color=green>��õ���һ��"..nLPLvl.."�������������ƣ�<color>");
end;

tab_LPAward = {[1] = {300000, 2}, [2] = {400000, 5}, [3] = {600000, 10}}
function tong_tylp_award()
	if (GetTask(TASK_LP_COUNT) == 0) then	--���û�а��������������
		Say("��Ŀǰû��������������", 0);
		return
	end;
	
	local nGetCount = rwlp_getjuanshucount();
	local nGoalCount = GetTask(TASK_LP_COUNT);
	local nLPLvl = get_lp_lvl();
	local nPK = GetPK();
	local nDate = GetLocalDate("%m%d");
	local nday, nmon = mod(nDate, 100), floor(nDate / 100);
	local nTsk_Times = GetTask(TASK_LP_TIMESLIMIT);
	local ncurday, ncurmon, ncuttimes = GetByte(nTsk_Times, 2), GetByte(nTsk_Times, 3), GetByte(nTsk_Times, 1);
	
	if (nPK == 0) then
		Say("Ŀǰ��û��PK��������ɸ�����.", 0);
		return 0;
	end
	
	if (nday ~= ncurday or nmon ~= ncurmon) then
		ncurday = nday;
		ncurmon = nmon;
		ncuttimes = 0;
		nTsk_Times = SetByte(nTsk_Times, 2, ncurday);
		nTsk_Times = SetByte(nTsk_Times, 3, ncurmon);
		nTsk_Times = SetByte(nTsk_Times, 1, ncuttimes);
		SetTask(TASK_LP_TIMESLIMIT, nTsk_Times);
	end
	
	if (ncuttimes >= DAILY_MAX_TIMES) then
		Say(format("������ִ�и�����%d���ˣ����������� .", DAILY_MAX_TIMES), 0);
		return 0;
	end
	
	if (nGetCount >= nGoalCount and nGetCount > 0) then
		ncuttimes = ncuttimes + 1;
		nTsk_Times = SetByte(nTsk_Times, 1, ncuttimes);
		SetTask(TASK_LP_TIMESLIMIT, nTsk_Times);
		
		Say("���ⷻ�ܹܣ��Ϸ���������Ϊ�������������PKֵ��û�м��٣��Ǻǡ�", 0);
		--����������
		AddOwnExp(tab_LPAward[nLPLvl][1]);
		Msg2Player("������<color=yellow>"..tab_LPAward[nLPLvl][1].."<color>�㾭��Ľ�����");
--		local nDecCount = tab_LPAward[nLPLvl][2];
		local nDecCount = PER_ASSIGNMENT_PK  
		if (nDecCount > nPK) then
			nDecCount = nPK;
		end;
		if (nDecCount > 0) then
			--�i��������pk - Modified by DinhHQ - 20110810
			if (ncuttimes < 3) then
				SetPK(nPK - nDecCount);
			Msg2Player("���PKֵ������<color=yellow>"..nDecCount.."<color>�㡣");
			end			
		else
			Msg2Player("���PKֵ��Ϊ<color=yellow>0��<color>�ˡ�");
		end;
		rwlp_cleartask()	--������������
	else
		Say("���ⷻ�ܹܣ���Ҫ�ҵ�<color=yellow>"..nGoalCount.."<color>���������,�������Ѿ��ҵ���<color=yellow>"..nGetCount.."<color>��", 0);
	end;
end;

function tong_tylp_aobut()--������������
	Say("���ⷻ�ܹܣ��������������Ҫ���������߸�������Ҫ��Ѱ�ҵ�һ�������İ�ᣬ��Щ���Ĺ�ͬ����ӵ������Ҫ���ĳ�����������������ȼ�ͬʱ��ꡣ��ʱ��������ܹܶԻ������ͻ����͸���һ����飬ÿ������Ҫ��İ�ᣬ�������ܹ�ֻ�����͸���һ����顣ֻҪ�ռ�������Ҫ�������ļ��飬���Լ�������ҶԻ����������ɡ�", 0);
end;

function use_g_1_ok21(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelRenWuPrice[nLevel]) then
		Say("<#>���ⷻ�ܹܣ��Բ�����Ĺ��׶Ȳ��㣡", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>���ⷻ�ܹܣ���Ҫ�Ķ�����û���������Ե�Ƭ�̣�", 0)
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "װ����Ҫ2����λ.");
		return 
	end
	
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	if (GetContribution() < aLevelRenWuPrice[nLevel]) then
		return
	end
	
	local nRandomTaskID = createRandomTask();
	local nRandomItemIndex = 0;
	
	if nRandomTaskID~=nil and nRandomTaskID~=0 then
		
		AddContribution(-aLevelRenWuPrice[nLevel]);
		
		Msg2Player("��������"..tostring(aLevelRenWuPrice[nLevel]).."�㹱�׶ȣ�");
		
		nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
		SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
		
		-- ͬ����Ʒħ������
		SyncItem(nRandomItemIndex);		
				
		Msg2Player("<color=green>��õ���һ������������ƣ�<color>");
	end;
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
	local nPrice  --��ǰ��ȡ�������ƵĹ��׶�
	local dTokenCount	--��ǰÿ���������Ʋ����������
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelRenWuPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
		else
			nPrice = "--"
			dTokenCount = "--"	
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextTokenCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end	
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextPrice = aLevelRenWuPrice[nUseLevel + 1] --�¼���ȡ�������ƵĹ��׶�
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --�¼�ÿ���������Ʋ����������
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
	end
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>��ͣ" elseif bOpen == 1 then state="<color=green>����" else state="<color=red>�ر�" end
		local szMsg = "����״̬��"..state.."<color>\n"..
			"�����ȼ���<color=gold>"..nCurLevel.."<color>��\n"..
			"��ǰʹ�õȼ���<color=gold>"..nUseLevel.."<color>��\n"..
			"���������ղ�����������ߣ�<color=gold>"..dTokenCount.."<color>��\n"..		
			"��ȡ�����������蹱�׶ȣ�<color=gold>"..nPrice.."<color>\n"..
			"ÿ��ά������ս������<color=gold>"..nMaintainFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nOpenFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һʹ�õȼ�<color>\n"..
			"<color=water>���������ղ�����������ߣ�<color=Violet>"..dNextTokenCount.."<color>��\n"..	
			"��ȡ�����������蹱�׶ȣ�<color=Violet>"..nNextPrice.."<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	else
		local szMsg = "����״̬��<color=water>δ����<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һ�ȼ�<color>\n"..
			"<color=water>���������ղ�����������ߣ�<color=Violet>"..dNextTokenCount.."<color>��\n"..	
			"��ȡ�����������蹱�׶ȣ�<color=Violet>"..nNextPrice.."<color>\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	end
end

end