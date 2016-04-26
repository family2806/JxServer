QY_GOLDBOSS_APOS_INFO = {
					{"王左", 739, 95, 0, {"武陵洞","芙蓉洞","city"}}, -- 名字,形象,等级,五行,{可能出现的地图}
					{"玄难大师", 1365, 95, 0, {"风陵渡北","蚩尤洞","city"}},
					{"唐不染", 741, 95, 1, {"长白山南","蚩尤洞","city"}},
					{"白盈盈", 742, 95, 1, {"清溪洞","沙漠地表","city"}},
					{"清绝师太", 743, 95, 2, {"西山屿","阳中洞","city"}},
					{"钟灵秀", 567, 95, 2, {"飞天洞","无名洞","city"}},
					{"何人我", 745, 95, 3, {"雁石洞","两水洞","city"}},
					{"端木瑞", 565, 95, 3, {"风陵渡南","山宝洞","city"}},
					{"慈大岳", 1367, 95, 4, {"漠北草原","武陵洞","city"}},
					{"清莲子", 1368, 95, 4, {"长白山北","沙漠 3","city"}},
					
				--{"完颜雪衣", 564, 95, 3, 227, 1504, 3144, "听说金国七公主完颜雪衣追随端木睿去到西夏国敦煌沙漠迷宫。"},
}



if (GetProductRegion() == "cn_ib") then
	QY_GOLDBOSS_DPOS_INFO = {
					--{"单思南", 746, 95, 341, 4, "江湖传闻曾经叱咤风云的 单思南 在漠北草原出现!势必掀起一场腥风血雨！", "\\settings\\maps\\东北区\\漠北草原\\shansinanboss.txt"},
					{"白盈盈", 742, 95, 336, 1, "江湖传闻白盈盈曾经名震江湖，出现在风陵渡北! 势必掀起一场腥风血雨!", "\\settings\\maps\\中原北区\\风陵渡北岸\\baiyingyingboss.txt"},
					--{"韩蒙", 748, 95, 342, 1, "江湖传闻曾经叱咤风云的 韩蒙 在西山屿出现!势必掀起一场腥风血雨！", "\\settings\\maps\\江南区\\西山屿\\hanmengboss.txt"}
	}
else
	QY_GOLDBOSS_DPOS_INFO = {
--					{"单思南", 746, 95, 341, 4, "江湖传闻曾经叱咤风云的 单思南 在漠北草原出现!势必掀起一场腥风血雨！", "\\settings\\maps\\东北区\\漠北草原\\shansinanboss.txt"},
					{"白盈盈", 742, 95, 336, 1, "江湖传闻白盈盈曾经名震江湖，出现在风陵渡北! 势必掀起一场腥风血雨!", "\\settings\\maps\\中原北区\\风陵渡北岸\\baiyingyingboss.txt"},
--					{"韩蒙", 748, 95, 342, 1, "江湖传闻曾经叱咤风云的 韩蒙 在西山屿出现!势必掀起一场腥风血雨！", "\\settings\\maps\\江南区\\西山屿\\hanmengboss.txt"}
					{"王左", 739, 95, 341, 0, "江湖传闻曾经叱咤风云的王左出现在漠北草原! 势必掀起一场腥风血雨!", "\\settings\\maps\\东北区\\漠北草原\\wangzuoboss.txt"},
					{"端木瑞", 565, 95, 227, 3,"有人看到端木瑞出现在沙漠迷宫敦煌.", "\\settings\\maps\\西北北区\\沙漠迷宫\\duanmuruiboss.txt"},
					{"蓝衣衣", 582, 95, 181, 1, "黑面郎君的女儿蓝衣衣在两水洞练功.", "\\settings\\maps\\江南区\\两水洞迷宫\\lanyiyiboss.txt"},
					{"唐飞燕", 1366, 95, 342, 1, "传闻唐飞燕出现在微山岛，势必掀起一场腥风血雨 ", "\\settings\\maps\\江南区\\西山屿\\big_goldboss.txt"},
	}
end

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
function TaskShedule()
	-- 设置方案名称
	TaskName( "MAKE GOLDBOSS 23:00" );
	TaskInterval( 1440 );
	TaskTime( 23, 0 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  23:00" );
end

function TaskContent()
TAB_CITY_EMPTY = {}
	qy_makeboss_onlyone_pos()
	--qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
