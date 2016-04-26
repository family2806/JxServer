-- 野叟任务链脚本奖励头文件
-- Edited by peres
-- 2004/12/25 圣诞节早上

-- 载入辉煌之章的头文件
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua");
Include("\\script\\tong\\tong_award_head.lua");	--by zhishan


-- 给玩家发奖励的总函数
-- 传入参数：myAwardType，1 为普通任务奖励 2 为链奖励 3 为环奖励
function tl_giveplayeraward(myGiveAwardType)

	-- 传给奖励面版的参数：
	-- 如果是物品的话则依次为：奖励类型，Quality、Genre、Detail、Particular、Level、GoodsFive、Magiclevel，和说明文字
	-- 如果是金钱的话则依次为：奖励类型，金钱的数量
	-- 如果是经验的话则依次为：奖励类型，经验的数量
	-- 如果是随机机会或者是取消机会则只记录第一位为奖励类型
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,"",0}, 
						 	{0,0,0,0,0,0,0,0,"",0},
						 	{0,0,0,0,0,0,0,0,"",0}
				        }
	
	-- 用以链奖励和环奖励的返回处理
	local myAwardSingle = {0,0,0,0,0,0,0,0,"",0}
	
	-- 奖励的数组，分别为各种奖励的权重
	-- 依次为：金钱、经验、物品、再随机一次的机会、取消任务的机会
	-- 0 则是哪个奖励类型已经被选出
	local myMainAwardRate = {20,33,34,8,5}
	
	local myTaskValue1,myTaskValue2,myMainValue -- 临时变量，用以记录读到的数值
	-- 用于奖励传入的字符串
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- 奖励物品相对应的数组
	
	local myAwardType = 0
	
	local myAwardArryIndex = 1 -- 用以记录奖励数组里已经记录了多少个
	
	local myRandomNum,myRandomSeed -- 随机数和随机种子
	
	local myCountLinks -- 目前连续完成的链数
	
	local myTimes = tl_gettaskstate(1)
	local myLinks = tl_gettaskstate(2)
	local myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskType = tl_getplayertasktype()
		
	local _nSeed = SetRandSeed(nt_getTask(1037))
	local nTongValue = 0;
	
	if (myGiveAwardType==1) then -- 奖励类型是普通任务奖励

		for i=1,3 do -- 循环选出三个奖励种类
			
			myAwardType,myMainAwardRate = tl_getawardtypeforrate(myMainAwardRate)
			
			tl_print("第 "..i.." 个循环中选择了奖励类型："..myAwardType);
			
			if (myAwardType==1) then -- 如果奖励类型是钱
				
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				
				-- 经过加乘值计算后的任务奖励价值
				myMainValue = myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2
				
				-- 2005/9/20 日修改了金钱的产生比例，为 60% ~ 100% 浮动
				-- 2006/8/23 为越南修改了野叟任务的金钱价值，增加 15%
				myMainValue = floor((myMainValue * 0.05 * 15) * (C_Random(60,100) * 0.01)) + myTaskValue1 -- 计算后得出的实际金钱量
				
				--=======================================
				
				myMainValue = TireReduce(myMainValue);  -- 进行疲劳系统处理；
				myMainValue = CountDoubleMode(myMainValue);  -- 进行双倍活动的处理
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --记录价值量
				
				myAwardMoney = format("%s%s",myMainValue," 金钱");
				
				myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("取得了一个金钱的奖励："..myAwardMoney);
				
			elseif (myAwardType==2) then -- 如果奖励的是经验
			
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- 经过加乘值计算后的任务奖励价值
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				-- 2006/8/23 为越南修改了野叟任务的经验价值，减少 10%
				myMainValue = floor((myMainValue * 3) * (C_Random(80,120) * 0.01)) -- 计算后得出的实际经验值量
				
				--=======================================
				myMainValue = TireReduce(myMainValue);--进行疲劳系统处理；
				myMainValue = CountDoubleMode(myMainValue);  -- 进行双倍活动的处理
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --记录价值量
				
				-- 2007/7/11 为越南防沉迷修改了野叟经验奖励,如果为疲劳状态,将经验存入到物品
				-- 野叟积分中,在非疲劳时使用可以获得经验
				if (GetTiredDegree() == 2) then
					local nTemExp = floor(myMainValue / 1000);
					if (nTemExp < 0) then
						nTemExp = 1;
					end;
					myMainValue = nTemExp * 1000;
				myAwardExp = format("%s%s",myMainValue," 点经验值")
					
					myAwardArry[myAwardArryIndex] = {3,myMainValue,0,6,1,1475,1,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					SetTask(TSK_TASKLINK_SEANSONPOINT, nTemExp);
					
				tl_print("取得了一个经验值的奖励："..myAwardExp);
				else
				myAwardExp = format("%s%s",myMainValue," 点经验值")
					
					myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					
				tl_print("取得了一个经验值的奖励："..myAwardExp);
				end;
				
			elseif (myAwardType==3) then -- 如果奖励的是物品
				
				myTaskValue1 = tl_giveplayeraward_goods(1,Task_AwardBasic) -- 首先得到奖励物品的行数
				
				myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
				myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
				myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
				myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
				myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
				myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
				-- LLG_ALLINONE_TODO_20070802
				
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- 经过加乘值计算后的任务奖励价值
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 2)
				
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --记录价值量
				
				
				myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
				
				myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("取得了一个物品的奖励："..myArawdGoods);
				
			elseif (myAwardType==4) then -- 如果奖励的是重新随机一次的机会
				
				myTaskValue1 = tl_getawardagin() -- 得到加入了金钱和经验的列表后的行数
				
				if (myTaskValue1<=getn(Task_AwardBasic) + 1) then
				
					myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
					myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
					myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
					myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
					myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
					myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
					myAwardChange = "要不要试试看这会是什么呢？"
					
					--=======================================
					myMainValue = TireReduce(myMainValue);--进行疲劳系统处理
					myMainValue = CountDoubleMode(myMainValue);  -- 进行双倍活动的处理
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --记录价值量
					
					if (0 == myMainValue)then
						myMainValue = 1;
					end
	
					myAwardArry[myAwardArryIndex] = {4,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myAwardChange,1}
				
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 2)) then
				
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- 经过加乘值计算后的任务奖励价值
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*1) + myLoops * 0.2)
				
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.1)) -- 计算后得出的实际经验值量
					
					--=======================================
					myMainValue = TireReduce(myMainValue);--进行疲劳系统处理
					myMainValue = CountDoubleMode(myMainValue);  -- 进行双倍活动的处理
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --记录价值量
					
					myAwardChange = "要不要试试看这会是什么呢？"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,2}
					
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 3)) then
	
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- 经过加乘值计算后的任务奖励价值
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*1) + myLoops * 0.2)
					
					--=======================================
					myMainValue = TireReduce(myMainValue); --进行疲劳系统处理；
					myMainValue = CountDoubleMode(myMainValue);  -- 进行双倍活动的处理
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --记录价值量
					
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.1)) -- 计算后得出的实际金钱量
				
					myAwardChange = "要不要试试看这会是什么呢？"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,3}
									
				end
				
				myAwardArryIndex = myAwardArryIndex + 1
			
			elseif (myAwardType==5) then -- 如果奖励的是一次取消任务的机会
			
				myAwardCancal = "一次取消任务的机会"
				myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardCancal,0}
				myAwardArryIndex = myAwardArryIndex + 1	
			
			end
		end
	
		SetRandSeed(_nSeed)
		-- 返回已经构造好的奖励数组
		return myAwardArry, nTongValue;

	elseif (myGiveAwardType==2) then -- 奖励类型是链奖励
	
		myTaskValue1 = tl_giveplayeraward_goods(2,Task_AwardLink) -- 首先得到奖励物品的行数
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"GoodsFive"))
		
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("在链奖励中取得了一个物品的奖励："..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle
			
	elseif (myGiveAwardType==3) then -- 奖励类型是环奖励
	
		tl_print ("开始进行任务链环奖励的选择！");

		myTaskValue1 = tl_giveplayeraward_goods(3,Task_AwardLoop) -- 首先得到奖励物品的行数
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"GoodsFive"))
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("在环奖励中取得了一个物品的奖励："..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle

	end
	SetRandSeed(_nSeed)
end


-- 子函数，根据奖励链剩余的类型取出奖励
function tl_getawardtypeforrate(myAwardRate)

	local i,j,k = 0,0,0
	local myAwardMainRate = 0
	
	for i=1,getn(myAwardRate) do
		myAwardMainRate = myAwardMainRate + myAwardRate[i]
	end
	
	j=C_Random(1,myAwardMainRate)
	
tl_print ("目前奖励类型的总数为："..myAwardMainRate);
	
tl_print ("选择了一个奖励类型随机数："..j);
	
	for i=1,getn(myAwardRate) do
		k = k + myAwardRate[i]
		if (j<=k) then
			myAwardRate[i] = 0 -- 在全局变量 TL_MainAwardRate 中减去一个值
		tl_print ("选择了奖励类型链中的第 "..i.."行。");
			return i,myAwardRate
		end
	end

 tl_print ("脚本选取任务奖励类型时出错！");

end


-- 搜寻奖励列表，得到相应的奖励
-- myAwardType：奖励的类型
-- myAwardOrgTable：传入的原始奖励数据列表
-- 1：任务基本奖励 2：任务链完成奖励 3:任务环完成奖励
function tl_giveplayeraward_goods(myAwardType,myAwardOrgTable)

local myTaskValue1,myTaskValue2 -- 从任务表格里读取的任务奖励价值
local myLinks,myTimes,myLoops,myCountLinks -- 连续完成的次数与链数
local myMainValue -- 经过加乘值计算后的任务奖励价值
local myTaskType = tl_getplayertasktype()

local myAwardTable

local FinalAward,n -- 最终返回的奖励
	
	myTimes = tl_gettaskstate(1)
	myLinks = tl_gettaskstate(2)
	myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	
	-- 经过加乘值计算后的任务奖励价值
	if (myAwardType==1) then
		myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1 + myLoops * 0.2))
		myMainValue = myMainValue * (tl_getplayerlucky() * 0.01 + 1)
	elseif (myAwardType==2) or (myAwardType==3) then
		myMainValue = 2000000
	end
	
	--=======================================
	myMainValue = TireReduce(myMainValue);--进行疲劳系统处理
	myMainValue = CountDoubleMode(myMainValue);  -- 进行双倍活动的处理
	
	if (0 == myMainValue)then
		myMainValue = 1;
	end
	
	myAwardTable = AssignValue_AwardRate(myAwardOrgTable,myMainValue)

