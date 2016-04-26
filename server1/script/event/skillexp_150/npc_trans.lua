-- �ļ�������npc_trans.lua
-- �����ߡ���wangjingjun
-- ���ݡ�����150������ɽ����ͼ������
-- ����ʱ�䣺2011-07-28 10:48:34

Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>��Ҫȥ���Ҵ��㣬��ҪǮ:"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tinsert(tbDailog, {"���踮", wlls_want2go,{1}});
	tinsert(tbDailog, {"�ɶ���", wlls_want2go,{11}});
	tinsert(tbDailog, {"����", wlls_want2go,{162}});
	tinsert(tbDailog, {"�꾩��", wlls_want2go,{37}});
	tinsert(tbDailog, {"������", wlls_want2go,{78}});
	tinsert(tbDailog, {"���ݸ�", wlls_want2go,{80}});
	tinsert(tbDailog, {"�ٰ���", wlls_want2go,{176}});
	tinsert(tbDailog, {"ȡ��"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end



tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "���踮"},
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "�ɶ���"},
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "�꾩��" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "������" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "���ݸ�" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "����" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "�ٰ���" }
}

function wlls_want2go(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end

	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	Msg2Player("��Ϣ������? �����߰�"..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
	
	SetLogoutRV(0);
end
