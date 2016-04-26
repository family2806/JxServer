-- 野叟任务链脚本
-- Edited by peres
-- 2004/12/24 圣诞节前夜

IncludeLib("FILESYS");
IncludeLib("RELAYLADDER");	--排行榜
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua"); -- 任务链的头文件
Include("\\script\\task\\newtask\\tasklink\\tasklink_award.lua"); -- 任务链的奖励头文件
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--Storm 真正的接新任务
function storm_goon_start(gameid, b_nonext)
	
	local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
		-- 每天的限制次数 +1
		nNum = nNum + 1;
		SetTask(ID_TASKLINK_LIMITNUM, nNum);
		
	if b_nonext then return end
	tl_dealtask()
	Task_MainDialog()
end

-- 检测任务是否已经过了每天的限制
function checkTask_Limit()
	
-- 每天限制次数的处理
local nNowDate = tonumber(GetLocalDate("%y%m%d"));
local nOldDate = GetTask(ID_TASKLINK_LIMITDATE);
local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
	if nNowDate~=nOldDate then
		
		SetTask(ID_TASKLINK_LIMITDATE, tonumber(GetLocalDate("%y%m%d")) );
		SetTask(ID_TASKLINK_LIMITNUM, 0);
		SetTask(ID_TASKLINK_LIMITCancelCount, 0);
		return 1;
		
	else
		-- 200 次的限制
		if nNum>=200 then
			Say("哈哈！少侠，每天做200次就够了！明天再来吧!", 0);
			return 0;
		end;
		
		return 1;

	end;
	
end;
	
	
--Task_BuyGoods = {}
--Task_FindGoods = {}
--Task_ShowGoods = {}
--Task_FindMaps = {}
--Task_UpGround = {}
--Task_WorldMaps = {}
--Task_Level = {}
--Task_MainLevelRate = {}


-- 构造任务内存变量
Task_BuyGoods = AssignValue(Task_BuyGoods,TL_BUYGOODS)
Task_FindGoods = AssignValue(Task_FindGoods,TL_FINDGOODS)
Task_ShowGoods = AssignValue(Task_ShowGoods,TL_SHOWGOODS)
Task_FindMaps = AssignValue(Task_FindMaps,TL_FINDMAPS)
Task_UpGround = AssignValue(Task_UpGround,TL_UPGROUND)
Task_WorldMaps = AssignValue(Task_WorldMaps,TL_WORLDMAPS)

Task_MainTaskLink = AssignValue_TaskLink(Task_MainTaskLink,TL_LEVELLINK)
Task_MainLevelRate = AssignValue_TaskRate(Task_MainLevelRate,TL_MAINTASKLEVEL)

-- 构造奖励内存变量
Task_AwardBasic = AssignValue_Award(Task_AwardBasic,TL_AWARDBASIC)

-- 构造完成次数的奖励
Task_AwardLink = AssignValue_LinkAward(TL_AWARDLINK)

Task_AwardLoop = AssignValue_Award(Task_AwardLoop,TL_AWARDLOOP)

-- 构造对话内容内存变量
Task_TalkGoods = AssignValue_TaskTalk(Task_TalkGoods,TL_TASKGOODSTALK)
Task_TalkBuy = AssignValue_TaskTalk(Task_TalkBuy,TL_TASKBUYTALK)
Task_TalkShow = AssignValue_TaskTalk(Task_TalkShow,TL_TASKSHOWTALK)
Task_TalkFind = AssignValue_TaskTalk(Task_TalkFind,TL_TASKFINDMAPS)
Task_TalkUp = AssignValue_TaskTalk(Task_TalkUp,TL_TASKUPGROUNDTALK)
Task_TalkWorld = AssignValue_TaskTalk(Task_TalkWorld,TL_TASKWORLDTALK)


function Task_NewVersionAward()
	
	local nNum = GetTask(ID_TASKLINK_LIMITNUM);
	local nCancelNum = GetTask(ID_TASKLINK_LIMITCancelCount);
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "yesourenwu")
	G_ACTIVITY:OnMessage("FinishYesou", nNum, nCancelNum);
	
	-- 每天完成第30个额外奖励
	if (nNum - nCancelNum) == 30 then
		Msg2Player("今天完成野叟任务第30次，多获得经验!");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 30000000}, "每日完成野叟任务经验奖励")
	end
	
	-- 每天完成第40个额外奖励
	if (nNum == 40 and nCancelNum) == 0 then
		Msg2Player("今天联系完成野叟任务第40级，获得额外经验!");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 100000000}, "每日完成野叟任务经验奖励")
	end	
	
end


function main()

	--有盂兰节活动期间对话。
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 60808 and nDate <= 60815) then
		local tab_Content = {
			"看还有什么任务要做的吗？/tasklink_entence",
		}
		tinsert(tab_Content, "我想做一个莲花环/menglanjie");
		tinsert(tab_Content, "离开/Task_Wait");
		Say("近几年，战争连绵，民情痛苦。少林方丈想举行斋戒活动来庆祝羽蓝节，让大家都享受一下平安。", getn(tab_Content), tab_Content);
		return
	end;
	
	tasklink_entence();
