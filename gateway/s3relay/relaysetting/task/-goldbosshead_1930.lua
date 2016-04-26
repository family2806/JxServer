--黄金怪物的脚本设定
--1、建立一个黄金怪物的产生方案脚本文件并放置在Relay\RelaySetting\Task\目录下面。
--在该文件开头部分必须包含黄金怪物的头文件
--用以下方法包含
--Include("\\RelaySetting\\Task\\GoldBossHead.lua");

--2、在非函数区域(全局定义)，填写与黄金怪物有关的全局变量值
--分别是
--1、Sid表示产生的Boss的方案号，每个方案只能同时产生一个Boss。注意Boss方案号必须是唯一的，不能设定重复的Sid号.
--2、Interval表示产生Boss的间隔时间,单位为分钟
--3、Count 表示触发该方案的次数，如果为0表示无限次数，只要到时间就触发本脚本。
--4、StartHour, StartMin表示第一次触发本方案的时间，StartHour表示小时，StartMin表示分钟。
--如果StartHour与StartMin等于-1时，表示Relay一启动，就立即开始第一次触发
--例如:
--Sid = 4
--Interval = 30
--Count = 4
--StartHour = 3
--StartMin = 19
--上述设定表示，第4个黄金怪物产生方案，将在3点19分开始第一次触发，并且以后每半小时(30分钟)触发一次，共触发4次。也就是在3:19 3:49 4:19 4:49触发.

--3、定义与实现Boss的脚本函数NewBoss()
--该函数必须存在。该函数的功能是决定是否要产生Boss,Boss所在地、种类与等级。
--因此、函数最终返回如下4个参数
--分别表示是否要产生boss,boss所在地图id,boss的Npc模板id, boss的等级。
--例如如下NewBoss的实现.
--function NewBoss()
	--return 1, 20, random(100), 50 + random(50); 
--end;
--表示，产生怪物，它在地图ID为20的地图上，npc模板号在1到100随机,等级在51到100随机

--4、在Relay\RelaySetting\Task\TaskList.ini文件中增加本脚本
--把[List]下的Count的值加一表示又增加了一个定时触发任务
--增加[Task_X],把X替换成最新的Count值.
--在[Task_X]的TaskFile上填本脚本的文件名
																			--黄金怪物设计者:窦昊
																			--2004.2.13 16:27:08

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--设置方案名称
	TaskName("Boss黄金1930")
	
	--设置间隔时间，单位为分钟
	TaskInterval(1440)
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	
	--设定定时期启动时间
	
	TaskTime(19, 30);
	
	--删除从前的数据
	for i= 1, getn(tb_goldboss) do
		success = ClearRecordOnShareDB("GoldBoss", tb_goldboss[i].Sid, 0, 1, 0);
		OutputMsg("删除黄金怪物资料在 database"..tb_goldboss[i].Sid);
	end
end

function TaskContent()
	for i = 1, getn(tb_goldboss) do
		str = tb_goldboss[i].str;
		GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	end
	GlobalExecute("dwf \\script\\missions\\boss\\callboss_incity.lua CallBossDown_Fixure()");
end

