--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==2) then
		Talk(3, "select", "�������죿", "��ʲô��?", "����˽����ȥ")
	elseif (UTask_world46==10) then
		Talk(1,"","����ͨ�ˣ��⼸��������ף�û���¾Ͳ�Ҫ������.")
	else
		Talk(1,"","С�ֵܣ���Ҫ����˵����Ů�˹ܣ���ô����̫ƽ������?")
	end
end

function select()
	Say(" �á������Ǹ�ĸҹ�棬����ʲô��������Ҫ�ܣ��Ҳ��ͺȵ��ô���á�?", 2, "Ȱ/reason","�����ı��˷��޵���/no")
end

function reason()
	Talk(2, "prise", "ʮ���޵�ͬ���ɣ������޵ù����ߣ��������ޣ�Ե���ѵã��㻹�ǻ�ȥ�������Ӻͺð�."," ���ˣ������Ϸ������ˣ���Ҳ������������.")
end;

function prise()
	Talk(1,"","�ҵȻ�ͻ�ȥ���������е��ҩ������ʮ��ϰ��֮�ˣ����͸���ɮ�.")
	SetTask(74,10)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddRepute(5)
	AddNote("�ɹ�˵������ؼң��������")
	Msg2Player("�ɹ�˵������ؼң��������")
	Msg2Player("���3����ҩ ")
	Msg2Player("�����������5��")
end

function no()
end
