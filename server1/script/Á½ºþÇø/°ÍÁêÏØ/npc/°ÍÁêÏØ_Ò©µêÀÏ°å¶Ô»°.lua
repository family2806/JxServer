--description: ������ ������ ҩ���ϰ�Ի���������40��������������С������Ĳ���
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- ����40������
		Talk(5, "L40_tw_talk2", "������������ĵ���, ����һ��ͬ�����˳����ߵĶ�������ҽ���ҽ�ҩ!", "������? �����̫Σ����..�ҿ��Ծ�, Ҫ�Ҳ�������ҩ!", "��֪��Ҫʲô�����أ�", "���ǼҴ��ؾ�, ���������������Ҿ�˵������! Ҫ��<color=Red>���������Ƭ<color> ��<color=Red>��ë�����ϵ�ë<color>. �ҵ����������������ͬ�ž��о���", "��֪�������ҵ�������������")
	elseif(UTask_world18 == 1) then				-- ���ִ�С������
		Talk(1,"","����ҽ���ޣ�С��ĵ��������ˣ������Ŀ��治�ɣ��ս���һ��������ȫ�����������ˡ�Ҫ������ȥ���ʴ���������ĵ��ӣ�")
		Msg2Player("ҩ���ϰ�����������������꣬��ȥѰ�����������")
		AddNote("ҩ���ϰ�����������������꣬��ȥѰ�����������")
	elseif (UTask_tw == 40*256+50) then
		Say("��˵��<color=Red>������<color> ��<olor=Red>������<color> ��<color=Red>��ë��<color>, ������<color=Red>������<color>������. ֻҪ�ҵ����ͬ�ž��о���", 2, "����ȥ��һ��ҩ/yes", "��Ҫ����ȥ��ҩ��/no")
	else							-- ������״̬
		Say("����ҽ�������ﶼ���Ϻõ�ҩ�ģ��в��β����޲�ǿ�������ʵ����ٰ�����Ҫ���ʲôҩ��", 3, "����/yes", "�����������������/yboss","������/no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","��˵��<color=Red>������<color> ��<color=Red>������<color> ��<color=Red>��ë��<color>, ������<color=Red>������<color>������", "��л��ҽ!")
	SetTask(3, 40*256+50)								-- ����40������
	AddNote("�������ص���ҽ˵: ��Ҫ���߶�Ҫ�л�����Ƥ����ë��")
	Msg2Player("��Ҫ���߶�Ҫ�л�����Ƥ����ë��.")
end;

function yes()
	Sale(39);  			--�������׿�
end;

function no()
end;
