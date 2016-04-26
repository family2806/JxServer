-- 野叟任务链脚本头文件
-- Edited by peres
-- 2004/12/25 圣诞节早上

Include("\\script\\global\\fuyuan.lua"); -- 用于取得福缘的文件
Include("\\script\\task\\newtask\\newtask_head.lua"); -- 新任务系统的头文件，用于同步变量

Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

IncludeLib("FILESYS");
IncludeLib("BATTLE");

TL_MAXTIMES = 20 -- 每个链有 20 个任务
TL_MAXLINKS = 20 -- 每个环有 20 个链
TL_MAXLOOPS = 20 -- 玩家总共可以做 20 环的任务
-- TL_MAXLINKSCOUNT = 4 -- 每个链最多只能做 4 次

TL_UPLEVELEXP = "TaskLink_UpLevel"


DEBUG_TASKVALUE = 1046;  -- 用于追查刷取消机会 BUG 的变量

ID_TASKLINK_LIMITDATE 				= 2419;  -- 记录每天限制的日期
ID_TASKLINK_LIMITNUM  				= 2420;  -- 记录每天限制的次数
ID_TASKLINK_LIMITCancelCount 	= 2797;  -- 记录每天取消的次数
TSK_TASKLINK_SEANSONPOINT = 1825	--记录经验转化的野叟积分值
TKS_TASKLINK_SPITEM	= 2690		-- 记录领取野叟的神秘宝箱时任务次数

-- 读取文件时的字符串定义
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"
TL_LEVELLINK = "TaskLink_Level"

TL_MAINTASKLEVEL = "TaskLink_MainLevel"
TL_AWARDBASIC = "Award_Basic"
TL_AWARDLINK = "Award_Link"
TL_AWARDLOOP = "Award_Loop"

TL_TASKGOODSTALK = "TaskLink_GoodsTalk"
TL_TASKBUYTALK = "TaskLink_BuyTalk"
TL_TASKSHOWTALK = "TaskLink_ShowTalk"
TL_TASKFINDMAPS = "TaskLink_FindTalk"
TL_TASKUPGROUNDTALK = "TaskLink_UpGroundTalk"
TL_TASKWORLDTALK = "TaskLink_WorldTalk"

-- 任务链 TABLE FILE 的预载入
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- 每个等级相对应的初始等级
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- 每个任务类型在相应的等级里面出现的几率
-- TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- 升级所需的经验表

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)

TabFile_Load("\\settings\\task\\talk\\talk_findgoods.txt",TL_TASKGOODSTALK)
TabFile_Load("\\settings\\task\\talk\\talk_buygoods.txt",TL_TASKBUYTALK)
TabFile_Load("\\settings\\task\\talk\\talk_showgoods.txt",TL_TASKSHOWTALK)
TabFile_Load("\\settings\\task\\talk\\talk_findmaps.txt",TL_TASKFINDMAPS)
TabFile_Load("\\settings\\task\\talk\\talk_upground.txt",TL_TASKUPGROUNDTALK)
TabFile_Load("\\settings\\task\\talk\\talk_worldmap.txt",TL_TASKWORLDTALK)


-- 确定玩家当前的任务状态应该是属于第几环
function tl_getfirstloop()
	-- 由于暂时没有环的差别，所以只能为 0 
	return 0
end


-- 最终的输出函数，给予玩家任务并且置于任务变量中
function tl_dealtask()

-- 首先确定玩家的任务等级
local myTaskLevel = tl_gettaskstate(2)

-- 然后随机算出该等级应该进行什么类型的任务
local myTaskType = tl_gettasktype(myTaskLevel)

tl_setplayertasktype(myTaskType)

-- 最后再读相应的表确定具体的任务在表格中的行号 
local myTaskID = tl_gettasklink(myTaskType,myTaskLevel)

tl_savetasktablecol(myTaskID)

-- 如果是收集地图任务的话则记录地图的编号和要收集的卷轴类型
local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapID"))
local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapType"))
local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))

-- 第5类任务的判断条件
local myTaskValueType

-- 记录任务变量
-- 记录玩家的任务类型
tl_setplayertasktype(myTaskType)

-- 记录玩家的任务具体表格行数
tl_savetasktablecol(myTaskID)

