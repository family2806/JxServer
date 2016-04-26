--����������Ա

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )
Include("\\script\\lib\\log.lua")


--���Ի���
function main()
	local n_level = wlls_getcityinfo()
	if (not wlls_CheckIsOpen(n_level)) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (not FALSE(n_lid)) then
		--��鲢��ʾ�Ҵ��Ա�����
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mylevel = WLLS_TAB[n_mytype].match_type[n_mtype].level
		if (n_mylevel ~= n_level) then
			wlls_descript("<enter>  �����Ѽ���<color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> ���� <color=red>"..WLLS_LEVEL_DESC[n_level].."<color>,�ǲ����Ҵ�����?", wlls_add_option({}, "û����"))
			return
		end
		
		--�ж��Ƿ�Խ��
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"�����뿪С��!/wlls_want2leaveleague",
				"���뿴������û�н���/wlls_wantaward",
				"���Ժ����/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "���뵽"..str_des.."����/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = " "..str_des.."С��/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "������ȡ��������/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "����������ֵ/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "�ر�/ ����ȡ����/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "��ֻ��·��"))
end

--��ȡ�������Ի���
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter>####�����ǲμ��������������������������������콱����Ʒ����<color=red>������<color> ��<color=red>����ֵ<color>. ÿ���׶ε����������󣬽�����<color=red>����, ȡʤ����, ������ʱ��<color> ������. <color=red>"..n_awardmin.."������߶�<color> �����<color=red>�ر���<color>.��������������п���������ֵ��ȡ����������������ʲô����"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "������������!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "������ƺŽ���!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "���뻻��������/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "��������������/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "��ֻ��·��/OnCancel"
	wlls_descript(str, tb_option)
end

--��ȡ�����������Ի���
function wlls_wantaward_rank()
	--�����������	
	local nAward, nLevel, szLGName, nRank = wlls_checkaward_rank()
	if nAward then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[nLevel][nAward]
		local str = "<enter>  ���ս��:<color=yellow>"..szLGName.."<color>������ʱ"..str_des.."����<color=yellow>"..nRank.."<color>. ����Ի������ֵ"..tb_award[2].."��."
		if (tb_award[3]) then	--�жӳ����⽱��
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.."�ӳ�(ʦ��)��ȡ����ֵ"..tb_award[3].."��."
			end
		end
		str = str.."��������"
		wlls_descript(str,
			"�����콱��!/wlls_getaward_rank",
			"���Ժ����!/OnCancel")
		return
	end
end

--����Ƿ������ȡ�������������ؿ���������ͣ�nilΪ������
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--�պ��ڿ�������ʱ��Ҫ�콱
		if (not b_silent) then
			Msg2Player("Ŀǰ�����ѽ����µ��������������ϴ�������������.")
		end
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local str_des = wlls_get_desc(1)
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_awardmin = wlls_get_award_min()
	local n_rank = 0
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > n_awardmin) then
		if (not b_silent) then
			wlls_descript("<enter>  �˴�"..str_des.." <color=red>"..n_awardmin.."<color> Ŀǰ�Ѿ�������������µ�ս��û��������!"..n_awardmin.."�� ���Ұ�����һ��")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>��Ҫ��Ϊ��������С���������ð�콱��������������!")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> �������콱�ˣ���ƭ����?")
		end
		return nil
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_award = WLLS_TAB[n_type].award_rank[n_level]
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award, n_level, str_lgname, n_rank
end

--��ȡ�ƺŽ���
function wlls_wantaward_title()
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then
		Msg2Player("�ѽ����µ������������콱��!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().."����ֻ�͸�"..wlls_get_desc(1).."�����ɫ(����ǰ��) . �㲻���Ǹ���ģ���Ҫ���Ҹ�!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter>  ��Ҫ��Ϊ��������С���������ð�콱��������������!")
		return nil
	end
	local n_title = WLLS_AWARD_TITLE[n_level] + n_rank - 1
	
	
	if (n_level == 2) then
		if WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)] then
			n_title = WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)][n_rank]
		end
	end
	
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	
	local nTime	= nMon * 1000000 + nDay * 10000	-- �������½���������
	_M("Title_AddTitle", n_title, nTime)
	
	--Remove�����������⣬��add�µĺ���֮ǰ- Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
		
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	
	
	SetTask(1122, n_title)	--��ǰ�����ȡ�����ĸ�ͷ��ID
	local tb = {"�ھ�", "�Ǿ�", "������", "������"}
	Msg2Player("�������óƺ�<color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color>! �óƺſ���ά�� <color=yellow>20<color> ��.")
