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
bFind , key1, mapid = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
if (bFind == 1) then 
	--如果重连的服务器包含Boss的数据时
	if (IsMapOnGameSvr(mapid, dwGameSvrIP ) == 1) then 
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, mapid, "iii");		
		if (bResult == 1) then 
			success = SaveCustomDataToSDBOw("GoldBoss", Sid, mapid, "iii", npctid, npclevel, 0);
			NotifySDBRChanged1Svr(dwGameSvrIP, "GoldBoss", Sid ,mapid ,1);		
			msg = format("黄金怪方案%d, 发现 GameSvr %d 启动连接与Relay,出现怪物，区域%d, ID Npc%d,  等级Npc%d.", Sid, dwGameSvrIP, mapid, npctid, npclevel);
			OutputMsg(msg);
		else
			success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);		
		end;
	else
		OutputMsg("主机重启不存在下面的BOSS:"..Sid);
	end
end

end;

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--设置方案名称
	TaskName("Boss Ho祅g kim"..Sid)
	
	--设置间隔时间，单位为分钟
	TaskInterval(Interval)
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(Count)
	
	--设定定时期启动时间
	if (StartHour ~= -1 and StartMin ~= -1) then 
		TaskTime(StartHour, StartMin);
	end;
	--删除从前的数据
	success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);
	OutputMsg("删除黄金怪资料在database"..Sid);
end

function TaskContent()
	bFind , key1, key2 = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
	if (bFind == 1) then
		OutputMsg("找到黄金怪资料database".. Sid..","..key2.."方案资料");
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, key2, "iii");
		msg =	format("资料 %d 在黄金怪物方案里是 Npc: %d, 等级:%d, 状态: %d", Sid, npctid, npclevel, npcstate);
		OutputMsg(msg);
		if (bResult == 1) then 
			if (npctid == 0 and npcstate == 0 and npclevel == 0) or (npctid ~= 0 and npclevel ~=0 and npcstate == 0) then 
				create, mapid, npcid, npclevel = NewBoss();
				if (create == 1) then 
					msg = format("黄金怪物 %d 在方案里没有，或者已经死了，即将出现新的黄金怪物，Npc 数为%d, Npc等级  %d.   ", Sid, mapid, npcid, npclevel);
					OutputMsg(msg);
					success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
					NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
				end
			end
		end
	else
		create, mapid, npcid, npclevel = NewBoss();
		msg = format("黄金怪物%d在方案里没有，即将出现新的黄金怪物，Npc 数为%d, Npc等级 %d,", Sid, mapid, npcid, npclevel);
		OutputMsg(msg);
		success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
		NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
	end
end