-- 对应不同的任务作不同的变量存储处理

	if ( myTaskType == 1 ) then
		-- 保存任务对话元素的随机值
		tl_savetalkvalue(1,random( 2,getn(Task_TalkBuy[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkBuy[3]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkBuy[6]) + 1 ))
		
	elseif ( myTaskType == 2 ) then
		-- 保存任务对话元素的随机值
		tl_savetalkvalue(1,random( 2,getn(Task_TalkGoods[1]) + 1 ))
		tl_savetalkvalue(2,random( 2,getn(Task_TalkGoods[2]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkGoods[3]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkGoods[4]) + 1 ))
		tl_savetalkvalue(5,random( 2,getn(Task_TalkGoods[5]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkGoods[6]) + 1 ))
			
	elseif ( myTaskType == 3 ) then
		-- 保存任务对话元素的随机值
		tl_savetalkvalue(1,random( 2,getn(Task_TalkShow[1]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkShow[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkShow[6]) + 1 ))

		
	elseif ( myTaskType == 4 ) then
		-- 保存任务对话元素的随机值
		tl_savetalkvalue(1,random( 2,getn(Task_TalkFind[1]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkFind[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkFind[6]) + 1 ))

		nt_setTask(1031,myTaskMapID)
		nt_setTask(1032,SetByte(nt_getTask(1032),1,myMapType))
		nt_setTask(1032,SetByte(nt_getTask(1032),2,myMapNum))
		nt_setTask(1025,0) -- 清空原来的地图志数量
	elseif ( myTaskType == 5 ) then -- 如果是属于数值升级的任务的话，则判断是哪种数值
		-- 保存任务对话元素的随机值
		tl_savetalkvalue(1,random( 2,getn(Task_TalkUp[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkUp[3]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkUp[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkUp[6]) + 1 ))	
		
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then -- 如果是涨经验值
			local nCurExp = GetExp()
			nt_setTask(1033,GetLevel())
			nt_setTask(2574, floor(nCurExp/1e5))
			nt_setTask(1034, mod(nCurExp,1e5))
		elseif (myTaskValueType == 3) then -- 如果是涨声望
			nt_setTask(1026,GetRepute())
		elseif (myTaskValueType == 4) then -- 如果是涨福缘
			nt_setTask(1026,nt_getTask(151))
		elseif (myTaskValueType == 5) then -- 如果是涨 PK 值
			nt_setTask(1026,GetPK())
		elseif (myTaskValueType == 6) then -- 如果是涨宋金积分
			nt_setTask(1026,nt_getTask(747))
		end
		
	elseif ( myTaskType == 6 ) then
		-- 保存任务对话元素的随机值
		tl_savetalkvalue(1,random( 2,getn(Task_TalkWorld[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkWorld[3]) + 1 ))
	end
	
	tl_settaskcourse(1) -- 设置任务进展进度为 1 

end


-- 任务的循环到下一轮
function tl_taskprocess()

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4)
local myTaskLinksCount = tl_gettaskstate(6) -- 检测玩家在当前的链中已经进行了几次

	myTaskTimes = myTaskTimes + 1
	
	if (myTaskLoops >= TL_MAXLOOPS) then
		myTaskLoops = 0;
	end;
	
	if (myTaskTimes >= TL_MAXTIMES) then
	
		myTaskTimes = 0
		myTaskLinksCount = myTaskLinksCount + 1
		
		-- 先在这里保存一次任务状态
		tl_settaskstate(1,myTaskTimes)
		tl_settaskstate(2,myTaskLinks)
		tl_settaskstate(6,myTaskLinksCount)
		
		if (tl_counttasklinknum(2) >= TL_MAXLINKS) then -- 任务已经进行到环状
		
			myTaskTimes = 0
			myTaskLinks = tl_getfirstlink()
--			tl_print("得到了初始任务链："..myTaskLinks);
			myTaskLinksCount = 0
			myTaskLoops = myTaskLoops + 1
			
			if (myTaskLoops >= TL_MAXLOOPS) then
				myTaskLoops = 0
			end
			
			tl_settaskstate(1,myTaskTimes)
			tl_settaskstate(2,myTaskLinks)
			tl_settaskstate(6,myTaskLinksCount)
		
		end
		
		if (myTaskLinksCount == tl_gettasklinknum(myTaskLinks)) then -- 如果这个链已经完成了该完成的链数
			myTaskLinks = myTaskLinks + 1
			myTaskLinksCount = 0
		end
			
	end

tl_settaskstate(1,myTaskTimes)
tl_settaskstate(2,myTaskLinks)
tl_settaskstate(3,myTaskLoops)
tl_settaskstate(6,myTaskLinksCount)

-- 在这里记录一下任务的总数
nt_setTask(1044, tl_counttasklinknum(1));

end



-- 检测函数，用以确认玩家是否已经完成了任务
-- 返回值
-- 1：已经达成条件
-- 0：还未能完成
-- 传入参数 nTaskGoods 有多个表达方式
-- 如果是任务 1 的话：种类、类别、细类、五行、等级
-- 如果是任务 2 的话：种类、类别、细类、五行、等级、魔法属性ID、魔法属性下限、魔法属性上限
-- 如果是任务 3 的话：魔法属性ID、魔法属性下限、魔法属性上限
function tl_checktask(nTaskGoods)

local i,j

-- 任务所需求的物品
local myTaskGoods

-- 任务所需求物品的种类、类别、细类、五行、等级
local myGenre,myDetail,myParticular,myGoodsFive,myLevel,myMagicID,myMagicMax,myMagicMin

-- 任务所需求物品的种类，不带魔法属性和带魔法属性
local myGoodsClean,myGoodsMagic

-- 任务所要求的地图志 ID, 地图志的数量和地图志的类型
local myTaskMaps,myTaskMapNum,myTaskMapType

-- 任务所要求升级的数值和数值类型
local myTaskValue,myTaskValueType,myOrgValue

-- 任务所要求的山河社稷图数量
local myWorldMaps,nWorldMaps

-- 获取玩家当前所接的任务类型
local myTaskType = tl_getplayertasktype()
local myTaskID = tl_gettasktablecol()

	if ( myTaskType == 1) then
		
		myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Level"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel}
		
		--tl_print("任务所要求的物品为："..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
		if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 2) then
	
		myGenre = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		
		myGoodsFive = TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive")
		
		if (myGoodsFive == "n") then
			myGoodsFive = 0
			nTaskGoods[5] = 0
		else
			myGoodsFive = tonumber(myGoodsFive)
		end
		
		myLevel = TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level")
		
		if (myLevel == "n") then
			myLevel = 0
			nTaskGoods[4] = 0
		else
			myLevel = tonumber(myLevel)
		end
		
		myMagicID = TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName")
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myLevel,myGoodsFive,myMagicID,myMagicMin,myMagicMax}
		myGoodsClean = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5]} -- 如果不用判断魔法属性则取此值
		myGoodsMagic = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5],nTaskGoods[6],nTaskGoods[7],nTaskGoods[8]}
		
		if (myMagicID == "n") then
			--tl_print("任务所要求的物品为："..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
				return 1
			else
				return 0
			end			
		else
			myMagicID = tonumber(myMagicID)
			--tl_print("任务所要求的物品为："..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."魔法属性："..myMagicID.." 最小值："..myMagicMin.." 最大值："..myMagicMax)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[6] == myMagicID) and (tonumber(nTaskGoods[7]) >= myMagicMin) and (tonumber(nTaskGoods[7]) <= myMagicMax) then
				return 1
			else
				return 0
			end
		end 
		
	elseif ( myTaskType == 3) then
	
		myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
		myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
		myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
		
		--tl_print("任务所要求的物品为："..myMagicID..myMagicMin..myMagicMax)
		
		if ( nTaskGoods[1] == myMagicID) and ( nTaskGoods[2] >= myMagicMin ) and ( nTaskGoods[2] <= myMagicMax )then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 4) then
	
		myTaskMapNum = nt_getTask(1025)

		if (myTaskMapNum>=tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))) then
			myTaskMapNum = 0
			nt_setTask(1025,myTaskMapNum) -- 重新置 0
			return 1
		else
			return 0
		end
		
	elseif (myTaskType == 5) then
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		myTaskValue = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))
		local n_transcount = ST_GetTransLifeCount();
		if (myTaskValueType == 2) then
			local n_level = nt_getTask(1033);
			local n_exp = nt_getTask(2574) * 1e5 + nt_getTask(1034);
			if (tl_countuplevelexp(n_level, n_exp, n_transcount) >= tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 3) then -- 声望值
			myOrgValue = GetRepute()
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 4) then -- 福缘值
			myOrgValue = nt_getTask(151)
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 5) then -- PK 值
			myOrgValue = GetPK()
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 6) then -- 宋金积分
			myOrgValue = nt_getTask(747)
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end			
		end
		
	elseif (myTaskType == 6) then
		myWorldMaps = tonumber(TabFile_GetCell(TL_WORLDMAPS,myTaskID,"Num"))
		if (nt_getTask(1027) >= myWorldMaps) then
			nWorldMaps = nt_getTask(1027) - myWorldMaps -- 在这里删了需要的山河社稷图残片
			nt_setTask(1027,nWorldMaps)
			return 1
		else
			return 0
		end
	end
	
