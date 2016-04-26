---��ԭ����\�䵱��\�䵱��\npc\wdnpc06.lua
--description: �䵱������Ȫ���䵱40������
--author: yuanlan	
--date: 2003/5/15
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)
-- updage by xiaoyang(2004\4\15) �䵱90������
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	

	local szTitleMsg = "<npc>������кܶ���Ҫ�������������ʲô��?"
	local tbOpt = 
	{
		{"150������", dailog150skill},
		{"�����������", org_dailog}
	}

	CreateNewSayEx(szTitleMsg, tbOpt)
end

function org_dailog()
	UTask_wd = GetTask(5)
	Uworld129 = GetTask(129)
	if((UTask_wd == 40*256) and (GetLevel() >= 40) and (GetFaction() == "wudang")) then
		Say("����԰������������Ҵ�<color=Red>1 ����<color>��<color=Red>���ڶ�<color> �� <color=Red>����<color>, ͻȻ���м��£������������?", 2, "��������!/L40_get_yes", "�Բ�������������/L40_get_no")
	elseif (UTask_wd >= 40*256+20) and (UTask_wd <= 40*256+40) and (HaveItem(163) == 0) then		-- ���߶���
		AddEventItem(163)
		Talk(1,"","������³ç�����ŵ���û��������?")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 1) then					--������Ļ���
		Talk(2, "", "��ʦ�֣����Ѱ�������ˣ���������Ļ���!", "�������ˣ�ȥ��������ûظ����ţ�������������.")
		Msg2Player("�ص��䵱������Ȫ��֪��Ҫ���Ÿ�����. ")
		AddNote("�ص��䵱������Ȫ��֪��Ҫ���Ÿ����� ")
		SetTask(5,40*256+80)
	elseif (UTask_wd == 40*256+80) and (HaveItem(164) == 0) then			-- ���߶���
		AddEventItem(164)
		Talk(1,"","�������������������!")
	elseif (Uworld129 == 10) then
		Talk(12,"Uworld129_admit","�������䵱���ܣ����������Ѿã��������ɽ���","�ã���ĳ�ܾ�û�ж�����ϰ�ˣ��ֽź�����","С����ô�ұ���","��Ҳ��ǿ�����ˣ����µ�һ�����䵱����������Է�ʽ","��ѧ���������ڣ��Թŷ������мң����ʣ��ÿ���ʲô��","�ڼ��������������û�к�������ô������ˣ��迴�����","���ǣ��������컯ʹȻ�����������������ͨ��Ȼ��������������","��ʲô����ʲô���������3,5�ֲ���ÿ����Ѫ���ǽ�ʲô���","�书��ǿ�������⣬����...","�����ˣ��ҳ������㣬�����֤����Щ����ȥ������Ŀʦ��","�����������","���ߣ��������ܲ�����!")
   elseif(Uworld129 == 30)then
   	Talk(6,"Uworld129_admit2","���ѣ�����!","������ʲôָ��!","�������㿴���",".....���飿��ϲ����!","��������ĸ�ڼҵ��ң���Ҫ������ɽ���鷳�����ʦ�ֵ�˵һ��.","����������ТΪ��!")
   elseif (Uworld129 > 10) and (Uworld129 < 60)then
   	Talk(1,"","�䵱����ԭ����ռ����Ҫ��λ�ã����䵱̸���书�����ҶԵط���.")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,"","<color=Red>����<color> ��<color=Red>���ڶ�<color>.")
	elseif (UTask_wd > 40*256+20) and (UTask_wd < 40*256+80) then					--�Ѿ��ӵ�40��������δ���
		Talk(1,"","����������������ô����?")
	elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--�Ѿ����40��������δ��ʦ
		Talk(1,"","ʦ��������Ķ�Թ����������ֻ��Ϊʦ��������̸�������������ӵ�Ҳ���ö���")
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","���Ǽ���ͬ�ţ�������Ե����Ե���Ժ󻹻���棬�뱣��! ")
	else
		dailog150skill()
	end
end

function dailog150skill()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>���������㣬���䵱ɽŬ��ѧϰ�书������û����Ȣ�����ӵ��£������Ѿ������Ǹ�ʱ���ˣ�����Ҳ�е��ǳ�."
	G_TASK:OnMessage("Th�y Y�n", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L40_get_yes()
	Talk(1,"","�a��л<color=Red>����<color> �� <color=Red>���ڶ�<color>,�������ȥ!")
	Msg2Player("���ŷԸ������Ŵ�������. ")
	AddEventItem(163)
	SetTask(5, 40*256+20)
	AddNote("����ˮ������������Ȫ�����������񣬵���ţɽ���ڶ����Ž�������. ")
	Msg2Player("����ˮ������������Ȫ�����������񣬵���ţɽ���ڶ����Ž�������. ")
end;

function L40_get_no()
	Say("���������˰�æ. ")
end;

function Uworld129_admit()
	SetTask(129,20)  --�����������20
	Msg2Player("������Ȫ�Ի��󣬻���������Ŀ. ")
	AddNote("������Ȫ�Ի��󣬻���������Ŀ. ")
end

function Uworld129_admit2()
	SetTask(129,40)
	Msg2Player("������Ȫ�Ի��󣬻���������Ŀ. ")
	AddNote("����Ȫ�յ����飬���������ˣ���Ӧ��������Ŀ˵. ")
end
