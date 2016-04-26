Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")

local tbEnterNpc = 
{
		szName = "�ʳ�˾����",
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
	tbDailog.szTitleMsg = "<npc>Ϊѵ���µĴ��ڸ��֣���߽���־ʿ���һʳ�˾��ļ���º��ܡ�������������뱨����͢����μӱ������ѧ�����գ������������������ճ�Ⱥ��."
	tbDailog:AddOptEntry("�ʳ�˾ѵ����", xunlianying)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()
end

function xunlianying()
	local tbOpt = {}
	tinsert(tbOpt, {"ѵ��ľ�� ", zhaojingling})
	tinsert(tbOpt, {"�����Ի�", oncancel})
	CreateNewSayEx("<npc>��ѵ��������ѵ���������ĵط�����ѵ����Ϊ���ڸ��֣���ó�͢�Ľ�����", tbOpt)	
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

