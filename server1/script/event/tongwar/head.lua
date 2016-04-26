Include("\\script\\event\\tongwar\\headinfo.lua")
Include("\\script\\event\\tongwar\\tongwar_signup.lua")
Include("\\script\\task\\random\\treasure_head.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\dailogsys\\dailogsay.lua")
IL("TONG");
_TONGWAR_CITYOWNER = {}


--���Ϊnil��0������1�����򷵻�0
function FALSE(value)
	if (value == 0 or value == nil or value == "") then
		return 1
	else
		return nil
	end
end

--����7��������ʱ����
function tongwar_create()
	if (getn(_TONGWAR_CITYOWNER) ~= 0 and _TONGWAR_CITYOWNER[1][3] == get_tongwar_season()) then
		return
	end
	local nseason = get_tongwar_season();
	local n_lid = LG_GetFirstLeague(TONGWAR_LGTYPE)
--	if (FALSE(n_lid)) then
--		return
--	end
	for i = 1, 7 do
		_TONGWAR_CITYOWNER[i] = {}
		_TONGWAR_CITYOWNER[i][1] = TONGWAR_CITY[i]
		_TONGWAR_CITYOWNER[i][2] = tongwar_getmember(TONGWAR_CITY[i])
		_TONGWAR_CITYOWNER[1][3] = nseason;
	end
end

--���ĳ�����е����� ����table
function tongwar_getmember(s_lname)
	local tb_member = {}
	local n_lid = LG_GetLeagueObj(TONGWAR_LGTYPE, s_lname)
	local n_count = LG_GetMemberCount(n_lid)
	for i = 0, (n_count - 1) do
		local tongname, n_job = LG_GetMemberInfo(n_lid, i)
		tb_member[getn(tb_member) + 1] = {tongname, n_job}
	end
	return tb_member
end

--���������󣬸�7���������ּ�������������
_TONGWAR_ARRRANK = {};
_TONGWAR_ROLELADDER = {};
function tongwar_bigger(lg1, lg2)
	if (lg1[2] == lg2[2]) then
		return lg1[3] > lg2[3];
	end;
	return lg1[2] > lg2[2];
end;

function tongwar_cityrank()
--��ս��������
	for i = 1, 7 do
		_TONGWAR_ARRRANK[i] = {};
		_TONGWAR_ARRRANK[i][1] = _TONGWAR_CITYOWNER[i][1];
		_TONGWAR_ARRRANK[i][2] = LG_GetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_CITYOWNER[i][1], TONGWAR_LGTASK_RESULT);
		_TONGWAR_ARRRANK[i][3] = LG_GetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_CITYOWNER[i][1], TONGWAR_LGTASK_POINT);
		_TONGWAR_ARRRANK[i][4] = LG_GetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_CITYOWNER[i][1], TONGWAR_LGTASK_TONGID);
	end;
	sort(_TONGWAR_ARRRANK, tongwar_bigger);
	for i = 1, 7 do
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_ARRRANK[i][1], TONGWAR_LGTASK_RANK, i, "", "");
	end;
--	gb_SetTask("TONGWAR_STATION", 1, _TONGWAR_ARRRANK[1][4]);
end;

function get_tongwar_phase()
	return gb_GetTask("TONGWAR_STATION", 2);
end;

function tongWar_SelectCity(strCityName, strCityTongName)
	if tongWar_CanSelectCity() ~= 1 then
		return
	end
	if get_tongwar_phase() ~= 1 then
		return
	end
	
	nseason = get_tongwar_season()
	if (FALSE(LG_GetLeagueObj(TONGWAR_LGTYPE, strCityName))) then
		local nLeagueID = LG_CreateLeagueObj()
		LG_SetLeagueInfo(nLeagueID, TONGWAR_LGTYPE, strCityName)
		LG_ApplyAddLeague(nLeagueID, "", "")
		LG_FreeLeagueObj(nLeagueID)
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, strCityName, TONGWAR_LGTASK_SEASON, nseason);
		
		if (not FALSE(strCityTongName))then
				nMemberID = LGM_CreateMemberObj()
				--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
				LGM_SetMemberInfo(nMemberID, strCityTongName, 1, TONGWAR_LGTYPE, strCityName)
				LGM_ApplyAddMember(nMemberID, "", "")
				LGM_FreeMemberObj(nMemberID)
				LG_ApplySetMemberTask(TONGWAR_LGTYPE, strCityName, strCityTongName, TONGWAR_LGMTASK_JOB, 1)
		end
		
		
	end
