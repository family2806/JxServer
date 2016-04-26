-- ��������� �����˴��˴�
-- lixin 2005-9-7

--�����˴���	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>���ִ���<link>"


tab_city = {
{1,520,1601,3269, "<#>���踮"},
{11,521,1601,3269, "<#>�ɶ���"},
{37,522,1601,3269, "<#> �꾩��"},
{78,523,1601,3269, "<#>������"},
{80,524,1601,3269, "<#>���ݸ�"},
{162,525,1601,3269, "<#>����"},
{176,526,1601,3269, "<#> �ٰ���"},
}

startdate = 05091618
enddate = 05091824

function mid_autumn_main()
	local nDay = tonumber(GetLocalDate("%y%m%d"))
	local mid_sdate = floor(startdate / 100)
	local mid_edate = floor(enddate / 100)
	if ( nDay >= mid_sdate and nDay <= mid_edate ) then
		Describe(WULINMENG_NPC.."<#> ���գ�����������Ƽұ���һЩ�����ֲ��͵�С��������������Ҫ����������֯һ���±�����̽�����ŵ���ʵ����������׶༪��. �кܶ���ֻ���� . ��λȥ�μӼ�סһ��Ҫ����!", 4, "<#> ֪����!, ����ȥ�������./autumn_enter", "<#> ����ȥ���ƴ�� /lantern_enter", "<#> �����ﻥ����й�/autumn_help","<#> ������һ��!/cancel");
	else
		Describe(WULINMENG_NPC.."<#> ���գ�����������Ƽұ���һЩ�����ֲ��͵�С��������������Ҫ����������֯һ���±�����̽�����ŵ���ʵ����������׶༪��. �кܶ���ֻ���� . ��λȥ�μӼ�סһ��Ҫ����!", 2, "<#>֪����!, ����ȥ�������./autumn_enter", "<#>������һ��!/cancel");
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
		Describe(WULINMENG_NPC..tab_city[cityid][5].."<#>���⵽�������Σ�գ����Ǵӱ�ĳ��н�ȥ�ɣ�", 1, "<#> ����Ҳ����! лл!/cancel");
		return
	end
	NewWorld(tab_city[cityid][2],tab_city[cityid][3],tab_city[cityid][4]);
	SetFightState(0);
	if(nDate >= startdate and nDate <= enddate) then
		Say("<#> ��֯���ƻ�ĵط��ǣ���ɽ�����ɽ������ɽ�����ɽ��������. ÿ��18:00-24:00����, �����ȥ�ͻ���, �μӻ���콱.",0)
	end
end

function autumn_help()
	Describe(WULINMENG_NPC.."<#>�����������<color=red>���������±�����<color>. ��<color=red>9��16�յ�9��18�գ�ÿ��18:00-24:00<color>,4�����򶼾���<color=red>���ƻ�<color>. ���뵽�Ǹ��ط���?", 3, "<#> ������'����'���ص�/huadeng_help","<#> �����������±���ص�/yuebing_help","<#> ��֪����/cancel");
end;

function huadeng_help()
	Describe(WULINMENG_NPC.."<#>��<color=red>9��16�յ�9��18�գ�ÿ��18:00-24:00 <color>, <color=yellow>���ɽ<color>, <color=yellow>����ɽ<color>, <color=yellow>���ɽ<color>, <color=yellow>��ɽ<color>���л��ƻ�. ��ֻ��<color=red>�������3������<color>�Ϳ����콱. ÿ��ֻ��<color=red>100�ݽ�Ʒ<color>!",1,"<#> ��֪����/cancel")
end

function yuebing_help()
	Describe(WULINMENG_NPC.."<#>16/9��30/9�ڼ䣬ÿ���˶����Ը������ִ��˽���������֮��Ѱ��<color=red>�±�ʦ��<color>�˽������±��Ĺ���. ͬʱ��ÿ���<color=red>9:00-24:00<color> ��7����н������н����˶һ����±�ԭ��!",1,"<#> ��һҳ/yuebing_help2")
end

function yuebing_help2()
	Describe(WULINMENG_NPC.."<#> �������±���3������: <color=red>'����' <color>, <color=red>'����'<color>, <color=red>'���±�'<color>, ÿ�����ڶ��й涨��ʱ�䣬���֮��Ҫͨ������������һ�����ڣ������ʱ��ʧ��. ������ɹ��� <color=red>ʲ���±�<color>, <color=red>�����±�<color>, <color=red>���ƶ�ɳ�±�<color>, <color=red>��ɳ�±�<color> ���Դ�����������<color=red>��������<color> �ҽ�!",1,"<#> �����Ի�!/cancel")
end

function lantern_enter()
	Describe(WULINMENG_NPC.."<#> ���ﻨ�ƴ�������ɽ������ɽ�����ɽ����ɽ��4���ط�����. ��ϲ��ȥ��?",5, "<#> ���ɽ/#lantern_enter_lantern(21)", "<#> ����ɽ/#lantern_enter_lantern(193)", "<#> ���ɽ/#lantern_enter_lantern(167)", "<#> ��ɽ/#lantern_enter_lantern(2)", "<#> �����Ի�!/cancel")
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
	
