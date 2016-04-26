IncludeLib("TONG")

Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\map\\map_management.lua")
Include("\\script\\global\\tonggetmasterpower.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\fenghuo_hero\\hero_event.lua")

--�����Ŀ���콱
function tong_award(nTongID)
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		CreateTaskSay({"<dec><npc>��û��Ȩ��������Ŀ�꣬�����콱!", "��֪����/tong_cancel"});
		return
	end
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>����û����Ŀ�꣬�����콱!", "��֪����/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>���Ϊ�������Ŀ��, �����콱!", "��֪����/tong_cancel"});
		return
	end
	local nWeek = TONG_GetWeek(nTongID);
	--�������ʱ�����жϣ������ˢ����Ϊ�����������ڷ���˲��Ǽ�ʱ���ϵģ�
	--�����콱ֻ�����������ͼ����˻��������ڶ��������ͬʱ�콱��ˢ�����
	if (nWeek == TONG_GetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE) or 
		nWeek == TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK)) then
		CreateTaskSay({"<dec><npc>�Ѿ��콱�ˣ������찡!", "��֪����/tong_cancel"});
		return
	end
	local nWeekGoalPriceTong = TONG_GetLWeekGoalPriceTong(nTongID)
	TONG_ApplyAddWarBuildFund(nTongID, nWeekGoalPriceTong);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWeekGoalPriceTong);
	--���콱��־��Ϊ����
	TONG_SetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE, nWeek);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK, nWeek);
	TONG_ApplyAddEventRecord(nTongID, "������Ŀ�꽱��."..nWeekGoalPriceTong.." ��ս��Ԥ�� ");	-- ����¼���¼
	Msg2Player(format("�����Ŀ�꽱��: ս��Ԥ�� <color=gold>%d<color> ��", nWeekGoalPriceTong))
end

--������Ŀ���콱
function WeekGoalPrice(nTongID)
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>���ܹ��û����Ŀ��, �����콱!", "��֪����/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>δ�����Ŀ��, �����콱!", "��֪����/tong_cancel"});
		return
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nLWeekValue = TONGM_GetLWeekGoalOffer(nTongID, GetName())
	local nPlayerGoal = TONG_GetLWeekGoalPlayer(nTongID)
	--ʹ�õ����ɷ���˾����ĳ�Ա����
	local nState = GetTongMTask(TONGMTSK_WEEK_GOAL_PRICE)
	if (nState == nTongWeek) then --�������������Ϊ����
		CreateTaskSay({"<dec><npc>����ȡ����Ŀ�꽱����, ��Ҫ����Ϊ���������, �������� ", "��֪����/tong_cancel"});
		return
	end
	if (nLWeekValue == 0 or nPlayerGoal == 0) then
		CreateTaskSay({"<dec><npc>����ʲôҲû������ô�ܲ��Ͷ����أ� ", "��֪����/tong_cancel"});
		return
	end
	if (nLWeekValue < nPlayerGoal) then
		CreateTaskSay({"<dec><npc>δ�������Ŀ��, �����콱, ��Ҫ����Ϊ���Ŭ��, ���������ջ��.", "��֪����/tong_cancel"});
		return
	end	
	local nPrice = TONG_GetLWeekGoalPricePlayer(nTongID)
	AddContribution(nPrice)
	Msg2Player("<#>�Ѿ���ɰ����Ŀ����, ��ù��׶Ƚ���:"..nPrice.."��")
	Msg2Player("<#>�Ѿ���ɰ����Ŀ����, ��þ���ֵ����: "..(nPrice*10000).."��")
	AddOwnExp(nPrice*10000)
	SetTongMTask(TONGMTSK_WEEK_GOAL_PRICE, nTongWeek)
end

