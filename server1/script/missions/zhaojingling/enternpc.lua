Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")

local tbEnterNpc = 
{
		szName = "皇城司提点官",
		nNpcId = 1747,
		nLevel = 95,
		nMapId = 176,
		szPosPath = "\\settings\\maps\\chrismas\\enternpc.txt",
		szScriptPath = "\\script\\missions\\zhaojingling\\enternpc.lua",
}

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>为训练新的大内高手，提高江湖志士，我皇城司招募天下豪杰。如果你有意向想报销朝廷，请参加报名活动。学成武艺，帮主帝王。阁下武艺超群。."
	tbDailog:AddOptEntry("皇城司训练宫", xunlianying)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()
end

function xunlianying()
	local tbOpt = {}
	tinsert(tbOpt, {"训练木人 ", zhaojingling})
	tinsert(tbOpt, {"结束对话", oncancel})
	CreateNewSayEx("<npc>该训练宫用于训练人能力的地方，将训练成为大内高手，获得朝廷的奖励。", tbOpt)	
end

function zhaojingling()
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\zhaojingling\\enterdialog.lua", "dialogmain")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhTruyTimMocNhan")
end

function addenternpc()
	if (TabFile_Load(%tbEnterNpc.szPosPath, %tbEnterNpc.szPosPath) == 0) then
		print("Load TabFile Error!"..%tbEnterNpc.szPosPath)
		return 0
	end
	%tbEnterNpc.nPosX = TabFile_GetCell(%tbEnterNpc.szPosPath, 2, "POSX")
	%tbEnterNpc.nPosY = TabFile_GetCell(%tbEnterNpc.szPosPath, 2, "POSY")
	
	basemission_CallNpc(%tbEnterNpc)
end

function initialize()
	addenternpc()
	DynamicExecute("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua", "PrepareGame:Start")
end

AutoFunctions:Add(initialize)

