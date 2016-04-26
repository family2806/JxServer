
-- 野叟任务链脚本头文件
-- Edited by peres
-- 2004/12/25 圣诞节早上

IncludeLib("FILESYS");

TL_MAXTIMES = 20 -- 每个链有 20 个任务
TL_MAXLINKS = 20 -- 每个环有 20 个链
TL_MAXLOOPS = 10 -- 玩家总共可以做 10 环的任务
TL_MAXLINKSCOUNT = 4 -- 每个链最多只能做 4 次

TL_UPLEVELEXP = "TaskLink_UpLevel"


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


-- 任务链 TABLE FILE 的预载入
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- 每个等级相对应的初始等级
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- 每个任务类型在相应的等级里面出现的几率
TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- 升级所需的经验表

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)



-- 确定玩家当前的任务状态应该是属于第几环
function GetFirstLoop()
	-- 由于暂时没有环的差别，所以只能为 1 
	return 1
end


-- 最终的输出函数，给予玩家任务并且置于任务变量中
function DealTask()

-- 首先确定玩家的任务等级
local myTaskLevel = GetTaskState(2)

print ("Get The TaskLevel:  "..myTaskLevel)

-- 然后随机算出该等级应该进行什么类型的任务
local myTaskType = GetTaskType(myTaskLevel)

SetPlayerTaskTpye(myTaskType)

print ("Get The TaskType:  "..myTaskType)

-- 最后再读相应的表确定具体的任务在表格中的行号 
local myTaskID = GetTaskLink(myTaskType,myTaskLevel)

SaveTaskTableCol(myTaskID)

print ("Get The TaskColID:  "..myTaskID)

-- 如果是收集地图任务的话则记录地图的编号和要收集的卷轴类型
local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapID"))
local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapType"))
local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))

-- 第5类任务的判断条件
local myTaskValueType

-- 记录任务变量
-- 记录玩家的任务类型
SetPlayerTaskTpye(myTaskType)

-- 记录玩家的任务具体表格行数
SaveTaskTableCol(myTaskID)

-- 对应不同的任务作不同的变量存储处理

	if ( myTaskType == 1 ) then
	elseif ( myTaskType == 2 ) then
	elseif ( myTaskType == 3 ) then
	elseif ( myTaskType == 4 ) then
		SetTask(1031,myTaskMapID)
		SetTask(1032,SetByte(GetTask(1032),1,myMapType))
		SetTask(1032,SetByte(GetTask(1032),2,myMapNum))
		SetTask(1025,0) -- 清空原来的地图志数量
	elseif ( myTaskType == 5 ) then -- 如果是属于数值升级的任务的话，则判断是哪种数值
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then
			print("得到了升级经验的任务！")
			SetTask(1033,GetLevel())
			SetTask(1034,GetExp())
		elseif (myTaskValueType == 3) then
			print("得到了升级声望的任务！")
			SetTask(1026,GetRepute())
		elseif (myTaskValueType == 4) then
			print("得到了升级福缘的任务！")
			SetTask(1026,FuYuan_Get())
		elseif (myTaskValueType == 5) then
			print("得到了升级 PK 值的任务！")
			SetTask(1026,GetPK())
		end
		
	elseif ( myTaskType == 6 ) then
	end
	
	SetTaskCourse(1) -- 设置任务进展进度为 1 

end


-- 任务的循环到下一轮
function TaskProcess()

local myTaskTimes = GetTaskState(1) -- 玩家进行到的次数
local myTaskLinks = GetTaskState(2) -- 玩家进行到的链数
local myTaskLoops = GetTaskState(3) -- 玩家进行到的环数
local myTaskCancel = GetTaskState(4)
local myTaskLinksCount = GetTaskState(6) -- 检测玩家在当前的链中已经进行了几次

if (myTaskTimes ~= 0) then
	myTaskTimes = myTaskTimes + 1
	if (myTaskTimes >= TL_MAXTIMES + 1) then
		myTaskTimes = 1
		myTaskLinksCount = myTaskLinksCount + 1
		myTaskCancel = 0 -- 取消次数为0
		if (myTaskLinksCount >= TL_MAXLINKSCOUNT + 1) then
			myTaskLinks = myTaskLinks + 1
			myTaskLinksCount = 0
		end
			
	end
	
	if (myTaskLinks >= TL_MAXLINKS + 1) then
		myTaskLinks = GetFirstLink()
		myTaskLoops = myTaskLoops + 1
	end
