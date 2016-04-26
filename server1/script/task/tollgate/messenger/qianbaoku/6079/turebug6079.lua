-------------------------------------------------------------------------
-- FileName		:	turebug6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 21:05:14
-- Desc			:   千宝库关卡的小怪脚本[60-79级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turebugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

TUREBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,8 ,"bug_exp"))  --小怪经验
TUREBUGBEAR_MAPID= 393  --千宝库的地图id
TUREBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,8 ,"bug_jifen"))  --小怪经验


function OnDeath(Npcindex)
	local name = GetName()
	local turesureindex = GetNpcParam(Npcindex,1)
	SetTaskTemp(181,turesureindex)
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("对不起! "..name.."!你的信使任务时间已用完，任务失败!.")
		losemessengertask()
	else
		turesure_killbugbear()
	end
end