function main()
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (GetProductRegion() == "cn_ib") then
		-- ����ͼģ���еļ�����ֱ�ӽ����ͼ����
		if (aDynMapCopyName[nSubWorldId] ~= nil) then
			tongmap_management();
			return
		end
	end;
	local _Name, nTongID = GetTongName();
	-- ���û�а���򲻳��ֹ����б�
	if (nTongID == 0) then
		CreateTaskSay({"<dec><npc>���˽��°��ϵͳ��Ϣ!", "Э�����/#tong_help()", "���� /tong_cancel"});
		return
	end
	local param = "("..nTongID..")";
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (nSubWorldId > DYNMAP_ID_BASE and nSubWorldId ~= TONG_GetTongMap(nTongID)) then
		Say("�ⲻ�ǹ�����, �����μӰ�?", 2, "Э�����/#tong_help()", "˳��·������/tong_cancel");
		return
	end
	local figure = TONGM_GetFigure(nTongID, GetName());
	local aryDescribe = 
	{
				"<dec><npc>��������ʲô����?",
				"������Ŀ�꽱�� /#WeekGoalPrice"..param,
				"��ȡÿ�չ��׶Ƚ���/#GetDayPrice"..param,
--				"����ȼ���������/LUP_HelpInfo",
				-- Խ�ϰ�᲻��
--				"���ư�����װ/enter_anbang",
				"�Լ����а��ְ�� #tong_mastercompetition"..param,
--				"��������Ϣ/#tong_help()",
	};
	--����ǳ��ϺͰ���
	if (figure == TONG_MASTER or figure == TONG_ELDER) then
		tinsert(aryDescribe, "������Ŀ���Ѷ�/#tong_levelchoose"..param);
		tinsert(aryDescribe, "�����Ŀ�꽱��/#tong_award"..param);
	end
	tinsert(aryDescribe, "Э�����/#tong_help()");
	tinsert(aryDescribe, "����/tong_cancel");
	CreateTaskSay(aryDescribe);
end

function tong_help()
	OpenHelp(80)
end

function GetDayPrice(nTongID)
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_RETIRE) then
		Say("����������״̬, �����콱", 0);	
		return
	end	
	if (TONGM_GetJoinDay(nTongID, GetName() ) == TONG_GetDay(nTongID)) then
		Say("<#>��Ҫ���������һ�������!", 0)
		return
	end

	if (TONG_GetBuildLevel(nTongID) <= 0) then
		Say("<#>���ﵽ1�������칱�׶�", 0)
		return
	end
	--��̳�������ۼӵ����ۻ����׶�
	if (TONG_GetPauseState(nTongID) ~= 0) then
		Say("<#>�����������ͣ״̬��������", 0)
		return
	end
	local nTongDay = TONG_GetDay(nTongID)
	if (GetTongMTask(TONGMTSK_DAILY_PRICE) == nTongDay) then
		Say("<#>������ս���", 0)
		return
	end
	local nPrice = DAILY_PRICE
	if (nPrice > 0)then
		AddContribution(nPrice)
		Msg2Player("���<color=gold>"..nPrice.."<color> ���׶�")
	end
	SetTongMTask(TONGMTSK_DAILY_PRICE, nTongDay)
end

function unchain_pause_state(nTongID)
	local nConsume = TONG_GetMaintainFund(nTongID)	
	local nCurFund = TONG_GetWarBuildFund(nTongID)
	if (nCurFund < nConsume*7) then
		Say("<#>ս��Ԥ���������ı���ս��Ԥ��, ������������!", 0)
	else	
		TONG_ApplySetPauseState(nTongID, 0)
		Msg2Tong(nTongID, "��������ָ�����!")
	end
end

function tong_levelchoose(nTongID)
	if nTongID == 0 then return end;
	local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
	Say("<#>�����Ŀ���Ѷȼ���Ϊ<color=yellow>"..nLevel.."<color>,\n\n ������Ŀ���ѶȽ������ܷ�������,��������Ŀ���Ѷ���?", 3, "�Ѷȼ���1/#select_level(1)", "�Ѷȼ���2/#select_level(2)", "����Ҫ/tong_cancel")
end

function select_level(nLevel)
	local _Name, nTongID = GetTongName()
	if nTongID == 0 then return end;
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		Say("<#>����Ȩ������Ŀ��, ��а�����!", 0)
		return
	end
	TONG_ApplySetCurWeekGoalLevel(nTongID, nLevel)
	Say("<#>Ŀǰ��Ŀ���Ѷ�Ϊ <color=yellow>"..nLevel.."��", 0)
end

