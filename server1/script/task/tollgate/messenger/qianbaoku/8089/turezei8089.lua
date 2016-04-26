-------------------------------------------------------------------------
-- FileName		:	turezei8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:14:14
-- Desc			:   千宝库关卡的盗贼死亡脚本[80-89级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

TUREREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,9 ,"shuachu_exp"))  --小怪经验
TUREREFRESH_MAPID= 394  --千宝库的地图id
TUREREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,9 ,"shuachu_jifen"))  --小怪经验


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
		ture_killrefresh()
	end
end