end

function tongWar_CanSelectCity()
	local szTongName = GetTongName();
	
	if szTongName == nil or szTongName == "" then
		return
	end
	
	if (GetTongFigure() ~= TONG_MASTER) then --�ж��Ƿ��ǰ���
		return
	end
	--����Ѿ���ս���˿϶�����ѡ����
	if not FALSE(LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName)	) then 
		return
	end
	local tb = {}
	for i = 1, 7 do
		if GetCityOwner(i) == szTongName then --ûս������ռ�ǰ��
			return 1
		end
	end
end

function tongWar_ShowSelectCityMenu()
	local szTongName = GetTongName();
	
	if szTongName == nil or szTongName == "" then
		return
	end
	
	if (GetTongFigure() ~= TONG_MASTER) then --�ж��Ƿ��ǰ���
		return
	end
	local tb = {}
	for i = 1, 7 do
		local strCityName = GetCityAreaName(i)
		local strCityTongName = GetCityOwner(i)
		tb[strCityTongName] = tb[strCityTongName] or {}
		tinsert(tb[strCityTongName], strCityName)
	end
	local tbCity = tb[szTongName]
	if tbCity then
		local szTitle = "ѡ�������μӱ����ĳ��У�������ռ�ĳ��ж�1��ֻ�ܴ���һ�����вμӵ�һ��"
		local tbOpt = {}
		for i=1, getn(tbCity) do
			
			tinsert(tbOpt, {tbCity[i], tongWar_SelectCity, { tbCity[i], szTongName}})
		end
		CreateNewSayEx(szTitle, tbOpt)
	end
	
end

function tongWar_AddSelectCityOpt(tbOpt)
	
	if tongWar_CanSelectCity() then
		tinsert(tbOpt, 2, "ѡ����Ҫ����μӱ����ĳ���/tongWar_ShowSelectCityMenu")
	end
	
end

function tongWar_Start()
	tongwar_create()
	if (getn(_TONGWAR_CITYOWNER) == 0) then
		CreateTaskSay({"<dec><npc>��������������ߴ���к����˰�ռ�ǵİ����Խ���ר���������������ֳ��ĸ�����Ϊ���ֵ�һ���һ�ｫ�ص�������Ѿ��߹�����š�","�����Ի�/OnCancel"});
		return 
	end;
	
	tongwar_clear_rlpoint();
	
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local szContent = {"<dec><npc>���ֵ�һ��������ἴ����ʼ��Ŀǰ�������������������ռ�ǰ���������������������һ����ʼ�Ͳ��ܸı������ˡ�"};
	if (get_tongwar_phase() == 1) then	--���
		
		
		tongWar_AddSelectCityOpt(szContent)
		
		
		tinsert(szContent, "ͬ�˼���������/tongwar_onjoin");
		tinsert(szContent, "ռ�ǰ���ڸ�����/tongwar_cityowner");
		
	elseif (get_tongwar_phase() == 2) then	-- �����ڼ�
		
		tinsert(szContent, "����μӱ���/tongwar_want2signup");
		tinsert(szContent, "��ռ�ǰ�����˳ɼ�/tongwar_rank");
		tinsert(szContent, "ռ�ǰ���ڸ�����/tongwar_cityowner");
		
	elseif (get_tongwar_phase() == 3) then	--����ʱ��
		
		if (getn(_TONGWAR_ARRRANK) == 0) then
			tongwar_cityrank();
		end;
		tinsert(szContent,"��ȡ���ֵ�һ������/tongwar_title_talk");
		tinsert(szContent, "��ȡ���ֵ�һ���ý���/tongwar_aword_talk");
		tinsert(szContent, "��ռ�ǰ��������/tongwar_query");
		tinsert(szContent, "ռ�ǰ���ڸ�����/tongwar_cityowner");
	end;
							
	tinsert(szContent, "���ֵ�һ��/tongwar_detail");
	tinsert(szContent, "�����Ի�/OnCancel");
	
	CreateTaskSay(szContent);
end

