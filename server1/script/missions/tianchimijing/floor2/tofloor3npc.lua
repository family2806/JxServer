Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
--Bonus award - Modified By DinhHQ - 20120405
Include("\\script\\missions\\tianchimijing\\vnextaward.lua")
function main()
		local nNpcIndex = GetLastDiagNpc()
		local szNpcName = GetNpcName(nNpcIndex)
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc> 不料少侠能到达这里，这是天池秘境的第二层，我可以帮你进入第三层，不过，你要小心，第三层极其危险。"
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"介绍进入天池秘境第三层的规则", Realize})
		tinsert(tbDailog, {"我想进入天池秘境第三层", ToFloor3})
		----Bonus award - Modified By DinhHQ - 20120405		
		tinsert(tbDailog, {"我想领取穿越第2层的奖励", tbVnExtAward.ToFloor3GetAward, {tbVnExtAward}})
		tinsert(tbDailog, {"天池秘境太可怕了，我想离开天池秘境", LeaveMijing})
		tinsert(tbDailog, {"结束对话"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = ""
	szTitle = "<#><npc> 秘境第三层藏有很多宝物，少侠你最好还是多找几个人组队进入，秘境第三层有10间秘房，我可以带你进入任何一件秘房，如果你处于组队状态，我可以带你和你的组队一起进入。在秘房不允许打开<回天再造锦囊>以及其他药袋，仙草露和其他增加经验值的道具将失效。"
	tinsert(tbOpt, {"返回", main})
  CreateNewSayEx(szTitle, tbOpt)
end

function ToFloor3()
	local nTeamSize = GetTeamSize()
	if (nTeamSize ~= 0 ) then
		if (IsCaptain() ~= 1) then
			Msg2Player("你不是队长")
			return 0
		else 
			local szMsg = ""
			local _, _, nMapId = GetPos()
			local bInSameMap = 1
			for i = 1, nTeamSize do
				local nPlayerIndex = GetTeamMember(i);
				local _, _, nTempMapId = DynamicExecuteByPlayer(nPlayerIndex, "", "GetPos")
				local szName = DynamicExecuteByPlayer(nPlayerIndex, "", "GetName")
				if nTempMapId ~= nMapId then
					szMsg = format("%s\n%组队成员没有在附近，不能进入天池秘境第三层", szMsg, szName)
					bInSameMap = 0
				end
			end
			if bInSameMap == 0 then
				Msg2Player(szMsg)
				return 0
			end
		end
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "GameFloor3:WantEnterMap")
end

function LeaveMijing()
	local szPosPath = "\\settings\\maps\\tianchimijing\\common\\exit.txt"
	local nMapId = 934
	if GetTeamSize() >= 1 then
		LeaveTeam()
	end
	Game:MoveTo(nMapId, szPosPath)
end

