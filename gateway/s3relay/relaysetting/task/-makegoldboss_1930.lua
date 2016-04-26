QY_GOLDBOSS_APOS_INFO = {
					{"古柏", 566, 95, 0, {"芙蓉洞","山宝洞","city"}}, -- 名字,形象,等级,五行,{可能出现的地图}
					{"玄觉大师 ", 740, 95, 0, {"雁石洞","清溪洞","city"}},
					{"唐飞燕", 1366, 95, 1, {"风陵渡南","蚩尤洞","city"}},
					{"蓝衣衣", 582, 95, 1, {"武陵洞","飞天洞","city"}},
					{"河灵洞", 568, 95, 2, {"长白山北","无名洞","city"}},
					{"安晓寨", 744, 95, 2, {"沙漠1","沙漠3","city"}},
					{"梦苍梁", 583, 95, 3, {"沙漠地表","沙漠2","city"}},
					{"嘉律离", 563, 95, 3, {"两水洞","阳中洞","city"}},
					{"道清真人 ", 562, 95, 4, {"长白山南","莫高窟","city"}},
					{"全机子 ", 747, 95, 4, {"西山屿","飞天洞","city"}},
					
				--{"完颜雪衣", 564, 95, 3, 227, 1504, 3144, "听说金国七公主完颜雪衣追随端木睿去到西夏国敦煌沙漠迷宫。"},
}

QY_GOLDBOSS_DPOS_INFO = {
					{"清绝师太", 743, 95, 341, 2, "江湖传说清绝师太曾经名震江湖，出现在漠北草原，江湖将有一场血战!", "\\settings\\maps\\东北区\\漠北草原\\qingxiaoshitaiboss.txt"},
					{"安晓寨", 744, 95, 336, 2, "听说水仙使者安晓寨已经出现在风陵渡北，江湖将有一场血战!", "\\settings\\maps\\中原北区\\风陵渡北岸\\yanxiaoqianboss.txt"},
					{"何人我", 745, 95, 321, 3, "江湖相传，何人我已出现在长白山，江湖将有一场血战!", "\\settings\\maps\\东北区\\长白山麓\\xuanjiziboss.txt"},
					{"玄觉大师", 740, 95, 322, 0, "江湖传说玄觉大师曾经名震江湖，出现在长白山，江湖将有一场血战!", "\\settings\\maps\\东北区\\长白山麓\\xuanjuedashiboss.txt"},
					{"泉机子", 747, 95, 340, 4, "江湖传说全机子隐居已久，突然出现在莫高窟，江湖将有一场血战!", "\\settings\\maps\\西北北区\\莫高窟\\tangburanboss.txt"},
					{"慈大岳", 1367, 95, 342,4, "相传慈大岳出现在微山岛，江湖将有一场血战", "\\settings\\maps\\江南区\\西山屿\\big_goldboss.txt"},
}
Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName( "MAKE GOLDBOSS 19:30" );
	TaskInterval( 1440 );
	TaskTime( 19, 30 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  19:30" );
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		qy_makeboss_fixure(1)
		return 0;
	end;
	BigBoss.gold_boss_count = 0;
TAB_CITY_EMPTY = {}
	qy_makeboss_onlyone_pos()
	--qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
