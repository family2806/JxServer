Include( "\\script\\missions\\leaguematch\\head.lua" )

function main(sel)
--	DisabledUseTownP(0)	--�ָ���ʹ�ûسǷ�
	Say("<#> Xa Phu: Hoan ngh�nh tham gia li�n ��u, ng��i mu�n �i ��u ?",
		8, "Ph��ng T��ng Ph�/#wlls_want2go(1)", "Th�nh �� Ph�/#wlls_want2go(11)", "��i L�/#wlls_want2go(162)", "Bi�n Kinh Ph�/#wlls_want2go(37)", "T��ng D��ng Ph�/#wlls_want2go(78)", "D��ng Ch�u/#wlls_want2go(80)", "L�m An/#wlls_want2go(176)", "�� khi kh�c!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph��ng T��ng" },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Th�nh ��" },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "��i L�" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "Bi�n Kinh" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "T��ng D��ng" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "D��ng Ch�u" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L�m An" }
}

function wlls_want2go(stationname)
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("<#> Nh�m c�a b�n �ang trong giai �o�n b�o danh, n�u �i s� ko th� thi ��u?",
			2, "Ta �i!/#cp_station("..stationname..")", "Th�i v�y!/OnCancel")
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
	Msg2Player("Ng�i y�n! Ch�ng ta �i "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end
