Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local tbPaiMingAward = 
{
	[1] = 
	{
		nExp_tl = 20e6	
	},
	[2] = 
	{
		nExp_tl = 15e6
	},
	[3] = 
	{
		nExp_tl = 13e6
	},
	[4] = 
	{
		nExp_tl = 10e6
	},
	[5] = 
	{
		nExp_tl = 8e6
	},
	[6] = 
	{
		nExp_tl = 6e6
	},
	[7] = 
	{
		nExp_tl = 5e6
	},
	[8] = 
	{
		nExp_tl = 4e6
	},
	[9] = 
	{
		nExp_tl = 3e6
	},
	[10] = 
	{
		nExp_tl = 2e6
	},
}

local tbAllPaiMingAward = 
{
	[1]={
		[1]={szName="至尊秘宝",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 3,},
		[2]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 4,},
		[3]={nJxb=1,nRate = 20.0,nCount = 30000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 60000000,},
	},
	[2]={
		[1]={szName="至尊秘宝",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 2,},
		[2]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 3,},
		[3]={nJxb=1,nRate = 20.0,nCount = 24000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 48000000,},
	},
	[3]={
		[1]={
			[1]={szName="至尊秘宝",tbProp={6,1,2375,1,0,0},},
			[2]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},},
			nRate = 25.0,
		},
		[2]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},nRate = 25.0,},
		[3]={nJxb=1,nRate = 25.0,nCount = 22000000,},
		[4]={nExp_tl=1,nRate = 25.0,nCount = 44000000,},
	},
	[4]={
		[1]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 18000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 36000000,},
	},
	[5]={
		[1]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 16000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 32000000,},
	},
	[6]={
		[1]={szName="至尊秘宝",tbProp={6,1,2375,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 12000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 24000000,},
	},
	[7]={
		[1]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 10000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 20000000,},
	},
	[8]={
		[1]={szName="水贼财宝",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 8000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 16000000,},
	},
	[9]={
		[1]={nJxb=1,nRate = 50.0,nCount = 5000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 10000000,},
	},
	[10]={
		[1]={nJxb=1,nRate = 50.0,nCount = 3000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 6000000,},
	},
}

local szRemoteScript = "\\script\\event\\zhaojingling\\event.lua"

function dialogmain()
	local tbOpt = {}
	local szTitleMsg = "<npc>年轻人，你想训练自己的反应能力吗？试找到更多的<color=yellow> 木人 <color> 将获得奖励"
	local szTitleMsg = format("%s, 每天你只有<color=yellow>%d<color>次机会可以免费参加，努力练习哦", szTitleMsg, MAXGAMETIME)
	tinsert(tbOpt, {"我想试试看", onok})
	tinsert(tbOpt, {"领取奖励", getaward})
--	tinsert(tbOpt, {"查看前一天的前十名", querytopten})
	tinsert(tbOpt, {"关于训练木人一事", detail})	
	tinsert(tbOpt, {"目前我很忙，稍候回来.", oncancel})
	CreateNewSayEx(szTitleMsg, tbOpt)
end

function onok()
	local tbOpt = {}
	tinsert(tbOpt, {"可以!", wantjoin})
	tinsert(tbOpt, {"我有急事，等我一下", oncancel})
	CreateNewSayEx("<npc>你去那边准备吧，等一会将开始装备", tbOpt)
end

function wantjoin()
	if checkjoingame() ~= 1 then
		return
	end
	dojoingame()
end

function detail()
	local tbOpt = {}
	tinsert(tbOpt, {"我知道了!", oncancel})
	CreateNewSayEx("<npc>训练木人一场是<color=yellow>15<color> 分钟，其中，<color=yellow>5<color> 分钟准备，报名参加后，你将会被打到准备区，活动开始后，你将被带进巡逻车，如果在那里你看到 <color=yellow> 木人<color>只需用鼠标<color=yellow> 点击左键<color> 到上面就行，不过，你会被他人挡住，此时，你可以使用道具来应付这种情况，只需要你找到很多 <color=yellow> 木人<color> 将获得相应的奖励", tbOpt)
end

function oncancel()
end