n = tl_getaward(myAwardTable)

return n -- 返回奖励所在的行数

end


-- 如果选择了重新随机一次的话则调用此函数
function tl_getawardagin()

tl_print ("开始进行再随机一次的奖励计算！");

local myMainValue,myTaskValue1,myTaskValue2,myOrgValue
local myTaskType = tl_getplayertasktype()
local myAwardExp,myAwardMoney
local myAwardAddTable = {{0,0},{0,0}}

local myReAwardTable = {}
myReAwardTable[1] = {}

local myTimes = tl_gettaskstate(1)
local myLinks = tl_gettaskstate(2)
local myLoops = tl_gettaskstate(3)

local n

	for i = 1,getn(Task_AwardBasic) + 2 do
		myReAwardTable[i]={}
	end
	
	myCountLinks = tl_counttasklinknum(2)

	myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	-- 经过加乘值计算后的任务奖励价值
	myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*1) + myLoops * 0.2)
	myMainValue = myMainValue * (tl_getplayerlucky() * 0.03 + 1)
	myOrgValue = myMainValue; -- 这是用于传进去选择物品的基础价值量
	
	tl_print ("开始进行再随机一次的奖励计算，任务的总奖励价值为："..myMainValue);
	
	myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.1)) -- 计算后得出的实际经验值量
	myAwardExp = myMainValue
	
	myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.1)) -- 计算后得出的实际的金钱量
	myAwardMoney = myMainValue
	
	myAwardAddTable[1][1] = getn(Task_AwardBasic) + 1
	myAwardAddTable[1][2] = myAwardExp
	
	myAwardAddTable[2][1] = getn(Task_AwardBasic) + 2
	myAwardAddTable[2][2] = myAwardMoney
	
	for i = 1,getn(Task_AwardBasic) do
		myReAwardTable[i][1] = Task_AwardBasic[i][1]
		myReAwardTable[i][2] = Task_AwardBasic[i][2]
	end
	
	myReAwardTable[(getn(Task_AwardBasic) + 1)] = {myAwardAddTable[1][1],myAwardAddTable[1][2]}
	myReAwardTable[(getn(Task_AwardBasic) + 2)] = {myAwardAddTable[2][1],myAwardAddTable[2][2]}
	
	tl_print ("传入的计算权重的奖励价值量为: "..myMainValue);
	
	myReAwardTable = AssignValue_AwardRate(myReAwardTable,myOrgValue * 1.2)
	
	tl_print ("经过计算后的表格元素数量为："..getn(myReAwardTable));
	
	n = tl_getaward(myReAwardTable)
	
	return n