end


-- 子函数，用以确定当前玩家所接到的任务具体是哪一种类型的任务
-- 返回值为 1~6，如果为 0 则玩家还没有触发任务链
function tl_getplayertasktype()

local myTaskType

--	myTaskType = strsub(format("%d",nt_getTask(1021),1,1))
myTaskType = nt_getTask(1021)

return myTaskType

end


-- 子函数，用以设定当前玩家所接到的任务具体是哪一种类型的任务
function tl_setplayertasktype(myTaskType)
	nt_setTask(1021,myTaskType)
end


-- 子函数，用以记录玩家当前任务所具体对应的表格行数
function tl_savetasktablecol(myTaskCol)
	nt_setTask(1030,myTaskCol)
end


-- 子函数，用以读取玩家当前任务所对应的具体表格行数
function tl_gettasktablecol()
	return nt_getTask(1030)
end


-- 子函数，检测任务的状态
-- 1：当前进行的次数
-- 2：当前进行的链数
-- 3：当前进行的环数
-- 4：剩余取消的次数
-- 5：玩家当前所接的任务号储存在 1021 上
-- 6：玩家在每一环的该链中已经做了几次，最大为 4
function tl_gettaskstate(myTaskState)

local n

if ( myTaskState <= 4) then
	n = GetByte(nt_getTask(1020),myTaskState)