function checkjoingame()
	if PlayerFunLib:CheckTotalLevel(MINLEVEL, "125级及125级以上或者已重生的壮士，才能参加木人活动", ">=") ~= 1 then
		return
	end
	local nCurHour = tonumber(GetLocalDate("%H"))
	if nCurHour >= 0 and nCurHour < 12 then
		Talk(1, "", "每天12时到24时，开始抓木人活动，目前不是活动时间")
		return
	end
	local nTimes = GetTaskA(TSK_PLAYTIMES, TSK_DAYKEY)
	if nTimes >= MAXGAMETIME then
		Talk(1, "", "每天只能参加3场，明天再来吧。")
		return
	end
	
	if GetTask(TSK_RANK) ~= 0 and GetTask(TSK_COUNT_ONETIME) > 0 then
		Talk(1, "", "需要领取昨天比赛场次的奖励才能继续参加，快去领奖吧。")
		return
	end

	return 1
end

function dojoingame()
	local nMapId, nX, nY = GetWorldPos()
	SetTask(TSK_LEAVERMAPID, nMapId)
	SetTask(TSK_LEAVERPOSX, nX)
	SetTask(TSK_LEAVERPOSY, nY)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\zhaojingling\\templet\\gametemplet.lua", "GameTemplet:MoveTo", PREPARE_MAP, POSPATH, 2, PREPAREPOSENDLINE)	
end

function getaward()
	local tbOpt = {}
	tinsert(tbOpt, {"领取每场排名奖励", getonetimeaward})
	--Change request 14/7/2011 - Modified by DinhHQ - 20110714
--	tinsert(tbOpt, {"每天总排名奖励", getallpaimingaward})
	CreateNewSayEx("<npc>请领完之前场次的奖励后才能继续参加下面的比赛", tbOpt)		
end

function checkbox()
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight) >= nCount then
		return 1
	else
		local szMsg = format("为保护大侠的财产，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight)
		Talk(1,"", szMsg)
		return
	end
end

function getonetimeaward()
	local nRank = GetTask(TSK_RANK)
	local nCount = GetTask(TSK_COUNT_ONETIME)
	if nRank <= 0 or nRank > 10 then
		Talk(1, "", "没有要领的奖励")
		return
	end
	if nCount <= 0 then
		Talk(1, "", "没有要领的奖励")
		return		
	end
	
	if checkbox() ~= 1 then
		return
	end
	tbAwardTemplet:GiveAwardByList(%tbPaiMingAward[nRank], "领取每周每人活动排名奖励")
	SetTask(TSK_RANK, 0)
end

function getallpaimingaward()
	local nIsAward = GetTaskA(TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY)
	if nIsAward > 0 then
		Talk(1, "", "总排名奖励已经领了")
		return
	end
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_GetFormerPaiMing", obj.m_Handle, "receivepaiming", 0)
	obj:Destroy()		
end

function receivepaiming(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing ~= nil and nPaiMing <= 10 then
		if dogetallpaimingaward(nPlayerIndex, nPaiMing) == 1 then
			CallPlayerFunction(nPlayerIndex, AddTaskA, TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY, 1)
			CallPlayerFunction(nPlayerIndex, Msg2Player, format("领取总排名奖励 %s", nPaiMing))
		end
	else
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "没有要领的奖励")
	end
end

function dogetallpaimingaward(nPlayerIndex, nPaiMing)
	if CallPlayerFunction(nPlayerIndex, checkbox) ~= 1 then
		return 
	end 
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbAllPaiMingAward[nPaiMing], "领取每天木人活动排名奖励")
	return 1
end

function querytopten()
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_QueryTopTen", obj.m_Handle, "displaytopten", 0)
	obj:Destroy()			
end

function displaytopten(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	if tbTopTen == nil then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "目前还没有排名")
		return
	end
	local nCount = getn(tbTopTen)
	if nCount == 0 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "目前还没有排名")
		return
	end
	local szMsg = format("%-32s%-10s\n", "名字", "分数")
	for i=1, nCount do
		local szTemp = format("%-32s%-10d\n", tbTopTen[i][1], tbTopTen[i][2])
		szMsg = szMsg.. szTemp
	end
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szMsg, {{"结束对话"}})
end


