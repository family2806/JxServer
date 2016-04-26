--by 廖志山 [2006-09-12]
--2006中秋活动之做灯笼活动,公共数据
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_MIDAUTUMN_06__) then
	__H_MIDAUTUMN_06__ = 1;

Include([[\script\lib\pay.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

EXP_AWARD_LIMIT = 50000000;
AU06_TK_EXP = 1776;

AU06_BEGINDATE = 20060930;
AU06_ENDDATE = 20061013;

AU06_COLORED_LIMITED = 3000;


--灯笼数据表
tab_Lightcage = {
--		1	2		3		4		5		6		7	8		9
	{1229, 1221, "彩蝶灯笼", "黄色单光纸(制作灯笼材料)", 1000, 1241, 1235, "普通月饼", 2},
	{1230, 1222, "彩星灯笼", "蓝色单光纸(制作灯笼材料)", 2000, 1242, 1236, "豆沙月饼", 2},
	{1231, 1223, "管状灯笼", "绿色单光纸(制作灯笼材料)", 3000, 1243, 1237, "蛋黄月饼", 2},
	{1232, 1224, "圆形灯笼", "红色单光纸(制作灯笼材料)", 4000, 1244, 1238, "特制月饼", 2},
	{1233, 1225, "鲤鱼灯笼", "橙色单光纸(制作灯笼材料)", 5000, 1245, 1239, "莲蓉月饼", 1},
	{1234, 1225, "五彩灯笼", "橙色单光纸(制作灯笼材料)", 5000, 1245, 1240, "火腿月饼", 5},
}

tab_BasicMaterial = {
	{1226, "青竹(制作灯笼材料)"},
	{1227, "蒲草线(制作灯笼材料)"},
	{1228, "蜡烛"},
}

--是否在活动期间 返回：1在 ,0 不在活动期间
function au06_is_inperiod()
	if (gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		return 0
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= AU06_BEGINDATE and nDate <= AU06_ENDDATE) then --
		return 1;
	end;
	return 0;
end;

--是否为50级充值用户
function au06_IsPayed_player()
	if (IsCharged() == 0) then
		return 0;
	end;
	return 1;
end;

function oncancel()
end;

end;	--//end of __H_MIDAUTUMN_06__