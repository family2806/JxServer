--description: ���ϱ��� �ɶ��� �������ϰ� ������10������
--author: yuanlan	
--date: 2003/5/24
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>��������û����Ȥ���������ѧͽ�����԰�סร�"

function main(sel)
	UTask_em = GetTask(1)
	if ((UTask_em == 10*256+20) and (HaveItem(18) == 1) and (HaveItem(19) == 1)) then
		Talk(5, "", "������磬���ܲ��ܰ��Ұ�������ͭ�����¸�ԭ��һ��?", "Ҫ�ǻ��˱��ˣ��븴ԭһ��ͭ�������ڵ��죬������ȴ��һ���洫�����գ�ר�������޲�ͭ�����������Ҷ����ˣ�ֻ����...", "��Ҫ����Ǯ�ſ��޸�ͭ��?", "ֻҪ���ܰ����ҵ�һ�ֽ���������Ŀ�ʯ���ҾͰ����޲������ͭ������˵�����������о��������󣬲�����Ϊ�����кܶ���˵�Ұ�ޣ�����ƽʱû�˸�ȥ�ɿ�.","���ˣ��ҷ����龵�����������ȥ��������.")
		DelItem(18)
		DelItem(19)
		SetTask(1, 10*256+40)
		AddNote("���ɶ��ҵ�������֪����Ҫ����������ԭͭ��")
		Msg2Player("���ɶ��ҵ�������֪����Ҫ����������ԭͭ��")
	elseif (UTask_em == 10*256+40) then
		if (HaveItem(118) == 1) then
			Talk(1, "", "�ܺã����������ˣ��ҾͰ��㸴ԭ����.")
			DelItem(118)
			AddEventItem(20)
			SetTask(1, 10*256+60)
			AddNote("����������������õ���ԭ��ͭ��")
			Msg2Player("�õ���ԭ��ͭ��")
		else
			tiejiang_city("<dec><npc>��˵�����������о���������û��������Ͳ��ܸ�ԭ����.");
		end
	elseif ((UTask_em == 10*256+60) and (HaveItem(20) == 0)) then		-- �����У�ͭ������
		AddEventItem(20)
		Msg2Player("��ø�ԭ��ͭ��.")
		Talk(1,"","���������ľ��Ӳ����˰�?")
	else
		tiejiang_city(TIEJIANG_DIALOG);
	end
end;

function yes()
Sale(13)  			--�������׿�
end;