end

SetTaskState(1,myTaskTimes)
SetTaskState(2,myTaskLinks)
SetTaskState(3,myTaskLoops)
SetTaskState(4,myTaskCancel)
SetTaskState(6,myTaskLinksCount)

DealTask()

main()

end



-- 检测函数，用以确认玩家是否已经完成了任务
-- 返回值
-- 1：已经达成条件
-- 0：还未能完成
-- 传入参数 nTaskGoods 有多个表达方式
-- 如果是任务 1 的话：种类、类别、细类、五行、等级
-- 如果是任务 2 的话：种类、类别、细类、五行、等级、魔法属性ID、魔法属性下限、魔法属性上限
-- 如果是任务 3 的话：魔法属性ID、魔法属性下限、魔法属性上限
function CheckTask(nTaskGoods)

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
local myTaskValue,myTaskValueType

-- 任务所要求的山河社稷图数量
local myWorldMaps,nWorldMaps

-- 获取玩家当前所接的任务类型
local myTaskType = GetPlayerTaskType()
local myTaskID = GetTaskTableCol()

	if ( myTaskType == 1) then
		
		myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Level"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel}
		
		print("任务所要求的物品为："..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
		if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 2) then
	
		myGenre = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level"))
		myMagicID = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName"))
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel,myMagicID,myMagicMin,myMagicMax}
		myGoodsClean = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5]} -- 如果不用判断魔法属性则取此值
		myGoodsMagic = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5],nTaskGoods[6],nTaskGoods[7],nTaskGoods[8]}
		
		if (myMagicID == "n") then
			print("任务所要求的物品为："..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
				return 1
			else
				return 0
			end			
		else
			print("任务所要求的物品为："..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."魔法属性："..myMagicID.." 最小值："..myMagicMin.." 最大值："..myMagicMax)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[6] == myTaskGoods[6]) and (tonumber(nTaskGoods[7]) >= myTaskGoods[7]) then
				return 1
			else
				return 0
			end
		end 
		
	elseif ( myTaskType == 3) then
	
		myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
		myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
		myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
		
		print("任务所要求的物品为："..myMagicID..myMagicMin..myMagicMax)
		
		if ( nTaskGoods[1] == myMagicID) and ( nTaskGoods[2] >= myMagicMin ) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 4) then
	
		myTaskMapNum = GetTask(1025)

		print ("任务所要求的地图数量为："..tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num")));

		if (myTaskMapNum>=tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))) then
			myTaskMapNum = 0
			SetTask(1025,myTaskMapNum) -- 重新置 0
			return 1
		else
			return 0
		end
		
	elseif (myTaskType == 5) then
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then
		
		print("目前的任务是升级经验的类型")
			if (CountUpLevelExp(GetTask(1033),GetTask(1034)) >= tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 3) then -- 声望值
		
		print("目前的任务是升级声望的类型")
			if (GetRepute() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 4) then -- 福缘值
		
		print("目前的任务是升级福缘的类型")
			if (FuYuan_Get() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 5) then -- PK 值
		
		print("目前的任务是升级 PK 值的类型")
			if (GetPK() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		end
		
	elseif (myTaskType == 6) then
		myWorldMaps = tonumber(TabFile_GetCell(TL_WORLDMAPS,myTaskID,"Num"))
		if (GetTask(1027) >= myWorldMaps) then
			nWorldMaps = GetTask(1027) - myWorldMaps -- 在这里删了需要的山河社稷图残片
			SetTask(1027,nWorldMaps)
			return 1
		else
			return 0
		end
	end
	
end



-- 给玩家发奖励的总函数
function GivePlayerAward()

	-- 传给奖励面版的参数：
	-- 如果是物品的话则依次为：奖励类型，Quality、Genre、Detail、Particular、Level、GoodsFive、Magiclevel，和说明文字
	-- 如果是金钱的话则依次为：奖励类型，金钱的数量
	-- 如果是经验的话则依次为：奖励类型，经验的数量
	-- 如果是随机机会或者是取消机会则只记录第一位为奖励类型
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,""}, 
						 	{0,0,0,0,0,0,0,0,""},
						 	{0,0,0,0,0,0,0,0,""}
				        }
	
	-- 奖励的数组，分别为各种奖励的权重
	-- 依次为：金钱、经验、物品、再随机一次的机会、取消任务的机会
	-- 0 则是哪个奖励类型已经被选出
	local myMainAwardRate = {30,30,30,9,1}
	
	local myTaskValue1,myTaskValue2,myMainValue -- 临时变量，用以记录读到的数值
	-- 用于奖励传入的字符串
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- 奖励物品相对应的数组
	
	local myAwardType
	
	local myAwardArryIndex = 1 -- 用以记录奖励数组里已经记录了多少个
	
	local myRandomNum,myRandomSeed -- 随机数和随机种子
	
	myTimes = GetTaskState(1)
	myLinks = GetTaskState(2)
	
	myTaskType = GetPlayerTaskType()
	
	local _nSeed = SetRandSeed(GetTask(1037))
	
	
	print("开始进行奖励类型选择！")
	
	for i=1,3 do -- 循环选出三个奖励种类
		
		myAwardType,myMainAwardRate = GetAwardTypeForRate(myMainAwardRate)
		
		print("第 "..i.." 个循环中选择了奖励类型："..myAwardType);
		
		if (myAwardType==1) then -- 如果奖励类型是钱
		
			print ("当前的任务类型是："..GetTaskTextID(myTaskType).." , 当前的任务表格行号是："..GetTaskTableCol());
			
			myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
			myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
			-- 经过加乘值计算后的任务奖励价值
			myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
			
			myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- 计算后得出的实际金钱量
			
			myAwardMoney = format("%s%s",myMainValue," 金钱");
			
			myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("取得了一个金钱的奖励："..myAwardMoney);
			
		elseif (myAwardType==2) then -- 如果奖励的是经验
		
			myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
			myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
			-- 经过加乘值计算后的任务奖励价值
			myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
			
			myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- 计算后得出的实际经验值量
			
			myAwardExp = format("%s%s",myMainValue," 点经验值")
			
			myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("取得了一个经验值的奖励："..myAwardExp);
			
		elseif (myAwardType==3) then -- 如果奖励的是物品
			
			myTaskValue1 = GivePlayerAward_Goods(1) -- 首先得到奖励物品的行数
			
			myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
			myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
			myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
			myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
			myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
			myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
			
			
			myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
			
			myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("取得了一个物品的奖励："..myArawdGoods);
			
		elseif (myAwardType==4) then -- 如果奖励的是重新随机一次的机会
			
			myAwardChange = "重新再选择一次"
			myAwardArry[myAwardArryIndex] = {4,0,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("取得了一个选择机会的奖励");
		
		elseif (myAwardType==5) then -- 如果奖励的是一次取消任务的机会
		
			myAwardChange = "一次可以取消任务的机会"
			myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1	
			
			print("取得了一次取消机会的奖励");	
		
		end
	end
	
	SetRandSeed(_nSeed)
	-- 返回已经构造好的奖励数组
	return myAwardArry

end


-- 子函数，根据奖励链剩余的类型取出奖励
function GetAwardTypeForRate(myAwardRate)

local i,j,k = 0,0,0
local myAwardMainRate = 0

for i=1,getn(myAwardRate) do
	myAwardMainRate = myAwardMainRate + myAwardRate[i]
end

j=C_Random(1,myAwardMainRate)

for i=1,getn(myAwardRate) do
	k = k + myAwardRate[i]
	if (i<k) then
		myAwardRate[i] = 0 -- 在全局变量 TL_MainAwardRate 中减去一个值
		return i,myAwardRate
	end
end

print ("脚本选取任务奖励类型时出错！");

end


-- 搜寻奖励列表，得到相应的奖励
-- myAwardType：奖励的类型
-- 1：任务基本奖励 2：任务链完成奖励 3:任务环完成奖励
function GivePlayerAward_Goods(myAwardType)

local myTaskValue1,myTaskValue2 -- 从任务表格里读取的任务奖励价值
local myLinks,myTimes -- 连续完成的次数与链数
local myMainValue -- 经过加乘值计算后的任务奖励价值
local myTaskType = GetPlayerTaskType()
local myAwardTextID

local myAwardTable

local FinalAward -- 最终返回的奖励
	
	if (myAwardType == 1) then
		myAwardTextID = TL_AWARDBASIC
	elseif (myAwardType == 2) then
		myAwardTextID = TL_AWARDLINK
	elseif (myAwardType == 3) then
		myAwardTextID = TL_AWARDLOOP
	end
	
	myTimes = GetTaskState(1)
	myLinks = GetTaskState(2)
	
	myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
	
	-- 经过加乘值计算后的任务奖励价值
	myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
	
	myAwardTable = AssignValue_AwardRate(Task_AwardBasic,myMainValue)
	
	FinalAward = TabFile_GetCell(myAwardTextID,GetAward(myAwardTable),"Name")
	
--	print ("获取了 "..myTaskTextID.." 任务类型中的 "..FinalAward.."奖励")
	
return GetAward(myAwardTable) -- 返回奖励所在的行数

end


-- 在已经形成权重列表的奖励中挑选出一个奖励，返回值为奖励所在的表格行数
function GetAward(myAwardVariable)

local i,j,k = 0,0,0
local myMainRate = 0 -- 总的奖励权重
	
	for i=1,getn(myAwardVariable) do
		myMainRate = myMainRate + myAwardVariable[i][2]
	end
	
	j = C_Random(1,myMainRate)
	
	for i=1,getn(myAwardVariable) do
		k = k + myAwardVariable[i][2]
		if (j<k) then
			return i
		end
	end

end


-- 子函数，用以确定当前玩家所接到的任务具体是哪一种类型的任务
-- 返回值为 1~6，如果为 0 则玩家还没有触发任务链
function GetPlayerTaskType()

local myTaskType

--	myTaskType = strsub(format("%d",GetTask(1021),1,1))
myTaskType = GetTask(1021)

return myTaskType

end


-- 子函数，用以设定当前玩家所接到的任务具体是哪一种类型的任务
function SetPlayerTaskTpye(myTaskType)
	SetTask(1021,myTaskType)
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


-- 子函数，用以记录玩家当前任务所具体对应的表格行数
function SaveTaskTableCol(myTaskCol)
	SetTask(1030,myTaskCol)
end


-- 子函数，用以读取玩家当前任务所对应的具体表格行数
function GetTaskTableCol()
	return GetTask(1030)
end


-- 子函数，检测任务的状态
-- 1：当前进行的次数
-- 2：当前进行的链数
-- 3：当前进行的环数
-- 4：剩余取消的次数
-- 5：玩家当前所接的任务号储存在 1021 上
-- 6：玩家在每一环的该链中已经做了几次，最大为 4
function GetTaskState(myTaskState)

local n

if ( myTaskState <= 4) then
	n = GetByte(GetTask(1020),myTaskState)
elseif ( myTaskState == 5) then
	n = GetTask()
elseif ( myTaskState == 6) then
	n = GetTask(1035)
end

return n

end


-- 子函数，设置任务的状态
-- 1：当前进行的次数
-- 2：当前进行的链数
-- 3：当前进行的环数
-- 4：剩余取消的次数
-- 5：玩家当前所接的任务号储存在 1021 上
-- 6：玩家在每一环的该链中已经做了几次，最大为 4
function SetTaskState(myTaskState,myTaskValue)

local n

	if ( myTaskState <= 4) then
		n = GetTask(1020)
		SetTask(1020,SetByte(n,myTaskState,myTaskValue))
	elseif ( myTaskState == 5) then -- 如果是 5 的话则是记录玩家当前所接的任务号在 1021 上
		SetTask(1021,myTaskValue)
	elseif ( myTaskState == 6) then
		SetTask(1035,myTaskValue)
	end

end


-- 子函数，设置当前任务的进程状态，1、2、3
function SetTaskCourse(myTaskCourse)
	SetTask(1028,myTaskCourse)
end


-- 子函数，获取当前任务的进程状态，1、2、3
function GetTaskCourse()
	return GetTask(1028)
end



--  //////////////////////////////////////////////////////////////
-- //                  读表与任务的数值处理                    //
--//////////////////////////////////////////////////////////////

-- 搜寻等级相对应任务表，确定玩家当前的任务链第一等级是属于哪一级
function GetFirstLink()

	local i
	local myLevel = GetLevel()
	local myTotalCol = tonumber(TabFile_GetRowCount(TL_LEVELLINK))
	
	for i = 2,myTotalCol do
		if (myLevel > tonumber(TabFile_GetCell(TL_LEVELLINK,i,"level"))) then
			
		elseif (myLevel <= tonumber(TabFile_GetCell(TL_LEVELLINK,i,"level"))) then
			if (i == 2) then
				return tonumber(TabFile_GetCell(TL_LEVELLINK,2,"task"))
			end
			return tonumber(TabFile_GetCell(TL_LEVELLINK,i-1,"task"))
		end
	end
	
--	return tonumber(TabFile_GetCell(TL_LEVELLINK,j,"task"))
end


-- 搜寻任务链总表，获取相应等级的随机类型任务
-- 传入参数 myTaskLevel 为任务链的等级 1~20
-- 返回值为 1~6 1：物品购买 2：物品寻找 3：物品展示 4：地图收集 5：数值升级 6：山河社稷
function GetTaskType(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- 所有任务类型在一个等级里的总比率
	local myTaskType -- 返回的任务类型
	
	print("mylevel:   "..myTaskLevel)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	print ("任务类型权重总数： "..myMainRate)
	
	
	-- 根据权重公式最后随机计算出任务类型
	j = C_Random(1,myMainRate)
	
	print ("任务类型权重随机数： "..j)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j < k) then
		print ("循环结束，选择了任务类型："..i)
			return i
		end
		print ("目前循环时没有选择到任务类型。任务权重的累加总值为： "..k)
	end
	
	-- 异常处理，如果玩家都选不到任务类型的话就选 4
	
	print("脚本在选择任务类型的时候出错！");
	
	return 0

end


-- 搜寻任务链，取得相应的任务
-- 返回值是该任务在表中的行号
function GetTaskLink(myTaskType,myTaskLevel)

	local myTaskCol -- 记录任务的行号

	if ( myTaskType == 1 ) then -- 如果是购买物品的任务
		myTaskCol = SelectTask(Task_BuyGoods,myTaskLevel)
	elseif ( myTaskType == 2 ) then
		myTaskCol = SelectTask(Task_FindGoods,myTaskLevel)	
	elseif ( myTaskType == 3 ) then
		myTaskCol = SelectTask(Task_ShowGoods,myTaskLevel)	
	elseif ( myTaskType == 4 ) then
		myTaskCol = SelectTask(Task_FindMaps,myTaskLevel)
	elseif ( myTaskType == 5 ) then
		myTaskCol = SelectTask(Task_UpGround,myTaskLevel)
	elseif ( myTaskType == 6 ) then
		myTaskCol = SelectTask(Task_WorldMaps,myTaskLevel)
	end

	return myTaskCol

end







-- 根据任务列表里的权重随机挑出任务，返回值为相应任务表格的行号
function SelectTask(myTaskTable,myTaskLevel)

local i,j,k = 0,0,0
local myMainRate  = 0 -- 任务的总权重

	print ("选择的任务等级 :  "..myTaskLevel.."  ")
	
	print ("任务等级里共有 "..getn(myTaskTable[myTaskLevel]).." 个任务")

	for i=1,getn(myTaskTable[myTaskLevel]) do
		myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
	end
	
	print ("选择到的具体任务总权重："..myMainRate)
	
	-- 根据权重公式最后随机计算出具体的任务
	j = C_Random(1,myMainRate)
	
--	print ("任务的总权重:  "..myMainRate)
--	print ("随机到的任务权重  :  "..j)
	
	for i=1,getn(myTaskTable[myTaskLevel]) do
	
		k = k + myTaskTable[myTaskLevel][i][2]
		
		if ( j < k ) then
--			print ("选择到了表格中的第  "..myTaskTable[myTaskLevel][i][1].."  行。")
			return myTaskTable[myTaskLevel][i][1]
		end
			
	end
	
	-- 异常处理，如果玩家选不到的话则返回 0
	print ("脚本在选择具体的任务时出错！")
	return 0
	
end



-- 子函数，反回一个任务类型所对应表格的字符标识
function GetTaskTextID(myTaskType)

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
function CountTaskRate(myTableName,myTaskRate,myTableCol)

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
function CountUpLevelExp(myOldLevel,myOldExp)

local i
local myLevel = GetLevel()
local myExp = GetExp()

local myTotalExp = 0

if (myOldLevel<myLevel) then


	for i=myOldLevel,myLevel do
		myTotalExp = myTotalExp + tonumber(TabFile_GetCell(TL_UPLEVELEXP,i+1,2))
	end
	
	myTotalExp = (myTotalExp - myOldExp) - myExp

	return myTotalExp
else
	return myExp - myOldExp
end

end



-- 子函数，取得任务相应的说明，返回一段字符串
function GetTaskInfo()

local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3

	local myTaskType = GetPlayerTaskType()
	
	if (myTaskType == 1) then
		
		print("取得的行号："..GetTaskTableCol())
		
		-- 物品名称
		myTaskOrder = TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo1")
		
		print("任务的说明："..TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo1"))
		
		-- 目的地名称
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo")
		
		myTaskMainInfo = format("%s%s%s%s%s","去 ",myTaskInfo1," 处买 ",myTaskOrder," 来给我。");
		
	elseif (myTaskType == 2) then
	 
		-- 魔法属性
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MagicCnName")
		-- 具体的武器类别
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"TaskInfo")
		-- 最小魔法属性
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MinValue")
		-- 最大魔法属性
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MaxValue")
		
		if (myTaskOrder=="n") then
		
			myTaskMainInfo = format("%s%s%s","去找 <color=red>",myTaskInfo1,"<color> 来给我。");
		else
			myTaskMainInfo = format("%s%s%s%s%s%s%s","去找 <color=red>",myTaskOrder,"<color> 最少 ",myTaskInfo2," 的 ",myTaskInfo1," 来给我。");
		end
		
	elseif (myTaskType == 3) then 
		
		-- 魔法属性中文名
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MagicCnName")
		-- 魔法属性的最小值
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MinValue")
		-- 魔法属性的最大值
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MaxValue")
		
		myTaskMainInfo = format("%s%s%s%s%s%s%s","去找一样 <color=red>",myTaskOrder,"<color> 最少为 ",myTaskInfo1," 最高为 ",myTaskInfo2," 的装备或者矿石给我。");
		
	elseif (myTaskType == 4) then 
		
		-- 地图的名称
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"TaskInfo1")
		
		-- 所要的地图数量
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"Num")
		
		-- 地图的类型
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"MapType")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "地图志"
		else
			myTaskInfo3 = "秘志"
		end
		
		myTaskMainInfo = format("%s%s%s%s%s%s%s%s","到 <color=red>",myTaskOrder,"<color> 处给我找 ",myTaskInfo1," 卷",myTaskOrder,myTaskInfo3,"来。")
		
	elseif (myTaskType == 5) then
		
		-- 需要提升的数值类型
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,GetTaskTableCol(),"NumericType")
		
		-- 需要提升的数值总数
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,GetTaskTableCol(),"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = "级等级"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "点经验值"
		elseif (tonumber(myTaskOrder) == 3) then
			myTaskInfo2 = "点声望"
		elseif (tonumber(myTaskOrder) == 4) then
			myTaskInfo2 = "点福缘"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "点PK值"
		end
		
		myTaskMainInfo = format("%s%s%s%s","去提升 ",myTaskInfo1," ",myTaskInfo2)
		
	elseif (myTaskType == 6) then
		-- 需要收集的山河社稷图残片
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,GetTaskTableCol(),"Num")
		
		myTaskMainInfo = format("%s%s%s","去给我收集 ",myTaskOrder," 张山河社稷图的残片来。")
	end

	return myTaskMainInfo
 
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