elseif ( myTaskState == 5) then
	n = nt_getTask()
elseif ( myTaskState == 6) then
	n = nt_getTask(1035)
end

return n

end


-- 子函数，设置任务的状态
-- 1：当前进行的次数
-- 2：当前进行的链数
-- 3：当前进行的环数
-- 5：玩家当前所接的任务号储存在 1021 上
-- 6：玩家在每一环的该链中已经做了几次
function tl_settaskstate(myTaskState,myTaskValue)

local n

	if ( myTaskState <= 3) then
		n = nt_getTask(1020)
		nt_setTask(1020,SetByte(n,myTaskState,myTaskValue))
	elseif ( myTaskState == 4) then
		n = nt_getTask(1020)
		if myTaskValue<=254 then
			nt_setTask(1020,SetByte(n,myTaskState,myTaskValue))
		else
			Msg2Player("你的取消次数已经达到<color=yellow> 254 次的上限<color>，不能再增加了！");
			return
		end;
	elseif ( myTaskState == 6) then
		nt_setTask(1035,myTaskValue)
	end
	
end


-- 子函数，设置当前任务的进程状态，1、2、3
function tl_settaskcourse(myTaskCourse)
	nt_setTask(1028,myTaskCourse)
end


-- 子函数，获取当前任务的进程状态，1、2、3
function tl_gettaskcourse()
	return nt_getTask(1028)
end


-- 子函数，记录对话元素的数值
function tl_savetalkvalue(myValueType,myTalkValue)

	if (myValueType==1) then
		nt_setTask(1038,myTalkValue)
	elseif (myValueType==2) then
		nt_setTask(1039,myTalkValue)
	elseif (myValueType==3) then
		nt_setTask(1040,myTalkValue)
	elseif (myValueType==4) then
		nt_setTask(1041,myTalkValue)
	elseif (myValueType==5) then
		nt_setTask(1042,myTalkValue)
	elseif (myValueType==6) then
		nt_setTask(1043,myTalkValue)
	end
	
end


-- 子函数，获取对话元素的数值
function tl_gettalkvalue(myValueType)

local myTalkValue

	if (myValueType==1) then
		myTalkValue = nt_getTask(1038)
	elseif (myValueType==2) then
		myTalkValue = nt_getTask(1039)
	elseif (myValueType==3) then
		myTalkValue = nt_getTask(1040)
	elseif (myValueType==4) then
		myTalkValue = nt_getTask(1041)
	elseif (myValueType==5) then
		myTalkValue = nt_getTask(1042)
	elseif (myValueType==6) then
		myTalkValue = nt_getTask(1043)
	end
	
return myTalkValue
	
end


--  //////////////////////////////////////////////////////////////
-- //                  读表与任务的数值处理                    //
--//////////////////////////////////////////////////////////////

-- 搜寻等级相对应任务表，确定玩家当前的任务链第一等级是属于哪一级
function tl_getfirstlink()

	local i
	local myLevel = GetLevel()
	local myTaskLevel,myBelongLevel
	
	for i=1,getn(Task_MainTaskLink) do
		myTaskLevel = Task_MainTaskLink[i][1]
		if (myLevel>=myTaskLevel) then
			myBelongLevel = Task_MainTaskLink[i][2]
		end
	end
	
	return myBelongLevel