function tongwar_title_talk() --��ȡ���µ�һ��ĳƺ�
	if (GetByte(GetTask(TONGWAR_RLTASK_AWARD),1) == get_tongwar_season()) then --�����ƺ����ð�
		Msg2Player("����óƺ�<color=red>���ֵ�һ��<color> ��.")
		CreateTaskSay({"<dec><npc>����ȡ�ƺ�<color=red>���ֵ�һ��<color> ��.", "�����Ի�/OnCancel"});
		return
	end;        
	
	local szTongName = GetTong();
	if (FALSE(szTongName)) then
		CreateTaskSay({"<dec><npc>����������ȡ�ƺ�<color=red>���ֵ�һ��<color>.", "�����Ի�/OnCancel"});
		return
	end;           
	
	local nLeagueID = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName);
	if (FALSE(nLeagueID)) then
		CreateTaskSay({"<dec><npc>����������ȡ�ƺ�<color=red>���ֵ�һ��<color>.", "�����Ի�/OnCancel"});
		return
	end;
	
	local szLeagueName = LG_GetLeagueInfo(nLeagueID);
	
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1] or FALSE(tongwar_check_ownerright())) then
		CreateTaskSay({"<dec><npc>ֻ��������һ��ռ�ǰ��Ա���ܻ�øóƺ�.", "�����Ի�/OnCancel"});
		return
	end;
	
	tongwar_title_award(szLeagueName);
end;

function tongwar_title_award(szlgname)
	SetTask(TONGWAR_RLTASK_AWARD, SetByte(GetTask(TONGWAR_RLTASK_AWARD), 1, get_tongwar_season()));
	if (GetTongMaster() == GetName() and LG_GetLeagueTask(TONGWAR_LGTYPE, szlgname, TONGWAR_LGTASK_MSTITLE) < 1) then
		Msg2Player("��óƺ�<color=green>��������<color>");
		CreateTaskSay({"<dec><npc>��ϲ����óƺ�<color=yellow>��������<color>.", "�����Ի�/OnCancel"});
		tongwar_addtitle(105);--�����⻷
		tongwar_award_log("������������ƺ�");
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, szlgname, TONGWAR_LGTASK_MSTITLE, 1);
	else
		Msg2Player("��óƺ�<color=green>���ֵ�һ��<color>");
		CreateTaskSay({"<dec><npc>��ϲ����� <color=yellow>���ֵ�һ��ƺ�<color>.", "�����Ի�/OnCancel"});
		tongwar_addtitle(106);--���ڹ⻷
		tongwar_award_log("������ֵ�һ��ƺ�");
	end;
end;

function tongwar_addtitle(n_title)
	local nDate	= tonumber(GetLocalDate("%m%d"));
	local nDay	= mod(nDate,100)
	local nMon	= floor(nDate/100)
	nMon	= nMon + floor((nDay + 30)/30);
	nDay = mod((nDay + 30),30);
	local nTime	= mod(FormatTime2Number(GetCurServerTime()+30*24*60*60), 100000000)--nMon * 1000000 + nDay * 10000	-- 

	Title_AddTitle(n_title, 2, nTime);
	Title_ActiveTitle(n_title);
	SetTask(1122, n_title)
end;

function tongwar_query()
	local szmsg = "<dec><npc>���ֵ�һ������ѽ������������: \n"
	for i = 1, 7 do
		szmsg = format("%s -  <color=red>%d<color>: <color=yellow>ռ�ǰ��ܷ���%s: %d  ������: %d<color>  <enter>",
												szmsg, i, _TONGWAR_ARRRANK[i][1], _TONGWAR_ARRRANK[i][2], _TONGWAR_ARRRANK[i][3]);
	end;
	CreateTaskSay({szmsg, "�����Ի�/OnCancel"});
end;

function OnCancel()
end

function tongwar_cityowner()
	local tb_Opp = {"<dec><npc>���ռ�ߴ�����ѷֳ�����ѡ����Ҫ���ĳ�����Ϣ:"};
	tb_Opp[getn(tb_Opp) + 1] = "����������ĸ��������/tongwar_enemy";
	for i=1,7 do
		tb_Opp[getn(tb_Opp) + 1] = format("ռ�ǰ��%s/#tongwar_cityowner_qur(%d)",
																			TONGWAR_CITY[i],i);
	end
	tb_Opp[getn(tb_Opp) + 1] = "����/tongWar_Start";

	CreateTaskSay(tb_Opp);
end