end;

function menglanjie()
	if (GetExtPoint(0) <= 0 or GetLevel() < 30) then
		Say("对不起，只有玩家到了<color=red>30级, 充值<color> 才能参加该活动", 0)
		return 
	end;
	local tab_Content = {
		"我想合成金莲花环[需要 9个金莲花]/#process(1)",
		"我想合成木莲花环[需要 9个木莲花]/#process(2)",
		"我想合成水莲花环[需要 9个水莲花]/#process(3)",
		"我想合成火莲花环[需要 9个火莲花]/#process(4)",
		"我想合成土莲花环[需要 9个土莲花]/#process(5)",
		"只是来看望你一下而已!/Task_Wait"
	}
	Say("只需要你去收集足够的莲花数量<color=yellow>"..MAKING_COST.."<color> 我将帮你合成绝美的花环. 但是，注意：每天只能合成2个同一属性的莲花环而已.", getn(tab_Content), tab_Content);
end;

--{name, product}
MAKING_COST = 10000;
MAKING_COUNT = 9;
tab_Flower = {
	{1126, "金", 1131, 1760, 1761}, {1127, "木", 1132, 1762, 1763}, {1128, "水 ", 1133, 1764, 1765}, {1129, "火", 1134, 1766, 1767}, {1130, "土", 1135, 1768, 1769}
}

function process(nIdx)
	if (nIdx < 1 or nIdx > getn(tab_Flower)) then
		return
	end;
	
	local nIndex;
	if (nIdx == 1) then
		nIndex = 1;
	elseif (nIdx == 2) then
		nIndex = 2;
	elseif (nIdx == 3) then
		nIndex = 3;
	elseif (nIdx == 4) then
		nIndex = 4;
	elseif (nIdx == 5) then
		nIndex = 5;
	end;
	
	Say("想做一个环 <color=yellow>"..tab_Flower[nIdx][2].." 莲花<color> 需要9级<color=yellow>"..tab_Flower[nIdx][2].."莲花<color>. 你确定做??", 2, "对，请老前辈帮忙!/#make_round("..nIndex..")", "我稍候回来!/Task_Wait");
end;

function make_round(nIdx)
	if (GetCash() < MAKING_COST) then
		Say("请找够10000两，然后回来，我在这等!", 1, "可以！我去拿多点钱!/Task_Wait");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(6,1,tab_Flower[nIdx][1],-1);
	if (nCount < 9) then
		Say("你好像没够<color=yellow>"..tab_Flower[nIdx][2].." 莲花<color=yellow>. 不足9 <color=yellow>"..tab_Flower[nIdx][2].." 莲花<color> 那我就不能帮你合成花环了"..tab_Flower[nIdx][2].." 莲花环", 1, "让我先去准备!/Task_Wait");
		return
	end;
	
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate ~= GetTask(tab_Flower[nIdx][4])) then
		SetTask(tab_Flower[nIdx][4], nDate);
		SetTask(tab_Flower[nIdx][5], 0);
	end;
	
	local nTimes = GetTask(tab_Flower[nIdx][5]);
	if (nTimes >= 2) then
		Say(tab_Flower[nIdx][2].."今天已成功合成2个花环了，明天再来吧!", 0)
		return
	end;
	
	Pay(MAKING_COST);
	ConsumeEquiproomItem(9, 6, 1, tab_Flower[nIdx][1], -1);
	SetTask(tab_Flower[nIdx][5], nTimes + 1);
	AddItem(6, 1, tab_Flower[nIdx][3], 1, 0, 0, 0);
	Say("V遪g "..tab_Flower[nIdx][2].." 你的莲花已做好，快拿他去礼官那里吧!", 1, "领花环/Task_Wait");
	Msg2Player("你获得一个"..tab_Flower[nIdx][2].." 莲花环");
end;
    
-- 任务链的入口
function tasklink_entence()

_TaskLinkDebug() -- 对于任务链无法进行下去的 BUG 修复

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数

local myCountLinks
local myCountTimes

local myCanceled = nt_getTask(1036)
local myTaskTime = GetGameTime() -- 获取游戏时间，用以判断玩家是否被封
local n = myTaskTime - nt_getTask(1029)
local myTaskInfo = ""


-- 如果玩家当前的状态为还未发奖的话，则重新发奖
if (tl_gettaskcourse() == 2) then
	Task_GiveAward()
	return
