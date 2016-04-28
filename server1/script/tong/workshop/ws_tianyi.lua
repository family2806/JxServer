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
		print("��c t�p config Thi�n � ph��ng th�t b�i!")
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
	if SVR_CheckUse(nTongID, nWorkshopID, "T�ng qu�n Thi�n � ph��ng") ~= 1 then
		return 0
	end
	Say("<#>T�ng qu�n Thi�n � ph��ng�����������⣬��;�԰��գ��м��мǣ�", 3, 
		"Nh�n nhi�m v� ng�u nhi�n/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"L�nh b�i nhi�m v� ��c bi�t/#use_g_1_ok22".."("..nTongID..","..nWorkshopID..")",
		"Kh�ng c�n ��u/cancel");
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
	_dbgMsg("S� l�n nh�n c�n l�i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>T�ng qu�n Thi�n � ph��ng���������������ѷַ���ϣ������������ɣ�", 0)
		return 0;
			end
			Say("<#>S� d�ng <color=yellow>"..aLevelRenWuPrice[nLevel].."<color> �i�m c�ng hi�n ��i l�y 1 l�nh b�i ng�u nhi�n, ng��i ��ng � kh�ng?", 2,
			"ta mu�n ��i/#use_g_1_ok21".."("..nTongID..","..nWorkshopID..")",
			"H�y b� /cancel")
	else
		Talk(1,"","Th�i gian nh�n v�t ph�m l� t� 12h30 ��n 22h h�ng ng�y !")
			return
	end
	Say("<#>Ng��i ph�i t�n ph� <color=yellow>"..aLevelRenWuPrice[nLevel].."<color>Nh�n �i�m c�ng hi�n nh�n ���c nhi�m vu l�nh b�i ng�u nhi�n, ��ng � kh�ng?", 2,
		"ta mu�n ��i/#use_g_1_ok21".."("..nTongID..","..nWorkshopID..")",
		"H�y b� /cancel")
end

function use_g_1_ok22(nTongID, nWorkshopID)--��ȡ������������
	nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	if (nLevel < 4) then
		Say("T�ng qu�n Thi�n � ph��ng�����ⷻ�ȼ��ﵽ<color=yellow>4<color>��ʱ���ܲ��������������ơ���Ҫ��Щʲô��", 2, "T�m hi�u l�nh b�i nhi�m v� ��c bi�t/tong_tylp_aobut", "R�i kh�i/cancel");
		return
	end;
	Say("T�ng qu�n Thi�n � ph��ng�������������Щ�ر�����񣬲��������������Ӿ��飬���ҿ�����������һ����PKֵ��Ҫ���Կ���", 7, 
	"T�m hi�u L�nh b�i nhi�m v� ��c bi�t/tong_tylp_aobut", 
	"��i l�nh b�i nhi�m v� ��c bi�t/#tong_tylp_tobuy("..nLevel..")",
	"Xem ti�n �� nhi�m v� l�nh b�i/tong_tylp_knowabout",
	"Ta mu�n ��i nhi�m v�/tong_tylp_turn",
	"Ta nh�n ���c �� Th� ti�n c� r�i/tong_tylp_award",
	"H�y b� nhi�m v�/tong_tylp_giveup",
	"��ҪR�i kh�i/cancel");
end;