end

--������ȡ���н���
function wlls_getaward_rank()
	local n_award, n_level, str_lgname, nRank = wlls_checkaward_rank();
	if (n_award) then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[n_level][n_award]
		local n_got = GetGlbValue(GLB_WLLS_SID)
		n_got = SetByte(n_got, 4, n_type)
		n_got = SetByte(n_got, 3, n_level)
		n_got = SetByte(n_got, 2, n_award)
		SetTask(WLLS_TASKID_GOTAWARD, n_got)
		local nPoint	= tb_award[2]
		Msg2Player("��ϲ��ﵽ"..str_des.."������: ����ֵ"..tb_award[2].."��")
		wlls_award_log(format("��������� %s: ����ֵ%d ��",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--�жӳ����⽱��
			--���ж�ֻ�Զӳ�����ת�Ƶ������ʦͽ������ȫ
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("��ϲ��ﵽ"..str_des.."������ (�ӳ�): ����ֵ"..tb_award[3].."��")
				wlls_award_log(format("��������� %s (�ӳ�): ����ֵ %d ��",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("�ܹ��� %d ����ֵ", GetTask(WLLS_TASKID_HONOUR)))
		
		if (nRank == 1) then -- ��õ�һ�� �������а� ����ֵ��1
		    local nCurPoint = GetTask(2601);
		    nCurPoint = nCurPoint + 1;
		    SetTask(2601, nCurPoint);
		end

		SyncTaskValue(WLLS_TASKID_HONOUR)
	end
end

--����Ƿ���Խ���ս��
function wlls_cancreate(n_level)
	local n_mylevel = wlls_player_level()
	--�ȼ�����
	if (n_mylevel ~= n_level) then
		if (n_level == 1) then
			if (n_mylevel < n_level) then
				wlls_descript("<enter>  <color=red>������������<color>��Ȼ��ѡ�������ɵ�������ܣ����ǣ���ĵȼ�����!"..WLLS_LEVEL_JUNIOR.."�������ղ�����ֻ�µ������ۣ�����Ū�ˣ�����Ҫ������ϰ!")
			else
				wlls_descript("<enter> �������Ƕ��������Ľ�������, <color=red>������������<color> ����ѡ��������Ϊ���˲ţ�����Ҫ�ں�����ǰˣ������Ҫ����μ� <color=red>��������<color> ��!")
			end
		else
			wlls_descript("<enter>  <color=red>��������<color>��Ȼ������Ӣ������֮������ĵȼ�����!"..WLLS_LEVEL_SENIOR.."��������Ӣ�۾ۼ����Ի�������������ֻ�Ǻ󱲣�����Ƕ���ϰ!")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter>  ���������ˣ����ܳ�����������!")
		return nil
	end
	return wlls_player_type()
end

--�ҵ�ս��
function wlls_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local n_type

	if (FALSE(n_lid)) then
		n_type = GetGlbValue(GLB_WLLS_NEXT)
	else
		n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)		
	end
	
	WLLS_TAB[n_type].npc_mylg()
end

function wlls_want2create()
	local n_level = wlls_getcityinfo()
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	if (not wlls_cancreate(n_level)) then return end
	wlls_descript("<enter>"..WLLS_TAB[n_next].text_creat,
		"���뽨��С��!/wlls_inputstr_lgname",
		"���ٿ���/OnCancel")
end

--����ս����
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "�����������С������")
end

--����ս�ӣ����գ�
function wlls_createleague(str_lgname)
	if (not str_lgname) then
		str_lgname = GetName()
	end
	local n_level = wlls_getcityinfo()
	local n_mtype = wlls_cancreate(n_level)
	if (not n_mtype) then return end
	str_lgname = strsub(str_lgname,1,16)
	local forbidstr={" ","\"","/","#","|","\t","\n"}
	local str
	for i = 1, getn(forbidstr) do
		if (not FALSE(strfind(str_lgname,forbidstr[i]))) then
			str = "�Բ���! ���С��û�и���:"
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [����]"
				elseif (forbidstr[i]=="\t") then
					str = str .. "[TAB]"
				elseif (forbidstr[i]=="\n") then
					str = str .. " [Enter]"
				else
					str = str .. forbidstr[i]
				end
			end
			break
		end
	end
	if (not str) then
		if (not FALSE(LG_GetLeagueObj(WLLS_LGTYPE, str_lgname))) then
			str = "�Բ���! ������������������ʹ��."
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "�Բ���! ���С���ɵ��ֲ���."
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "�����ˣ��ҽ���������!/wlls_inputstr_lgname", "����Ҫ!/OnCancel")
		return
	end
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local szParam = GetName().." "..n_next.." "..n_mtype.." "..str_lgname
	LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, GetName(), "\\script\\leaguematch\\league.lua", "wlls_create", szParam , "", "")
	
	
	SetRespect(0)