end


-- 搜寻任务链总表，获取相应等级的随机类型任务
-- 传入参数 myTaskLevel 为任务链的等级 1~20
-- 返回值为 1~6 1：物品购买 2：物品寻找 3：物品展示 4：地图收集 5：数值升级 6：山河社稷
function tl_gettasktype(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- 所有任务类型在一个等级里的总比率
	local myTaskType -- 返回的任务类型
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	-- 根据权重公式最后随机计算出任务类型
	j = random(1,myMainRate)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j <= k) then
			return i
		end
	end
	
	-- 异常处理，如果玩家都选不到任务类型的话就选 4
	
	--tl_print("脚本在选择任务类型的时候出错！");
	
	return 0

end


-- 搜寻任务链，取得相应的任务
-- 返回值是该任务在表中的行号
function tl_gettasklink(myTaskType,myTaskLevel)

	local myTaskCol -- 记录任务的行号

	if ( myTaskType == 1 ) then -- 如果是购买物品的任务
		myTaskCol = tl_selecttask(Task_BuyGoods,myTaskLevel)
	elseif ( myTaskType == 2 ) then
		myTaskCol = tl_selecttask(Task_FindGoods,myTaskLevel)	
	elseif ( myTaskType == 3 ) then
		myTaskCol = tl_selecttask(Task_ShowGoods,myTaskLevel)	
	elseif ( myTaskType == 4 ) then
		myTaskCol = tl_selecttask(Task_FindMaps,myTaskLevel)
	elseif ( myTaskType == 5 ) then
		myTaskCol = tl_selecttask(Task_UpGround,myTaskLevel)
	elseif ( myTaskType == 6 ) then
		myTaskCol = tl_selecttask(Task_WorldMaps,myTaskLevel)
	end

	return myTaskCol

end



-- 根据任务列表里的权重随机挑出任务，返回值为相应任务表格的行号
function tl_selecttask(myTaskTable,myTaskLevel)

local i,j,k = 0,0,0
local myMainRate  = 0 -- 任务的总权重

	for i=1,getn(myTaskTable[myTaskLevel]) do
		myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
	end
	
	-- 根据权重公式最后随机计算出具体的任务
	j = random(1,myMainRate)
	
--	tl_print ("任务的总权重:  "..myMainRate)
--	tl_print ("随机到的任务权重  :  "..j)
	
	for i=1,getn(myTaskTable[myTaskLevel]) do
	
		k = k + myTaskTable[myTaskLevel][i][2]
		
		if ( j < k ) then
--			tl_print ("选择到了表格中的第  "..myTaskTable[myTaskLevel][i][1].."  行。")
			return myTaskTable[myTaskLevel][i][1]
		end
			
	end
	
	-- 异常处理，如果玩家选不到的话则返回 2，无论如何让玩家继续进行下去
--	tl_print ("脚本在选择具体的任务时出错！")
	return 2
	
end



-- 子函数，反回一个任务类型所对应表格的字符标识
function tl_gettasktextID(myTaskType)

local myTaskTextID

	if (myTaskType == 1) then
		myTaskTextID = TL_BUYGOODS
	elseif (myTaskType == 2) then
		myTaskTextID = TL_FINDGOODS
	elseif (myTaskType == 3) then
		myTaskTextID = TL_SHOWGOODS
	elseif (myTaskType == 4) then
		myTaskTextID = TL_FINDMAPS
	elseif (myTaskType == 5) then
		myTaskTextID = TL_UPGROUND
	elseif (myTaskType == 6) then
		myTaskTextID = TL_WORLDMAPS
	end
	
	return myTaskTextID
end


-- 计算一个任务的权重在其当前等级中所占的百分比
-- myTableName 传入的要读取表格的字符
-- myTaskRate 当前任务的权重
-- myTableCol 所读表的列(字符或者数字)
function tl_counttaskrate(myTableName,myTaskRate,myTableCol)

local i
local myTotalRate = 0
local myReadRate
local myPercent

local myTableRow = TabFile_GetRowCount(myTableName) -- 获取TABLE文件的总行数

	for i = 3,myTableRow-1 do
		myReadRate = tonumber(TabFile_GetCell(myTableName,myTableRow,myTableCol))
		myTotalRate = myTotalRate + myReadRate
		i = i + 1
	end

myPercent = (myTaskRate / myTotalRate) * 100

return myPercent