function tongwar_cityowner_qur(nSel)
	local cityname = _TONGWAR_CITYOWNER[nSel][1];
	local tb_citymember = _TONGWAR_CITYOWNER[nSel][2];
	local n_lid = LG_GetLeagueObj(TONGWAR_LGTYPE, cityname);
	
	if (FALSE(n_lid)) then
		local szmsg = format("<dec><npc>��%s û�а�����˲μ����ֵ�һ������������.", cityname);
		CreateTaskSay({szmsg, "����/tongwar_cityowner", "����/OnCancel"});
		return
	end;
	
	local n_count = LG_GetMemberCount(n_lid);
	if (getn(tb_citymember) ~= n_count) then	--��Ա��TempTable�У�����ʱ���ȷ��
																						--��Ա���������£���ˢ����
		_TONGWAR_CITYOWNER[nSel][2] = tongwar_getmember(TONGWAR_CITY[nSel])
		tb_citymember = _TONGWAR_CITYOWNER[nSel][2]
	end
	
	local cityowner = ""
	local citymember = ""
	for i = 1, getn(tb_citymember) do
		if (tb_citymember[i][2] == 1) then
			cityowner = tb_citymember[i][1]
		else
			citymember = format("%s\n    <color=yellow>%s<color>", 
														citymember, tb_citymember[i][1]);
		end
	end
	local szmsg = "";
	if (cityowner == "") then
		szmsg = format("<dec><npc>��%s û�а�����˲μ����ֵ�һ������������.", cityname);
		CreateTaskSay({szmsg, "����/tongwar_cityowner", "����/OnCancel"});
		return 
	elseif (citymember == "") then
		szmsg = format("<dec><npc>ռ�ǰ��%s �� <color=red>%s<color>, ������Ϊ\n  <û��>", 
															cityname, cityowner);
	else
		szmsg = format("<dec><npc>ռ�ǰ��%s �� <color=red>%s<color>, ������Ϊ %s", 
															cityname, cityowner, citymember);
	end
	
	local nResult = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_RESULT);	--�ܻ���
	local nPoint = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_POINT);		--������
	szmsg = format("%s\n �����ܷ�: <color=yellow>%d<color><enter>   �ܷ�Ϊ <color=yellow>%d<color>", szmsg, nResult, nPoint);
	CreateTaskSay({szmsg, "����/tongwar_cityowner", "����/OnCancel"});
end

function tongwar_onjoin()
	if (FALSE(tongwar_check_ownerright(1))) then
		CreateTaskSay({"<dec><npc>ֻ��<color=red>ռ�ǰ����<color> ���ܳ����������.",
										 "�����Ի�/OnCancel"});
		return
	end;
	CreateTaskSay({"<dec><npc>ռ�ǰ���������벻ռ�ǰ�İ�����ӽ��ˣ������������?",
					 				"���������������/tongwar_want2join",
					  			"�����Ի�/OnCancel"});
end

--�ж��ǲ���ռ�ǰ�İ���
function tongwar_check_ownerright(bmaster)
	local tongname = GetTongName();
	if (bmaster) then
		-- LLG_ALLINONE_TODO_20070802
		if (GetTongFigure() ~= TONG_MASTER) then --�ж��Ƿ��ǰ���
			return nil
		end;
	end;
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (not FALSE(n_lid)) then
		local leaguename = LG_GetLeagueInfo(n_lid)
		if (LG_GetMemberTask(TONGWAR_LGTYPE, leaguename, tongname, TONGWAR_LGMTASK_JOB) == 1) then
			return n_lid
		end
	end

	return nil
end

function tongwar_want2join()
	if (GetTeamSize() <= 1) then
		CreateTaskSay({"<dec><npc>�����ź������Ϊ�գ����ܽ�Ϊ����!",
										 "�����Ի�/OnCancel"});
		return
	end;
	
	if (IsCaptain() ~= 1) then
		CreateTaskSay({"<dec><npc>ֻ��<color=red>�鳤<color> �������������İ�����Ϊ����.", "�����Ի�/OnCancel"});
		return
	end;
	
	local tb_teammember = tongwar_check_team();
	if (tb_teammember == nil) then
		return
	end
	
	local szmsg = format("�����%d ���°�����������?",getn(tb_teammember))
	for i=1,getn(tb_teammember) do
		szmsg = format("%s\n<color=yellow>%s<color>",szmsg,tb_teammember[i]);
	end
	CreateTaskSay({szmsg, "��/tongwar_sure2join", "����Ҫ!/OnCancel"});
end

