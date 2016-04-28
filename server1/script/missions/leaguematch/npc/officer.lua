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
			wlls_descript("<enter> c�c h� �� gia nh�p <color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> �i�m vinh d� ta l� <color=red>"..WLLS_LEVEL_DESC[n_level].."<color> �i�m vinh d�, c� ph�i hay kh�ng t�m l�n ng��i ?", wlls_add_option({}, "Kh�ng c� chuy�n g� "))
			return
		end
		
		--�ж��Ƿ�Խ��
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"Ta mu�n r�i kh�i ��i!/wlls_want2leaveleague",
				"Ta mu�n l�nh th��ng/wlls_wantaward",
				"Ta ch� ti�n gh� qua/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "Ta mu�n ��n "..str_des.." h�i tr��ng/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = " "..str_des.." nh�m/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "Ta mu�n l�nh ph�n th��ng li�n ��u/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "Ki�m tra �i�m vinh d�/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "T�t m� nh�n kinh nghi�m/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "Ta ch� ti�n gh� qua"))
end

--��ȡ�������Ի���
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter> Gi�i th��ng li�n ��u bao g�m �i�m <color=red>x�p h�ng<color> �i�m vinh d� v� �i�m <color=red>vinh d�<color> �i�m vinh d�. Sau khi k�t th�c giai �o�n li�n ��u <color=red> d�a v�o s� tr�n chi�n th�ng<color> �i�m vinh d� �� x�p th� h�ng. <color=red>"..n_awardmin.." ��i x�p h�ng cao nh�t<color> �i�m vinh d� s� nh�n ���c <color=red>ph�n th��ng ��c bi�t<color> �i�m vinh d�.C� th� d�ng �i�m vinh d� �� mua v�t ph�m!"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "Ta mu�n nh�n ph�n th��ng x�p h�ng!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "Ta mu�n nh�n ph�n th��ng danh hi�u!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "Ta mu�n ��i �i�m vinh d�/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "Ta mu�n ��i �i�m uy t�n/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "Ta ch� ti�n gh� qua/OnCancel"
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
		local str = "<enter>  Chi�n ��i: <color=yellow>"..szLGName.."<color> �i�m vinh d� trong "..str_des.." x�p h�ng <color=yellow>"..nRank.."<color> �i�m vinh d�. Nh�n ���c "..tb_award[2].." �i�m danh v�ng."
		if (tb_award[3]) then	--�жӳ����⽱��
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.." ��i tr��ng nh�n ���c "..tb_award[3].." �i�m danh v�ng."
			end
		end
		str = str.." c� mu�n l�nh kh�ng ?"
		wlls_descript(str,
			"L�nh th��ng!/wlls_getaward_rank",
			"Tr� v�!/OnCancel")
		return
	end
end

