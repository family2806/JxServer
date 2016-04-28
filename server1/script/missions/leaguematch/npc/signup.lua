Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_want2transback()
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("N�u r�i kh�i khu v�c chu�n b�, s� kh�ng th� thi ��u",
			2, "R�i kh�i!/wlls_transback", "Kh�ng c� g�!/OnCancel")
	else
		wlls_transback()
	end
end

--����Ƿ���Խ���׼�������ɹ����أ�n_matchtype,leagueid�������򷵻�nil
function wlls_ready2join()
	local n_mtype, n_group = wlls_get_mapinfo()
	local n_lid = wlls_check_player(GetName(), nil, n_mtype)
	if (FALSE(n_lid)) then
		wlls_transback()
		return nil
	end
	
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	if (n_matchphase < 3) then
		Say("Hi�n t�i ch�a c� li�n ��u !", 2, "R�i kh�i!/wlls_transback", "Kh�ng c�n/OnCancel")
		return nil
	end
	
	local tb_option = wlls_add_option({}, "Kh�ng c�n")
	if (n_matchphase == 3) then	--��Ъʱ��
		--����������һ����
		Say("H�y ngh� ng�i m�t ch�t, tr�n ti�p theo s� b�t ��u sau �t ph�t n�a", getn(tb_option), tb_option)
		return nil
	end
	
	--�ж��Ƿ�Խ��
	local str = wlls_levelcheck(n_lid)
	if (str) then
		Say("Quan vi�n li�n ��u: "..str, 2, "Ta mu�n r�i kh�i ��y!/wlls_want2transback", "Kh�ng c� g�!/OnCancel")
		return nil
	end

	if (n_matchphase == 5) then	--����ʱ��
		local n_combatmap = wlls_get_mapid(3, n_mtype, n_group)
		local n_resttime = WLLS_TIMER_FIGHT_TOTAL - GetGlbValue(GLB_WLLS_TIME)
		n_resttime = ceil(n_resttime*WLLS_TIMER_FIGHT_FREQ/60)
		Say("�ang trong giai �o�n thi ��u, c�n l�i "..n_resttime.." n�a s� k�t th�c", getn(tb_option), tb_option)
		return nil
	end

	if (n_matchphase == 4) then	--׼��ʱ��
		return n_mtype, n_lid
	end
	
	print("n_matchphase error! :"..n_matchphase)
end

function main()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then
		return
	end
	
	local nLevel	= wlls_get_level(n_mtype)
	if (not wlls_CheckIsOpen(nLevel)) then
		return
	end
	
	local tb_option = {"Ta mu�n tham chi�n!/wlls_en1"}
	wlls_add_option(tb_option, "Kh�ng c�n")
	Say("Li�n ��u �ang trong giai �o�n b�o danh, ng��i mu�n tham gia kh�ng ?", getn(tb_option), tb_option)
	
	local _, _, n_count = LG_GetLeagueInfo(n_lid)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_maxmem = WLLS_TAB[n_type].max_member
	if (n_count < n_maxmem) then
		Msg2Player("Ng��i ��i b�y gi� ch� c�n d� <color=yellow>"..n_count.."<color> th�nh vi�n , ng��i chi�n ��i c� th� nhi�u nh�t gia nh�p <color=yellow>"..n_maxmem.."<color> th�nh vi�n .")
	end
end

function wlls_en1()
	Say("V� l�m ngay c� ��u kh�ng th� s� d�ng <color=red> b�t lu�n lo�i n�o PK thu�c men <color>, <color=yellow> c�c lo�i k� n�ng ph� tr� hi�u qu� c�ng �em m�t �i hi�u l�c <color>. b�t ��u tranh t�i sau c� th� <color=yellow> s� d�ng c�c lo�i k� n�ng <color>. � ti�n v�o cu�c so t�i tr�ng tr��c c�n xem m�t ch�t c�c lo�i chu�n b� hao t�n �� , cu�c so t�i tr�ng kh�ng cho ph�p �em trang b� n�m v� ph�a b�n ngo�i ",2, "Ta �� chu�n b� xong !/wlls_en2", "Ta sau n�y tr� l�i !/OnCancel")
end

function wlls_en2()
	Say("H�i tr��ng quan vi�n :<color=red> ti�n v�o chu�n b� khu v�c c�ng tranh t�i khu v�c , nh� ch�i kh�ng th� di ��ng trang b� d�m v�t ph�m , nh�ng l� nh� c� c� th� s� d�ng ��o c� lan c�ng trang b� d�m v�t ph�m . ng��i ki�m tra c�ng c� lan d�m v�t ph�m �� ch�a ?",2,"X�c ��nh /wlls_en3", "Ta kh�ng c� trang b� h�o !/OnCancel")
end

function wlls_en3()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then return end
	if not wlls_en_check() then return end
	
	local szResult = n_mtype.." "..GetName()
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_want2join", szResult , "", "")
end

