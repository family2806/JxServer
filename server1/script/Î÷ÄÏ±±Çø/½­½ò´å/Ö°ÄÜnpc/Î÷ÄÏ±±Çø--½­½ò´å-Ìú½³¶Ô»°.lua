--���ϱ������������
--������������񣺻��ӵĵ���
--suyu
-- Update: Dan_Deng(2003-08-11)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>������������ı���ȫ���Ǿ�����ͣ����Ҽ۸񹫵����������߽������������壬û�����ֵı�����ô�У���һ�Ѱɣ�"

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	Uworld1000 = nt_getTask(1000)	
	if(UTask_world45 == 10) then
		Talk(1,"","������������С���ӵĵ���ѽ���һ�û�ж������أ���Ҫ��ԭ�ϻ�û��ȥ�ң��ҵ��������߲����������ɣ�������ҵ���辺�ţƤ������ԭ�������Ͼ������á�")
		SetTask(45, 20)
		AddNote("������Ҫ�µ�ԭ�ϲ������������������һ����辺�ţƤ .")
		Msg2Player("������Ҫ�µ�ԭ�ϲ������������������һ����辺�ţƤ.")
	elseif(UTask_world45 == 20) then
		if((HaveItem(177) ==1 ) and (HaveItem(178) == 1)) then	--�ж��Ƿ��е���
		Talk(2,"","����������ô����ҵ��ˣ�����辺�ţƤ�����Ұɣ������϶�������","�����������ˣ�����Ұѵ�������С���Ӱɡ�˳���������Ҫ̫��ƤӴ��")
			DelItem(177)		--ɾ�����
			DelItem(178)		--ɾ��ţƤ
			AddEventItem(176)		--����ҵ���
		Msg2Player("��õ���һ�ѵ�����")
			AddNote("���������˵����������ȥ������ .")
			Msg2Player("���������˵����������ȥ������.")
--			SetTask(46, 3)
		else
			tiejiang_village("<dec><npc>��������辺�ţƤ���ҵ����ø��ң������ϰ�С��������������")
		end
	else
		tiejiang_village();
	end
end;

function yes()
	Sale(22);  				--�������׿�
end;
