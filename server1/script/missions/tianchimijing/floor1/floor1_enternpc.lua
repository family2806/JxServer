Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

tbEnterPosConfigPath = {
	[1] = "\\settings\\maps\\tianchimijing\\floor1\\enter1.txt",
	[2] = "\\settings\\maps\\tianchimijing\\floor1\\enter2.txt",
	[3] = "\\settings\\maps\\tianchimijing\\floor1\\enter3.txt",
	[4] = "\\settings\\maps\\tianchimijing\\floor1\\enter4.txt",
	[5] = "\\settings\\maps\\tianchimijing\\floor1\\enter5.txt",
	[6] = "\\settings\\maps\\tianchimijing\\floor1\\enter6.txt",
  [7] = "\\settings\\maps\\tianchimijing\\floor1\\enter7.txt",
	[8] = "\\settings\\maps\\tianchimijing\\floor1\\enter8.txt",
	[9] = "\\settings\\maps\\tianchimijing\\floor1\\enter9.txt"							
	}

function main()
		local nNpcIndex = GetLastDiagNpc()
		local szNpcName = GetNpcName(nNpcIndex)
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>这位小侠，我发现在这个水潭里有一条密道，在密道中布置着很多机关陷阱，需要练习轻功才能过去，听说密道最后一段有很多宝藏。"
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"我想再了解一下", Realize})
		tinsert(tbDailog, {"结束对话"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = "<#><npc>这个密道好像没有尽头，从这里进去的人，没有一个能出来，听说这个密道藏有很多金人，他们很残忍，少侠你最好是找几个人一起进入。."
	tinsert(tbOpt, {"进入密道", ReadyGo})
	--Check team member condition - Modified By DinhHQ - 20120405
	if GetTeamSize() >= 2 then
		tinsert(tbOpt, {"检查组队条件", VnCheckTeamCondition, {1, 1}})
	end
	tinsert(tbOpt, {"要不算了吧"})
	CreateNewSayEx(szTitle, tbOpt)
end

function ReadyGo()
	if GetTeamSize() <= 1 then
		SingleEnter()
	else
		TeamEnter()
	end
end

function SingleEnter()
	local tbOpt = {}
	local szTitle = "<#><npc> 少侠你确定一个人穿越密道?"
	tinsert(tbOpt, {"对.",SingleEnterSure})
	tinsert(tbOpt, {"让我想想"})
	CreateNewSayEx(szTitle, tbOpt)
end

function TeamEnter()
	if IsCaptain() ~= 1 then
		DealWithNotCaption()
	else
		DealWithIsCaption()
	end
end

function DealWithNotCaption()
	local tbOpt = {}
	local szTitle = "<#><npc> 少侠你不是队长，要不请队长来这里吧"
	tinsert(tbOpt, {"好了."})
	CreateNewSayEx(szTitle, tbOpt)
end

function DealWithIsCaption()
	local nTeamSize = GetTeamSize()
	local szTitle = ""
	local _, _, nMapId = GetPos()
	local tbOpt = {}
	local bInSameMap = 1
	for i = 1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i);
		local _, _, nTempMapId = DynamicExecuteByPlayer(nPlayerIndex, "", "GetPos")
		--Check enter pass - Modified By DinhHQ - 20120405
		local nHavePass = DynamicExecuteByPlayer(nPlayerIndex, "", "CalcItemCount", 3, 6, 1, 30194, -1)
		if nTempMapId ~= nMapId or not nHavePass then
			bInSameMap = 0
			break
		end
	end
	if bInSameMap ~= 0 then
		TeamEnterSure()
	else	
		szTitle = "<#><npc> 你的队伍里还有侠士没有装备好，请召集所有人到我这里后才能进入."
		tinsert(tbOpt, {"好，我马上召集他们来 "})
		CreateNewSayEx(szTitle, tbOpt)
	end
end

function SingleEnterSure()
	--Check enter pass - Modified By DinhHQ - 20120405
	if not VnCheckPass(PlayerIndex) or not VnConsumePass(PlayerIndex) then
		Talk(1, "", "只需要给我一个<color=red>天池密令<color> 我将只给你入口.")
		return
	end
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	local nRowId = random(2, nTotalRow)
	local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
	local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
	NewWorld(935, nPosX/32, nPosY/32)
end

function TeamEnterSure()
	--Last time check team enter pass- Modified By DinhHQ - 20120405
	if not VnCheckTeamCondition(1) then
		return
	end
	local nTeamSize = GetTeamSize()
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	for i = 1, nTeamSize do 
		local nPlayerIndex = GetTeamMember(i)		
		if VnConsumePass(nPlayerIndex) then
			local nRowId = random(2, nTotalRow)
			local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
			local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
			DynamicExecuteByPlayer(nPlayerIndex, "", "NewWorld", 935, nPosX/32, nPosY/32)			
		end		
	end
end

--Check enter pass - Modified By DinhHQ - 20120404
function VnCheckPass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if CalcItemCount(3, 6, 1, 30194, -1) < 1 then		
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnConsumePass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if ConsumeItem(3, 1, 6, 1, 30194, -1) ~= 1 then
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnCheckTeamCondition(bShowDialog1, bShowDialog2)
	if IsCaptain() ~= 1 then
		Talk(1, "", "你不是队长，不能执行该操作，请叫队长来这!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()	
	local nOldPlayer = PlayerIndex
	for i = 1, nTeamSize do		
		--Check enter pass
		PlayerIndex = GetTeamMember(i)
		if not VnCheckPass(PlayerIndex) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "没有天池密令"))
		end	
	end
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then		
		if bShowDialog1 then
			local strTittle = "组队目前不能进入天池秘境:"
			for i = 1, getn(tbDialog) do
				strTittle = strTittle.."\n"..tbDialog[i]
			end
			Describe(strTittle, 1, "关闭/OnCancel")
		end
		return nil
	else
		if bShowDialog2 then
			local strTittle = "组队目前可以进入天池秘境"
			Describe(strTittle, 1, "关闭/OnCancel")
		end
		return 1
	end
end