end


-- 在已经形成权重列表的奖励中挑选出一个奖励，返回值为奖励所在的表格行数
function tl_getaward(myAwardVariable)

local i,j,k = 0,0,0
local myMainRate = 0 -- 总的奖励权重

	tl_print ("在选取奖励表格行数时得到的传入数组元素有："..getn(myAwardVariable));

	for i=1,getn(myAwardVariable) do
		myMainRate = myMainRate + myAwardVariable[i][2]
	end

	j = C_Random(1, 100)/100 * myMainRate
	
	tl_print ("在选取奖励表格行数时得出了一个随机数"..j);
	
	for i=1,getn(myAwardVariable) do
		k = k + myAwardVariable[i][2]
		
		tl_print ("在选取奖励表格行数时 k 的值为："..k);
		
		if (j<k) then
			return myAwardVariable[i][1]
		end
	end

end


-- 给予玩家固定次数的奖励，直接发予玩家
-- 传入参数为原始数据表，当前完成的次数
function tl_getlinkaward(orgLinkAward, nTask)

local i,j,nAward = 0,0,0;
local decLinkAward = {}; -- 行数，权重

local k,nRate = 0,0; -- 用于计算权重的两个数

local nAwardCol = 0; -- 获取到的表格行数

local nGoods = {"",0,0,0,0,0,0,0};

	for i=1, getn(orgLinkAward) do
	
		if (nTask == orgLinkAward[i][1]) then -- 到达了符合发奖的次数
			nAward = nAward + 1;
			--decLinkAward[nAward][1] = orgLinkAward[i][2];
			--decLinkAward[nAward][2] = orgLinkAward[i][3];
			tinsert(decLinkAward, nAward, {orgLinkAward[i][2], orgLinkAward[i][3]});
		end;
	
	end;
	
	if (nAward==0) then -- 一个奖励都没有的话就返回咯
		-- storm_ask2start(4, 1)	--Storm 开始挑战
		return
	end
	
	if (getn(decLinkAward)>0) then
	
		for i=1, getn(decLinkAward) do
			nRate = nRate + decLinkAward[i][2];
		end;
		
		j = C_Random(1, nRate);
		
		for i=1, getn(decLinkAward) do
			k = k + decLinkAward[i][2];
			if (j<=k) then
				nAwardCol = decLinkAward[i][1];
				break;
			end;
		end;
		
		nGoods[1] = TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Name");
		nGoods[2] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Quality"));
		nGoods[3] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Genre"));
		nGoods[4] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Detail"));
		nGoods[5] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Particular"));
		nGoods[6] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Level"));
		nGoods[7] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "GoodsFive"));
		nGoods[8] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Magiclevel"));
		
		if (nGoods[2]==1) then
			AddGoldItem(0, nGoods[3]);
			Msg2Player("恭喜您！你因为完成了 "..nTask.." 次任务得到了一个"..nGoods[1].."！！！");
			Say("野叟：嗯……年轻人干的不错，我现在把我的家藏之宝<color=yellow>"..nGoods[1].."<color>送给你吧，以后可要继续努力哦！", 0);
			AddGlobalCountNews("公告：玩家 "..GetName().." 因为完成了 "..nTask.." 次任务在野叟处得到了黄金装备 "..nGoods[1].." 一件！！！", 3);
			
			WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."在任务链奖励中得到了黄金装备"..nGoods[1])
			
		else
			AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
			Msg2Player("恭喜您！你因为完成了 "..nTask.." 次任务得到了一个"..nGoods[1].."！！！");
			
			if (nTask >= 100) then -- 如果任务次数大于 100 才写 LOG
				TaskLink_WriteLog(nTask, nGoods[1]);
			end;
			
			Say("野叟：嗯……年轻人干的不错，我现在把我的家藏之宝<color=yellow>"..nGoods[1].."<color>送给你吧，以后可要继续努力哦！", 0);
		end;
		
	else
	
		-- storm_ask2start(4, 1)	--Storm 开始挑战
		return
	
	end;

