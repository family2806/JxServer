Include( "\\script\\missions\\leaguematch\\head.lua" )

function main(sel)
--	DisabledUseTownP(0)	--»Ö¸´ÆäÊ¹ÓÃ»Ø³Ç·û
	Say("<#> Xa Phu: Hoan nghªnh tham gia liªn ®Êu, ng­¬i muèn ®i ®©u ?",
		8, "Ph­îng T­êng Phñ/#wlls_want2go(1)", "Thµnh §« Phñ/#wlls_want2go(11)", "§¹i Lý/#wlls_want2go(162)", "BiÖn Kinh Phñ/#wlls_want2go(37)", "T­¬ng D­¬ng Phñ/#wlls_want2go(78)", "D­¬ng Ch©u/#wlls_want2go(80)", "L©m An/#wlls_want2go(176)", "§Ó khi kh¸c!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph­îng T­êng" },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Thµnh §«" },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "§¹i Lý" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "BiÖn Kinh" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "T­¬ng D­¬ng" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "D­¬ng Ch©u" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L©m An" }
}

function wlls_want2go(stationname)
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("<#> Nhãm cña b¹n ®ang trong giai ®o¹n b¸o danh, nÕu ®i sÏ ko thÓ thi ®Êu?",
			2, "Ta ®i!/#cp_station("..stationname..")", "Th«i vËy!/OnCancel")
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
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end
