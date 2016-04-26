Include( "\\script\\missions\\leaguematch\\head.lua" )

function main(sel)
--	DisabledUseTownP(0)	--�ָ���ʹ�ûسǷ�
	Say("<#> ���򣺻�ӭ��λ���μ��������������Ǳ��������ĳ��򣬿͹�����������Ը�",
		8, "���踮/#wlls_want2go(1)", "�ɶ���/#wlls_want2go(11)", "����/#wlls_want2go(162)", "�꾩��/#wlls_want2go(37)", "������/#wlls_want2go(78)", "���ݸ�/#wlls_want2go(80)", "�ٰ���/#wlls_want2go(176)", "�Ķ���ȥ!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "���踮 " },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "�ɶ���" },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "�꾩��" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "������" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "���ݸ�" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "����" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "�ٰ���" }
}

function wlls_want2go(stationname)
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("<#> ������Ķ�������������������뿪�����ܻ�ý�������ȷ�����뿪��?",
			2, "��!/#cp_station("..stationname..")", "����!/OnCancel")
	else
		cp_station(stationname)
	end
end

function cp_station(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	Msg2Player("�������������� "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end
