IncludeLib("LEAGUE")
IncludeLib("TITLE")
Include("\\script\\lib\\gb_modulefuncs.lua");
TASK_ACTIVE_TITLE = 1122
CW_TITLE_TIME = 7*24*60*60*18;
TB_CITYWAR_ARRANGE = {
				{3,4},--����
				{1,2},--�ɶ�
				{2,3},--����
				{5,6},--�꾩
				{4,5},--����
				{0,1},--����
				{6,0},--�ٰ�
			}
			
-----���򹥳�ս���� start
function AskDeal()
	Say("�������ǵ��þ�ʮ����Ч��, ֻ����Ԫ������! �͹��������˲�����ľ����ź���!", 4, 
	--"��ʯ��/DealBuy", 
	"�����峵/#DealBuy(1)", 
	"�Ƽ�����/#DealBuy(2)", 
	"��̱���/#DealBuy(3)", 
	"����Ҫ/OnCancelBuy");
end;

function DealBuy(ItemID)
	if (ItemID == 0) then
		SetTaskTemp(15, 29);
	elseif (ItemID == 1) then
		SetTaskTemp(15, 30);
	elseif (ItemID == 2) then
		SetTaskTemp(15, 31);
	elseif (ItemID == 3) then
		SetTaskTemp(15, 32);
	else
		return
	end;
	Say("��Ϊ����˺ܶ�! �͹�ֻ����һ��!ͬ����?", 2, "��/DoBuy", "����һ��/OnCancelBuy");
end;

function DoBuy()
	TheItem = GetTaskTemp(15);
	if (TheItem >= 29 and TheItem <= 32) then
		if (GetItemCountEx(343) > 0) then
			DelItemEx(343);
			AddItem(6,1,TheItem,1,0,0);
			WriteLog(format("%s ��343����Ԫ����1�����ǵ���>> %s",GetName(),TheItem));
			Say("�͹���ʶ��!", 0);
		else
			Say("�͹��Ǻ�С�˿���Ц�������û��Ԫ��?", 0);
		end;
	end;
end;
function OnCancelBuy()
	Say("ף��ʿ�쿪��ʤ, ���տ���!", 0);
end;
-----���򹥳�ս���� end

--��õ�7��� 20:00�� ��ʱ����
function getUsedLine()
	local nh = tonumber(GetLocalDate("%H"));
	local nm = tonumber(GetLocalDate("%M"));
	return (CW_TITLE_TIME-((nh-20)*60+nm)*60*18);
end;

--��õ�ǰ��������ս�ĳ���
--nSel=1,������nSel=2,����
function getSigningUpCity(nSel)
	local nWeek = tonumber(GetLocalDate("%w"));
	for i = 1, getn(TB_CITYWAR_ARRANGE)do
		if (TB_CITYWAR_ARRANGE[i][nSel] == nWeek) then
			return i;
		end;
	end;
end;

-- ����콱����
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> ֻ��ռ����еİ��ɲſ����콱, �����ҵ��ֵ���ȥռ��һ����ȥ!")
		end
		return 0
	end
	
	--local tong_master = GetTongMaster()
	--local player_name = GetName()
	--if (tong_master ~= player_name) then
--		if (show_talk == 1) then
	--		Talk(1, "", "<#>ֻ�а���������ȡ��ά���������ǰ�������")
		--end
		--return 0
	--end
	
	local wday = tonumber(GetLocalDate("%w"))	-- ���������ڼ���
	local hour = tonumber(GetLocalDate("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#>ÿ�ܴ�9:00~20:00 ���콱ʱ��, ��ʱ����ȥ")
		end
		return 0
	end

	local ndate = tonumber(GetLocalDate("%Y%m%d"))
	if (ndate == get_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS)) then
		if (get_city_orecount(city_index) <= get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT)) then
			if (show_talk == 1) then
				Talk(1, "", "<#>���ܵĽ�Ʒ�����꣬���������ɡ�")
			end
			return 0
		end;
	else
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS, ndate);
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 0);
	end

	return 1
end

