-- 定时向一组服务器的所有Gameserver发系统公告
Include("\\script\\gb_modulefuncs.lua")
tab_GameSetting = 
{
"2006春季活动",--年兽
"OpenShop",--商城
"有色贺卡",--Msg2SubWorld
"卷卡",--AddLocalNews
"福缘烟花", 
"传功",
"情人礼物 ",--AddLocalNews and AddGift
"YANDIBAOZANG",
"YANDIBAOZANG_TALK",
"SWITH_DAIYITOUSHI",
"chunjie2009_dangboss",
}

function TaskShedule()
	TaskName("设计游戏系统");
	TaskInterval(1000000);
	TaskCountLimit(0);
	OutputMsg("启动游戏里的职能开关系统...");
end

function TaskContent()
	for i = 1, getn(tab_GameSetting) do 
		gb_AutoStartModule(tab_GameSetting[i])
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
