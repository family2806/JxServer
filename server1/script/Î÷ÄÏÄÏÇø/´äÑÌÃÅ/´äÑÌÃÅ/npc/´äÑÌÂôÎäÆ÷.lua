--������ �������ĵ��ӶԻ�
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) or (GetLastFactionNumber() == 5) then
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end

		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>���Ź�����Ҫ���Ǳ仯�������һ����书."
		tbDailog:AddOptEntry("����", yes)
		tbDailog:AddOptEntry("������", no)
		G_TASK:OnMessage("����", tbDailog, "DialogWithNpc")
		tbDailog:Show()
	else
		Talk(1,"","����������ű���ֻ������ͬ�Ž���.")
	end
end;

function yes()
Sale(66)
end;

function no()
end;
