Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\event\\great_night\\lantern\\create_lanterns.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\passerby\\passerby181\\passerby181_pst.spr>���:<link>"

Great_Night_DiaStr = {
	"�Ի�ҹ",
	format("%s ��֮��ÿ��12h00��ʼ. �������������Ĳ��ֻԻ�����. 5���Ӻ󣬸�λ������ʿ����ժ����ĻԻ͹�ʵ���Ժ���������.<enter>",DescLink_LiGuan),
	
	format("%s ��֮��ÿ��<color=yellow>��19h55��21h45<color>. �ڴ��ڼ䣬��λ�������ԲμӸ�����ȡ˫�������Ļ. <enter> Ŀǰ�и���:  <enter>%s<enter>%s<enter>%s<enter>. ��λ������<color=yellow>19h45<color> ���Ե���ٴ�ѯ�ʵ�����ȡ˫�������Ļ.",DescLink_LiGuan,"�ν�ս��","��սʱ��","Ұ������"),
	
	"�˽�'�Ի�'�/gn_huizhizhang",
	"�˽�'��֮��'�/gn_huangzhizhang",
	"ֻ��תת����/OnCancel",
	"����/onGreat_Night",
	"������/OnCancel",
}

function onGreat_Night()
	Describe(format("%s �����Ƿ����˳�Ļ,Ϊ�˴�л��λ�����Ĺ��ף������������½���֯�˻<color=yellow>'�Ի�ҹ'<color>. �ʱ����ÿ���12h00. <enter><color=yellow>����12h00 ������'��֮��'���������ֻƽ�֮���ĵط��ǣ�%s<color><enter><color=yellow>����19h45�����С���֮�¡������ȡ˫�������Ļ�ǣ�  %s<color><enter>",
				DescLink_LiGuan,
				"Į����ԭ",
				huang_event_name()),
	 3, 
	Great_Night_DiaStr[4], 
	Great_Night_DiaStr[5],
	Great_Night_DiaStr[6]
 	)
end

function gn_huizhizhang()
	Describe(Great_Night_DiaStr[2],2,
	 Great_Night_DiaStr[7],
	 Great_Night_DiaStr[8])
end

function gn_huangzhizhang()
	Describe(Great_Night_DiaStr[3], 2, Great_Night_DiaStr[7], Great_Night_DiaStr[8])
end


tbLANTERN_ENTER_POS = {
		[2] = { 	--huashan
			{ 2287 ,4092 },
			{ 2595, 3501 },
			{ 2546, 3618 },
			{ 2360, 3758 },
			{ 2332, 3912 },
			{ 2355, 4045 },
			{ 2428, 4054 },
			{ 2525, 4052 },
			{ 2290, 4087 },
			{ 2546, 4035 },
		 },
		[21] = { 	--qingchengshan
			{ 2621, 4501 },
			{ 2577, 3292 },
			{ 2387, 3706 },
			{ 2561, 3313 },
			{ 2365, 4016 },
			{ 2735, 3965 },
			{ 2542, 3915 },
			{ 2270, 3842 },
			{ 2830, 3700 },
			{ 2049, 4107 },
		 },
		[167] = { 	--diancangshan
			{ 1606, 3214 },
			{ 1373, 2532 },
			{ 1689, 2620 },
			{ 1430, 2692 },
			{ 1617, 2738 },
			{ 1216, 2805 },
			{ 1586, 2850 },
			{ 1430, 2950 },
			{ 1671, 3034 },
			{ 1517, 3215 },
		 },
		[193] = { 	--wuyishan
			{ 1937, 2851},
			{ 1071, 2843 },
			{ 1130, 3074 },
			{ 1113, 2641 },
			{ 1447, 3243 },
			{ 1808, 2705 },
			{ 1513, 2497 },
			{ 1213, 2565 },
			{ 1431, 2776 },
			{ 1310, 2435 },
		 },
}

function gn_lanternjoin()
	local area = gb_GetTask(GN_LANTERN_NAME_TSK, GN_LANTERN_TSK_MAP)
	if (area == 0 or area == nil) then
		Describe(DescLink_LiGuan.."�»������ջ��û��ʼ�������������", 1, "֪����!/OnCancel")
		return
	end
	for i = 1, getn(tbLANTERNS_NPC) do
		if (area == tbLANTERNS_NPC[i][1]) then
			Describe(DescLink_LiGuan.."��ҹ�����ơ������֯��<color=yellow>"..tbLANTERNS_NPC[i][7].."<color>, Ҫ�����ھ���ȥ�ɣ�", 2, "���»������յĵط�/lantern_enter_lantern", "��������һ��!/OnCancel")
		end
	end
end

function lantern_enter_lantern()
	local nNowTime = tonumber(GetLocalDate("%H%M"));
	if (nNowTime < 1930 or nNowTime > 2001) then
		Describe(DescLink_LiGuan.."�»������ջ��û��ʼ�������������", 1, "֪����!/OnCancel")
		return
	end
	
	local area = gb_GetTask(GN_LANTERN_NAME_TSK, GN_LANTERN_TSK_MAP)
	if (area == 0 or area == nil) then
		Describe(DescLink_LiGuan.."�»������ջ��û��ʼ�������������", 1, "֪����!/OnCancel")
		return
	end
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end

function OnCancel()
end