-- �û���������Լ�
function tong_mastercompetition() 
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --�����������
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --�����뿪����30��,�������ڲ�����
				Say("����δ�뿪30��, ���ܾ��а���ְλ�Լ�", 1, "ȷ��/tong_cancel");
			return
		end
	end
	
	local param = "("..nTongID..")";
	
	-- ִ�е��˴����������뿪30����
	if (CheckTongMasterPower() ~= 1) then --�����ϵ��������ʸ�
		Say("�iͳ˧ֵ������ֵ�����Ե��ΰ���ְλ", 1, "ȷ��/tong_cancel")
		return
	end

	--ִ�е�����������������������ﵽ�������Ƿ�����ѡ�����������
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then --��û�п���
		Say("�������뿪30���ˣ�����Խ��а���ְλ�Լ��ˣ�2�ܺ���ԲμӾ�ѡ�����",
			2, "��ʼ/#_tong_startup_compete"..param, "����/tong_cancel");
	elseif (TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE) == 0) then --��û�н���2240����,���ǰ�����ѡ��
		Say("���������ְλ����Ҫ��2����Ϊ������ܶ๱�ף��μӸ��ֻ���ﵽ2240���˹��׶�(���׶Ȳ��а�ά������̳���׶ȣ�����Ŀ��Ĺ��׶Ƚ�������)", 2, "�μ�/_foretask", "����/tong_cancel");
	else  --�Ѿ��Ǻ�ѡ���ˣ����μ���2240����
		local nIniContribution = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS);--��øղ���2240����ʱ�Ĺ��׶�
		local nEarnContributiveness =  GetCumulateOffer() - nIniContribution;--����õ����ӵ��ֹ����׶�
		if(nEarnContributiveness < FORETASKVALUE ) then --���׵㻹����2240
			Say("���� "..tostring(nEarnContributiveness).." ���׶�"..", ����"..tostring(FORETASKVALUE - nEarnContributiveness).." ���׶�.", 0);
			return
		end
		local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);
		if (nLastContributiveness == 0) then
			Say("��ϲ! ���ҵ�������Ϊ2240 ���׶����Կ��ԲμӰ���ְλ�����ᣬ���������ֱ�����������ߵĽ��õ�20���ĸ��˹��׶ȣ�Ҫע����ǣ�ÿ��ѡ�񣬽��۳�5% ������.", 2, "ȷ��/inputcontributiveness", "����/tong_cancel");
		else
			Say("��������Ϊ "..tostring(nLastContributiveness)..", ����������?", 2, "+/inputcontributiveness", "����/tong_cancel");
		end
	end
end 

--���������Լ�
function _tong_startup_compete(nTongID)
	local _Name, nCurTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (nCurTongID == 0 or nTongID ~= nCurTongID) then
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --�����������
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --�����뿪����30��,�������ڲ�����
			return
		end
	end
	
	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, dwCurrDateTime); --��ѡ��ʼ����
	--���ģ�����¼��м�¼
	Msg2Tong(nTongID, "�����Լ���ѿ�ʼ");
	TONG_ApplyAddEventRecord(nTongID, "�����Լ���ѿ�ʼ");
	--�������
	local tbMsg = {
		startmemberid	 = GetTongMemberID(),
		startupdate      = FormatTime2String(dwCurrDateTime)
		}
		cTongLog:WriteInfTB("TONG", "master_compete_date", nTongID, tbMsg)

		Say("������ѡ��ѿ�ʼ�����������ְλ����Ҫ��2����Ϊ������ܶ๱�ף��μӸ��ֻ���ﵽ2240���˹��׶�(���׶Ȳ��а�ά������̳���׶ȣ�����Ŀ��Ĺ��׶Ƚ�������)", 2, "�μ�/_foretask", "����/tong_cancel");
end

--����Ϊ��ѡ��,�������Ⱦ�����,Ϊ��ṱ��2240�㹱�׶�
function _foretask()
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 1);--��Ϊ������ѡ��
	Say("��ϲ, ���ѳ�Ϊ���������ˣ���ȥ��ȡ2240 ���׶�.", 1, "ȷ��/tong_cancel");
	local tbMsg = {
		mastercandidat	 = GetTongMemberID()
		};
	cTongLog:WriteInfTB("TONG", "master_candidat", nTongID, tbMsg);
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, GetCumulateOffer()); --��¼��ǰ�ֹ����׶�,��Ϊ2240�������ʼ��־
end

