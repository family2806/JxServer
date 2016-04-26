-------------------------------------------------------------------------
-- FileName		:	enemy_flyrefresh90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:19:14
-- Desc			:   风之骑关卡的boss身边刷出怪死亡脚本[90以上级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flyrefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

FLYREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,4 ,"shuachu_exp"))   --boss身边刷出小怪经验
FLYREFRESH_MAPID= 389  --风之骑的地图id
FLYREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,4 ,"shuachu_jifen"))  --风之骑的boss身边刷出小怪死亡获得信使积分


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --boss身边刷怪的打怪开关
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("对不起! "..name.."!你的信使任务时间已用完，任务失败!.")
		losemessengertask()
	--elseif ( Uworld1215 == 0 ) then  --没有刷怪的任务
	--	Msg2Player("这个家伙已经被别人包了，你打他是不会有任何奖励得。")
	--	return
	else
		messenger_killrefresh()
	end
end