--����Ƿ������ȡ�������������ؿ���������ͣ�nilΪ������
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--�պ��ڿ�������ʱ��Ҫ�콱
		if (not b_silent) then
			Msg2Player("Tr��c m�t li�n cu�c so t�i �� ti�n h�nh m�i li�n cu�c so t�i , kh�ng th� d�n l�n tr��c li�n cu�c so t�i ��ng h�ng t��ng th��ng .")
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
			wlls_descript("<enter> l�n n�y "..str_des.." <color=red>"..n_awardmin.."<color> �i�m vinh d� tr��c m�t �� ��ng h�ng , gi�ng nh� c�c h� ��ch chi�n ��i kh�ng c� � b�n trong !"..n_awardmin.." �� cho ta gi�p ng��i ki�m tra m�t c�i ")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> ��ng t��ng r�ng gia nh�p nh�ng kh�c ti�u t� l� c� th� t�i gi� m�o d�n t��ng . h� k� ng��i tr� l�i �i !")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> c�c h� �� d�n t��ng li�u , mu�n g�t ta sao ?")
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
		Msg2Player("�� ti�n h�nh li�n ��u, kh�ng th� nh�n th��ng!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().." gi�i th��ng ch� gi�nh cho "..wlls_get_desc(1).." xu�t s�c nh�t(4 ��i h�ng ��u) . Ng��i kh�ng thu�c trong nh�m ��, ��ng ph� r�i!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter> ��ng t��ng r�ng gia nh�p t� ��i l� c� th� gi� m�o t�i nh�n th��ng. Ng��i tr� l�i �i !")
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
	local tb = {"V� ��ch ", " � qu�n ", "H�ng Ba", "H�ng T�"}
	Msg2Player("C�c h� ng��i ��t ���c danh hi�u <color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color> �i�m vinh d�! n�n danh hi�u c� th� duy tr� <color=yellow>20<color> �i�m vinh d� ng�y .")
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
		Msg2Player("Ch�c m�ng, b�n ��t ���c "..str_des.." danh hi�u: Gi� tr� vinh d� "..tb_award[2].." �i�m")
		wlls_award_log(format("��������� %s: ����ֵ%d  �i�m",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--�жӳ����⽱��
			--���ж�ֻ�Զӳ�����ת�Ƶ������ʦͽ������ȫ
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("Ch�c m�ng, b�n ��t ���c "..str_des.."danh hi�u, gi�i th��ng(��i tr��ng): Gi� tr� vinh d� "..tb_award[3].." �i�m")
				wlls_award_log(format("��������� %s (�ӳ�): ����ֵ %d  �i�m",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("T�ng c�ng c� %d danh v�ng  ", GetTask(WLLS_TASKID_HONOUR)))
		
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
				wlls_descript("<enter>  <color=red>V� l�m li�n ��u<color> �i�m vinh d� h�i t� t�t c� c�c anh h�ng, nh�ng c�p �� c�a b�n kh�ng ��! Ph�i ��t level "..WLLS_LEVEL_JUNIOR.." tr� l�n th� m�i c� th� tham gia!")
			else
				wlls_descript("<enter> c�c h� �� l� ��nh ��nh n�i danh giang h� ��i hi�p , <color=red> v� l�m t�n t� li�n cu�c so t�i <color> �i�m vinh d� l� mu�n ch�n l�a tu�i tr� t�i cao ng��i c�a m�i , ng��i c�n � ph�a sau tr��c m�t ��a b�n uy phong sao ? n�u kh�ng ng��i tham gia <color=red> v� l�m li�n cu�c so t�i <color> �i�m vinh d� �i !")
			end
		else
			wlls_descript("<enter> <color=red> v� l�m li�n cu�c so t�i <color> �i�m vinh d� v�n l� anh h�ng thi�n h� luy�n ki�m ch� , c�p b�c c�a ng��i kh�ng �� !"..WLLS_LEVEL_SENIOR.." c�p , anh h�ng thi�n h� t� t�p , ��m r�ng hang h� , ch� s� ng��i ch�ng qua l� h�u b�i , t�t nh�t l� luy�n nhi�u t�p !")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter> c�c h� v�o ��i r�i , kh�ng th� th�nh l�p ��i kh�c!")
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
		"Ta mu�n l�p ��i!/wlls_inputstr_lgname",
		"Suy ngh� l�i/OnCancel")
end

--����ս����
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "Nh�p v�o t�n nh�m")
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
			str = "Xin l�i! T�n kh�ng ���c c� k� t�: "
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [ ch�p h�nh ]"
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
			str = "Xin l�i! T�n nh�m �� ���c s� d�ng"
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "Xin l�i! T�n nh�m c� k� t� kh�ng ��ng"
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "Nh�p l�i!/wlls_inputstr_lgname", "Kh�ng c�n!/OnCancel")
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

	local str = wlls_npcname().." ng��i ngh� ng��i ph�a d��i "..getn(teammember).." gia nh�p t� ��i ["..str_lgname.."] ph�i kh�ng ?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "Cho gia nh�p /wlls_sure2addmember","Kh�ng c�n!/OnCancel")
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

--�����Ӷ�Ա�Ƿ���Ա���ӵ���ǰ�����У�Th�nh c�ng ������Ӷ�Ա������ս�����͡�ս���������򷵻�nil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().." th�t xin l�i ! ng��i c�n l� <color=red> ��i tr��ng <color> �i�m vinh d� � <color=red> ti�u t� <color> �i�m vinh d�, m�i c� th� ghi danh gia nh�p chi�n ��i ��i vi�n .",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().." ng��i ti�u t� gi�ng nh� kh�ng c� nh�ng kh�c t� th�nh vi�n , ng��i mu�n cho ng��i n�o ti�n v�o m�nh t� sao ?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().." th�t xin l�i ! ng��i kh�ng c� th�nh l�p ti�u t� , kh�ng th� �� cho nh�ng ng��i kh�c ti�n v�o ti�u t� !", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().." th�t xin l�i ! ng��i kh�ng ph�i l� ��i tr��ng , kh�ng th� cho nh�ng ng��i kh�c ti�n v�o ti�u t� !", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().." th�t xin l�i ! l�n sau li�n cu�c so t�i lo�i h�nh kh�ng thay ��i , ng��i chi�n ��i tr��c m�t �� ��n k� , kh�ng th� ti�p t�c s� d�ng .", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().." th�t xin l�i ! ng��i chi�n ��i ["..str_lgname.."] �� �� ng��i , kh�ng th� l�i th�m v�o th�nh vi�n !",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().." th�t xin l�i ! ng��i chi�n ��i ["..str_lgname.."] ch� c�n l�n n�a ��a v�o "..n_mcount.." ng��i , kh�ng th� �� cho t�t c� c�a ng��i th�nh vi�n gia nh�p , xin cho c�n s�t l�i th�nh vi�n t�m th�i r�i �i ti�u t� !",0)
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
		 	Say(wlls_npcname().." th�t xin l�i ! � ti�u t� ��i vi�n :"..membername.." �� l� nh�ng chi�n ��i kh�c th�nh vi�n , cho n�n , kh�ng th� v�o ng��i chi�n ��i !", 0)
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
	local str = wlls_npcname().." ng��i ngh� r�i �i chi�n ��i ["..str_lgname.."] ph�i kh�ng?"
	if(n_memcount <= 1) then
		str = str .. " ng��i b�y gi� l� <color=red> duy nh�t th�nh vi�n <color> �i�m vinh d� � ng��i chi�n ��i . n�u nh� ng��i r�i �i chi�n ��i , chi�n ��i �em b� gi�i t�n ."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--ʦͽ��
			str = str .. " tr��c m�t ng��i l� <color=red> ��i tr��ng ( s� ph� )<color> �i�m vinh d� n�u nh� ng��i r�i �i chi�n ��i , �� �� c�a ng��i �em <color=red> kh�ng th� tham gia li�n cu�c so t�i <color> �i�m vinh d�."
		else	--��������
			str = str .. " tr��c m�t ng��i l� <color=red> ��i tr��ng <color> �i�m vinh d�, n�u nh� ng��i r�i �i ti�u t� , ��i tr��ng ch�c v� �em chuy�n giao cho th�nh vi�n kh�c ."
		end
	end
	Say(str, 2, "��i v�i !/wlls_sure2leaveleague","Kh�ng c�n!/OnCancel")
end

--�뿪ս�ӣ�ȷ�϶Ի���
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().." khi ng��i r�i �i ti�u t� sau , �em <color=yellow> kh�ng th� nh�n l�y chi�n ��i t��ng th��ng <color> �i�m vinh d�, ng��i x�c ��nh mu�n r�i �i sao ?", 2, "��i v�i !/wlls_leaveleague_final","Kh�ng c�n!/OnCancel")
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
		Say(wlls_npcname()..": li�n ��u �ang trong giai �o�n ngh� ng�i, h�i tr��ng li�n ��u t�m th�i ��ng!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("B�n ch�a c� "..str_des.." nh�m, n�u tham gia v�o li�n ��u, ch�ng t�i s� t�o cho b�n m�t nh�m", "Ta mu�n t�o nh�m!/#wlls_createleague()", "Kh�ng c�n!/OnCancel")
		else
			wlls_descript("<enter> l�n n�y "..str_des.." nh�m, ph�i c� chi�n ��i m�i c� th� v�o h�i tr��ng!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--��¼�볡�� �i�m
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--���͵����� �i�m��ͼ
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("B�n ��n <color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color> �i�m vinh d� khu v�c li�n ��u")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--����Ƿ�����뿪ս�ӡ����Է���n_lid�����򷵻�nil,ԭ���ַ���
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "Ng��i v�n kh�ng c� ti�n v�o chi�n ��i !"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "B�i v� ng��i chi�n ��i �ang li�n cu�c so t�i , ng��i kh�ng th� r�i �i chi�n ��i , xin ��i ��n li�n cu�c so t�i ho�n tr� l�i !"
	end
	
	if(n_phase > 3) then
		return nil, "�ang li�n cu�c so t�i , kh�ng th� r�i �i chi�n ��i , xin ch� ch�t m�t cu�c th�i gian ngh� ng�i m�i c� th� r�i �i ."
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
	local str = "<enter> l�n n�y v� l�m li�n cu�c so t�i t��ng th��ng r�t phong ph� , n�u nh� c�c ng��i mu�n s� d�ng kinh nghi�m tr� gi� s� t�i ta ch� n�y , m� ra kinh nghi�m tr� gi� , ng��i c� th� kh�a l�i m�nh kinh nghi�m tr� gi� t��ng th��ng .<enter>"
	str = str.."<enter> tr��c m�t ng��i t�t / m� ra tr�ng th�i v� "..iif(b_exps == 0, "<color=red> m� ra color> ( c� th� nh�n l�y kinh nghi�m tr� gi� ) ", "<color=red> t�t <color> �i�m vinh d� ( kh�ng th� nh�n l�y kinh nghi�m tr� gi� ) ")..""
	wlls_descript(str, iif(b_exps == 0, "Ta mu�n t�t t��ng th��ng /wlls_set_expswitch(1)", "Ta mu�n m� ra t��ng th��ng /wlls_set_expswitch(0)"), "T�t , ta th�nh l�p t�t l�m !/OnCancel")
end

--���þ�����ȡ����
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "Th�nh c�ng "..iif(b_exps == 0, "M� ra ", "T�t ").." li�n cu�c so t�i kinh nghi�m t��ng th��ng !")
end

--��������ȡ��Ʒ
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end

	Msg2Player("B�n c� <color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> �i�m vinh d� �i�m vinh d�")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- �̵���������ֱ��Ϊ11
	else
		Say(wlls_npcname().."��M� ra ������������! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "�i�m vinh d� c�a b�n hi�n t�i l� <color=yellow>"..GetRespect().."<color> �i�m vinh d�")
end

--��������ȡ��Ʒ
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	--�������̵�ȡ�������ߵ�����- Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "Ŀǰ���ܢ���������")
--		return 
--	end
	
	
	Msg2Player("B�n �ang c� <color=yellow>"..GetRespect().."<color> �i�m vinh d�")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- �̵���������ֱ��Ϊ11
	else
		Say(wlls_npcname().."��M� ra ������������! ", 0)
	end
end