end

	if ( myCanceled == 10) then
		if (n < 605) then
			Task_Punish()
			return
		else
			myCanceled = 0
			nt_setTask(1036,0)
			Task_Confirm()
		end
	end

	if (tl_gettaskcourse() == 0) then
		-- 如果还没有开始野叟的任务链的话
		Say("野叟：这位"..GetPlayerSex().."看来闯荡江湖也有一段时间了，可否有兴趣来参加我的<color=yellow>“环环链链相般配，层层迭迭取厚礼”<color>的任务考验呢？",3,"好呀，我就不信有什么任务能难得倒我的/Task_Confirm","我想知道你说的考验是个什么样子/Task_Info","我还有事，没空和你在这闲扯/Task_Exit");
	end
	
	if (tl_gettaskcourse() == 3) then

		-- 检测是否超过每天的限制
		if checkTask_Limit()~=1 then return end;
	
		myCountLinks = tl_counttasklinknum(2)
		myCountTimes = tl_counttasklinknum(1)
		
		Say("野叟：<enter>这位"..GetPlayerSex().."已经完成了 <color=yellow>"..myCountTimes.."<color> 次我所给你的任务，不知你还有没有兴趣继续接着做下去呢？",2,"当然，快让我知道下一个任务是什么/Task_TaskProcess","还是让我歇一会儿吧，我还有别的事情/Task_Wait");
	elseif (tl_gettaskcourse() == 1) then
		Task_MainDialog()
	end

end

-- 答应了野叟的考验，正式开始任务链
function Task_Confirm()

local myTaskID

-- 设置任务变量的数值，1020 号变量为任务链状态专用变量，其中的四个字节分别定义为：| ①次数 | ②链数 | ③环数 | ④取消剩余次数 |

tl_settaskstate(1,0) -- 正在进行第一次任务
tl_settaskstate(2,tl_getfirstlink()) -- 正在进行第一链任务
tl_settaskstate(3,tl_getfirstloop()) -- 正在进行第一环任务

tl_settaskstate(4,0) -- 剩余 0 次取消任务的机会
nt_setTask(DEBUG_TASKVALUE, 0);

tl_settaskstate(6,0)

storm_ask2start(4)	--Storm 开始挑战
tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuDaTau")
end


-- 进行下一次任务
function Task_TaskProcess()

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数


-- 检测是否超过每天的限制
if checkTask_Limit()~=1 then return end;

tl_taskprocess() -- 首先执行下一轮函数

storm_goon_start()	--Storm恢复

end


-- 任务链的主要控制面版
function Task_MainDialog()

local myTaskInfo = tl_gettaskinfo() -- 任务的详细信息
local myTaskTotalNum = tl_counttasklinknum(1) + 1; -- 总任务次数统计
local myTitleText = "";

if (myTaskInfo == nil) then
	myTaskInfo = ""
end

-- 设置任务状态为已经接了任务但未完成
tl_settaskcourse(1)


if myTaskTotalNum==0 or myTaskTotalNum==nil then
	myTitleText = "野叟：<enter><enter>"..myTaskInfo;
else
	myTitleText = "野叟：<enter><enter>这是第 <color=green>"..myTaskTotalNum.."<color> 个任务，"..myTaskInfo;
end;

Say(myTitleText,
	4,
		"知道了，等我完成任务后再来找你/Task_Wait",
		"我已经完成了这次的任务，请你验收吧！/Task_Accept",
		"这次任务也太难了，我想取消掉不做了/Task_CancelConfirm",
		"我想知道你说的考验是个什么样子/Task_Info"
	);

-- 设置取消任务的标记为可以取消
nt_setTask(1045, 1);

end


-- 取消任务时给予玩家一次确认的机会
function Task_CancelConfirm()

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数

local myCountTimes = tl_counttasklinknum(1);  -- 玩家进行的任务总数

if (myTaskCancel==0) then
	
	Say("野叟：您现在一次取消的机会也没有，这样一来你就必须得从头开始喔！而且你之前的奖励累积就会重新开始计数。",
		3,
		"是的，我就是不想做这个鬼任务/Task_NormalCancel",
		"我想用 100 张山河社稷图残片来取消这次任务/#Task_Cancel(2)",
		"嗯……那就让我再想想吧/Task_Wait");
	
else
	
	Say("野叟：您现在还有 "..myTaskCancel.." 次取消任务的机会，你确定要取消这次任务吗？",
		2,
		"是的，我就是不想做这个鬼任务/#Task_Cancel(1)",
		"嗯……那就让我再想想吧/Task_Wait");
	
end

end


-- 正常的取消方式再确认一次
function Task_NormalCancel()

Say("野叟：你想好了真的要取消这次任务吗？",2,"不要啰唆了，我就是不想做这个鬼任务/#Task_Cancel(1)","那还是让我再想想吧/Task_Wait");

end;


-- 1000 次以上的任务取消时需要放水晶
function Task_TotalCancel()
	GiveItemUI("交水晶给野叟", "如果你已经决定放弃任务，我也不拦你，请放入绿水晶!", "Task_TotalCancel_Main", "Task_Wait");
end;


function Task_TotalCancel_Main(nCount)
	
	local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = 0,0,0,0,0,0;
	local nIndex = 0;
	
	if nCount~=1 then
		Say("野叟：你给我什么东西呢？我只需要<color=yellow>1 块绿水晶<color> 而已!", 0);
		return
	end;
	
	nIndex = GetGiveItemUnit(1);
	nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
	
	if nGenre==4 and nDetail==240 and nParticular==1 then
		Task_Cancel(1);  -- 全部取消
	else
		Say("野叟：你给我什么东西呢？我只需要<color=yellow>1 块绿水晶<color> 而已!", 0);
		return		
	end;
	
