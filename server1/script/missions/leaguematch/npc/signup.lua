Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_want2transback()
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("�᳡���������ս�Ӳ������ڱ�������������뿪�������콱�����������?",
			2, "��!/wlls_transback", "����Ҫ!/OnCancel")
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
		Say("������û��������Ҫ�������ȥ��?", 2, "��!/wlls_transback", "�һ������/OnCancel")
		return nil
	end
	
	local tb_option = wlls_add_option({}, "����Ҫ")
	if (n_matchphase == 3) then	--��Ъʱ��
		--����������һ����
		Say("����ʱ��Ϣһ�£�Ŀǰ��δ��ʼ�������㻹��ʲôҪ����?", getn(tb_option), tb_option)
		return nil
	end
	
	--�ж��Ƿ�Խ��
	local str = wlls_levelcheck(n_lid)
	if (str) then
		Say("�᳡��Ա:"..str, 2, "�����뿪�᳡!/wlls_want2transback", "����Ҫ!/OnCancel")
		return nil
	end

	if (n_matchphase == 5) then	--����ʱ��
		local n_combatmap = wlls_get_mapid(3, n_mtype, n_group)
		local n_resttime = WLLS_TIMER_FIGHT_TOTAL - GetGlbValue(GLB_WLLS_TIME)
		n_resttime = ceil(n_resttime*WLLS_TIMER_FIGHT_FREQ/60)
		Say("��Ȼ���ڽ��б���������ʱ�仹ʣ"..n_resttime.."���ӣ�����Ҫʲô������?", getn(tb_option), tb_option)
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
	
	local tb_option = {"�����ս!/wlls_en1"}
	wlls_add_option(tb_option, "����Ҫ")
	Say("���������ڱ����׶Σ�����μӱ�������?", getn(tb_option), tb_option)
	
	local _, _, n_count = LG_GetLeagueInfo(n_lid)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_maxmem = WLLS_TAB[n_type].max_member
	if (n_count < n_maxmem) then
		Msg2Player("��Ķ�����ֻʣ<color=yellow>"..n_count.."<color>��Ա�����ս�ӿ���������<color=yellow>"..n_maxmem.."<color>��Ա.")
	end
end

function wlls_en1()
	Say("������������ʹ��<color=red> ��������PKҩƷ<color>, <color=yellow>���ּ��ܸ���Ч��Ҳ��ʧЧ<color>. ��ʼ���������<color=yellow>ʹ�ø��ּ���<color>. �ڽ�������֮ǰ��Ҫ��������׼���ĺ���ȣ������������װ����������",2, "����׼����!/wlls_en2", "���Ժ�����!/OnCancel")
end

function wlls_en2()
	Say("�᳡��Ա:<color=red>����׼������ͱ���������Ҳ����ƶ�װ�������Ʒ��������Ȼ����ʹ�õ�������װ�������Ʒ�����鹤���������Ʒ������?",2,"ȷ��/wlls_en3", "��ûװ����!/OnCancel")
end

function wlls_en3()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then return end
	if not wlls_en_check() then return end
	
	local szResult = n_mtype.." "..GetName()
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_want2join", szResult , "", "")
end