function tongwar_sure2join()
	local tb_teammember, tb_rolename, teamtongid = tongwar_check_team();
	if (tb_teammember == nil) then
		return
	end
	local tongname, mytongid = GetTongName();
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (FALSE(n_lid)) then
		return
	end
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local ncityid = TONGWAR_CITYID[str_lgname];
	if (FALSE(ncityid)) then
		print(format("Error!!! CityName(leaguename) Wrong!!%s",str_lgname))
		return
	end;
	for i = 1, getn(tb_teammember) do
		--���Ѱ��������������ս�������ӳ������ӳ����ID
		--local szParam = tb_teammember[i].." "..tb_rolename[i].." "..str_lgname.." "..GetName()
		local szParam = tostring(teamtongid[i]).." "..tb_rolename[i].." "..ncityid.." "..GetName().." "..mytongid;
		LG_ApplyDoScript(0, "", tb_teammember[i], "\\script\\event\\tongwar\\event.lua", "tongwar_add", szParam , "", "")
	end
end

--�����Զ����Ƿ���ϼ������˵�����
--���� ���� tab1(�����),tab2(������),tab3(���id)
--������ ���� nil
function tongwar_check_team()
	local teammember = {};
	local tongmaster = {};
	local teamtongid = {};
	local str_capname = GetName();
	local str_captong = GetTongName();
	local teamsize = GetTeamSize();
	local n_capidx = PlayerIndex;
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i);
		local membername = GetName();
		local tongname, tongid = GetTongName();
		local szmsg = "";
		
		if (FALSE(tongid)) then
			PlayerIndex = n_capidx;
			szmsg = format("<dec><npc>��Ա%s �ڶ��ﲻ�ǰ���Ա�����ܼ�������.",
											 membername);
			CreateTaskSay({szmsg, "�����Ի�/OnCancel"});
			return
		end;
		
		if (GetTongFigure() ~= TONG_MASTER) then
			PlayerIndex = n_capidx;
			szmsg = format("<dec><npc>�Է����ǰ��������ܽ�������.",
											 tongname, membername, tongname);
			CreateTaskSay({szmsg, "�����Ի�/OnCancel"});
			return
		end
		
		--�����ظ������Ա
		if (not FALSE(LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname))) then
			if (LG_GetLeagueObjByRole(TONGWAR_LGTYPE, str_captong) == LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)) then
				szmsg = format("<dec><npc>���%s ��%s �Ѽ���������.",
													membername, tongname);
			else
		 		szmsg = format("<dec><npc>��� %s ��%s �Ѽ����������ˣ����ܼ������İ��������!",
													membername, tongname);
			end;
		 	PlayerIndex = n_capidx;
		 	CreateTaskSay({szmsg, "�����Ի�/OnCancel"});
		 	return 
		end
		teammember[i-1] = tongname;
		tongmaster[i-1] = membername;
		teamtongid[i-1] = tongid;
	end
	PlayerIndex = n_capidx
	return teammember, tongmaster, teamtongid
end

function tongwar_calendar()
	local str = "<dec><npc>"
	for i = 1, getn(TONGWAR_CALENDAR) do
		str = format("%s\n%s",str,TONGWAR_CALENDAR[i]);
	end
	CreateTaskSay({str, "�����Ի�/OnCancel"});
end

function tongwar_detail()
--VLDNB 11 - ����֪ͨ- Modified by DinhHQ - 20120507
	CreateTaskSay({format("<dec><npc>��<color=green>%s <color>��<color=green>%s<color>, ����<color=green>18/05/2012<color>,ÿ����һ��������(���������ϵ�׼��ʱ���<color=green>08: 00~08: 29<color>, ����ʱ��Ϊ<color=green>08:30~09:30<color>), ÿ����3��ͬʱ�ı�����ͬʱ����һ�����û�б�����õ����������һ��ռ����н�һ���<color=green>6<color>�������������˱���.","16/05/2012", "23/05/2012"), 
		"�鿴ռ�ǰ������ճ�/tongwar_calendar", "����/tongWar_Start", "��֪����!/OnCancel"});
end;

function tongwar_join()
	
end;