TSK_CITYTONG_DATE = 2518
-- ��ȡռ�ǰ�ά��
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#>ռ�ǰ�άƷ. ռ�ǰ��Ա���Ե����ִ��˴���ȡ5������, ÿ�˿�����ȡ1��. ����:����(�ٰ����꾩) ��ȡ300��5������, ����(��������) ��ȡ200��5������. ��18h00֮�������û������Ļ�����ô����������20h00 ֮ǰ����ȡ.",
			3,
			"<#>������ȡ������ʯ/#take_tong_award(1)",
			"<#>���ǰ�����������һ�ν�Ʒ/take_tong_resaward",
			"<#>����ʱ����/nothing")
	end
end

-- ��ȡ���
function take_tong_award(count)
	-- һ�����ռһ������
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#>��ı������ˣ�����������콱.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH >= 18) then
		Talk(1, "", "<#>ÿ�������콱ʱ����9h00��18h00, ��׼ʱ���콱. ���ڻ�û����ȡ�Ľ�Ʒ, ֪ͨ����20h00ǰ����ȡ.");
		return 0;
	end;
	local today = tonumber(GetLocalDate("%Y%m%d"));
	local nMydate = GetTask(TSK_CITYTONG_DATE);
	if (nMydate ~= today) then
		AddItem(6,1,147,5,1,1);
		SetTask(TSK_CITYTONG_DATE, today);
		add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 1);
	local msg =	format("%s %s (%s) ��ȡ %s 5�������ӽ�ɽ�����˴�",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
		WriteLog(msg);
		Talk(1, "", "<#>������Ľ�Ʒ������ȡ.")
	else
		Talk(1, "", "<#>���Ѿ��������ܵĽ�Ʒ, �����ܰɡ�");
	end
end

function take_tong_resaward()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH < 18 or nH >= 20) then
		Talk(1, "", "<#>����������18h00��20:00�ڶ����콱Ʒ����׼ʱ����.");
		return 0;
	end;
	
	if (GetName() ~= GetTongMaster()) then
		Talk(1, "", "<#>ֻ�а����ſ����ٴ���ȡ���ڰ�άƷ. ���֪��������20h00֮ǰ�����콱.");
		return 0;
	end;
	
	local nFreecell = CalcFreeItemCellCount();
	if (nFreecell < 20) then
		Talk(1, "", "<#>�����ռ䲻������������.")
		return 0;
	end;
	
	local nCount = get_city_orecount(city_index) - get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT);
	
	for i = 1, nCount do
		AddItem(6,1,147,5,1,1);
	end;
	add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, nCount);
	local msg =	format("%s %s (%s) ��ȡ %s 5�������ӽ�ɽ������",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
	WriteLog(msg);
	Say(format("���ǹ��Ľ�Ʒ, %s����������!",nCount), 0);
end;

function get_city_orecount(cityid)
	if (cityid == 4 or cityid == 7) then
		return 300;
	else
		return 200;
	end;
end;
--------------------------------------------------------------------------------
--�õ�һ��������ڰ��ռ��ĳ���,��������ֵ
function gettongownercity()
	--�õ���Ұ������
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--�ֱ�õ��ߴ���еİ����������Ұ�����ƶԱ�
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--��ʾ������ڵİ��û��ռ�����
	return 0
end

--���Ϊnil��0������1�����򷵻�0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
function checkCityWarLeague()
	for i = 1, 7 do
		local szLg = cityid_to_lgname(i);
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_SIGN, szLg)	--����������Ϣ(���͡�����)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
		
		nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_FIRST, szLg)	--����������Ϣ(���͡�����)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
	end;
end;

function cityid_to_lgname(nCityID)
	return GetCityAreaName(nCityID);
end;

--����һ̨��������ִ�м���
--���ԣ��ж��л�ɽ�ĵ�ͼ

--Relayִ������ ���Ƿ�
function citywar_appointchallenger(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointChallenger(szCityName, szTongName)
	end;
end;

--Relayִ������ ����
function citywar_appointviceroy(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointViceroy(szCityName, szTongName)
	end;
end;
