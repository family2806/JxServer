--������ ������ �ӻ����ϰ�Ի�������40������
-- Update: Dan_Deng(2003-08-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main(sel)
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local tbDailog = DailogClass:new(szNpcName)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = "<npc>�ӻ����ϰ壺����ǰ�������ɵ��ģ�������һ�㱾Ǯ֮�󣬾��ڴ˵ذ����������������СС���ӻ��ꡣ"
	if (GetTask(3) == 40*256+50) and (GetTask(14) == 5) and (HaveItem(148) == 0) then 		--������40������
		tbDailog:AddOptEntry("����������?", lotus)
	end
	tbDailog:AddOptEntry("����", yes)
	tbDailog:AddOptEntry("������", no)
	tbDailog:AddOptEntry("����������������", zboss);
                 tbDailog:Show()
end

function lotus()
Say("�ӻ����ϰ壺���ӿ�������������ز�������Ȼ������ֻҪʮ�����ӡ�", 2, "��/yes1", "����/no");
end;

function yes1()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(148)
		Msg2Player("������")
--		SetTask(14, 3)	
		AddNote("�ڰ������ӻ��������� ")
	else
	Say("�ӻ����ϰ壺�ȴ湻������������ɣ��ȿ��������Ķ�����", 2, "����/yes", "������/no")		
	end
end;

function yes()
Sale(38);  			
end;

function no()
end;
