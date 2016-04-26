--by 廖志山 [2006-09-12]
--2006中秋活动之做灯笼活动,打怪得到灯笼,灯笼换取经验和月饼.
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

--中秋活动入口函数
function au06_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("只有充值玩家才可以参加中秋活动", 0);
		return
	end;
	
	local tab_Content = {
		"我想做彩蝶灯笼[需要2黄单光纸, 1青竹, 1蒲草线, 1蜡烛和1000 两]/#determine_process( 1 )",
		"我想做彩星灯笼[需要2蓝单光纸, 1青竹, 1蒲草线, 1蜡烛和2000 两]/#determine_process( 2 )",
		"我想做管状灯笼[需要2绿单光纸, 1青竹, 1蒲草线, 1蜡烛和3000 两]/#determine_process( 3 )",
		"我想做圆形灯笼[需要2红单光纸, 1青竹, 1蒲草线, 1蜡烛和4000 两]/#determine_process( 4 )",
		"我想做鲤鱼灯笼[需要1橙单光纸, 1青竹, 1蒲草线, 1蜡烛和5000 两]/#determine_process( 5 )",
		"我想做五彩灯笼[需要5种单光纸, 1青竹, 1蒲草线, 1蜡烛和5000 两]/sure_colorfulcage",
		"只是来看一下您而已!/oncancel"
	};
	Say("我做的灯笼很有名，人人都爱. 客官想做什么灯笼?", getn(tab_Content), tab_Content);
end;

--确定制造(普通灯笼)
function determine_process(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5};
	local szCageName = tab_Lightcage[nIndex][3];
	Say("做"..szCageName.."需要<color=yellow>"..tab_Lightcage[nIndex][9].."开"..tab_Lightcage[nIndex][4]..", 1青竹, 1蒲草线, 1蜡烛和<color=red>"..tab_Lightcage[nIndex][5].."<color> 两工钱, 做吗", 2, "好！请前辈赐教!/#process_lightcage("..tab_Index[nIndex]..")", "我一会回来!/oncancel");
	
end;

--制造灯笼(普通灯笼制造)
function process_lightcage(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	
	local szCageName = tab_Lightcage[nIndex][3];
	local bEnough = 1;
	--检查材料
	if (GetCash() < tab_Lightcage[nIndex][5]) then
		bEnough = 0;
	end;
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][2], -1) < tab_Lightcage[nIndex][9]) then
		bEnough = 0;
	end

	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("客官的材料不够, <color=red>"..szCageName.."<color> 需要<color=yellow>"..tab_Lightcage[nIndex][9].."开"..tab_Lightcage[nIndex][4]..", 1青竹, 1蒲草线, 1蜡烛和<color=red>"..tab_Lightcage[nIndex][5].."<color> 两工钱.", 1, "我先去准备!/oncancel");
		return
	end;
	
	--删除材料
	if (Pay(tab_Lightcage[nIndex][5]) == 0) then
		return
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	if (ConsumeEquiproomItem(tab_Lightcage[nIndex][9], 6, 1, tab_Lightcage[nIndex][2], -1) ~= 1) then
		return
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
	--给予物品
		AddItem(6, 1, tab_Lightcage[nIndex][1], 1, 0, 0, 0);
	--公告
		Say("<color=red>"..szCageName.."<color> 已做完，客官满意吗?!", 0);
		Msg2Player("你得到 <color=yellow>"..szCageName.."(".."特别"..")<color>");
	else
	--给予物品
		local iIdx = AddItem(6, 1, tab_Lightcage[nIndex][6], 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--公告
		Say("<color=red>"..szCageName.."<color> 做完了，但不满意。真不好意思！", 0);
		Msg2Player("你得到<color=yellow>"..szCageName.."<color>");
	end;
end;

--确定制造(五彩灯笼)
function sure_colorfulcage()
	Say("<color=red>五彩灯笼<color><color> 需要有<color=yellow>5种单光纸, 1青竹, 1蒲草线, 1蜡烛<color> v?<color=red>5000 两<color> 工钱, 做吗", 2, "好！请前辈赐教!/make_colorfulcage", "我一会回来!/oncancel");
end;

--制造五彩灯笼
function make_colorfulcage()
	local szCageName = "五彩灯笼";
	--检查是否已经做了300个
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local w = GetWorldPos();
	local szCityLGName = "midautumn2006_city_"..tostring(w);
	local n_wc_Count = gb_GetTask(szCityLGName, 2);
	if (gb_GetTask(szCityLGName, 1) ~= nDate) then
		gb_SetTask(szCityLGName, 1, nDate);
		n_wc_Count = 0;
	end;
	
	if (n_wc_Count >= AU06_COLORED_LIMITED) then
		Say("今天我已经做了<color=yellow>3000个五彩灯笼<color>了，我太累了，改天再来吧.", 0);
		return
	end;
	
	--检查材料
	local bEnough = 1;
	if (GetCash() < 5000) then
		bEnough = 0;
	end;
	for i = 1221, 1225 do
		if (CalcEquiproomItemCount(6, 1, i, -1) < 1) then
			bEnough = 0;
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("客官的材料不够, <color=red>"..szCageName.."<color> 需要<color=yellow>5种单光纸, 1青竹, 1蒲草线, 1蜡烛<color> v?<color=red>5000 两<color> 工钱.", 1, "我先去准备!/oncancel");
		return
	end;
	
	--删除材料
	if (Pay(5000) == 0) then
		return
	end;
	for i = 1221, 1225 do
		if (ConsumeEquiproomItem(1, 6, 1, i, -1) ~= 1) then
			return
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
		gb_SetTask(szCityLGName, 2, n_wc_Count + 1);
	--给予物品
		AddItem(6, 1, 1234, 1, 0, 0, 0);
	--公告
		Say("<color=red>"..szCageName.."<color>已经做完了，客观满意吗?!", 0);
		Msg2Player("你得到<color=yellow>"..szCageName.."(".."特别"..")<color>");
	else
	--给予物品
		local iIdx = AddItem(6, 1, 1246, 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--公告
		Say("<color=red>"..szCageName.."<color>已经做完了，但是不满意.真不好意！", 0);
		Msg2Player("你得到<color=yellow>"..szCageName.."<color>");
	end;
end;