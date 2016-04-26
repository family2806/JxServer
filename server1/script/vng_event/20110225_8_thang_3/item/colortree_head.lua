Include("\\script\\activitysys\\config\\19\\config.lua")
Include("\\script\\activitysys\\config\\19\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\global\\judgeoffline_limit.lua")

TASK_VALENTINENUMBER = 1


TREE_GROWSTEP        = 1
TREE_OWNER					 = 10
TREE_PICKSTEP				 = 3
TREE_TASKSTEP				 = 4
TREE_TASKTIME        = 5
TREE_TASKRANDTIME    = 6
TREE_TASKSTARTTIME   = 7
TREE_TASKNAME				 = 8
TREE_TASKSCORE       = 9
TREE_TYPE						 = 2

XIANGSI 						 = 1
MEIGUIHUAZI					 = 2


ACTIVITY_NPC_ID 			= {1252, 1253, 1254, 1255} 	-- NPC的ID

ACTIVITY_STARTTIME = 20110213
ACTIVITY_ENDTIME   = 20110223
ACTIVITY_MAP = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53}

COLOR_TREE_NPC_DATA = {}

ACTIVITY_TREE_NAME_XIANGSI = {
											"相思树芽",
											"小相思树",
											"相思树开花",
											"相思树开满相思豆",
											}
ACTIVITY_TREE_TALK_XIANGSI			= {
											"红豆生南国，春来发几只",
											"愿君多采撷，此物最相思",
											"情人怨遥夜,竟夕起相思 ",
											"长相思,长相思。若问相思甚了期,除非相见时。",
											"长相思,长相思。欲把相思说似谁,浅情人不知.",
											"长相思兮长相忆,短相思兮无穷极.",
										  }
ACTIVITY_TREE_NAME_ROSE =	{
											"玫瑰芽",
											"小玫瑰树",
											"玫瑰树未开花",
											"玫瑰花开满花",
											}
ACTIVITY_TREE_TALK_ROSE			= {
											"君心知我心",
											"执子之手，与子偕老.",
											"此情无计可消除,才下眉头,却上心头.",
											"我愿与君相知",
											"愿天下有情人终成眷属.",
										  }
ACTIVITY_TREE_NAME_QINGREN =	{
											"有色树芽",
											"有色树正在成长",
											"有色树正在成长",
											"有色树",
											}
										  
ACTIVITY_TREE_TASK_NAME	= {"浇水", "施肥", "割草", "除虫 ",}


function AddMeiGuiOrXiangSiTree(tb, nNpcIndex)
	COLOR_TREE_NPC_DATA[nNpcIndex] = tb.szTmpPlayerName
	AddTimer(1*18, "MeiGuiOrXiangSiOnTimer", nNpcIndex)
	if GetNpcParam(nNpcIndex, TREE_GROWSTEP) == 4 then
		AddNpcSkillState(nNpcIndex, 662,1, 1, 30*60*18)
	end
end

function MeiGuiOrXiangSiOnTimer(nNpcIdx)
	
	local nTaskStart = GetNpcParam(nNpcIdx, TREE_TASKTIME)
	local nCurTime = GetCurServerTime()
	local nCheckPoint  = nCurTime - nTaskStart -- 检查点
	
	local nTreeStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nTreeStep == 4 then
		if nCheckPoint > 10*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end		
		return 18, nNpcIdx
	else
		if nCheckPoint > 10*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end			
	end
	
	local nTaskStartTime = GetCurServerTime() - GetNpcParam(nNpcIdx, TREE_TASKSTARTTIME)
	local nNowStep = floor(nTaskStartTime/300)
	if nNowStep ~= 0 then
		ValentineMeGuiAndXiangSiTreeGrow(nNpcIdx)
		return 0, nNpcIdx
	end
	
	if 270 < nTaskStartTime then
		AddNpcSkillState(nNpcIdx, 764,1, 1, 0)
		SetNpcParam(nNpcIdx, TREE_TASKSTEP, -1)
		return 18, nNpcIdx
	end 
	
	local nTreeTaskStep = GetNpcParam(nNpcIdx, TREE_TASKSTEP)

	if nCheckPoint >= 90 then
		AddNpcSkillState(nNpcIdx, 764,1, 1, 0)
		SetNpcParam(nNpcIdx, TREE_TASKTIME, GetCurServerTime())
		SetNpcParam(nNpcIdx, TREE_TASKSTEP, 0)
		SetNpcParam(nNpcIdx, TREE_TASKNAME, -1)
		return 18, nNpcIdx
	end
	
	if nCheckPoint >= 60 and nTreeTaskStep <= 1 then
		SetNpcParam(nNpcIdx, TREE_TASKSTEP, -1)
		return 18, nNpcIdx
	end
	
	if nCheckPoint <= 30 and nTreeTaskStep == 0 then
		local nRandTime = GetNpcParam(nNpcIdx, TREE_TASKRANDTIME)
		if nCheckPoint >= nRandTime then
			AddNpcSkillState(nNpcIdx, 662,1, 1, (60 - nCheckPoint )*18) -- 出现任务感叹号
			SetNpcParam(nNpcIdx, TREE_TASKSTEP, nTreeTaskStep + 1)
			SetNpcParam(nNpcIdx, TREE_TASKRANDTIME, random(1, 30))
		end
		return 18, nNpcIdx
	end
	
	return 18, nNpcIdx