end


--��ӳ�Ա���Ի���
function wlls_want2addmember()
	local teammember, _, str_lgname = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local str = wlls_npcname().."�����������"..getn(teammember).."�������С�� ["..str_lgname.."] ����?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "�ԣ��Ǽ�����(��) ��������/wlls_sure2addmember","����Ҫ!/OnCancel")
end

--��ӳ�Ա�����գ�
function wlls_sure2addmember()
	local teammember = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local str_lgname = LG_GetLeagueInfo(n_lid)
	for i = 1, getn(teammember) do
		local nPlayerIndex = SearchPlayer(teammember[i])
		if nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, SetRespect, 0)
			local szParam = teammember[i].." "..str_lgname.." "..GetName()
			LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, teammember[i], "\\script\\leaguematch\\league.lua", "wlls_add", szParam , "", "")
		end	
	end
end

--�����Ӷ�Ա�Ƿ���Ա���ӵ���ǰ�����У��ɹ�������Ӷ�Ա������ս�����͡�ս���������򷵻�nil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().."�Բ���! ����Ҫ�� <color=red> �ӳ�<color> ��<color=red>С��<color>, ���ܵǼǼ���ս�Ӷ�Ա.",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().."���С�����û��������ĳ�Ա��������˭�����Լ�������?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."�Բ���! ��û�н���С�飬�����������˽���С��!", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().."�Բ���! �㲻�Ƕӳ������ܸ������˽���С��!", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().."�Բ���! �´��������Ͳ���, ���ս��Ŀǰ�ѵ��ڣ����ܼ���ʹ��.", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().."�Բ���! ���ս��["..str_lgname.."]���ѹ����ˣ������ټ����Ա��!",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().."�Բ���! ���ս��["..str_lgname.."]ֻ��Ҫ��������"..n_mcount.." �ˣ����������ȫ����Ա���룬�������µĳ�Ա��ʱ�뿪С��!",0)
		return nil
	end

	local teammember = {}
	local str_capname = GetName()
	local n_capidx = PlayerIndex
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i)
		local membername = GetName()
		--�����ظ������Ա
		if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, membername))) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname().."�Բ���! ��С��Ķ�Ա:"..membername.." ��������ս�ӳ�Ա�����ԣ����ܽ������ս��!", 0)
		 	return nil
		end
		--�����Ա������
		local str = wlls_check_addmem(n_capidx, n_lid, n_mtype)
		if (str) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname()..str, 0)
		 	return nil
		end
		teammember[i-1] = membername
	end
	PlayerIndex = n_capidx
	return teammember, n_mtype, str_lgname
end