end


-- 获取玩家的幸运值
function tl_getplayerlucky()

local nLucky = GetLucky(0);

	if (nLucky~=nil) and (nLucky~=0) then
		return nLucky
	else
		return 1
	end;
	
end;


-- 建立奖励权重索引表
-- 传入参数：myTaskVariable 是原始的奖励价值列表，myAwardValue 是计算后的物品总价值量
-- 返回值为每个奖励的表格文件行号索引与其权重
function AssignValue_AwardRate(myAwardVariable,myAwardValue)

local i,j,k = 0,0,0
local myAwardRate = {{}} -- 转换后的权重表
local myAwardNum = getn(myAwardVariable)
	
	for i = 1,myAwardNum do
		myAwardRate[i]={}
	end
	
	for i=1,myAwardNum do
	
		k = i + 1 -- 为保持表格行数的对应所以用 k 
	
		myAwardRate[i][2] = myAwardVariable[i][2]
		
		if (myAwardValue > myAwardVariable[i][2]) then
			myAwardRate[i][2] = myAwardValue
		end
		
		j = myAwardValue / ( myAwardNum * (myAwardRate[i][2]) ) 
		
		myAwardRate[i] = {k,j}
		
	end
	
	return myAwardRate
	
end

-- 构造固定次数奖励的内存列表
function AssignValue_LinkAward(myTaskTextID)