end


function ValentineMeGuiAndXiangSiTreeGrow(nNpcIdx)
	
	local nX32, nY32, nMapIndex = GetNpcPos(nNpcIdx)
	local szPlayerName = COLOR_TREE_NPC_DATA[nNpcIdx]
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	local nType = GetNpcParam(nNpcIdx, TREE_TYPE)
	local tbNpcName = {}
	if nType == XIANGSI then 
		tbNpcName = ACTIVITY_TREE_NAME_XIANGSI
	else 
		tbNpcName = ACTIVITY_TREE_NAME_ROSE
	end
	local tbNpc = {
		szName = format("%s[%s]", tbNpcName[nTreeGrowStep+1], szPlayerName), 
		nLevel = 95,
		nMapId = SubWorldIdx2ID(nMapIndex),
		nPosX = nX32,
		nPosY = nY32,
		nNpcId = ACTIVITY_NPC_ID[nTreeGrowStep+1],
		nIsBoss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\19\\tree.lua",
		pCallBack = AddMeiGuiOrXiangSiTree,
		szTmpPlayerName = szPlayerName,
	}
		
	tbNpc.tbNpcParam[TREE_GROWSTEP] = GetNpcParam(nNpcIdx, TREE_GROWSTEP)+1
	tbNpc.tbNpcParam[TREE_OWNER] = 1
	tbNpc.tbNpcParam[TREE_PICKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKTIME] = GetCurServerTime()
	tbNpc.tbNpcParam[TREE_TASKRANDTIME] = random(1, 30)
	tbNpc.tbNpcParam[TREE_TASKSTARTTIME] = GetCurServerTime()
	tbNpc.tbNpcParam[TREE_TASKNAME] = -1
	tbNpc.tbNpcParam[TREE_TASKSCORE] = GetNpcParam(nNpcIdx, TREE_TASKSCORE)
	tbNpc.tbNpcParam[TREE_TYPE] = GetNpcParam(nNpcIdx, TREE_TYPE)
	
	COLOR_TREE_NPC_DATA[nNpcIdx] = nil
	
	DelNpc(nNpcIdx)
	basemission_CallNpc(tbNpc)
	
end

function AddQingRenTree(tb, nNpcIndex)
	COLOR_TREE_NPC_DATA[nNpcIndex] = tb.szTmpPlayerName
	AddTimer(1*18, "QingRenOnTime", nNpcIndex)
	if GetNpcParam(nNpcIndex, TREE_GROWSTEP) == 4 then
		AddNpcSkillState(nNpcIndex, 662,1, 1, 30*60*18)
	end
end

function QingRenOnTime(nNpcIdx)
	
	local nTaskStart = GetNpcParam(nNpcIdx, TREE_TASKTIME)
	local nCurTime = GetCurServerTime()
	local nCheckPoint  = nCurTime - nTaskStart -- 检查点
	
	local nTreeStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nTreeStep == 4 then
		if nCheckPoint > 5*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end
		return 18, nNpcIdx	
	else
		if nCheckPoint > 30*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end
	end
	
	local nNowStep = floor(nCheckPoint/30)
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nNowStep ~= 0 then
		ValentineQingRenTreeGrow(nNpcIdx)
		return 0, nNpcIdx
	end
		
	return 18, nNpcIdx
end

