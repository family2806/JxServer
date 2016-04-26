-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   风之骑关卡的小怪脚本[60-79级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flybugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

FLYBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,2 ,"bug_exp"))  --小怪经验
FLYBUGBEAR_MAPID= 387  --风之骑的地图id
FLYBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"bug_jifen"))--风之骑的小怪死亡获得信使积分


function OnDeath()
	local name = GetName()
	if ( messenger_middletime() == 10  ) then --玩家在地图中的时间
		Msg2Player("对不起! "..name.."! 执行信使任务的时间已用完，任务失败!.")
		losemessengertask()
	else
		messenger_killbugbear()
	end
end