end;


-- 显示玩家当前的任务所进行的程度（调试用）
function Task_ProcessInfo()

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数

local myTaskType = tl_getplayertasktype()

local myTimes = tl_gettaskstate(1)
local myLinks = tl_gettaskstate(2)

local myCountTimes = tl_counttasklinknum(1)

-- local myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
-- local myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	

-- local myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1))

-- local myMainValueText1 = "你目前的任务物品价值为: "..myTaskValue1.."  任务价值为: "..myTaskValue2.."<enter>".."你现在的任务总价值量为: "..myMainValue

--	Say("野叟：你现在进行到了第 "..myTaskLoops.." 环中的第 "..myTaskLinks.." 链中的第 "..myTaskTimes.." 次。<enter>你连续进行的次数为："..tl_counttasklinknum(1).." 次<enter>你连续进行的链数为："..tl_counttasklinknum(2).." 链<enter>"..myMainValueText1,0);

	Say("野叟：你现在已经完成了 <color=yellow>"..myCountTimes.."<color> 次我所给你的任务，还请继续努力哦！", 0);

end


-- 玩家已经完成任务前来给野叟验收
function Task_Accept()
	--2007-09-19 增加物品奖励时的背包空间判断
	if (CalcFreeItemCellCount() < 5) then
		Say("背包空间不足，请整理出5个格以上.",0);
		return
	end;
local myTaskType = tl_getplayertasktype()

	if (myTaskType == 1) then
		GiveItemUI("寻找物品任务","野叟：哦？我让你去买的东西你给我买到了吗？","Task_Accept_01","Task_Wait");
	elseif (myTaskType == 2) then
		GiveItemUI("购买物品任务","野叟：哦？我让你去找的东西你给我找到了吗？","Task_Accept_02","Task_Wait");
	elseif (myTaskType == 3) then
		GiveItemUI("物品展示任务","野叟：哦？我让你去找的东西你给我找到了吗？","Task_Accept_03","Task_Wait");
	elseif (myTaskType == 4) then
		Task_Accept_04()
	elseif (myTaskType == 5) then
		Task_Accept_05()
	elseif (myTaskType == 6) then
		Task_Accept_06()
	else -- 异常处理
		Say("野叟：你现在所做的东西还没有达到我的要求哦，还是请你再努力吧！",0);
	end

end


-- 任务一的判断处理
function Task_Accept_01(nCount)
local myTaskGoods
local ItemGenre,DetailType,ParticularType,Level,nSeries,Luck

if ( nCount > 1 ) then
	Say("野叟：这位"..GetPlayerSex().."，你一次放这么多东西进来我是看得目不暇接呀，还是慢慢来吧……",0);
	return 0
elseif ( nCount == 0) then
	Say("野叟：这位"..GetPlayerSex().."，你……真的放有东西在里面吗？是不是我老花了眼呀？",0);
	return 0
end

	ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
--	magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
	myTaskGoods = {ItemGenre,DetailType,ParticularType,nSeries,Level}
	
