-------------------------------------------------------------------------
-- FileName		:	templeboss6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   山神庙关卡的标志boss脚本[60-79级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格


NPC_PARAM_ID = 1;        --用在boss死亡后刷出怪物的特殊事件中，增加npc的时候作为GetNpcParam的第二位，意思是该函数取出的是代表目前死亡bossID的数字   
TEMBOSS_RELIVE=120       --每个标志的重生时间
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_exp"))  --小怪经验
TEMBOSS_MAPID=390        --当前玩家所在地图风之骑的地图编号？？是多少？？
TEMBOSS_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_jifen"))  --小怪经验

templeboss=
{
{834,70,390,1520,2625,1,"刀妖兄弟林达",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",1},
{834,70,390,1519,2718,1,"刀妖兄弟张三",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",2},
{834,70,390,1465,2795,1,"刀妖兄弟告达",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",3},
{834,70,390,1436,2955,1,"刀妖兄弟铁曹",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",4},
{834,70,390,1379,3056,1,"刀妖兄弟同子",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",5},
{834,70,390,1412,3091,1,"刀妖兄弟刚芽",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",6},
{834,70,390,1499,2996,1,"刀妖兄弟长修",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",7},
{834,70,390,1530,2836,1,"刀妖兄弟王二麻子",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",8},
{834,70,390,1581,2701,1,"刀妖兄弟盘里",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",9},
{834,70,390,1360,2979,1,"刀妖兄弟和霸",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",10},
{834,70,390,1404,2810,1,"刀妖兄弟宏坤",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",11},
{834,70,390,1404,2688,1,"刀妖兄弟柳括",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",12},
{834,70,390,1463,2706,1,"刀妖兄弟李大年",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",13},
{834,70,390,1465,3136,1,"刀妖兄弟汪牛",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",14},
{834,70,390,1558,3151,1,"刀妖兄弟铁芽",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",15},
{834,70,390,1572,3000,1,"刀妖兄弟李小嘴",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",16},
{834,70,390,1572,2843,1,"刀妖兄弟曼踏",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",17},
{834,70,390,1333,2774,1,"刀妖兄弟山峰",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",18},
{834,70,390,1344,2669,1,"刀妖兄弟八毒",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",19},
{834,70,390,1485,2625,1,"刀妖兄弟车彻",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",20},
}

function OnDeath(NpcIndex)
	local name = GetName()
	if (GetTask(Task_IsQuest)==2 and GetTask(Task_lag_TskID)==4) then
		if (GetTask(Task_KillNPC) < 5) then
			SetTask(Task_KillNPC, GetTask(Task_KillNPC) + 1)
			Msg2Player(format("大侠已消灭%d 刀妖", GetTask(Task_KillNPC)))
		else
		Msg2Player("大侠已完成消灭刀妖任务，请到战心尊者处完成任务")
		end
	end
	
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("对不起! "..name.."!你的信使任务时间已用完，任务失败!.")
		losemessengertask()
	else
		Msg2Player("你已完成下妖刀.")
		messenger_templego(NpcIndex)
	end
end