end



-- 计算从旧等级升级到玩家目前的等级需要多少经验值
function tl_countuplevelexp(myOldLevel,myOldExp)

local i
local myLevel = GetLevel()
local myExp = GetExp()
local n_transcount = ST_GetTransLifeCount();
local nNowExp = tl_getUpLevelExp(myLevel + 1, n_transcount) -- 当前等级所需的经验

local myTotalExp = 0

if (myOldLevel<myLevel) then


	for i=myOldLevel,myLevel do
		myTotalExp = myTotalExp + tl_getUpLevelExp(i + 1, n_transcount)
	end
	
	myTotalExp = (myTotalExp - myOldExp) - (nNowExp - myExp)

	return myTotalExp
else
	return myExp - myOldExp
end

end


-- 子函数，计算当前的链需要在其等级链中连续做多少次
-- 已经过测试，确保无误，1~20 级都可以正确返回
function tl_gettasklinknum(myTaskLink)


local myTaskLevel
local myTaskLinks,myTaskLinksNum

myTaskLevel,myTaskLinksNum = tl_getlinksforlevel(myTaskLink)

myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

if 	(myTaskLink==Task_MainTaskLink[myTaskLevel][3]) then
	myTaskLinks = 20 - ((myTaskLinksNum-1) * floor(20 / (myTaskLinksNum)))
else
	myTaskLinks = floor(20 / (myTaskLinksNum))
end

return myTaskLinks

end


-- 子函数，确定该链属于第一个等级链，并返回其链中的成员个数
function tl_getlinksforlevel(myTaskLink)

local i,j = 0,0
local myTaskLevel, myTaskLinksNum

-- 首先确定这个链是属于哪个等级链
for i=1,getn(Task_MainTaskLink) do
	for j=Task_MainTaskLink[i][2],Task_MainTaskLink[i][3] do
		if (myTaskLink==j) then
			myTaskLevel = i
		end
	end
end

myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

return myTaskLevel, myTaskLinksNum

end


-- 子函数，计算玩家一共连续做了几次、几链、几环
function tl_counttasklinknum(myCountType)

local i,j = 0,0
local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数

local myCountLoops = tl_gettaskstate(3) -- 获取玩家的环数

local nTaskLevel,nTaskNum = tl_getlinksforlevel(myTaskLinks) -- 获取该链属于第几级以及该级的成员数

if (myTaskLinks==Task_MainTaskLink[nTaskLevel][2]) then -- 如果该链本来就是初始链，则直接取其值
	myCountLinks = tl_gettaskstate(6)
else
	for i=Task_MainTaskLink[nTaskLevel][2],myTaskLinks - 1 do
		j = j + tl_gettasklinknum(i)
	end
	myCountLinks = j + tl_gettaskstate(6)
end


if (myCountLinks==0) then
	myCountTimes = myTaskTimes + (myCountLoops * 400)
else
	myCountTimes = (myCountLinks * TL_MAXTIMES) + myTaskTimes + (myCountLoops * 400)
end


if (tl_gettaskcourse()==3) or (tl_gettaskcourse()==2) then
	myCountTimes = myCountTimes + 1
end


if (myCountType==1) then
	return myCountTimes
elseif (myCountType==2) then
	return myCountLinks
elseif (myCountType==3) then
	return myCountLoops
end

end


-- 子函数，取得任务相应的说明，返回一段字符串
function tl_gettaskinfo()

local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3