--���û�����ҪͶ��Ǯ��
function inputcontributiveness()
	AskClientForNumber("tong_masterbidding", 1, 500000000, "���������� ");
end

-- ��Ͷ��ע�Ᵽ��ÿ���˵ľ�Ͷ����,�ѱ㲢�е�ʱ���������
function tong_masterbidding(nContributiveness )
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrsecond = GetCurServerTime();

	--���㽫Ҫ�۳����׶�
	local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);--�ϴ�Ͷ����
	local nCurrTotalOffer = nLastContributiveness + nContributiveness; --�ܹ�Ͷ����
	local nDeductContributiveness = ceil((nContributiveness/ 20));--Ҫ�۳��Ĺ��׶�
	local nNewcontrvalue = GetContribution() - nDeductContributiveness;
	
	if (nNewcontrvalue < 0) then
		Say("�i���׶�С�� 5% ���������֣����ܲμ�.", 0);
		return
	end
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, nCurrTotalOffer)
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, dwCurrsecond)--��¼��Ͷʱ��,�����׶���ͬ��ʱ������������
	
	Say("�����ɹ�:"..tostring(nCurrTotalOffer), 0);
	AddContribution((-nDeductContributiveness));

	local tbMsg = {
		contribution     = nCurrTotalOffer,
		selfcommend_time = FormatTime2String(dwCurrsecond)
		}
	cTongLog:WriteInfTB("TONG", "master_bidding", nTongID, tbMsg)
end

---���ƶ�������---------------------------------------------------------------------------
--���ƶ�������ı�
ab_detail = {
			[1] = {"�������ʯ����", "����ܹ�: �� <color=yellow>[����] �������ʯ����<color> ��Ҫ<color=yellow>200<color> ���׶�, ��ͬ����?", 200, 218},
			[2] = {"����ջ�ʯָ��", "����ܹ�: �� <color=yellow>[����] ����ջ�ʯָ�� <color> ��Ҫ<color=yellow>500<color> ���׶�, ��ͬ����?", 500, 217},
			[3] = {"���Ѫʯ��ָ", "����ܹ�: �� <color=yellow>[����] ���Ѫʯ��ָcolor> ��Ҫ<color=yellow>500<color> ���׶�, ��ͬ����?", 500, 219},
			[4] = {"�������ʯ����", "����ܹ�: �� <color=yellow>[����] �������ʯ����<color> ��Ҫ<color=yellow>1000<color> ���׶�, ��ͬ����?", 1000, 216}
};
function enter_anbang()
	--�����ѡ��
	local tab_ab_content = {};
	local nLoop = 4;

	tinsert(tab_ab_content, "�˽���ư���/tong_ab_about");
	for i = 1, nLoop do
		tinsert(tab_ab_content, "������ "..ab_detail[i][1].." ("..ab_detail[i][3].." ���׶�) /#tong_ab_get("..i..")");
	end;
	tinsert(tab_ab_content, "�뿪/tong_cancel");
	Say("��̳����������������������˰���װ������Ȼֻ��ģ�£���������Ч��Ҳ������İ������⣬������İ���һ��ʹ��ʱ��Ҳ���Լ����������",
	getn(tab_ab_content), tab_ab_content);
end;

function tong_ab_about()
	Say("����̳�����Ƿ��ư����Ȼ����������в�𣬵�������ԭ�ϱ��˺ܶࡣ������� <color=yellow>[����] ����ջ�ʯָ��<color>, <color=yellow>[����] ���Ѫʯ��ָcolor>, <color=yellow>[����] �������ʯ����<color>, <color=yellow>[����] �������ʯ����<color>.", 0);
end;

