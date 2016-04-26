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
					{"王左 ", 739, 95, 341, 0, "江湖传闻曾经叱咤风云的王左出现在漠北草原! 势必掀起一场腥风血雨!", "\\settings\\maps\\东北区\\漠北草原\\wangzuoboss.txt"},
					{"端木瑞 ", 565, 95, 227, 3,"有人看到端木瑞出现在沙漠迷宫敦煌.", "\\settings\\maps\\西北北区\\沙漠迷宫\\duanmuruiboss.txt"},
					{"蓝衣衣", 582, 95, 181, 1, "黑面郎君的女儿蓝衣衣在两水洞练功.", "\\settings\\maps\\江南区\\两水洞迷宫\\lanyiyiboss.txt"},
					{"唐飞燕", 1366, 95, 342, 1, "传闻唐飞燕出现在微山岛，势必掀起一场腥风血雨", "\\settings\\maps\\江南区\\西山屿\\big_goldboss.txt"},
	}
end

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
function TaskShedule()
	-- 设置方案名称
	TaskName( "MAKE GOLDBOSS 21:00" );
	TaskInterval( 1440 );
	TaskTime( 21, 0 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  21:00" );
end

function TaskContent()
TAB_CITY_EMPTY = {}
	qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