local myWhen, myWhere, myWho, myWhy1, myWhy2, myWhat, myMainTalk

	local myTaskType = tl_getplayertasktype()
	
	if (myTaskType == 1) then
		
		-- 物品名称
		myTaskOrder = TabFile_GetCell(TL_BUYGOODS,tl_gettasktablecol(),"TaskInfo1")
		-- 目的地名称
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,tl_gettasktablecol(),"TaskInfo")
		
		myWhen = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(3), "Who")
		myWhat = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(6), "What")
		
		myMainTalk = "你能去帮我把它买回来吗？ <color=yellow>"..myTaskInfo1.."<color> 物品，在 <color=yellow>"..myTaskOrder.."<color> 购买";
		
		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 2) then
	 
		-- 魔法属性
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MagicCnName")
		-- 具体的武器类别
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"TaskInfo")
		-- 最小魔法属性
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MinValue")
		-- 最大魔法属性
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MaxValue")
		
		myWhen = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(1), "When")
		myWhere = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(2), "Where")
		myWho = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(3), "Who")
		myWhy1 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(4), "Why1")
		myWhy2 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(5), "Why2")
		myWhat = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(6), "What")		
		
		if (myTaskOrder=="n") then
			myTaskMainInfo = "一个<color=yellow>"..myTaskInfo1.."<color>"
			myMainTalk = "你能帮他找回来吗？我帮你交给他: <color=yellow>"..myTaskMainInfo.."<color>.";
		else		
			myMainTalk = "你能帮他找到那个: <color=yellow>"..myTaskInfo1.."<color>, <color=yellow>"..myTaskOrder.."<color>, 最低值为: <color=yellow>"..myTaskInfo2.."<color>, 最高值为: <color=yellow>"..myTaskInfo3.."<color>.";
		end

		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 3) then 
	
		myWhen = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(1), "When")
		myWhy1 = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(6), "What")
		
		-- 魔法属性中文名
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MagicCnName")
		-- 魔法属性的最小值
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MinValue")
		-- 魔法属性的最大值
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MaxValue")

		myMainTalk = "你能找这样的东西来让我看一下吗？: <color=yellow>"..myTaskOrder.."<color>, 最低值为: <color=yellow>"..myTaskInfo1.."<color>, 最高值为: <color=yellow>"..myTaskInfo2.."<color>! 看完后我便还给你。";
		
		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 4) then 
		
		-- 地图的名称
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"TaskInfo1")
		-- 所要的地图数量
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"Num")
		-- 地图的类型
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"MapType")
		
		myWhen = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(1), "When")
		myWhy1 = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(6), "What")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "地图志"
		else
			myTaskInfo3 = "秘志"
		end

		myTaskMainInfo = "你能帮我到<color=yellow>"..myTaskOrder.."<color>处给我找 <color=yellow>"..myTaskInfo1.."<color> 卷那里的<color=yellow>"..myTaskInfo3.."<color>来吗？";
		
	elseif (myTaskType == 5) then

		myWhen = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(3), "Who")
		myWhy1 = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(6), "What")

		
		-- 需要提升的数值类型
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,tl_gettasktablecol(),"NumericType")
		-- 需要提升的数值总数
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,tl_gettasktablecol(),"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = "级等级"
			myTaskInfo3 = "等级"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "点经验值"
			myTaskInfo3 = "经验值"
		elseif (tonumber(myTaskOrder) == 3) then
			myTaskInfo2 = "点声望"
			myTaskInfo3= "声望"
		elseif (tonumber(myTaskOrder) == 4) then
			myTaskInfo2 = "点福缘"
			myTaskInfo3 = "福缘"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "点PK值"
			myTaskInfo3 = "PK值"
		elseif (tonumber(myTaskOrder) == 6) then
			myTaskInfo2 = "点宋金积分"
			myTaskInfo3 = "宋金积分"
		end
		
		myTaskMainInfo = "你快点去提升 <color=yellow>"..myTaskInfo3.." "..myTaskInfo1.."<color>吧。";
		
	elseif (myTaskType == 6) then

		myWhen = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(3), "Who")
		
		-- 需要收集的山河社稷图残片
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,tl_gettasktablecol(),"Num")
		
		myTaskMainInfo = "的人向我收集 <color=yellow>"..myTaskOrder.."<color> 张山河社稷图的残片，你能帮我找来吗？";
	end

	return myTaskMainInfo
 
end

-- 用于任务链 DEBUG 信息打印的过程
function tl_print(myPrintText)
--	print ("任务链输出信息："..myPrintText);
end


-- 子函数，用以获取玩家的性别，直接返回字符串
function GetPlayerSex()
local mySex -- 用以显示人物性别的字符

	if (GetSex() == 0) then
		mySex = "公子"
	else
		mySex = "女侠"
	end
	
return mySex
end


function AssignValue(myTaskVariable,myTaskTextID)

local i,j,k = 0,0,0
local myTaskIndex = {}
myTaskVariable = {}
myTaskVariable[1] = {}
myTaskVariable[1][1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)
local myColText
local myReadRate

--	tl_print (format("%s%s%s",myTaskTextID,"  :  ",myTableRow))
	
	for i = 1,20 do
		myTaskVariable[i]={}
		for j=1,myTableRow - 1 do
			myTaskVariable[i][j] = {0,0}
		end
	end

	for i = 1,20 do
		myTaskIndex[i] = 0
	end

	for i = 1,20 do  -- 从第一级到第二十级的历遍循环
		for j = 2,myTableRow do
			myColText = format("%s%s","TaskRate",i)
			myReadRate = tonumber(TabFile_GetCell(myTaskTextID,j,myColText))
			
			if (myReadRate ~= nil) then -- 如果在任务链等级权重里面有数值的话，则属于这个等级

					myTaskIndex[i] = myTaskIndex[i] + 1
					myTaskVariable[i][myTaskIndex[i]] = {j,myReadRate}
			end
		end
	end
	
