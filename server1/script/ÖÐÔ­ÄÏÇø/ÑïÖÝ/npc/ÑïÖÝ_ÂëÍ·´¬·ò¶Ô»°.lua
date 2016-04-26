--��ԭ���� ���ݸ� ��ͷ����Ի�
--suyu
--200306015

CurWharf = 6;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
---------------------------------------------------------------
function main(sel)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>��������������һ��ˮ�磬�Ӷࡢ�Ŷࡢ�۶࣬��Щ��Ǯ��Ҫ�����������ݣ����ľ���������Щ����"
	tbDailog:AddOptEntry("����", WharfFun)
	tbDailog:AddOptEntry("������", OnCancel)
	if GetLevel() >= 50 then
		tbDailog:AddOptEntry("�iȥ�һ���(2) [ "..AEXP_TICKET.." ��]", go_thd)
	end
	G_TASK:OnMessage("�¸赺", tbDailog, "DialogWithNpc")
	if check_showdialog_condition() then
		tbDailog:AddOptEntry("���ҵ��¸赺", goto_yuegedao)
	end
	tbDailog:Show()
end;

function check_showdialog_condition()
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or nFact > 9 then
		return
	end
	local nFactStep = mod(GetTask(2885), 100)
	if nFactStep >= tbFactStepList[nFact] then
		return 1
	end
	return
end

function goto_yuegedao()
	if CalcItemCount(3, 6, 1, 2908, -1) <= 0 then
		Msg2Player("��û���¸���")
		return
	end
	NewWorld(968, 1436, 3179)
end
---------------------------------------------------------------
function  OnCancel()

   Say("����ûǮ��������ߺ�·�ɣ�",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(236);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","��Ҫ�˴����һ��� "..AEXP_TICKET.."�����㹻��? ")
	end
end
---------------------------------------------------------------
