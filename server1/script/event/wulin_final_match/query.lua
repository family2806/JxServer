IncludeLib("LEAGUE")
function query()
	Say("你想看哪个区域的比赛信息?", 4, "我的比赛信息/selfmatch", "我的比赛信息/owntong", "其他比赛信息/whichtong", "顺便路过/no");
end

function owntong()
	Say("你想看哪个项目的比赛信息?", 7, "比赛门派信息/owntong_SINGLE", "双斗/owntong_DOUBLE", "五行斗/owntong_FIVE", "十派斗/owntong_TEN", "十六斗/owntong_SIXTEEN", "上一页/query", "关闭/no");
end

function owntong_SINGLE()
	Say("你想看哪个门派的单斗比赛信息?", 12, "少林/owntong_sl", "天王/owntong_tw", "唐门/owntong_tm", "五毒/owntong_wu", "峨眉/owntong_em", "翠烟/owntong_cy", "丐帮/owntong_gb", "天忍/owntong_tr", "武当/owntong_wd", "丐帮/owntong_kl", "上一页/owntong", "关闭/no");
end

function owntong_sl()
	local owntongteamname = getowntongname().."单斗门派1_";
	Say("你想看少林单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(1,'"..owntongteamname.."1')", "第2组".."/#tonginfo(1,'"..owntongteamname.."2')", "第3组".."/#tonginfo(1,'"..owntongteamname.."3')", "第4组".."/#tonginfo(1,'"..owntongteamname.."4')", "第5组".."/#tonginfo(1,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_tw()
	local owntongteamname = getowntongname().."单斗门派2_";
	Say("你想看天王单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(2,'"..owntongteamname.."1')", "第2组".."/#tonginfo(2,'"..owntongteamname.."2')", "第3组".."/#tonginfo(2,'"..owntongteamname.."3')", "第4组".."/#tonginfo(2,'"..owntongteamname.."4')", "第5组".."/#tonginfo(2,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_tm()
	local owntongteamname = getowntongname().."单斗门派3_";
	Say("你想看唐门单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(3,'"..owntongteamname.."1')", "第2组".."/#tonginfo(3,'"..owntongteamname.."2')", "第3组".."/#tonginfo(3,'"..owntongteamname.."3')", "第4组".."/#tonginfo(3,'"..owntongteamname.."4')", "第5组".."/#tonginfo(3,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_wu()
	local owntongteamname = getowntongname().."单斗门派4_";
	Say("你想看五毒单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(4,'"..owntongteamname.."1')", "第2组".."/#tonginfo(4,'"..owntongteamname.."2')", "第3组".."/#tonginfo(4,'"..owntongteamname.."3')", "第4组".."/#tonginfo(4,'"..owntongteamname.."4')", "第5组".."/#tonginfo(4,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_em()
	local owntongteamname = getowntongname().."单斗门派5_";
	Say("你想看峨眉单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(5,'"..owntongteamname.."1')", "第2组".."/#tonginfo(5,'"..owntongteamname.."2')", "第3组".."/#tonginfo(5,'"..owntongteamname.."3')", "第4组".."/#tonginfo(5,'"..owntongteamname.."4')", "第5组".."/#tonginfo(5,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_cy()
	local owntongteamname = getowntongname().."单斗门派6_";
	Say("你想看翠烟单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(6,'"..owntongteamname.."1')", "第2组".."/#tonginfo(6,'"..owntongteamname.."2')", "第3组".."/#tonginfo(6,'"..owntongteamname.."3')", "第4组".."/#tonginfo(6,'"..owntongteamname.."4')", "第5组".."/#tonginfo(6,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_gb()
	local owntongteamname = getowntongname().."单斗门派7_";
	Say("你想看丐帮单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(7,'"..owntongteamname.."1')", "第2组".."/#tonginfo(7,'"..owntongteamname.."2')", "第3组".."/#tonginfo(7,'"..owntongteamname.."3')", "第4组".."/#tonginfo(7,'"..owntongteamname.."4')", "第5组".."/#tonginfo(7,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_tr()
	local owntongteamname = getowntongname().."单斗门派8_";
	Say("你想看天忍单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(8,'"..owntongteamname.."1')", "第2组".."/#tonginfo(8,'"..owntongteamname.."2')", "第3组".."/#tonginfo(8,'"..owntongteamname.."3')", "第4组".."/#tonginfo(8,'"..owntongteamname.."4')", "第5组".."/#tonginfo(8,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_wd()
	local owntongteamname = getowntongname().."单斗门派 9_";
	Say("你想看武当单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(9,'"..owntongteamname.."1')", "第2组".."/#tonginfo(9,'"..owntongteamname.."2')", "第3组".."/#tonginfo(9,'"..owntongteamname.."3')", "第4组".."/#tonginfo(9,'"..owntongteamname.."4')", "第5组".."/#tonginfo(9,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_kl()
	local owntongteamname = getowntongname().."单斗门派10_";
	Say("你想看昆仑单斗哪个战队的比赛信息?", 7, "第1组".."/#tonginfo(10,'"..owntongteamname.."1')", "第2组".."/#tonginfo(10,'"..owntongteamname.."2')", "第3组".."/#tonginfo(10,'"..owntongteamname.."3')", "第4组".."/#tonginfo(10,'"..owntongteamname.."4')", "第5组".."/#tonginfo(10,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_DOUBLE()
	local owntongteamname = getowntongname().."双斗";
	Say("你想看哪个战队的双人斗比赛信息?", 7, "第1组".."/#tonginfo(11,'"..owntongteamname.."1')", "第2组".."/#tonginfo(11,'"..owntongteamname.."2')", "第3组".."/#tonginfo(11,'"..owntongteamname.."3')", "第4组".."/#tonginfo(11,'"..owntongteamname.."4')", "第5组".."/#tonginfo(11,'"..owntongteamname.."5')", "上一页/owntong_SINGLE", "关闭/no");
end

function owntong_FIVE()
	local owntongteamname = getowntongname().."五行斗";
	Say("你想看哪个战队的五行斗比赛信息?", 5, "第1组".."/#tonginfo(12,'"..owntongteamname.."1')", "第2组".."/#tonginfo(12,'"..owntongteamname.."2')", "第3组".."/#tonginfo(12,'"..owntongteamname.."3')", "上一页/owntong", "关闭/no");
end

function owntong_TEN()
	local owntongteamname = getowntongname().."十全斗";
	Say("你想看哪个战队的十全斗比赛信息?", 4, "第1组".."/#tonginfo(13,'"..owntongteamname.."1')", "第2组".."/#tonginfo(13,'"..owntongteamname.."2')", "上一页/owntong", "关闭/no");
end

function owntong_SIXTEEN()
	local owntongteamname = getowntongname().."十六斗";
	Say("你想看哪个区域的比赛信息?", 4, "第1组".."/#tonginfo(14,'"..owntongteamname.."1')", "第2组".."/#tonginfo(14,'"..owntongteamname.."2')", "上一页/owntong", "关闭/no");
end

function whichtong()
	Say("你想看哪个区域的比赛信息?", 6, "区1 ~   区 5/tong_1to5", "Khu 6 ~ Khu10/tong_6to10", "区 11 ~ 区15/tong_11to15", "区16 ~ 区 22/tong_16to22", "上一页/query", "关闭/no");
end

function tong_1to5()
	Say("你想看哪个区域的比赛信息?", 7, "区1/tong_1", "区2/tong_2", "Khu 3/tong_3", "区 4/tong_4", "区5/tong_5", "上一页/whichtong", "关闭/no");
end

function tong_6to10()
	Say("你想看哪个区域的比赛信息?", 7, "区 6/tong_6", "区 7/tong_7", "区8/tong_8", "区 9/tong_9", "区 10/tong_10", "上一页/whichtong", "关闭/no");
end

function tong_11to15()
	Say("你想看哪个区域的比赛信息?", 7, "区11/tong_11", "区12/tong_12", "区 13/tong_13", "区 14/tong_14", "区 15/tong_15", "上一页/whichtong", "关闭/no");
end

function tong_16to22()
	Say("你想看哪个区域的比赛信息?", 8, "区16/tong_16", "区 17/tong_17", "区 18/tong_18", "区19/tong_19", "区 20/tong_20", "区 22/tong_22", "上一页/whichtong", "关闭/no");
end

function tong_1()
	Say("你想看哪个区域的比赛信息?", 5, "1-1/#othertong('1-1')", "1-2/#othertong('1-2')", "1-3/#othertong('1-3')", "上一页/tong_1to5", "关闭/no");
end

function tong_2()
	Say("你想看哪个区域的比赛信息?", 5, "2-1/#othertong('2-1')", "2-2/#othertong('2-2')", "2-3/#othertong('2-3')", "上一页/tong_1to5", "关闭/no");
end

function tong_3()
	Say("你想看哪个区域的比赛信息?", 5, "3-1/#othertong('3-1')", "3-2/#othertong('3-2')", "3-3/#othertong('3-3')", "上一页/tong_1to5", "关闭/no");
end

function tong_4()
	Say("你想看哪个区域的比赛信息?", 5, "4-1/#othertong('4-1')", "4-2/#othertong('4-2')", "4-3/#othertong('4-3')", "上一页/tong_1to5", "关闭/no");
end

function tong_5()
	Say("你想看哪个区域的比赛信息?", 4, "5-1/#othertong('5-1')", "5-2/#othertong('5-2')", "上一页/tong_1to5", "关闭/no");
end

function tong_6()
	Say("你想看哪个区域的比赛信息?", 5, "6-1/#othertong('6-1')", "6-2/#othertong('6-2')", "6-3/#othertong('6-3')", "上一页/tong_6to10", "关闭/no");
end

function tong_7()
	Say("你想看哪个区域的比赛信息?", 5, "7-1/#othertong('7-1')", "7-2/#othertong('7-2')", "7-3/#othertong('7-3')", "上一页/tong_6to10", "关闭/no");
end

function tong_8()
	Say("你想看哪个区域的比赛信息?", 4, "8-1/#othertong('8-1')", "8-2/#othertong('8-2')", "上一页/tong_6to10", "关闭/no");
end

function tong_9()
	Say("你想看哪个区域的比赛信息?", 4, "9-1/#othertong('9-1')", "9-2/#othertong('9-2')", "上一页/tong_6to10", "关闭/no");
end

function tong_10()
	Say("你想看哪个区域的比赛信息?", 4, "10-1/#othertong('10-1')", "10-2/#othertong('10-2')", "上一页/tong_6to10", "关闭/no");
end

function tong_11()
	Say("你想看哪个区域的比赛信息?", 5, "11-1/#othertong('11-1')", "11-2/#othertong('11-2')", "11-3/#othertong('11-3')", "上一页/tong_11to15", "关闭/no");
end

function tong_12()
	Say("你想看哪个区域的比赛信息?", 4, "12-1/#othertong('12-1')", "12-2/#othertong('12-2')", "上一页/tong_11to15", "关闭/no");
end

function tong_13()
	Say("你想看哪个区域的比赛信息?", 4, "13-1/#othertong('13-1')", "13-2/#othertong('13-2')", "上一页/tong_11to15", "关闭/no");
end

function tong_14()
	Say("你想看哪个区域的比赛信息?", 3, "14-1/#othertong('14-1')", "上一页/tong_11to15", "关闭/no");
end

function tong_15()
	Say("你想看哪个区域的比赛信息?", 3, "15-1/#othertong('15-1')", "上一页/tong_11to15", "关闭/no");
end

function tong_16()
	Say("你想看哪个区域的比赛信息?", 3, "16-1/#othertong('16-1')", "上一页/tong_16to22", "关闭/no");
end

function tong_17()
	Say("你想看哪个区域的比赛信息?", 3, "17-1/#othertong('17-1')", "上一页/tong_16to22", "关闭/no");
end

function tong_18()
	Say("你想看哪个区域的比赛信息?", 3, "18-1/#othertong('18-1')", "上一页/tong_16to22", "关闭/no");
end

function tong_19()
	Say("你想看哪个区域的比赛信息?", 3, "19-1/#othertong('19-1')", "上一页/tong_16to22", "关闭/no");
end

function tong_20()
	Say("你想看哪个区域的比赛信息?", 4, "20-1/#othertong('20-1')", "20-2/#othertong('20-2')", "上一页/tong_16to20", "关闭/no");
end

function tong_22()
	Say("你想看哪个区域的比赛信息?", 3, "22-1/#othertong('22-1')", "上一页/tong_16to20", "关闭/no");
end

function othertong(tongname)
	Say("你想看哪个门派的比赛信息?", 7, "比赛门派名单/#othertong_SINGLE('"..tongname.."')", "双斗/#othertong_DOUBLE('"..tongname.."')", "五行斗/#othertong_FIVE('"..tongname.."')", "十派斗/#othertong_TEN('"..tongname.."')", "十六斗/#othertong_SIXTEEN('"..tongname.."')", "上一页/whichtong", "关闭/no");
end

function othertong_SINGLE(tongname)
	Say("你想看哪个门派的比赛信息?", 12, "少林/#othertong_sl('"..tongname.."')", "天王/#othertong_tw('"..tongname.."')", "唐门/#othertong_tm('"..tongname.."')", "五毒/#othertong_wu('"..tongname.."')", "峨眉/#othertong_em('"..tongname.."')", "翠烟/#othertong_cy('"..tongname.."')", "丐帮/#othertong_gb('"..tongname.."')", "天忍/#othertong_tr('"..tongname.."')", "武当/#othertong_wd('"..tongname.."')", "昆仑/#othertong_kl('"..tongname.."')", "上一页/#othertong('"..tongname.."')", "关闭/no");
end

function othertong_sl(tongname)
	local othertongteamname = tongname.."门派单斗 1_";
	Say("你想看少林单斗哪个战队信息?", 7, "第一组".."/#tonginfo(1,'"..othertongteamname.."1')", "第2组".."/#tonginfo(1,'"..othertongteamname.."2')", "第3组".."/#tonginfo(1,'"..othertongteamname.."3')", "第4组".."/#tonginfo(1,'"..othertongteamname.."4')", "第5组".."/#tonginfo(1,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_tw(tongname)
	local othertongteamname = tongname.."门派单斗  2_";
	Say("你想看天王单斗哪个战队信息?", 7, "第一组".."/#tonginfo(2,'"..othertongteamname.."1')", "第2组".."/#tonginfo(2,'"..othertongteamname.."2')", "第3组".."/#tonginfo(2,'"..othertongteamname.."3')", "第4组".."/#tonginfo(2,'"..othertongteamname.."4')", "第5组".."/#tonginfo(2,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_tm(tongname)
	local othertongteamname = tongname.."门派单斗  3_";
	Say("你想看唐门单斗哪个战队信息?", 7, "第一组".."/#tonginfo(3,'"..othertongteamname.."1')", "第2组".."/#tonginfo(3,'"..othertongteamname.."2')", "第3组".."/#tonginfo(3,'"..othertongteamname.."3')", "第4组".."/#tonginfo(3,'"..othertongteamname.."4')", "第5组".."/#tonginfo(3,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_wu(tongname)
	local othertongteamname = tongname.."门派单斗  4_";
	Say("你想看五毒单斗哪个战队信息?", 7, "第一组".."/#tonginfo(4,'"..othertongteamname.."1')", "第2组".."/#tonginfo(4,'"..othertongteamname.."2')", "第3组".."/#tonginfo(4,'"..othertongteamname.."3')", "第4组".."/#tonginfo(4,'"..othertongteamname.."4')", "第5组".."/#tonginfo(4,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_em(tongname)
	local othertongteamname = tongname.."门派单斗 5_";
	Say("你想看峨眉单斗哪个战队信息?", 7, "第一组".."/#tonginfo(5,'"..othertongteamname.."1')", "第2组".."/#tonginfo(5,'"..othertongteamname.."2')", "第3组".."/#tonginfo(5,'"..othertongteamname.."3')", "第4组".."/#tonginfo(5,'"..othertongteamname.."4')", "第5组".."/#tonginfo(5,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_cy(tongname)
	local othertongteamname = tongname.."门派单斗  6_";
	Say("你想看翠烟单斗哪个战队信息?", 7, "第一组".."/#tonginfo(6,'"..othertongteamname.."1')", "第2组".."/#tonginfo(6,'"..othertongteamname.."2')", "第3组".."/#tonginfo(6,'"..othertongteamname.."3')", "第4组".."/#tonginfo(6,'"..othertongteamname.."4')", "第5组".."/#tonginfo(6,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_gb(tongname)
	local othertongteamname = tongname.."门派单斗  7_";
	Say("你想看丐帮单斗哪个战队信息?", 7, "第一组".."/#tonginfo(7,'"..othertongteamname.."1')", "第2组".."/#tonginfo(7,'"..othertongteamname.."2')", "第3组".."/#tonginfo(7,'"..othertongteamname.."3')", "第4组".."/#tonginfo(7,'"..othertongteamname.."4')", "第5组".."/#tonginfo(7,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_tr(tongname)
	local othertongteamname = tongname.."门派单斗  8_";
	Say("你想看天忍单斗哪个战队信息?", 7, "第一组".."/#tonginfo(8,'"..othertongteamname.."1')", "第2组".."/#tonginfo(8,'"..othertongteamname.."2')", "第3组".."/#tonginfo(8,'"..othertongteamname.."3')", "第4组".."/#tonginfo(8,'"..othertongteamname.."4')", "第5组".."/#tonginfo(8,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_wd(tongname)
	local othertongteamname = tongname.."门派单斗  9_";
	Say("你想看武当单斗哪个战队信息?", 7, "第一组".."/#tonginfo(9,'"..othertongteamname.."1')", "第2组".."/#tonginfo(9,'"..othertongteamname.."2')", "第3组".."/#tonginfo(9,'"..othertongteamname.."3')", "第4组".."/#tonginfo(9,'"..othertongteamname.."4')", "第5组".."/#tonginfo(9,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_kl(tongname)
	local othertongteamname = tongname.."门派单斗10_";
	Say("你想看昆仑单斗哪个战队信息?", 7, "第一组".."/#tonginfo(10,'"..othertongteamname.."1')", "第2组".."/#tonginfo(10,'"..othertongteamname.."2')", "第3组".."/#tonginfo(10,'"..othertongteamname.."3')", "第4组".."/#tonginfo(10,'"..othertongteamname.."4')", "第5组".."/#tonginfo(10,'"..othertongteamname.."5')", "上一页/#othertong_SINGLE('"..tongname.."')", "关闭/no");
end

function othertong_DOUBLE(tongname)
	local othertongteamname = tongname.."双斗";
	Say("你想看双斗哪个战队信息?", 7, "第一组".."/#tonginfo(11,'"..othertongteamname.."1')", "第2组".."/#tonginfo(11,'"..othertongteamname.."2')", "第3组".."/#tonginfo(11,'"..othertongteamname.."3')", "第4组".."/#tonginfo(11,'"..othertongteamname.."4')", "第5组".."/#tonginfo(11,'"..othertongteamname.."5')", "上一页/#othertong('"..tongname.."')", "关闭/no");
end

function othertong_FIVE(tongname)
	local othertongteamname = tongname.."Ng?h祅h u";
	Say("你想看五行斗哪个战队信息?", 5, "第一组".."/#tonginfo(12,'"..othertongteamname.."1')", "第2组".."/#tonginfo(12,'"..othertongteamname.."2')", "第3组".."/#tonginfo(12,'"..othertongteamname.."3')", "上一页/#othertong('"..tongname.."')", "关闭/no");
end

function othertong_TEN(tongname)
	local othertongteamname = tongname.."十全斗";
	Say("你想看十全斗哪个战队信息?", 4, "第一组".."/#tonginfo(13,'"..othertongteamname.."1')", "第2组".."/#tonginfo(13,'"..othertongteamname.."2')", "上一页/#othertong('"..tongname.."')", "关闭/no");
end

function othertong_SIXTEEN(tongname)
	local othertongteamname = tongname.."十六斗";
	Say("你想看十六斗哪个战队的信息?", 4, "第一组".."/#tonginfo(14,'"..othertongteamname.."1')", "第2组".."/#tonginfo(14,'"..othertongteamname.."2')", "上一页/#othertong('"..tongname.."')", "关闭/no");
end

function getowntongname()
	return GetTong();
end

function tonginfo(matchtype, tongname)
	leagueid = matchtype + 10
	print("getinfo-"..leagueid..":"..tongname)
	local lid = LG_GetLeagueObj(leagueid, tongname)
	if(FALSE(lid)) then
		print("小组不存在");
		Say("你想看的队不存在.", 0);
		return 0
	end
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name
		end
		local opp = selfinfo2next( lid, 0 )
		Say("你的队名是[<color=red>"..leaguename.."<color>], 队长是<color=red>"..captain.."<color> 目前正在参加比赛选拔阶段，积分为<color=red>"..mark.."<color>. 已过 <color=red>"..matchcount.."<color> 场比赛，胜 <color=red>"..wincount.."<color> 场，打平 <color=red>"..drawcount.."<color> 场，败 <color=red>"..losecount.."<color> 场。成员包括"..num.."人，名单如下:",getn(opp),opp );
	else
		leaugeid = matchtype + 30;
		local lid = LG_GetLeagueObj(leaugeid, tongname)
		local loldid = LG_GetLeagueObj(matchtype + 10,  tongname)
		if(FALSE(loldid)) then
			print("小组不存在");
			Say("你想看的队不存在.", 0);
			return 0
		end
		if(FALSE(lid)) then
			print("小组不存在");
			Say("你想看的队不存在.", 0);
			return 0
		end
		local num = LG_GetMemberCount(loldid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(loldid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( loldid, 0 )
		if ( position == 32 ) then
			positioninfo = "最猛32队";
		elseif ( position == 16 ) then
			positioninfo = "最猛16队";
		elseif ( position == 8 ) then
			positioninfo = "最猛8队";
		elseif ( position == 4 ) then
			positioninfo = "最猛4队";
		elseif ( position == 2 ) then
			positioninfo = "最后决定";
		else
			print("比赛阶段不对");
		end
		Say("该战队的名字是[ "..tongname.." ], 队长是"..captain..", 目前正在<color=red>"..positioninfo.."<color>. 成员包括"..num..", 名单如下:", getn(opp), opp);
	end
end

function selfmatch()
	local tab = {};
	faction = GetLastFactionNumber()+1
	playername = GetName()
	local lid = LG_GetLeagueObjByRole(faction + 10, playername)
	if (not FALSE(lid)) then
		tab[getn(tab) + 1] = "比赛门派名单/#selfinfo("..faction..")"
	end
	for i = 11, 15 do 
		local lid = LG_GetLeagueObjByRole(i + 10, playername)
		if (not FALSE(lid)) then
			local l_leaguename = LG_GetLeagueInfo(lid)
			tab[getn(tab) + 1] = "战队["..l_leaguename.."] 已加入.".."/#selfinfo("..i..")"
		end
	end
	if ( getn( tab ) == 0 ) then
		Say("  目前你未参加任何场次比赛!", 0)
		return
	end
	tab[getn(tab) + 1] = "不需要/OnCancel"
	--Say("武林大会官员：你要查询自己的哪项比赛呢？", 7, "门派单项赛/#selfinfo(10)", "双人赛/#selfinfo(11)", "五行团队赛/#selfinfo(12)", "十全团队赛/#selfinfo(13)", "16人团队赛/#selfinfo(14)", "上一页/query", "关闭/no");
	Say("   你要查询自己的哪项比赛呢?", getn(tab),tab);
end

function selfinfo(teamtpye)
	local playername = GetName();
	local lid = LG_GetLeagueObjByRole(teamtpye + 10,playername);
	if(FALSE(lid)) then
		print("小组不存在");
		Say(" 你未参加该比赛项目", 0);
		return 0
	end
	local leaguename = LG_GetLeagueInfo(lid)
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lid, 0 )
		
		Say("你的队名是[<color=red>"..leaguename.."<color>], 队长是<color=red>"..captain.."<color> 目前正在参加比赛选拔阶段，积分为<color=red>"..mark.."<color>. 已过 <color=red>"..matchcount.."<color> 场比赛，胜 <color=red>"..wincount.."<color> 场，打平 <color=red>"..drawcount.."<color> 场，败 <color=red>"..losecount.."<color> 场。成员包括"..num.."人，名单如下:",getn(opp),opp );
	else
		leaugeid = teamtpye + 30;
		local lcirleid = LG_GetLeagueObjByRole(teamtpye + 10,playername);	--循环赛的lid
		local szleaguename = LG_GetLeagueInfo(lcirleid)
		local lid = LG_GetLeagueObj(leaugeid,szleaguename);	--淘汰赛的lid
		if(FALSE(lcirleid)) then
			print("小组不存在");
			Say("你想看的队不存在.", 0);
			return 0
		end
		
		if(FALSE(lid)) then
			print("小组不存在");
			Say("你想看的队不存在.", 0);
			return 0
		end
		local num = LG_GetMemberCount(lcirleid);
		local membername = {}
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lcirleid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lcirleid, 0 )
		if ( position == 32 ) then
			positioninfo = "最强32队";
		elseif ( position == 16 ) then
			positioninfo = "最强16队";
		elseif ( position == 8 ) then
			positioninfo = "最强8队";
		elseif ( position == 4 ) then
			positioninfo = "最强4队";
		elseif ( position == 2 ) then
			positioninfo = "最后决定";
		else
			print("比赛阶段不对");
		end
		Say("你的队名是[ "..leaguename.." ], 队长是"..captain..",现在在<color=red>"..positioninfo.."<color>. 成员包括"..num..", 名单如下:", getn(opp), opp);
	end
end

function no()
end

function FALSE(value)
	if (value == nil or value == 0) then
		return 1
	end
	return nil
end

function selfinfo2next( lid, num )
	local count = LG_GetMemberCount(lid);
	local membername = {};
	local opp = {}
	local captain = ""
	for i = 0, count -1 do
		local name,job = LG_GetMemberInfo(lid, i);
		if ( job == 1 ) then
			captain = name
		end
		membername[i + 1] = name;
	end
	if ( getn(membername) - num > 10 ) then
		for i = num+1, num+10 do
			opp[ getn(opp) + 1 ] = membername[i].."/#selfinfo2next("..lid..","..(num+10)..")"
		end
		opp[getn(opp)+1] = "下一页/#selfinfo2next("..lid..","..(num+10)..")"
	else
		for i = num+1, getn( membername ) do
			opp[getn(opp) + 1] = membername[i]
		end
	end
	opp[getn(opp)+1] = "关闭/no"
	if( num == 0 ) then
		return opp
	end
	Say("武林新秀联赛官员:", getn(opp), opp)
end