function ValentineQingRenTreeGrow(nNpcIdx)
	
	local nX32, nY32, nMapIndex = GetNpcPos(nNpcIdx)
	local szPlayerName = COLOR_TREE_NPC_DATA[nNpcIdx]
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	local tbNpc = {
		szName = format("%s[%s]", ACTIVITY_TREE_NAME_QINGREN[nTreeGrowStep+3], szPlayerName), 
		nLevel = 95,
		nMapId = SubWorldIdx2ID(nMapIndex),
		nPosX = nX32,
		nPosY = nY32,
		nNpcId = ACTIVITY_NPC_ID[nTreeGrowStep+3],
		nIsBoss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\vng_event\\20110225_8_thang_3\\item\\colortree.lua",
		pCallBack = AddQingRenTree,
		szTmpPlayerName = szPlayerName,
		}
	tbNpc.tbNpcParam[TREE_GROWSTEP] = GetNpcParam(nNpcIdx, TREE_GROWSTEP)+3
	tbNpc.tbNpcParam[TREE_OWNER] = 1
	tbNpc.tbNpcParam[TREE_PICKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKTIME] = GetCurServerTime()

	COLOR_TREE_NPC_DATA[nNpcIdx] = nil
	DelNpc(nNpcIdx)
	basemission_CallNpc(tbNpc)	
	
end

function ValentineResetTask()
end

function IsInValentine()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))	
	if ACTIVITY_STARTTIME <= nDate and nDate <= ACTIVITY_ENDTIME then
		return 1
	end
	Msg2Player("不是活动举行时间，道具没有效力")
	return 0
end

function CheckPlayerCondition()
	if GetLevel() < 150 and ST_IsTransLife() ~= 1 then
		Msg2Player("等级不够!")
		return 0
	end
	return 1
end

function NumberIsEven(nNumber)
	local nMid = floor(nNumber/2)
	if nMid * 2 == nNumber then
		return 1
	end
	return 0
end

function CheckPlantConditionMeiGui()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		lib:ShowMessage("需要有2个人组队才能种玫瑰花种子")
		return 0
	end
	
	local nPlayer1Index = GetTeamMember(1)
	local nPlayer2Index = GetTeamMember(2)
	
	local nPlayer1Sex = DynamicExecuteByPlayer(nPlayer1Index, "", "GetSex")
	local nPlayer2Sex = DynamicExecuteByPlayer(nPlayer2Index, "", "GetSex")
	if (nPlayer1Sex + nPlayer2Sex ~= 1) or (nPlayer1Sex * nPlayer2Sex ~= 0) then
		lib:ShowMessage("需要男女组队才能种玫瑰花种子")
		return 0
	end
	
	local nMapId = SubWorldIdx2ID(SubWorld)
	local nIsInMap = 0

	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			nIsInMap = 1
			break	
		end
	end
	if nIsInMap == 0 then
		lib:ShowMessage("需要在七大城市及八大新手村以外种植玫瑰花种子")
		return 0
	end

	local nValentinePlayerIdx = ((nPlayer1Index == PlayerIndex) and nPlayer2Index or nPlayer1Index)
	local szLoverName = DynamicExecuteByPlayer(nValentinePlayerIdx, "", "GetMateName")
	local szCurPlayerName = GetName()
	if szCurPlayerName == szLoverName then
		return 1
	end
	
	
	local nFlag1 = CallPlayerFunction(nPlayer1Index, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")
 	if nFlag1 ~= 1 then
		lib:ShowMessage("请确认与你有缘的人也有红线请来种玫瑰花种子!")
		return 0
	end
	
	local nFlag2 = CallPlayerFunction(nPlayer2Index, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")
 	if nFlag2 ~= 1 then
		lib:ShowMessage("请确认与你有缘的人也有红线请来种玫瑰花种子!")
		return 0
	end

	local nPlayer1ValentineNumber = DynamicExecuteByPlayer(nPlayer1Index, "", "pActivity.TaskGroup:GetTask", TASK_VALENTINENUMBER)
	local nPlayer2ValentineNumber = DynamicExecuteByPlayer(nPlayer2Index, "", "pActivity.TaskGroup:GetTask", TASK_VALENTINENUMBER)
	if NumberIsEven(nPlayer1ValentineNumber + nPlayer2ValentineNumber) ~= 1 then
		lib:ShowMessage("2人的姻缘号需是整数或者是你的朋友!")
		return 0
	end
	
	return 1
	
end

function CheckPlantConditionXiangSi()
	local nMapId = SubWorldIdx2ID(SubWorld)
	
	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			return 1
		end
	end
	
	lib:ShowMessage("需要在七大城市和八大新手村以外种相思豆")
	return 0
end

function CheckPlantConditionQingRen()
	local nMapId = SubWorldIdx2ID(SubWorld)
	
	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			if (offlineCheckPermitRegion() == 0) then
				lib:ShowMessage("不能在接近车夫或者多人的地方种植有色树")
				return 0
			end
			return 1
		end
	end
	
	lib:ShowMessage("需要在七大城市和八大新手村以外才能种有色树")
	return 0
end