function tong_tylp_turn()
	local nLPLvl = get_lp_lvl();
	if (0 == nLPLvl) then
		Say("Ng��i ch�a nh�n nhi�m v� l�nh b�i.", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nContri, nConLimit, nMax;
	nContri = GetContribution();
	nConLimit = tab_buyLingPai_gxd[nLPLvl] / 10;
	if (nContri < nConLimit) then
		Say("��i 1 L�nh b�i nhi�m v� <color=yellow>c�p "..nLPLvl.."<color> c�n <color=yellow> "..nConLimit.." �i�m <color>c�ng hi�n (gi� l�nh b�i ch� b�ng 10% gi� ban ��u), �i�m c�ng hi�n c�a ng��i kh�ng ��.", 0);
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
	Msg2Player("S� d�ng <color=yellow>"..nConLimit.." �i�m <color> c�ng hi�n ��i l�y 1 l�nh b�i nhi�m v� c�p <color=yellow>"..nLPLvl..".");
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	nt_SetTask(TASK_LP_COUNT, nCount);
	Say("S� d�ng <color=yellow>"..nConLimit.." �i�m <color> c�ng hi�n ��i l�y 1 l�nh b�i nhi�m v� c�p <color=yellow>"..nLPLvl.."c�p-<color>Nhi�m v� l�nh b�i. <color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color> d�o n�y tinh th�n kh�ng ���c t�t, mu�n l�n kinh �ng th� nh�ng c�n ph�i thu th�p �� Th� ti�n c� c�a c�c danh s� n�i ��y. Phi�n ng��i �i t�m gi�p <color=yellow>"..nCount.." v� Ph��ng t�ng qu�n c�p "..nLevel.."<color>C�p tr� l�n kh�ng c�ng bang h�i <color=yellow>"..tab_Workshop[nWorkshopIdx].."<color>,�� nh�n th� ti�n c� c�a h�.", 1, "���c, ta s� c� g�ng./cancel")
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
		Say("T�ng qu�n Thi�n � ph��ng���Ǻǣ������û����������������̸��ȡ���أ�", 0)
		return
	end;
	nt_SetTask(TASK_LP_COUNT, 0);
	rwlp_cleartask()	--������������
	Msg2Player("T�ng qu�n Thi�n � ph��ng�����Ѿ�ȡ����<color=yellow>������������<color>����")
end;

function tong_tylp_tobuy(nLevel)--������������
	if (1 == TONG_GetPauseState(nTongID, nWorkshopID)) then
		Say("T�ng qu�n Thi�n � ph��ng���Բ��������ڰ�������Ŀǰ������ͣ״̬�������Ὣս���������Ŀ���ӵ���ά��ս���������ϣ������ڵ�����24��00���¿���������", 0);
		Msg2Player("T�c ph��ng �� t�m ng�ng ho�t ��ng, kh�ng th� nh�n bang v�t.");
		return
	end;
	
	local tab_selete = {};
	--�i�������� pk - Modified by DinhHQ - 20110810
--	tinsert(tab_selete, "��i l�nh b�i c�p 1/#tong_tylp_buy( 1 )");
--	if (nLevel >= 7) then
--		tinsert(tab_selete, "��i l�nh b�i c�p 2/#tong_tylp_buy( 2 )")
--	end
	if (nLevel >= 9) then
		tinsert(tab_selete, "��i l�nh b�i c�p 3/#tong_tylp_buy( 3 )")
	end
	
	tinsert(tab_selete, "��ҪR�i kh�i/cancel");
	Say("T�ng qu�n Thi�n � ph��ng���������Ѷȴӵ͵��߷�Ϊ1��3�����ƣ�1��������Ҫ100�㹱�׶���ɺ���Ի��30����ֵ�Լ�����2��PKֵ��2��������Ҫ150�㹱�׶���ɺ���Ի��40����ֵ�Լ�����5��PKֵ��3��������Ҫ200�㹱�׶���ɺ���Ի��60����ֵ�Լ�����10��PKֵ����Ҫ������һ�֣�", getn(tab_selete), tab_selete);
end;

function tong_tylp_knowabout()
	if (GetTask(TASK_LP_COUNT) == 0) then	--���û�а��������������
		Say("Ng��i ch�a nh�n nhi�m v� l�nh b�i.", 0);
		return
	end;
	local nNeedCount = GetTask(TASK_LP_COUNT);
	local nGetCount = rwlp_getjuanshucount();
	if (nGetCount >= nNeedCount and nGetCount > 0) then
		Say("���Ѿ��ռ����㹻��ļ��飬�Ͻ���ȥ��T�ng qu�n Thi�n � ph��ng�ɡ�", 0);
	end;
	Say("H�y ��n g�p c�c Ph��ng t�ng qu�n kh�c nhau <color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."<color> �� thu th�p �� <color=yellow>"..nNeedCount.." b�c <color>Th� ti�n c�, ng��i ch� c�<color=yellow> "..nGetCount.." b�c<color> m� th�i, h�y n� l�c h�n!", 0);
end;

tab_buyLingPai_gxd = {100, 150, 200};
function tong_tylp_buy(nLPLvl1)--��������ʵ��
	local nLPLvl = tonumber(nLPLvl1);
	local nAttr = GetContribution();
	if (nAttr < tab_buyLingPai_gxd[nLPLvl]) then
		Say("T�ng qu�n Thi�n � ph��ng���Բ������ĸ��˹��׶Ȳ���<color=yellow>"..tab_buyLingPai_gxd[nLPLvl].."<color>,Kh�ng th� mua v�t ph�m n�y, xin h�y n� l�c l�y �i�m c�ng hi�n.", 0);
		Msg2Player("�i�m c�ng hi�n c� nh�n kh�ng ��, kh�ng th� ��i l�y bang v�t.");
		return
	end;
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "H�nh trang ph�i c� hai � tr�ng.");
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
	
	Msg2Player("B�n ti�u t�n "..tostring(tab_buyLingPai_gxd[nLPLvl]).." �i�m c�ng hi�n!");
	Msg2Player("<color=green>B�n nh�n ���c 1 l�nh b�i c�p "..nLPLvl.."!<color>");
end;

tab_LPAward = {[1] = {300000, 2}, [2] = {400000, 5}, [3] = {600000, 10}}
function tong_tylp_award()
	if (GetTask(TASK_LP_COUNT) == 0) then	--���û�а��������������
		Say("Ng��i ch�a nh�n nhi�m v� l�nh b�i.", 0);
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
		Say("Hi�n t�i b�n kh�ng c� PK, kh�ng th� ho�n th�nh nhi�m v� n�y ���c.", 0);
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
		Say(format("H�m nay b�n th�c hi�n nhi�m v� n�y %d l�n r�i, ng�y mai h�y quay l�i nh�.", DAILY_MAX_TIMES), 0);
		return 0;
	end
	
	if (nGetCount >= nGoalCount and nGetCount > 0) then
		ncuttimes = ncuttimes + 1;
		nTsk_Times = SetByte(nTsk_Times, 1, ncuttimes);
		SetTask(TASK_LP_TIMESLIMIT, nTsk_Times);
		
		Say("T�ng qu�n Thi�n � ph��ng���Ϸ���������Ϊ�������������PKֵ��û�м��٣��Ǻǡ�", 0);
		--����������
		AddOwnExp(tab_LPAward[nLPLvl][1]);
		Msg2Player("B�n nh�n ���c <color=yellow>"..tab_LPAward[nLPLvl][1].."<color> Ph�n th��ng �i�m kinh nghi�m.");
--		local nDecCount = tab_LPAward[nLPLvl][2];
		local nDecCount = PER_ASSIGNMENT_PK  
		if (nDecCount > nPK) then
			nDecCount = nPK;
		end;
		if (nDecCount > 0) then
			--�i��������pk - Modified by DinhHQ - 20110810
			if (ncuttimes < 3) then
				SetPK(nPK - nDecCount);
			Msg2Player("PK �� gi�m <color=yellow>"..nDecCount.."<color> �i�m.");
			end			
		else
			Msg2Player("PK �� gi�m xu�ng c�n <color=yellow>0<color>.");
		end;
		rwlp_cleartask()	--������������
	else
		Say("T�ng qu�n Thi�n � ph��ng����Ҫ�ҵ�<color=yellow>"..nGoalCount.."<color>B�c th� ti�n c� m�i ���c, hi�n t�i �� t�m ���c <color=yellow>"..nGetCount.."<color>c�i", 0);
	end;
end;

function tong_tylp_aobut()--������������
	Say("T�ng qu�n Thi�n � ph��ng���������������Ҫ���������߸�������Ҫ��Ѱ�ҵ�һ�������İ�ᣬ��Щ���Ĺ�ͬ����ӵ������Ҫ���ĳ�����������������ȼ�ͬʱ��ꡣ��ʱ��������ܹܶԻ������ͻ����͸���һ����飬ÿ������Ҫ��İ�ᣬ�������ܹ�ֻ�����͸���һ����顣ֻҪ�ռ�������Ҫ�������ļ��飬���Լ�������ҶԻ����������ɡ�", 0);
end;

function use_g_1_ok21(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelRenWuPrice[nLevel]) then
		Say("<#>T�ng qu�n Thi�n � ph��ng���Բ�����Ĺ��׶Ȳ��㣡", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>T�ng qu�n Thi�n � ph��ng����Ҫ�Ķ�����û���������Ե�Ƭ�̣�", 0)
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "H�nh trang ph�i c� hai � tr�ng.");
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
		
		Msg2Player("B�n ti�u t�n "..tostring(aLevelRenWuPrice[nLevel]).." �i�m c�ng hi�n!");
		
		nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
		SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
		
		-- ͬ����Ʒħ������
		SyncItem(nRandomItemIndex);		
				
		Msg2Player("<color=green>B�n nh�n ���c 1 l�nh b�i c�p ����������ƣ�<color>");
	end;
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
		if bPause == 1 then state="<color=yellow>D�ng" elseif bOpen == 1 then state="<color=green>m� " else state="<color=red>��ng" end
		local szMsg = "Tr�ng th�i t�c ph��ng: "..state.."<color>\n"..
			"��ng c�p t�c ph��ng: <color=gold>"..nCurLevel.."<color>C�p\n"..
			"��ng c�p s� d�ng hi�n t�i: <color=gold>"..nUseLevel.."<color>C�p\n"..
			"S� l��ng l�nh b�i nhi�m v� h�ng ng�y t�ng l�n: <color=gold>"..dTokenCount.."<color>L�n\n"..		
			"�i�m c�ng hi�n c�n �� ��i l�nh b�i nhi�m v�: <color=gold>"..nPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=gold>"..nMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=gold>"..nOpenFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t �� n�ng c�p: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>S� d�ng ��ng c�p ti�p theo <color>\n"..
			"<color=water>N�ng cao l�nh b�i nhi�m v� h�ng ng�y s� l��ng sinh ra ��t gi�i h�n: <color=Violet>"..dNextTokenCount.."<color>L�n\n"..	
			"�i�m c�ng hi�n c�n �� ��i l�nh b�i nhi�m v�: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	else
		local szMsg = "Tr�ng th�i t�c ph��ng: <color=water>δ����<color>\n"..
			"Ng�n s�ch ki�n th�t c�n �� x�y d�ng: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p ti�p theo<color>\n"..
			"<color=water>N�ng cao l�nh b�i nhi�m v� h�ng ng�y s� l��ng sinh ra ��t gi�i h�n: <color=Violet>"..dNextTokenCount.."<color>L�n\n"..	
			"�i�m c�ng hi�n c�n �� ��i l�nh b�i nhi�m v�: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	end
end

end