function tong_ab_get(nIndex)
	if (nIndex < 1 or nIndex > 4) then
		return
	end;
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	if (GetContribution() < ab_detail[nIndex][3]) then
		Say("��̳:  �i���˹��׶Ȳ����� <color=yellow>"..ab_detail[nIndex][3].."<color> ��, ���������Ʒ, ����Ŭ���ҹ��׶Ȯ�.", 0);
		Msg2Player("�i���˹��׶Ȳ�����, ����ʹ�øù���.");
		SetTaskTemp(193, 0);
		return
	end;
	
	AddGoldItem(0, ab_detail[nIndex][4]);
	AddContribution(-ab_detail[nIndex][3]);
	Msg2Player("ʹ�� <color=yellow>"..ab_detail[nIndex][3].." ���׶�<color> �� �� 1<color=yellow>"..ab_detail[nIndex][1].."<color>.")
	SetTaskTemp(193, 0);
end;

-------------------------------�����������---------------------------------------
aTongLevelUpPrice = {
	[2] = {	--2��ʱ��boss��������֮ӡ���߼��Ի�֮��
		{20, 100, 200},
		{10, 100, 50},
		{8, 100, 50},
		{6, 100, 50},
		{4, 100, 50},
		{2, 100, 50},
		{1, 100, 50},
	},
	[4] = {	--4��ʱ��boss��������֮ӡ���߼��Ի�֮��
		{30, 200, 200},
		{20, 200, 100},
		{15, 200, 100},
		{10, 200, 100},
		{8, 200, 100},
		{6, 200, 100},
		{4, 200, 100},
	}									}

function LUP_HelpInfo()
	Say("ֻ��Ҫ����һ�� <color=red>7<color> ��ͷ���Ľ���ȼ��ﵽ����<color=yellow>2<color> ����<color=yellow>4<color>, "..
	 	"���ɰ����������콱����Ʒ�������ٻ�boss���ƣ�����ӡ���߼��Ի͹����ȼ�Խ�ߣ�����Խ��.",
	 	3, "�ҵİ�ṻ�����ˣ����콱/LUP_GetPrice", "���뿴��Ʒ���ݼ��Ľ���/#LUP_PriceInfo(nil)", "֪����/tong_cancel")	
end

function LUP_PriceInfo(nLevel, nOrder)
	if (nLevel == nil) then		
		Say("��ѡ��", 4, "������ȼ��ﵽ2���Ľ������Ľ���/#LUP_PriceInfo(2)", "������ȼ��ﵽ4���Ľ���/#LUP_PriceInfo(4)",
			 "����/LUP_HelpInfo", "�뿪/tong_cancel")
	elseif nOrder == nil then
		local S = {i = 0, l = nLevel}
		function S:GenParam()
			self.i = self.i+1
			return "�ȼ� "..self.i.."����/#LUP_PriceInfo("..self.l..","..self.i..")"
		end
		Say("��ѡ��", 9, S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(),
			"����/#LUP_PriceInfo(nil)", "�뿪/tong_cancel")
	else
		Say("�����Ի��<color=yellow>�ٻ�boss����10��<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][1].." <color>��, <color=yellow>����ӡ<color>(Sau khi ʹ��, 2Сʱ�ڹ��׶Ȼ�ý�Ϊ˫��)<color=green> "..aTongLevelUpPrice[nLevel][nOrder][2].." <color> ��, <color=yellow>�߼��Ի͹�<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][3].." <color> ��",2,
			"����/#LUP_PriceInfo("..nLevel..",nil)", "�뿪/tong_cancel")
	end
end

function LUP_PriceInfo2()
	Say("", 4, "������ȼ��ﵽ2��ʱ�Ľ���/LUP_PriceInfo2", "������ȼ��ﵽ2��ʱ�Ľ���/LUP_PriceInfo4",
		 "����/LUP_HelpInfo", "�뿪/tong_cancel")
end