function tongwar_enemy()
	local szmsg = ""
	local szTongName = GetTongName();
	if ("" == szTongName) then
		CreateTaskSay({"<dec><npc>δ������Ͳ��ܲμӱ���.", "����tongwar_cityowner", "�����Ի�/OnCancel"});
		return
	end;
	local HostLeagueID = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName);
	if (0 == HostLeagueID) then
		CreateTaskSay({"<dec><npc>���İ��Ϊ�����κ����ˣ�û��Ȩ�μӱ���!", "Tr?v?tongwar_cityowner", "��֪����!/OnCancel"});
		return
	end;
	
	local szHostcityName = LG_GetLeagueInfo(HostLeagueID);
	local szHostTongNames = tongwar_getnamestr(HostLeagueID);
	--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
	local nDate = tonumber(GetLocalDate("%d"));
	if (nDate ~= 16 and nDate ~= 17 and nDate ~= 19 and nDate ~= 20 and nDate ~= 21 and nDate ~= 22 and nDate ~= 23) then
		szmsg = format("<dec><npc>������%d,������.", nDate);
		CreateTaskSay({szmsg, "����tongwar_cityowner", "��֪����!/OnCancel"});
		return
	end;
	
	local szGuestCityName = tongwar_getenemycity(szHostcityName, nDate);
	if (nil == szGuestCityName) then
		szmsg = format("<dec><npc>������%d,������.", nDate);
		CreateTaskSay({szmsg, "����tongwar_cityowner", "��֪����!/OnCancel"});
		return
	end;
	
	local GuestLeagueID = LG_GetLeagueObj(TONGWAR_LGTYPE, szGuestCityName);
	local szGuestTongNames = ""
	if not FALSE(GuestLeagueID) then 
		szGuestTongNames = tongwar_getnamestr(GuestLeagueID);
	end
	szmsg = format("<dec><npc>�ҵ����� (ռ�ǰ� %s): %s <enter>    ����Ķ���(ռ�ǰ�%s):  %s", 
										szHostcityName, szHostTongNames,
										szGuestCityName, szGuestTongNames);
	CreateTaskSay({szmsg, "����tongwar_cityowner", "��֪����!/OnCancel"});
end;

--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
TAB_CITYNAME = {"����", "�꾩", "����", "����", "�ٰ�", "�ɶ�", "����"};
TAB_CALENDAR = {
	[16] = {5, 4, 0, 2, 1, 7, 6},
	[17] = {4, 3, 2, 1, 7, 0, 5},
	[19] = {3, 0, 1, 7, 6, 5, 4},
	[20] = {2, 1, 7, 6, 0, 4, 3},
	[21] = {0, 7, 6, 5, 4, 3, 2},
	[22] = {7, 6, 5, 0, 3, 2, 1},
	[23] = {6, 5, 4, 3, 2, 1, 0}
};

function tongwar_getenemycity(szCityName, nDate)
	local i;
	local nCount = getn(TAB_CITYNAME);
	local nPos = 0;
	for i = 1, nCount do
		if (szCityName == TAB_CITYNAME[i]) then
			nPos = i;
			break;
		end;
	end;
	
	if (0 == nPos) then
		return nil;
	end;

	local nEnemyCityIdx = TAB_CALENDAR[nDate][nPos];
	if (nEnemyCityIdx == 0) then
		return nil;
	end;
	return TAB_CITYNAME[nEnemyCityIdx];
end;

function tongwar_querycityrecord(szCityName)
	local LeagueID = LG_GetLeagueObj(TONGWAR_LGTYPE, szCityName);
	local nResult = LG_GetLeagueTask(LeagueID, TONGWAR_LGTASK_RESULT);
	local nPoint = LG_GetLeagueTask(LeagueID, TONGWAR_LGTASK_POINT);
	local szmsg = format("<dec><npc>ռ�ǰ������ܷ�%s: <color=yellow>%d<color><enter>   ս���ִܷ�: <color=yellow>%d<color>",
												 szCityName, nResult, nPoint);
	CreateTaskSay({szmsg, "����tongwar_rank", "��֪����!/OnCancel"});
end;

function tongwar_getnamestr(LeagueID)	--�õ�һ������ռ�������ֵ��б�
	local nCount = LG_GetMemberCount(LeagueID);
	local szLeagueName = LG_GetLeagueInfo(LeagueID);
	local i;
	local szNames = "";
	local szTongName = "";
	local nMemberTask = 0;
	for i = 0, nCount - 1 do
		szTongName = LG_GetMemberInfo(LeagueID, i);
		if (LG_GetMemberTask(TONGWAR_LGTYPE, szLeagueName, szTongName, TONGWAR_LGMTASK_JOB) == 1) then
			szNames = "<enter>    <color=red>"..szTongName.."<color>"..szNames;
		else
			szNames = szNames.."<enter>    <color=red>"..szTongName.."<color>";
		end;
	end;
	return szNames;
end;


