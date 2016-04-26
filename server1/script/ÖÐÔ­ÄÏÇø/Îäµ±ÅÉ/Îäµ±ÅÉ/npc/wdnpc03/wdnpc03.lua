--description: �䵱��Ҷ�������䵱10������
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if allbrother_0801_CheckIsDialog(12) == 1 then
		allbrother_0801_FindNpcTaskDialog(12)
		return 0;
	end
	UTask_wd = GetTask(5)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	G_TASK:OnMessage("�䵱", tbDailog, "DialogWithNpc")
	if (UTask_wd == 10*256+20) then 
		SetTask(5, 10*256+50)
		AddNote("��Ҷ��������ѧ�����¾�")
		Msg2Player("��Ҷ��������ѧ�����¾�")
		tbDailog.szTitleMsg = "<npc>�����¾�����ʦ����д�ģ���һ����37�£������½�44��"
		tbDailog:AddOptEntry("Ch��ng 1 ", ch1)
		tbDailog:AddOptEntry("Ch��ng 25 ", ch2)
		tbDailog:AddOptEntry("Ch��ng 33 ", ch3)
		tbDailog:AddOptEntry("Ch��ng 41 ", ch4)
		tbDailog:AddOptEntry("Ch��ng 42 ", ch5)
	elseif (UTask_wd == 10*256+50) then 
		tbDailog.szTitleMsg = "<npc> <���¾�>���ݲ���������ڶ�ʱ��������ģ��������ǰ5�°�."
		tbDailog:AddOptEntry("Ch��ng 1 ", ch1)
		tbDailog:AddOptEntry("Ch��ng 25 ", ch2)
		tbDailog:AddOptEntry("Ch��ng 33 ", ch3)
		tbDailog:AddOptEntry("Ch��ng 41 ", ch4)
		tbDailog:AddOptEntry("Ch��ng 42 ", ch5)
	elseif (UTask_wd < 10*256+20) and (GetFaction() == "wudang") then								--��δ��10������
		tbDailog.szTitleMsg = "<npc>�������¾�����ô�ܳ�Ϊ�䵱����?"
	elseif (UTask_wd >= 20*256) and (GetFaction() == "wudang") then					--�Ѿ����10��������δ��ʦ
		tbDailog.szTitleMsg = "<npc>������ѧ���¾�����?"
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		tbDailog.szTitleMsg = "<npc>�Һ���һ�������ʱ��Ҳ��һ��ǿ׳�Ĵ��ɷ򣬵������֪��ɽ�ߵغ�����Ȼ�Ǳ��ɳ�ʦ���ӣ����ǣ�Ҳ����С������."
	else
		tbDailog.szTitleMsg = "<npc>�����ӵĵ��¾�����һ����37�£������½�44�¡�һ��5000�֣����ݲ�����."
	end
	tbDailog:Show() 
end;

function ch1()
	Talk(1,"","���ɵ����ǳ��������������ǳ���.")
end;

function ch2()
	Talk(1,"","�˷��أ��ط��죬�취����������Ȼ.")
end;

function ch3()
	Talk(1,"","֪�����ǣ���֪֮����ʤ������������ʤ��ǿ.")
end;

function ch4()
	Talk(1,"","�����磬������ɣ�����ϣ�ɣ���������.")
end;

function ch5()
	Talk(1,"","����һ��һ����������������������.")
end;
