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
		tbDailog.szTitleMsg = "<#><npc> ���������ܵ��������������ؾ��ĵڶ��㣬�ҿ��԰����������㣬��������ҪС�ģ������㼫��Σ�ա�"
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"���ܽ�������ؾ�������Ĺ���", Realize})
		tinsert(tbDailog, {"�����������ؾ�������", ToFloor3})
		----Bonus award - Modified By DinhHQ - 20120405		
		tinsert(tbDailog, {"������ȡ��Խ��2��Ľ���", tbVnExtAward.ToFloor3GetAward, {tbVnExtAward}})
		tinsert(tbDailog, {"����ؾ�̫�����ˣ������뿪����ؾ�", LeaveMijing})
		tinsert(tbDailog, {"�����Ի�"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = ""
	szTitle = "<#><npc> �ؾ���������кܶ౦���������û��Ƕ��Ҽ�������ӽ��룬�ؾ���������10���ط����ҿ��Դ�������κ�һ���ط�������㴦�����״̬���ҿ��Դ����������һ����롣���ط��������<�����������>�Լ�����ҩ�����ɲ�¶���������Ӿ���ֵ�ĵ��߽�ʧЧ��"
	tinsert(tbOpt, {"����", main})
  CreateNewSayEx(szTitle, tbOpt)
end

function ToFloor3()
	local nTeamSize = GetTeamSize()
	if (nTeamSize ~= 0 ) then
		if (IsCaptain() ~= 1) then
			Msg2Player("�㲻�Ƕӳ�")
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
					szMsg = format("%s\n%��ӳ�Աû���ڸ��������ܽ�������ؾ�������", szMsg, szName)
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