--�뿪ս�ӣ��Ի���
function wlls_want2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB)
	local str = wlls_npcname().."�����뿪ս��["..str_lgname.."]ph�i kh�ng?"
	if(n_memcount <= 1) then
		str = str .. "�������� <color=red>Ψһ�ĳ�Ա<color>�����ս��. ������뿪ս�ӣ�ս�ӽ�����ɢ."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--ʦͽ��
			str = str .. "Ŀǰ���� <color=red>�ӳ� (ʦ��)<color> ������뿪ս�ӣ����ͽ�ܽ�<color=red>���ܲμ�����<color>."
		else	--��������
			str = str .. "Ŀǰ���� <color=red>�ӳ�<color>, ������뿪С��, �ӳ�ְ��ת����������Ա."
		end
	end
	Say(str, 2, "��!/wlls_sure2leaveleague","����Ҫ!/OnCancel")
end

--�뿪ս�ӣ�ȷ�϶Ի���
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().."�����뿪С��󣬽�<color=yellow>������ȡս�ӽ���<color>, ��ȷ�����뿪��?", 2, "��!/wlls_leaveleague_final","����Ҫ!/OnCancel")
end

--�뿪ս�ӣ����գ�
function wlls_leaveleague_final()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	LG_ApplyDoScript(WLLS_LGTYPE, "", GetName(), "\\script\\leaguematch\\league.lua", "wlls_leave", GetName() , "", "")
end

--����᳡���Ի���
function wlls_want2signmap()
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	
	if (n_matchphase < 2) then
		Say(wlls_npcname().."Ŀǰ����������ʱ�䣬�᳡����ʱ�رգ���ȵ�����ʱ������!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("��û��"..str_des.."ս�ӣ�����μ�������ϵͳ��Ϊ�㽨��һ��ս�ӣ����뽨��һ��ս����?", "���뽨��ս��!/#wlls_createleague()", "�Ҳ�������!/OnCancel")
		else
			wlls_descript("<enter>  �˴�"..str_des.." ������ս�ӱ������ǲ���Ū���ˣ����������涨���ϸ��������Ҳ���С�����ȷ��һ�£�Ȼ��������!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--��¼�볡�ص�
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--���͵��������ͼ
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("���ѵ�<color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color>��������")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--����Ƿ�����뿪ս�ӡ����Է���n_lid�����򷵻�nil,ԭ���ַ���
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "����Ȼû�н���ս��!"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "�������ս�������������㲻���뿪ս�ӣ���ȵ�����������!"
	end
	
	if(n_phase > 3) then
		return nil, "���������������뿪ս�ӣ������һ����Ϣʱ������뿪."
	end
	
	return n_lid
end

--ȡ�õ�ǰ������������������Ҫ������
function wlls_get_award_min()
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_level = wlls_getcityinfo()
	local tb = WLLS_TAB[n_type].award_rank[n_level]
	return tb[getn(tb)][1]
end

--������ȡ����
function wlls_show_expswitch()
	local b_exps = GetBit(GetTask(WLLS_TASKID_SWITCH), 1)
	local str = "<enter>   �˴��������������ܷḻ�����������ʹ�þ���ֵ����������򿪾���ֵ���������ס�Լ��ľ���ֵ����.<enter>"
	str = str.."<enter>   Ŀǰ��Ĺر�/��״̬Ϊ"..iif(b_exps == 0, "<color=red>�� color> (������ȡ����ֵ) ", "<color=red>��ر�<color> (������ȡ����ֵ) ")..""
	wlls_descript(str, iif(b_exps == 0, "����رս���/#wlls_set_expswitch(1)", "����򿪽���/#wlls_set_expswitch(0)"), "�õģ��ҽ�������!/OnCancel")
end

--���þ�����ȡ����
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "�ɹ�"..iif(b_exps == 0, "��", "�ر�").."�������齱��!")
end

--��������ȡ��Ʒ
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end

	Msg2Player("Ŀǰ����<color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> ����ֵ")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- �̵���������ֱ��Ϊ11
	else
		Say(wlls_npcname().."���������������! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "Ŀǰ�����е�����ֵΪ <color=yellow>"..GetRespect().."<color>")
end

--��������ȡ��Ʒ
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	--�������̵�ȡ�������ߵ�����- Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "Ŀǰ��������������")
--		return 
--	end
	
	
	Msg2Player("Ŀǰ����������ֵΪ��<color=yellow>"..GetRespect().."<color>")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- �̵���������ֱ��Ϊ11
	else
		Say(wlls_npcname().."���������������! ", 0)
	end
end