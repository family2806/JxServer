Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")

function main()	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>�����������룬���������������ڽ����Ͽ϶���һλ���ܡ�һ����������ý��򿪣��ڵȴ�֮�࣬�Ҹ������һ�������õ�һЩ�涨��"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	
	tbDailog:AddOptEntry("�볤��ָ��.",readRule);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() ~= 1) then
		tbDailog:AddOptEntry("���뻻һ���ٻ������ֵĻ���",buyChance);
	end

	tbDailog:AddOptEntry("����ȡ�ٻ���",getCallItem);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() == 1) then
		tbDailog:AddOptEntry("����׼������",skipPrepareTime);
	end
	
	tbDailog:AddOptEntry("�����ֳɼ�",queryKillCount);
	tbDailog:AddOptEntry("����ö���ѫ��",queryMedalCount);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() == 1) then
		tbDailog:AddOptEntry("�����콱",getAward);
	end

	tbDailog:AddOptEntry("�����뿪������",leave);
	
	--�����Ի���
	tbDailog:Show()
end

function buyChance()
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:BuyChance();
	end
end

function getAward()
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:GetAward();
	end
end

function leave()
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	if (tbDungeon ~= nil) then
		tbDungeonManager:LeaveDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end

function getCallItem()
	if (CalcEquiproomItemCount(6,1,2315,-1) >= 1) then
		Talk(1,"","�������ٻ�����.");
		return
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") == 1) then
		PlayerFunLib:GetItem("return {tbProp={6,1,2315,1,0,0},}",1,"��ȡ�������ٻ���")
	end
end

function skipPrepareTime()
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:SkipPrepare();
	end
end

function queryMedalCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("Ŀǰ������ <color=green>%d<color> ������ѫ��.", tbDungeon:GetMedal()));
	end
end

function queryKillCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("���Ѵ�����<color=green>%d<color> �̿�", tbDungeon:GetKillCount()));
	end
end

function readRule()
	local szTitle =  "<npc>���������ȿ������ƵĹ⾰��һ����󽫳���һ���̿͡���Ĺ������ǵ��������ء�������10�����λ��أ�����ֻ��Ҫ�߽��ٻ������ֵĵط�Ѱ��������У�ÿ�δ�һ��������Ҫ100�㾫��ʯֵ��5������ѫ�¡��㻹���Ե�������λ�����������ã�ÿ�ε�������2��ѫ�¡�����ÿ�����Ĵ̿Ͷ�������ѫ�£���������л����á�100���̿ͳ��ֺ󣬴�ܵ�Խ�࣬����Խ����Ϸ�Ҳ��׼�����ӷ��Ľ����� <enter>���1-49���̿ͻ��ľ�ʱ���<enter>���50-69���̿ͣ����ͭ�ʱ���<enter>���70-89���̿ͣ�������ʱ���<enter>���90-99���̿ͻ�ûƽ𱦺�<enter>���100�����ϴ̿Ϳ��Ի����������<enter>���ڱ�������ʲô����Ҫ�����������?��."
	local tbOpt = {}
	tinsert(tbOpt, {"��л����ָ��."})
	CreateNewSayEx(szTitle, tbOpt);
end


function OnExit()

end;