local i,j = 0,0;
local myLinkAward = {{0,0,0}}; -- 内存列表，任务次数、表格行数、权重

local myTableRow = TabFile_GetRowCount(myTaskTextID)
local nTaskNum = 0;

	for i=1,myTableRow - 1 do
		myLinkAward[i] = {0,0,0};
	end;

	for i=2, myTableRow do
		j = j + 1;
		nTaskNum = tonumber(TabFile_GetCell(myTaskTextID, i, "Num"));
		myLinkAward[j][1] = nTaskNum;
		myLinkAward[j][2] = i;
		myLinkAward[j][3] = tonumber(TabFile_GetCell(myTaskTextID, i, "TaskValue"));
	end;
	
	return myLinkAward;
	
end


-- 任务链写入 LOG 
function TaskLink_WriteLog(nTask, strGoods)

	WriteLog("[任务链奖励记录]"..date("[%y年%m月%d日%H时%M分]").."：账号"..GetAccount().."，角色"..GetName().."因为完成了 "..nTask.." 次任务在任务链奖励中得到了任务奖励"..strGoods);

end

-- 防疲劳系统衰减函数
function TireReduce(myMainValue)
--	Msg2Player("原始价值量："..myMainValue);
	if (nil == myMainValue) 
		then return 0; 
	end
	local Value = myMainValue;
	local TireDegree = GetTiredDegree();
	TireDegree = 0;
	if (1 == TireDegree) then
		Value = floor(Value / 2);
	elseif (2 == TireDegree) then
		Value = 0;
	end
	
--	Msg2Player("防沉迷处理后价值量："..Value);
	return Value;
end


-- 双倍活动的模式
-- 传入参数：int:nValue 所要计算的价值量
function CountDoubleMode(nValue)

local nDoubleMode = greatnight_huang_event(4);

	if nDoubleMode~=0 or nDoubleMode~=nil then
		return nValue*nDoubleMode;
	else
		return nValue;
	end;

end;

-- 读取表的数据,每次都又多处操作,写成一个函数
function getawardgoodsdata(nIndex)
	local	myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Quality"))
	local	myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Genre"))
	local	myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Detail"))
	local	myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Particular"))
	local	myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Level"))
	local	myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"GoodsFive"))
	local	myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,nIndex,"Name")
	return myQuality, myGenre, myDetail, myParticular, myLevel, myGoodsFive, myArawdGoods;
end;

--function GetTiredDegree()
--	return 1;
--end