function tongwar_rank()
	local szTongName = GetTongName();
	if ("" == szTongName) then
		CreateTaskSay({"<dec><npc>δ�����ᣬ���ܲμӱ���.", 
											"�����Ի�/OnCancel"});
		return
	end;
	
	local HostLeagueID = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName);
	if (FALSE(HostLeagueID)) then
		CreateTaskSay({"<dec><npc>���İ��δ�����κ����ˣ����ܲμӱ���!", 
											"�����Ի�OnCancel"});
		return
	end;
	
	local szHostcityName = LG_GetLeagueInfo(HostLeagueID);
	local nResult = LG_GetLeagueTask(HostLeagueID, TONGWAR_LGTASK_RESULT);	--�ܻ���
	local nPoint = LG_GetLeagueTask(HostLeagueID, TONGWAR_LGTASK_POINT);		--������
	local nPlayerRecord = GetTask(TONGWAR_RLTASK_TOTALPOINT);
	local tab_auerycity = {};
	tab_auerycity[1] = format("<dec><npc>�����ܷ� %s: <color=yellow>%d<color><enter>            ս���ִܷ�: <color=yellow>%d<color><enter>     ����ս����: <color=yellow>%d<color><enter>Xem th�nh th�ch li�n minh kh�c",
										szHostcityName, nResult, nPoint, nPlayerRecord);
	
	for i = 1, getn(TAB_CITYNAME) do
		local cityname = TAB_CITYNAME[i];
		if (szHostcityName ~= cityname) then
			tab_auerycity[getn(tab_auerycity) + 1] = format("�����˳ɼ�%s/#tongwar_querycityrecord([[%s]])", cityname, cityname);
		end;
	end;
	tab_auerycity[getn(tab_auerycity) + 1] ="����tongWar_Start"
	tab_auerycity[getn(tab_auerycity) + 1] ="�����Ի�/OnCancel"
	
	CreateTaskSay(tab_auerycity);
end;

function tongwar_aword_talk()	--�����������
	if (FALSE(tongwar_check_ownerright(1))) then
		CreateTaskSay({"<dec><npc>ֻ��ռ�ǰ��������콱", "��֪����!/OnCancel"});
		return
	end;
	
	local tongname = GetTongName()
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	local leaguename = LG_GetLeagueInfo(n_lid)
	
	local nRank = LG_GetLeagueTask(TONGWAR_LGTYPE, leaguename, TONGWAR_LGTASK_RANK);
	if (nRank > 7 or nRank < 1) then
		print("rank wrong")
		return
	end;
	
	local szDescribe = "";
	local arr_Remain = {};
	local isFinished = 1;
	for i = 1, getn(TAB_AWORD_GOOD) do
		arr_Remain[i] = TAB_AWORD_GOOD[i][2][nRank] - LG_GetLeagueTask(TONGWAR_LGTYPE, leaguename, LG_TASK_AWORD[i]);
		if (arr_Remain[i] > 0) then 
			szDescribe = format("%s<enter>%s: <color=yellow>%d<color>",
						szDescribe, TAB_AWORD_GOOD[i][1].szName,arr_Remain[i])
			isFinished = 0; 
		end;
	end;
	if (isFinished == 1) then
		CreateTaskSay({"<dec><npc>�����꽱��", "�����Ի�/OnCancel"});
		return
	end;
	
	
	local tab_AwordItem = {};
	tab_AwordItem = tongwar_getaworditem(nRank, arr_Remain); --���ɽ�����Ʒ��ѡ��
	if (getn(tab_AwordItem) == 0) then
		--Describe(WULINMENG_NPC.."����", 1, "��֪����/OnCancel");
		print("tab_AwordItem wrong!")
		return
	end;
	tinsert(tab_AwordItem, 1, format("<dec><npc>���ֵ�һ�ｱ������%s<enter>. ����֮ǰ��Ҫ<color=red>����װ��<color>, ������ʲô����?",szDescribe))
	CreateTaskSay(tab_AwordItem);
end

--
function tongwar_awordtalk_descript(szDescribe, nRemain, szItemName)
	if (nRemain > 0) then
		szDescribe = szDescribe.."<color=yellow>"..nRemain.."<color>"..szItemName;
	end;
	return szDescribe;
end;

function tongwar_getaworditem(nRank, arr_Remain)	--����ѡ����ѡ��
	local tab_AwordItem = {};
	
	for i = 1,getn(arr_Remain) do
		if (arr_Remain[i] > 0) then
			tinsert(tab_AwordItem, format("��ȡ %s",TAB_AWORD_GOOD[i][1].szName)..format("/#tongwar_aword(%d, %d)",i,nRank));
		end;
	end
	tinsert(tab_AwordItem, "��֪����!/OnCancel");
	return tab_AwordItem;
