-- 文件名　：npc_trans.lua
-- 创建者　：wangjingjun
-- 内容　　：150级技能山洞地图传送者
-- 创建时间：2011-07-28 10:48:34

Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>你要去哪我带你，不要钱:"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tinsert(tbDailog, {"凤翔府", wlls_want2go,{1}});
	tinsert(tbDailog, {"成都府", wlls_want2go,{11}});
	tinsert(tbDailog, {"大理", wlls_want2go,{162}});
	tinsert(tbDailog, {"汴京府", wlls_want2go,{37}});
	tinsert(tbDailog, {"襄阳府", wlls_want2go,{78}});
	tinsert(tbDailog, {"扬州府", wlls_want2go,{80}});
	tinsert(tbDailog, {"临安府", wlls_want2go,{176}});
	tinsert(tbDailog, {"取消"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end



tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "凤翔府"},
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "成都府"},
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "汴京府" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "襄阳府" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "扬州府" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "大理" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "临安府" }
}

function wlls_want2go(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end

	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	Msg2Player("休息好了吗? 我们走吧"..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
	
	SetLogoutRV(0);
end
