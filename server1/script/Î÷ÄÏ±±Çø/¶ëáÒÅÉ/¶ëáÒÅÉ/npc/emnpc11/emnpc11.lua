--description: �����������๫
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(207) == 1 then
		allbrother_0801_FindNpcTaskDialog(207)
		return 0;
	end
	UTask_em = GetTask(1);
	if (UTask_em == 10*256+20) then					--�ӵ�10������
		if (HaveItem(19) == 1) then
			Talk(1,"","�ҵ���ĺ���Ϣ! ")
		else
			Talk(3, "L10_step1", "����ʦ���Ѿ������ǵ�����������ˣ��һ���취���������ƾ���Բ�����ܰ���һ�뾵�Ӹ�����? ", "�ǾͰ������ˣ��������ô��?", "���ɶ����������ԣ�������ʲô�취?")
		end
	elseif (UTask_em == 10*256+60) then 					--ͭ���Ѳ���
		Talk(2, "", "��磬�������Ѿ���ͭ���޺���! ", "̫���ˣ����ȥ��ͭ�����������Ӱ�! ")
	elseif (UTask_em == 10*256+70) and (HaveItem(20) == 1) then		--�������һ��
		Talk(2, "", "��磬����ʦ�����Ұ������޲��õ�ͭ�������㣬��Ҫ������Ը��Ը��������꣬��������ͻ�ص�������.", "�鷳����������ӣ���˵���꣬������ʮ�꣬��Ҳ�����ȥ��")
		DelItem(20)
		SetTask(1, 10*256+80)
		AddNote("��ͭ�������������๫��ת��������Ѫ������")
		Msg2Player("��ͭ�������������๫��ת��������Ѫ������ ")
	elseif (UTask_em >= 10*256+80) then 					--������ɺ�ĶԻ�
		Talk(1,"","����Ҷ���")
	else
		Talk(1,"","���Ƿ���ʲôʱ���������?")
	end
end;

function L10_step1()
	AddEventItem(19)
--	SetTask(1, 14)
	AddNote("��ɽ���ҵ��������๫�����һ��ͭ��. ")
	Msg2Player("��ɽ���ҵ��������๫�����һ��ͭ��. ")
end;
