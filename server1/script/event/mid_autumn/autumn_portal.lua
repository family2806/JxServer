-- 明月镇入口 武林盟传人处
-- lixin 2005-9-7

--武林盟传人	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>武林传人<link>"


tab_city = {
{1,520,1601,3269, "<#>凤翔府"},
{11,521,1601,3269, "<#>成都府"},
{37,522,1601,3269, "<#> 汴京府"},
{78,523,1601,3269, "<#>襄阳府"},
{80,524,1601,3269, "<#>扬州府"},
{162,525,1601,3269, "<#>大理府"},
{176,526,1601,3269, "<#> 临安府"},
}

startdate = 05091618
enddate = 05091824

function mid_autumn_main()
	local nDay = tonumber(GetLocalDate("%y%m%d"))
	local mid_sdate = floor(startdate / 100)
	local mid_edate = floor(enddate / 100)
	if ( nDay >= mid_sdate and nDay <= mid_edate ) then
		Describe(WULINMENG_NPC.."<#> 近日，巴蜀地区的唐家堡有一些与武林不和的小动作！独孤盟主要在明月镇组织一次月饼大赛探听唐门的虚实！看来这次凶多吉少. 有很多高手会出现 . 各位去参加记住一定要慎重!", 4, "<#> 知道了!, 带我去明月镇吧./autumn_enter", "<#> 我想去花灯大会 /lantern_enter", "<#> 与中秋互助活动有关/autumn_help","<#> 等我想一想!/cancel");
	else
		Describe(WULINMENG_NPC.."<#> 近日，巴蜀地区的唐家堡有一些与武林不和的小动作！独孤盟主要在明月镇组织一次月饼大赛探听唐门的虚实！看来这次凶多吉少. 有很多高手会出现 . 各位去参加记住一定要慎重!", 2, "<#>知道了!, 带我去明月镇吧./autumn_enter", "<#>等我想一想!/cancel");
	end
end;


function autumn_enter()
	local nDate = tonumber(date("%y%m%d%H"));
	local nCount = getn(tab_city);
	local cityid = 0;

	for i=1,nCount do
		if( SubWorldIdx2ID( SubWorld ) == tab_city[i][1] ) then
			cityid = i
			break
		end;
	end;
	if ( GetPlayerCount() >=700 or cityid <= 0 ) then
		Describe(WULINMENG_NPC..tab_city[cityid][5].."<#>从这到明月镇很危险！还是从别的城市进去吧！", 1, "<#> 这样也可以! 谢谢!/cancel");
		return
	end
	NewWorld(tab_city[cityid][2],tab_city[cityid][3],tab_city[cityid][4]);
	SetFightState(0);
	if(nDate >= startdate and nDate <= enddate) then
		Say("<#> 组织花灯会的地方是：华山，青城山，武夷山，点苍山和明月镇. 每天18:00-24:00都有, 你可以去赏花灯, 参加活动和领奖.",0)
	end
end

function autumn_help()
	Describe(WULINMENG_NPC.."<#>这次中秋活动包括<color=red>明月镇做月饼大赛<color>. 从<color=red>9月16日到9月18日，每天18:00-24:00<color>,4各区域都举行<color=red>花灯会<color>. 你想到那个地方呢?", 3, "<#> 与中秋'花灯'活动相关的/huadeng_help","<#> 与制作中秋月饼相关的/yuebing_help","<#> 我知道了/cancel");
end;

function huadeng_help()
	Describe(WULINMENG_NPC.."<#>从<color=red>9月16日到9月18日，每天18:00-24:00 <color>, <color=yellow>青城山<color>, <color=yellow>武夷山<color>, <color=yellow>点苍山<color>, <color=yellow>华山<color>都有花灯会. 你只需<color=red>连续答对3题谜语<color>就可以领奖. 每天只有<color=red>100份奖品<color>!",1,"<#> 我知道了/cancel")
end

function yuebing_help()
	Describe(WULINMENG_NPC.."<#>16/9到30/9期间，每个人都可以跟着武林传人进入明月镇，之后寻找<color=red>月饼师傅<color>了解制作月饼的规则. 同时，每天从<color=red>9:00-24:00<color> 在7大城市将会有行脚商人兑换做月饼原料!",1,"<#> 下一页/yuebing_help2")
end

function yuebing_help2()
	Describe(WULINMENG_NPC.."<#> 做中秋月饼有3个步骤: <color=red>'和面' <color>, <color=red>'包馅'<color>, <color=red>'烤月饼'<color>, 每个环节都有规定的时间，完成之后要通报继续进行下一个环节，如果超时将失败. 如果做成功了 <color=red>什锦月饼<color>, <color=red>杏仁月饼<color>, <color=red>蛋黄豆沙月饼<color>, <color=red>豆沙月饼<color> 可以带到明月镇找<color=red>明月老人<color> 兑奖!",1,"<#> 结束对话!/cancel")
end

function lantern_enter()
	Describe(WULINMENG_NPC.."<#> 中秋花灯大会在青城山，武夷山，点苍山，华山等4个地方举行. 你喜欢去哪?",5, "<#> 青城山/#lantern_enter_lantern(21)", "<#> 武夷山/#lantern_enter_lantern(193)", "<#> 点苍山/#lantern_enter_lantern(167)", "<#> 华山/#lantern_enter_lantern(2)", "<#> 结束对话!/cancel")
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

function lantern_enter_lantern(area)
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end



function cancel()
end
	