end;

function tongwar_aword(nItemType, nRank)
	if (GetTaskTemp(PL_TEMPTASK_SECURITY) == 1) then--��ֹˢ
		return
	end;
	SetTaskTemp(PL_TEMPTASK_SECURITY, 1);
	
	if (FALSE(tongwar_check_ownerright())) then
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0)
		CreateTaskSay({"<dec><npc>ֻ��ռ�ǰ��������콱!", "��֪����!/OnCancel"});
		return
	end;
	
	if (nRank < 1 or nRank > 7) then --�������
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0)
		return
	end;
	
	local tongname = GetTongName()
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	local leaguename = LG_GetLeagueInfo(n_lid)
	local nTotal = TAB_AWORD_GOOD[nItemType][2][nRank];
	local nAwordedCount = LG_GetLeagueTask(TONGWAR_LGTYPE, leaguename, LG_TASK_AWORD[nItemType]); --�Ѿ�����������
	local nRemainCount = nTotal - nAwordedCount;

	local nFreeItemCount = CalcFreeItemCellCount();--������϶���
	local nMaxAwordCount = 60;
	if (nItemType == 2 or nItemType == 3) then
		nMaxAwordCount = 10;
	end;
	local nGiveCount = nRemainCount;
	if (nRemainCount > nMaxAwordCount) then
		nGiveCount = nMaxAwordCount;
	end;
	
	if (nFreeItemCount < nGiveCount and nFreeItemCount < nRemainCount) then
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0);
		CreateTaskSay({"<dec><npc>װ�������λ!", "��֪����!/OnCancel"});
		return
	end;

	local nResult = LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, leaguename, LG_TASK_AWORD[nItemType], nGiveCount, "", "");
	local str = "";
	if (nResult == 1) then
		str = format("�� %s - ����%s ��ȡ%d %s",tongname,GetName(),nGiveCount,TAB_AWORD_GOOD[nItemType][1].szName);
		tongwar_award_log(str);
		Msg2Player(str);
		
		local nItemID;
		local nowdate = tonumber(GetLocalDate("%y%m%d"))
		tbAwardTemplet:GiveAwardByList(TAB_AWORD_GOOD[nItemType][1],"TongWar_Award",nGiveCount);
--		for i = 1, nGiveCount do
--			nItemID = AddItem(TAB_AWORD_GOOD[nItemType][1][1], TAB_AWORD_GOOD[nItemType][1][2], TAB_AWORD_GOOD[nItemType][1][3], 0, 0, 0, 0);
--			if (nItemType == 1) then
--				SetSpecItemParam(nItemID, 1, nowdate)
--				SyncItem(nItemID)
--			elseif (nItemType == 3) then
--				local nExp = 20e8;
--				SetSpecItemParam(nItemID, 1, mod(nExp, 1e8))
--				SetSpecItemParam(nItemID, 2, nExp / 1e8)
--				SyncItem(nItemID)
--			end;
--			
--		end;
		Msg2Player(format(" ��%d %s",(nRemainCount - nGiveCount),TAB_AWORD_GOOD[nItemType][1].szName));
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0);
		return
	end;
	CreateTaskSay({"<dec><npc>�콱ʧ�ܣ�������һ��!", "��֪����!/OnCancel"});
	tongwar_award_log(str.."���ɹ���������!")
	SetTaskTemp(PL_TEMPTASK_SECURITY, 0);
end;

--д�뽱����־
function tongwar_award_log(str)
	WriteLog("[TONGWAR_AWARD]"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..str)
end

--���ص�ǰ�����׶Σ�1-������2-������3-����
function tongwar_checkinphase()
	local nphase = gb_GetTask("TONGWAR_STATION", 2);
	return nphase;
end

--���ص�ǰ����ID
function get_tongwar_season()
	local nseason = gb_GetTask("TONGWAR_STATION", 3);
	return nseason;
end;

--�����һ�������˻���
function tongwar_clear_rlpoint()
	local nmyseason = GetByte(GetTask(TONGWAR_RLTASK_AWARD), 4);
	local ncurseaon = get_tongwar_season();
	if (nmyseason ~= ncurseaon) then
		SetTask(TONGWAR_RLTASK_AWARD, SetByte(GetTask(TONGWAR_RLTASK_AWARD), 4, ncurseaon));
		SetTask(TONGWAR_RLTASK_TOTALPOINT, 0);
	end;
end;