--	tl_print ("野叟检验了物品："..ItemGenre..DetailType..ParticularType..nSeries..Level)
	
	if (tl_checktask(myTaskGoods) == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- 删除玩家身上的物品
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("野叟：你现在所给的东西还没有达到我的要求哦，还是请你再努力吧！",0);
	end
end


-- 任务二的判断处理
function Task_Accept_02(nCount)

local myTaskGoods
local ItemGenre, DetailType, ParticularType, Level, nSeries, Luck
local magictype,p1,p2,p3
local i,n,m = 0,0,0

if ( nCount > 1 ) then
	Say("野叟：这位"..GetPlayerSex().."，你一次放这么多东西进来我是看得目不暇接呀，还是慢慢来吧……",0);
	return 0
elseif ( nCount == 0) then
	Say("野叟：这位"..GetPlayerSex().."，你……真的放有东西在里面吗？是不是我老花了眼呀？",0);
	return 0
end

	for i=1,6 do
		ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
		magictype , p1, p2, p3 = GetItemMagicAttrib(GetGiveItemUnit(1), i)
		myTaskGoods = {ItemGenre,DetailType,ParticularType,Level,nSeries,magictype,p1,p2,p3}
--		tl_print("检验了魔法属性 "..i.." :".." 魔法 ID 为: "..magictype.."  魔法参数1为: "..p1.."  魔法参数2为: "..p2.." 魔法参数3为: "..p3);
		n = tl_checktask(myTaskGoods)
		if (n == 1) then
			m = 1
		end
	end
	
	if (m == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- 删除玩家身上的物品
		Task_AwardRecord()
		Task_GiveAward()
	else
		Say("野叟：你现在所给的东西还没有达到我的要求哦，还是请你再努力吧！",0);
	end
	
end


-- 任务三的判断处理
function Task_Accept_03(nCount)

local myTaskGoods
local magictype,p1,p2,p3
local i,n,m = 0,0,0

if ( nCount > 1 ) then
	Say("野叟：这位"..GetPlayerSex().."，你一次放这么多东西进来我是看得目不暇接呀，还是慢慢来吧……",0);
	return 0
elseif ( nCount == 0) then
	Say("野叟：这位"..GetPlayerSex().."，你……真的放有东西在里面吗？是不是我老花了眼呀？",0);
	return 0
end

	for i=1,6 do -- 循环历遍所有的魔法属性看看是否有合适的
		magictype,p1,p2,p3 = GetItemMagicAttrib(GetGiveItemUnit(1),i)
		myTaskGoods = {magictype,p1,p2,p3}
		n = tl_checktask(myTaskGoods)
		if (n == 1) then
			m = 1
		end
	end	

	if (m == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("野叟：你现在所给的东西还没有达到我的要求哦，还是请你再努力吧！",0);
	end
	
end


-- 任务四的判断处理
function Task_Accept_04()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("野叟：你现在所做的事情还没有达到我的要求哦，还是请你再努力吧！",0);
	end
	
end


-- 任务五的判断处理
function Task_Accept_05()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("野叟：你现在所做的事情还没有达到我的要求哦，还是请你再努力吧！",0);
	end
	
end



-- 任务六的判断处理
function Task_Accept_06()
	
	if (tl_checktask()==1) then
		Task_AwardRecord()
		Task_GiveAward()
		return 1
	else
		Say("野叟：哈哈哈……这位"..GetPlayerSex().."，某虽不才，但也明白江湖上讲的是一个信字，你都还没有收集完我所要求的山河社稷图残片怎么就想来领赏了呢？",0);
		return 0
	end

end



-- 玩家选择取消任务的处理
-- 传入参数 nType：取消任务的方法，1为用取消机会来取消，2为用 100 张山河社稷图碎片来取消
function Task_Cancel(nType)

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数
local myCanceled = nt_getTask(1036) -- 玩家已经恶意取消了多少次
local myMapNum = nt_getTask(1027) -- 看看玩家身上有多少个山河社稷图残片

local myNewCancel = GetTask(DEBUG_TASKVALUE);  -- 备份的取消机会

local nTotalTaskNum = tl_counttasklinknum(1); -- 获取当前玩家一共做了多少次任务

-- 如果不是从主面版进入的状态，则不能进行以下的取消过程
if nt_getTask(1045)~=1 then
	return
end;

-- 判断是否存在刷取消机会的行为
if _CancelTaskDebug()~=1 then
	Say("野叟：嗯……年轻人，好像你已经没有取消机会了哦！", 0);
	return
end;

-- 检测是否超过每天的限制
if checkTask_Limit()~=1 then return end;

	if (nType==2) then
		if (myMapNum>=100) then
			myMapNum = myMapNum - 100;
			nt_setTask(1027, myMapNum);
			myTaskCancel = myTaskCancel + 1;
			Msg2Player("您使用了 100 张山河社稷图残片来取消一次任务！");
			Msg2Player("您现在的山河社稷图残片还剩 "..myMapNum.." 张！");
		else
			Say("野叟：你……你……你真的带有 <color=yellow>100<color> 张山河社稷图残片来吗？我没看眼花吧？",0);
			return
		end;
	end;

	if (myTaskTimes == 0) and (myTaskLinks == tl_getfirstlink()) then
	
		if (myTaskCancel == 0) then
		
			myCanceled = myCanceled + 1
			nt_setTask(1036,myCanceled)
	
			if ( myCanceled > 2) then -- 如果玩家连续在初期取消了三次任务，则作处罚
				myCanceled = 10	
				nt_setTask(1036,myCanceled)
				nt_setTask(1029,GetGameTime())
				Task_Punish()
				
				return
				
			end
			
		end
		
		-- 重新随机派发新的任务
		SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- 增加当天的取消次数
		storm_ask2start(4)	--Storm 开始挑战
		
		return
		
	end

	if (myTaskCancel >= 1) then -- 如果玩家还有机会取消的话则继续随机当前等级的任务
	
		-- 写入取消任务时的 LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
		
		myTaskCancel = myTaskCancel - 1
		
		tl_settaskstate(4,myTaskCancel)
		
		nt_setTask(DEBUG_TASKVALUE, myTaskCancel);
			
	else
		-- 写入取消任务时的 LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
	
		tl_settaskstate(1,0) -- 正在进行第一次任务
		tl_settaskstate(2,tl_getfirstlink()) -- 正在进行第一链任务
		tl_settaskstate(3,0) -- 从第 0 环开始
		
		tl_settaskstate(4,0) -- 剩余 0 次取消任务的机会
		nt_setTask(DEBUG_TASKVALUE, 0);
		
		tl_settaskstate(6,0) -- 当前的链进行了 0 次
		nt_setTask(1036,0) -- 惩罚次数累积变为 0 
		-- 在这里记录一下任务的总数
		nt_setTask(1044, tl_counttasklinknum(1));
		
		Msg2Player("<color=yellow>野叟任务已经完全删除了，现在需要从头开始做任务<color>!");
	end
	
	-- 设置取消任务的标记为不可以取消
	nt_setTask(1045, 2);
	
	-- 重新随机派发新的任务
	SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- 增加当天的取消次数
	storm_ask2start(4)	--Storm 开始挑战
end;


-- 听野叟解释整个任务链的过程与方法
function Task_Info()
	Talk(4,
		"main",
		"野叟：我这次安排的考验分为各种不同类型的小任务来检验各位武林人士的武术与耐力。",
		"野叟：每完成一次任务都有<color=red>相应的奖励<color>等着各位，至于能连续达成<color=red>一千次<color>任务的人则会有<color=red>值得惊喜的报酬<color>等着你！",
		"野叟：而如果你在其中放弃了一个任务的话，则将从第一个任务开始算起。不过，我有时侯还是会给予你取消任务的机会，那得看你自己怎么把握了。",
		"野叟：怎么样？年轻人，有没有兴趣来接受我的这个考验呀？"
		);
end


-- 拒绝了野叟的考验提议
function Task_Exit()

	if (GetSex() == 0) then
		Say("野叟：哈哈哈……等公子知道了通过我的考验有多丰厚的奖励后就自然会再回来找我了。",0);
	else
		Say("野叟：哈哈哈……等这位女侠知道了通过我的考验有多丰厚的奖励后就自然会再回来找我了。",0);
	end

end


-- 在做任务的过程中退出野叟的对话，不作任何处理
function Task_Wait()

end


function Task_Punish()
	Say("野叟：这位"..GetPlayerSex().."是不是也太着急了些，我安排的考验真的这么难吗？你还是迟些再来吧！",0);
	return 0
end



--  //////////////////////////////////////////////////////////////
-- //                     发予奖励的处理                       //
--//////////////////////////////////////////////////////////////

function Task_GiveAward()

	local i
	
	local myAward
	local myLinkAward,myLoopAward
	
	local myGoodsText = ""
	local ShowText = {"","",""}

	local nTotalTaskNum = tl_counttasklinknum(1); -- 获取当前玩家一共做了多少次任务
	if (nTotalTaskNum ~= 0 and mod(nTotalTaskNum, 10) == 0 and GetTask(TKS_TASKLINK_SPITEM) ~= nTotalTaskNum) then
		SetTask(TKS_TASKLINK_SPITEM, nTotalTaskNum);
		local tbItem = {tbProp = {6, 1, 2374, 1, 0, 0}}
		tbAwardTemplet:GiveAwardByList(tbItem, "seasonnpc_10task")
		Msg2Player(format("恭喜大侠已继续完成%d野叟，获得奖励任务%s!", 10, "野叟神秘宝箱"));
	end

	--tl_print ("给链奖励和环奖励发奖完毕！！！");
	local nTongValue;
	myAward, nTongValue = tl_giveplayeraward(1);
	if (not nTongValue) then
		nTongValue = 0;
	end	
	local nBeishu = greatnight_huang_event(4);
	if (nBeishu > 0) then
		nTongValue = floor(nTongValue / nBeishu);
	end;
	
	for i=1,3 do
	--	tl_print ("得到金钱奖励！");
		if (myAward[i][1] == 1) then
		ShowText[i] = "得到 "..myAward[i][9].."/3".."/"..myAward[i][2].."/SelectAward_Money"
		elseif (myAward[i][1] == 2) then
		ShowText[i] = "得到 "..myAward[i][9].."/4".."/"..myAward[i][2].."/SelectAward_Exp"
		elseif (myAward[i][1] == 3) then
			myGoodsText = myAward[i][3]..","..myAward[i][4]..","..myAward[i][5]..","..myAward[i][6]..","..myAward[i][7]..","..myAward[i][8]
		ShowText[i] = "得到 "..myAward[i][9].."/5".."/"..myGoodsText.."/mySG"
		elseif (myAward[i][1] == 4) then
			if (myAward[i][10]==1) then
				myGoodsText = myAward[i][3]..","..myAward[i][4]..","..myAward[i][5]..","..myAward[i][6]..","..myAward[i][7]..","..myAward[i][8]
				ShowText[i] = myAward[i][9].."/6".."/"..myGoodsText.."/mySG"
			elseif (myAward[i][10]==2) then
				ShowText[i] = myAward[i][9].."/6".."/"..myAward[i][2].."/SelectAward_Exp"
			elseif (myAward[i][10]==3) then
				ShowText[i] = myAward[i][9].."/6".."/"..myAward[i][2].."/SelectAward_Money"
			end
			
		elseif (myAward[i][1] == 5) then
		ShowText[i] = "得到 "..myAward[i][9].."/7".."/"..myAward[i][1].."/SelectAward_Cancel"
		end
		
	end
	
	tl_print(ShowText[1])
	tl_print(ShowText[2])
	tl_print(ShowText[3])
	
Prise( "野叟：辛苦了，请这位"..GetPlayerSex().."看看哪一样东西是你最想要的呢？",ShowText[1],ShowText[2],ShowText[3] );
	
	--tl_print ("发奖完毕！！！！！");

end



-- 在已经确认了任务完成但是还未发奖时的变量处理，以防玩家刷奖
function Task_AwardRecord()
	--Storm 加积分
	local filename = tl_gettasktextID(tl_getplayertasktype())
	local tabcol = tl_gettasktablecol()
	local myTaskValue1 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue1"))
	local myTaskValue2 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue2"))
	local myMainValue = myTaskValue1 + myTaskValue2
	storm_addpoint(4, myMainValue)
	
	tl_settaskcourse(2) -- 任务的进展程度为2，即是还没有发奖
	nt_setTask(1037, GetGameTime() + tonumber(GetLocalDate("%H%M%S")));
end



-- 选择了物品的奖励
-- PS：因为考虑到任务面版的传入字符不能超过 32 个，所以这个过程简写成 mySG
function mySG(myQuality,myGenre,myDetail,myParticular,myLevel,myFive)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("野叟：你已经领过奖励了哦，怎么还想再领呢？",0);
	return
end
	--2007-09-19 增加物品奖励时的背包空间判断
	if (CalcFreeItemCellCount() < 5) then
		Say("背包空间不足,请整理出5格以上.",0);
		return
	end;
	
--	tl_print("得到了奖励物品编号："..myQuality..myGenre..myDetail..myParticular..myLevel..myGoodsFive);
	if (myQuality == 0) then
		local nItemIndex =  AddItem(myGenre,myDetail,myParticular,myLevel,myFive,0,0)
		if (GetProductRegion() == "vn") then
			-- LLG_ALLINONE_TODO_20070802
			if (myDetail==238) or (myDetail==239) or (myDetail==240) or (myDetail==252) then
			WriteLog("[任务链奖励记录]"..date("[%y年%m月%d日%H时%M分]").."：账号"..GetAccount().."，角色"..GetName().."在任务链奖励中得到了宝石一个，宝石的类型编号为："..myDetail)
			elseif (myGenre == 6 and myDetail == 1 and myParticular ==1475) then
				local nLastTime = FormatTime2Number(GetCurServerTime() + 7*24*60*60);
				local nYear = floor(nLastTime / 100000000);
				local nMMDD = mod(floor(nLastTime / 10000) , 10000);
				SetItemMagicLevel(nItemIndex, 1, GetTask(TSK_TASKLINK_SEANSONPOINT));
				SetItemMagicLevel(nItemIndex, 2, nYear);
				SetItemMagicLevel(nItemIndex, 3, nMMDD);
				SyncItem(nItemIndex);
				WriteLog(format("[Log 野叟任务奖励]%s: 账号 %s, 人物%s 完成野叟任务获得野叟积分(经验值: %d)",
					date(" [%y 年 %m 月 %d 日  %H 时%M 分]"),
					GetAccount(),
					GetName(),
					GetTask(TSK_TASKLINK_SEANSONPOINT)
				))
				SetTask(TSK_TASKLINK_SEANSONPOINT, 0);
			end
		else
			WriteLog(" [记得领奖]"..date(" [%y 年 %m 月 %d 日  %H 时 %M 分]").." [才开 :"..GetAccount().."] [人物:"..GetName().."]".."获得1 "..szName);
		end
	else
		AddGoldItem(0,myGenre)
		AddGlobalNews("公告：玩家 "..GetName().." 因为完成了任务在野叟处得到了黄金装备一件！！！");
		WriteLog("[任务链奖励记录]"..date("[%y 年 %m 月 %d 日  %H 时%M 分]").."：账号"..GetAccount().."，角色"..GetName().."在任务链奖励中得到了黄金装备一件，黄金装备编号为："..myGenre)
	end
	Msg2Player("您得到了一个任务物品奖励！");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end

-- 选择了金钱的奖励
function SelectAward_Money(nAward)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("野叟：你已经领过奖励了哦，怎么还想再领呢？",0);
	return
end

	Earn(nAward)
	Msg2Player("您得到了 <color=green>"..nAward.."<color> 两银子");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	-- 如果奖励的金钱数量大于 30W，则记LOG
	if nAward>=300000 then
		WriteLog("[任务链金钱记录]"..
				 date("[%y年%m月%d日%H时%M分]")..
				 "[账号]"..GetAccount()..
				 "[角色]"..GetName()..
				 "在任务链中获得了<money>"..nAward.."</money>两银子的奖励！");
	end;
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end

-- 选择了经验值的奖励
function SelectAward_Exp(nAward)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("野叟：你已经领过奖励了哦，怎么还想再领呢？",0);
	return
end

	tl_addPlayerExp(nAward)
	Msg2Player("您得到了 <color=green>"..nAward.."<color> 点经验值");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end

-- 选择再随机一次的奖励
function SelectAward_Change(nAward)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("野叟：你已经领过奖励了哦，怎么还想再领呢？",0);
	return
end

	Msg2Player("您得到了随机再选择一次奖励的机会！");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();

end

-- 选择了取消的机会
function SelectAward_Cancel(nAward)

local myCancel = 0;
local myNewCancel = GetTask(DEBUG_TASKVALUE);

	-- 防止多个面版弹出来刷奖励的处理
	if (tl_gettaskcourse() == 3) then
		Say("野叟：你已经领过奖励了哦，怎么还想再领呢？",0);
		return
	end


	
	myCancel = tl_gettaskstate(4)
	myCancel = myCancel + 1
	
	if myNewCancel==0 then
		myNewCancel = myCancel;
	else
		myNewCancel = myNewCancel + 1;		
	end;
	
	if myNewCancel<=254 then
		-- 再存一次另外的变量
		nt_setTask(DEBUG_TASKVALUE, myNewCancel);
	end;
	
	tl_settaskstate(4, myCancel);
	
	if myCancel<=254 then
		Msg2Player("您得到了 <color=green>一次取消任务的机会<color>!");
	end;

	WriteLog("[任务链奖励记录]"..
			 date("[%y年%m月%d日%H时%M分%S秒]")..
			 "[账号]"..GetAccount()..
			 "[角色]"..GetName()..
			 "在任务链中获得了取消机会的奖励，当前的取消机会为 <"..myCancel.."> 次。");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end


-- 发给玩家链奖励、环奖励或者黄金装备
function PayPlayerLinkAward()

local myGolden = {2,6,11,16,21,22,26,31,39,40,42,46,51,54,56,60,61,67,71,76,81,87,92,94,96,101,106,107,115,119,121,122,126,132,136,144,145,146} -- 20 环奖励黄金装备的编号
local nGoldenID = 0

local myTaskTimes = tl_gettaskstate(1)
local myTaskLinks = tl_gettaskstate(2)
local myTaskLoops = tl_gettaskstate(3)

local nTotalTask = tl_counttasklinknum(1);

-- 设置任务完成次数排名
Ladder_NewLadder(10118, GetName(), nTotalTask, 1);

-- 在这里发予固定任务次数的奖励
tl_getlinkaward(Task_AwardLink, nTotalTask);

-- 越南版完成 8000 次任务不做任何处理
if (nTotalTask == 1000) then

--	nGoldenID = myGolden[random(getn(myGolden))]
	
--	-- 满 8000 次任务奖励 1E 金钱
	Earn(100000000);
	
--	AddGoldItem( 0, nGoldenID )
	AddItem(6,1,2375,1,0,0)   ------送白虎令一个
	
--	WriteLog("[任务链奖励记录]"..date("[%y年%m月%d日%H时%M分]").."：账号"..GetAccount().."，角色"..GetName().."在任务链奖励中因为完成 8000 次任务得到了黄金装备一件，黄金装备编号为："..nGoldenID)
	
	AddGlobalCountNews("公告：玩家 "..GetName().." 因为完成了 1000 次任务在野叟处得到了白虎令牌一个和剑侠币一亿两！！！", 3);
	
	for i=1,3 do
		Msg2Player("恭喜你！！因为你连续完成了 1000 次任务所以得到了一个极品奖励和一亿两剑侠币！！！");
	end

	return
	
end

storm_ask2start(4, 1)	--Storm 开始挑战

end


--/////任务链的无法进行下去的 BUG 的修补/////

function _TaskLinkDebug()

	if (nt_getTask(1030)==0) and (tl_gettaskcourse()==1) then
		nt_setTask(1030,2);
		tl_savetalkvalue(1,2);
		tl_savetalkvalue(2,2);
		tl_savetalkvalue(3,2);
		tl_savetalkvalue(4,2);
		tl_savetalkvalue(5,2);
		tl_savetalkvalue(6,2);
	end

end


--  ////////////////////////////////////////////////
-- ///// 判断玩家是否刷取消机会的过程 /////////////
--////////////////////////////////////////////////

function _CancelTaskDebug()

local nOrgTask = GetTask(DEBUG_TASKVALUE);
local nDecTask = tl_gettaskstate(4);
local nDiff    = 0;

	if nOrgTask==nDecTask or nOrgTask==0 then
		return 1;
	else
		WriteLog("[任务链出错记录]"..
				 date("[%y年%m月%d日%H时%M分%S秒]")..
				 "[账号]"..GetAccount()..
				 "[角色]"..GetName()..
				 "任务取消机会不均等，当前取消机会为 <"..nDecTask..">，备份的取消机会为 <"..nOrgTask..">。");
		return 0;
	end;

end;

--  /////输出任务取消时的 LOG //////////////////////
-- ///// 传入的参数为任务次数和取消任务的机会 /////
--////////////////////////////////////////////////

function _WriteCancelLog(nType, nTime, nCancel)

	if nType==1 then
		WriteLog("[任务链取消记录]"..date("[%y年%m月%d日%H时%M分]").."：账号"..GetAccount().."，角色"..GetName().."在任务次数为"..nTime.."取消机会剩余"..nCancel.."时取消了一次任务。");
	else
		WriteLog("[任务链取消记录]"..date("[%y年%m月%d日%H时%M分]").."：账号"..GetAccount().."，角色"..GetName().."在任务次数为"..nTime.."时用100张社稷图取消了一次任务。");
	end;

end;