return myTaskVariable

end


-- 构造任务表格
function AssignValue_TaskLink(myTaskVariable,myTaskTextID)

local myTaskLevel,myTaskStart,myTaskEnd
local i,j = 0,0

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)

	for i = 1,myTableRow - 1 do
		myTaskVariable[i] = {0,0,0}
	end
	
	for i = 2,myTableRow do
		
		j = j + 1
		
		-- 记录这一等级链：需求等级、初始值和最高值
		if (i<myTableRow) then
			
			myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID,i,1))
			myTaskStart = tonumber(TabFile_GetCell(myTaskTextID,i,2))
			myTaskEnd = tonumber(TabFile_GetCell(myTaskTextID,i+1,2)) - 1
			
			myTaskVariable[j] = {myTaskLevel,myTaskStart,myTaskEnd}
			
		elseif (i==myTableRow) then
		
			myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID,i,1))
			myTaskStart = tonumber(TabFile_GetCell(myTaskTextID,i,2))
			myTaskEnd = TL_MAXLINKS
			
			myTaskVariable[j] = {myTaskLevel,myTaskStart,myTaskEnd}
			
		end
		
--		tl_print("任务等级链："..j.."时初始值为："..myTaskVariable[j][2].."  最高值为："..myTaskVariable[j][3].."  需求等级为："..myTaskVariable[j][1]);
	
	end
	
	return myTaskVariable
	
end


-- 所有任务类型在每个等级中比率的索引
function AssignValue_TaskRate(myTaskVariable,myTaskTextID)

local i,j,k

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID) -- 获取TABLE文件的总行数
local myTableCol -- 合并字符串，构造表头标识："level20"
local myRate

	for i = 1,TL_MAXLINKS do
		myTaskVariable[i]={}
		for j=1,6 do
			myTaskVariable[i][j] = 0
		end
	end
	
	k = 0
	
	for i = 1,TL_MAXLINKS do
		for j = 2,myTableRow do
			k = j - 1 
			myTableCol = format("%s%s","level",i)
			myRate = tonumber(TabFile_GetCell(myTaskTextID,j,myTableCol))
			myTaskVariable[i][k] = myRate
		end
	end

return myTaskVariable

end


-- 构造奖励内存表格
function AssignValue_Award(myTaskVariable,myTaskTextID)

local i,j = 0,1

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)

	for i = 1,myTableRow - 1 do
		myTaskVariable[i]={}
	end
	
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTaskVariable[i] = {j,tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue"))}
--		tl_print ("在 "..myTaskTextID.."  中 ".."  第 "..i.." 个元素：".." 第  "..j.."  行的价值量是  "..tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue")))
	end
	
return myTaskVariable
	
end


-- 构造寻找物品任务对话的内存索引
function AssignValue_TaskTalk(myTaskVariable,myTaskTextID)

local i,j = 0,0
local myTextValue

myTaskVariable = {{0},{0},{0},{0},{0},{0}} -- 六个元素分别为：时间、地点、人物、原因一和二、事件

local myTableRow = TabFile_GetRowCount(myTaskTextID)
	
	tl_print ("所获取的表格行数为："..myTableRow);
	
	-- 构造时间数组
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"When")
		if (myTextValue ~= "n") then
			myTaskVariable[1][i] = j
		end	
	end
	
	-- 构造地点数组
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Where")
		if (myTextValue ~= "n") then
			myTaskVariable[2][i] = j
		end	
	end

	-- 构造人物数组
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Who")
		if (myTextValue ~= "n") then
			myTaskVariable[3][i] = j
		end	
	end

	-- 构造原因一数组
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Why1")
		if (myTextValue ~= "n") then
			myTaskVariable[4][i] = j
		end	
	end
	
	-- 构造原因二数组
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Why2")
		if (myTextValue ~= "n") then
			myTaskVariable[5][i] = j
		end	
	end
	
	-- 构造事件数组
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"What")
		if (myTextValue ~= "n") then
			myTaskVariable[6][i] = j
		end	
	end
	
	for i=1,6 do
		tl_print("目前任务对话  "..i.."  所包含的元素个数有："..getn(myTaskVariable[i]));
	end
	
return myTaskVariable

end