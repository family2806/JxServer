-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:10:14
-- Desc			:  风之骑关卡的定点怪物死亡脚本[80-89级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,3 ,"dingdian_exp"))  --定点小怪经验
FLYPOINT_MAPID= 388  --风之骑的地图id
FLYPOINT_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,3 ,"dingdian_jifen"))  --风之骑的定点小怪死亡获得信使积分

------信使任务风之骑定点杀怪表格--------------
--小地图坐标x，y，人物名字（60-79级）,
killfly ={
{193,194,"大善",1},
{181,183,"大坊",2},
{197,179,"完颜名",3},
{197,172,"大妙",4},
{198,163,"完颜丹",5},
{190,160,"佳律浩男",6},
{164,162,"大古",7},
{164,172,"佳律明",8},
{178,190,"佳律酷波",9},
{178,187,"完颜吞",10},
{169,190,"大难",11},
{172,193,"大赖",12},
{165,191,"完颜和衣",13},
{178,2851,"佳律务男",14},
{186,183,"完颜扣",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --定点打怪开关
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("对不起! "..name.."! 你的信使任务时间已用完，任务失败!.")
		losemessengertask()
	elseif ( Uworld1214 == 0 ) then  --没有定点杀怪的任务
		Msg2Player("此人已被他人买断，你打他也不能获得奖励.")
		return
	elseif ( FLY_npcidex ~= killfly[Uworld1214][4]) then
		Msg2Player("此人不是信中想你去找的人吗？确定是不是金狗的人!")
	else
		messenger_killpoint()
	end
end