function LUP_GetPrice()
	local _,nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	--������ǰ���
	if (figure ~= TONG_MASTER) then
		Say("�����ź���ֻ�а��������콱.", 0)
		return
	end
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("������, ���᲻������1�� <color=red>7<color> ��һ���ﵽ�ȼ��İ��"..nLevel..", �����콱.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "����ǵ� <color=red>"..nOrder.."<color> ������<color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", �����Ѿ�������.", 0)
		return
	elseif (nPrice < 0) then --û�����
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	local tbSel = {}
	if (nBossFu > 0)then
		tinsert(tbSel, "��ǰ��ȡ "..nBossFu.." �ȼ�Ϊ10�����ٻ�boss����/#LUP_GivePrice(1,"..nBossFu..")")
	end
	if (nContributionPie >= 1 and nContributionPie < 20)then
		tinsert(tbSel, "��ȡ"..nContributionPie.." ������ӡ/#LUP_GivePrice(2,"..nContributionPie..")")
	elseif (nContributionPie >= 20)then
		tinsert(tbSel, "��ǰ��ȡ 20 ������ӡ/#LUP_GivePrice(2, 20)")
		if (nContributionPie >= 40)then
			tinsert(tbSel, "��ǰ��ȡ 40 ������ӡ/#LUP_GivePrice(2, 40)")
			if (nContributionPie >= 60)then
				tinsert(tbSel, "��ǰ��ȡ 60 ������ӡ/#LUP_GivePrice(2, 60)")
			end	
		end
	end
	if (nFruit >= 1 and nFruit < 20)then
		tinsert(tbSel, "��ȡ"..nFruit.." ���߼��Ի͹�/#LUP_GivePrice(3,"..nFruit..")")
	elseif (nFruit >= 20)then
		tinsert(tbSel, "��ǰ��ȡ 20 ���߼��Ի͹�/#LUP_GivePrice(3, 20)")
		if (nFruit >= 40)then
			tinsert(tbSel, "��ǰ��ȡ 40 ���߼��Ի͹�/#LUP_GivePrice(3, 40)")
			if (nFruit >= 60)then
				tinsert(tbSel, "��ǰ��ȡ 60 ���߼��Ի͹�/#LUP_GivePrice(3, 60)")
			end	
		end
	end	
	tinsert(tbSel, "��ʱ����/tong_cancel")
	Say(szOrder..", Ŀǰ�� <color=yellow>"..nBossFu.."<color> ��<color=yellow>10���ٻ�boss����<color>, <color=yellow>"..nContributionPie.."<color> ��<color=yellow>����ӡ<color> v?<color=yellow> "..nFruit.."<color> <color=yellow>�߼��Ի�֮��<color>������ȡ��������˴���ȡ��Ʒ���������١�", 
		getn(tbSel), tbSel)
end

function LUP_GivePrice(nWhich, num)
	local aName = {"10���ٻ�boss����", "����ӡ", "�Ի͹�(�߼�) "}
	Say("�� ��ǰ��ȡ <color=yellow>"..num.."<color> <color=yellow>"..aName[nWhich].."<color>, ��ȷ��װ������λ, ����ж����������������˼��ߣ���Ҫ����û�������㡣", 
		2, "��֪����!���Ľ���/#LUP_GivePrice_OK("..nWhich..","..num..")", "���ҿ���װ���Ȯ�./tong_cancel")
end

function LUP_GivePrice_OK(nWhich, num)
	local _,nTongID = GetTongName();	
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("�����ź�����ﲻ����7����ǰ�еİ�ᣬ����ﵽ"..nLevel..", �����콱.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "����ǵ�<color=red>"..nOrder.."<color> ������<color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", �����Ѿ�������.", 0)
		return
	elseif (nPrice < 0) then --û�����
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	if nWhich == 1 then
		if (nBossFu < num)then
			return
		end
		nBossFu = nBossFu - num
		--�����ٻ���
		for i = 1,num do
			AddItem(6,1,1022,10,0,0,0)
		end
		local szMsg = GetName().."��ȡ�����������: 10���ٻ�boss����"..num.."��"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	elseif nWhich == 2 then
		if (nContributionPie < num)then
			return
		end
		nContributionPie = nContributionPie - num
		--��������֮ӡ(һ������Ч)
		local ntime = GetCurServerTime() + 7 * 24 * 3600;
		local nTimeParam = tonumber(FormatTime2String("%y%m%d",ntime))	
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,1264,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
			SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
			SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."��ȡ�����������: ����ӡ"..num.."��"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)		
	elseif nWhich == 3 then
		if nFruit < num then
			return
		end
		nFruit = nFruit - num
		local ntime = tonumber(date("%y%m%d"));
		--�����߼��Ի�֮��
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,906,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."��ȡ�����������: �Ի͹��߼� ��"..num.."��"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	end	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, 1000 * 1000 * nFruit + 1000 * nContributionPie + nBossFu)
end

function tong_cancel()
end

