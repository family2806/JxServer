Include("\\script\\event\\wulin_final_match\\ticketinfo.lua")
Include("\\script\\event\\wulin_final_match\\query.lua")
IncludeLib("LEAGUE")

function wl_OnCreateLeague(leaguename, membername, result)
	if (result == 0) then
		Say("�Բ��𣬳���ս��С��ʧ�ܣ����ٲ���һ��!",0)
	else
		Say("��ϲ������ս��С��ɹ�!",0)
	end
end

function wl_createfactionleague()
	if (GetLastFactionNumber() == 0) then
		Say("�Բ���ѡ��û�����ɣ����ܲμӱ���.",0)
		return 
	end
	wl_createleague(GetLastFactionNumber())
end

function wl_createleague(matchtype)
	local zoneid = wl_zonename2zoneid(GetTong())
	if (zoneid == 0) then
		Say("�Բ������Ǳ�����ѡ�ֲ��ܱ����μӱ���!",0)
		return
	end
	local szParam = GetName().." "..matchtype.." "..GetTong().." "..(GetLastFactionNumber()+1)
	LG_ApplyDoScript(matchtype, "", GetName(), "\\script\\wulin_relay_createleague.lua", "main", szParam , "\\script\\event\\wulin_final_match\\createleague.lua", "wl_OnCreateLeague")
end


function wl_sureaddmember(matchtype)
	local leadertong = GetTong()
	local zoneid = wl_zonename2zoneid(leadertong)
	if (zoneid == 0) then
		Say("�Բ������Ǳ�����ѡ�ֲ��ܱ����μӱ���!",0)
		return
	end
	local lid = LG_GetLeagueObjByRole(matchtype + 10, GetName() )
	if (FALSE(lid)) then
		return
	end
	leaguename, time, count = LG_GetLeagueInfo(lid)
	print(count .. "   "..TAB_TICKETINFO[matchtype][4])
	if (count >= TAB_TICKETINFO[matchtype][4]) then
		Say("�Բ��������ڵ����ѹ��������ټ���!",0)
		return
	end
	
	OldPlayer= PlayerIndex
	for i= 2 , GetTeamSize() do 
		 PlayerIndex = GetTeamMember(i) 
		 local membertong = GetTong()
		 if (leadertong ~= membertong) then
		 	local membername = GetName()
		 	PlayerIndex = OldPlayer
		 	Say("�Բ��𣬳�Ա��"..membername.." ����ͬ�����Բ��ܼ���ӡ�����ʧ��!", 0)
		 	return
		end
	end
	
	for i= 2 , GetTeamSize() do 
		 PlayerIndex = GetTeamMember(i) 
		 local szParam = GetName().." "..matchtype.." "..GetTong().." "..GetLastFactionNumber().." "..leaguename
  	 	LG_ApplyDoScript(matchtype, "", GetName(), "\\script\\wulin_relay_createleague.lua", "wl_relay_addmembermain", szParam, "\\script\\event\\wulin_final_match\\createleague.lua", "wl_OnCreateLeague")
	end
	
	PlayerIndex = OldPlayer
end

function wl_league_addmember()
	if (IsCaptain() ~= 1) then
		Say("�Բ������Ƕӳ����������Ա����ս��.",0)
		return
	end
	
	local bDouble = 0
	local lid = 0;
--	if (GetTask(TK_WL_ISDOUBLELEADER) > 0 ) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[11][7], GetName())
		if (lid > 0) then
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bDouble = 1
					else
						bDouble = 0
						break
					end
				end
			end	
		end	
--	end
	
	local bFive = 0;
--	if (GetTask(TK_WL_ISFIVELEADER) > 0) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[12][7], GetName())
		print("find find five")
		if (lid > 0) then
			print("five")
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bFive = 1
						print("job1")
					else
						bFive = 0
						print("job0")
						break
					end
				end
			end
		end
--	end
	
	local bTen = 0;
--	if (GetTask(TK_WL_ISTENLEADER) > 0) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[13][7], GetName())
		if (lid > 0) then
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bTen = 1
					else
						bTen = 0
						break
					end
				end
			end
		end
--	end
	
	local bSixTeen = 0;
--	if (GetTask(TK_WL_ISSIXTEEN) > 0) then
		lid = LG_GetLeagueObjByRole(TAB_TICKETINFO[14][7], GetName())
		if (lid > 0) then
			for m = 1, LG_GetMemberCount(lid) do 
				name, job = LG_GetMemberInfo(lid , m - 1)--?
				if (name == GetName() ) then
					if (job == 1) then
						bSixTeen = 1
					else
						bSixTeen = 0
						break
					end
				end
			end
		end
--	end
	
	if (bDouble == 0 and bFive == 0 and bTen == 0 and bSixTeen == 0) then
		Say("�Բ�����δ�����κ�ս�ӣ���������������Ҽ���", 0)
		return 
	end
	
	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say("���Ķ�û�г�Ա��������˭�μ���?",0)
		return
	end

	
	local str = "����"..(GetTeamSize()-1).." �����ҵı���������?";
	OldPlayer= PlayerIndex
	for i= 2 , GetTeamSize() do 
		 PlayerIndex = GetTeamMember(i)
		 str = str .."<color=yellow> "..GetName();
	end
	PlayerIndex = OldPlayer
	local tableague = {};
	local ncurcount = 1;
	if (bDouble > 0) then
		tableague[ncurcount] = "ͬ�⣬��μ�˫��./#wl_sureaddmember(11)"
		ncurcount = ncurcount + 1
	end
	if (bFive > 0) then
		tableague[ncurcount] = "ͬ�⣬��μ����ж�./#wl_sureaddmember(12)"
		ncurcount = ncurcount + 1
	end
	if (bTen > 0) then
		tableague[ncurcount] = "ͬ�⣬��μ�ʮȫ��./#wl_sureaddmember(13)"
		ncurcount = ncurcount + 1
	end
	if (bSixTeen > 0) then
		tableague[ncurcount] = "ͬ�⣬��μ�ʮ����./#wl_sureaddmember(14)"
		ncurcount = ncurcount + 1
	end
		
		tableague[ncurcount] = "����Ҫ!/OnCancle";
	 
	
	Say(str, getn(tableague), tableague)

end