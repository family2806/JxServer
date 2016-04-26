Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\event\\great_night\\lantern\\create_lanterns.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\passerby\\passerby181\\passerby181_pst.spr>礼官:<link>"

Great_Night_DiaStr = {
	"辉煌夜",
	format("%s 辉之章每天12h00开始. 武林盟主将尽心播种辉煌种子. 5分钟后，各位武林人士可以摘成熟的辉煌果实，吃后功力会增加.<enter>",DescLink_LiGuan),
	
	format("%s 辉之章每晚<color=yellow>从19h55到21h45<color>. 在此期间，各位大侠可以参加各项领取双倍奖励的活动. <enter> 目前有各项活动:  <enter>%s<enter>%s<enter>%s<enter>. 各位大侠在<color=yellow>19h45<color> 可以到礼官处询问当天领取双倍奖励的活动.",DescLink_LiGuan,"宋金战场","挑战时间","野搜任务"),
	
	"了解'辉煌'活动/gn_huizhizhang",
	"了解'煌之章'活动/gn_huangzhizhang",
	"只是转转看！/OnCancel",
	"返回/onGreat_Night",
	"明白了/OnCancel",
}

function onGreat_Night()
	Describe(format("%s 现在是风调雨顺的活动,为了答谢各位大侠的贡献，武林盟主独孤剑组织了活动<color=yellow>'辉煌夜'<color>. 活动时间是每天的12h00. <enter><color=yellow>中午12h00 将进行'辉之章'活动，将会出现黄金之果的地方是：%s<color><enter><color=yellow>今天19h45将进行‘煌之章‘活动，领取双倍奖励的活动是：  %s<color><enter>",
				DescLink_LiGuan,
				"漠北草原",
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
		Describe(DescLink_LiGuan.."猜花灯字谜活动还没开始！请待会再来！", 1, "知道了!/OnCancel")
		return
	end
	for i = 1, getn(tbLANTERNS_NPC) do
		if (area == tbLANTERNS_NPC[i][1]) then
			Describe(DescLink_LiGuan.."今夜‘花灯’活动将组织在<color=yellow>"..tbLANTERNS_NPC[i][7].."<color>, 要不现在就先去吧！", 2, "到猜花灯字谜的地方/lantern_enter_lantern", "先让我想一下!/OnCancel")
		end
	end
end

function lantern_enter_lantern()
	local nNowTime = tonumber(GetLocalDate("%H%M"));
	if (nNowTime < 1930 or nNowTime > 2001) then
		Describe(DescLink_LiGuan.."猜花灯字谜活动还没开始！请待会再来！", 1, "知道了!/OnCancel")
		return
	end
	
	local area = gb_GetTask(GN_LANTERN_NAME_TSK, GN_LANTERN_TSK_MAP)
	if (area == 0 or area == nil) then
		Describe(DescLink_LiGuan.."猜花灯字谜活动还没开始！请待会再来！", 1, "知道了!/OnCancel")
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