--	print (format("%s%s%s",myTaskTextID,"  :  ",myTableRow))
	
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
--		print ("The "..myTaskTextID.." 's Task: "..i.." have: "..getn(myTaskVariable[i]).." members.");
	end
	
--	print (format("%s%s%s",myTaskTextID,"  :  ","finshed!!!"))
	
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
--			print ("MyTaskLevel: "..i.."  MyTaskType: "..k.." MyRate:  "..myRate)
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
		print("奖励类型："..myTaskTextID.."  任务奖励行号："..j.."  奖励价值："..myTaskVariable[i][2])
	end
	
return myTaskVariable
	
end


-- 建立奖励权重索引表
-- 传入参数：myTaskVariable 是原始的奖励价值列表，myAwardValue 是计算后的物品总价值量
-- 返回值为每个奖励的表格文件行号索引与其权重
function AssignValue_AwardRate(myAwardVariable,myAwardValue)

local i,j = 0,0
local myAwardRate = {} -- 转换后的权重表
local myAwardNum = getn(myAwardVariable)
	
	for i = 1,myAwardNum do
		myAwardRate[i]={}
	end
	
	for i=1,myAwardNum do
		j=floor((myAwardValue/(myAwardNum*(myAwardVariable[i][2])))*10000000)
		myAwardRate[i] = {i,j}
	end
	
	return myAwardRate
	
end