--�᳡����

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function main()
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local tb_option = wlls_add_option({"����׼���Ȯ�!/wlls_want2leave"}, "��������")
	Say("�᳡��������ʼ����ʱ�仹ʣ"..mm.."���ӣ���׼��������?", getn(tb_option), tb_option)
end

function wlls_want2leave()
	Say("�᳡��������һ�����뿪��׼�������ˣ���Ҫ�������ʱ��!", 2, "�����뿪����!/wlls_sure2leave", "����������������!/OnCancel")
end

function wlls_sure2leave()
	SetLogoutRV(0);		--������������������㲻��ͬһ�ص�
	local n_signmap = wlls_get_mapid(1)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
end
