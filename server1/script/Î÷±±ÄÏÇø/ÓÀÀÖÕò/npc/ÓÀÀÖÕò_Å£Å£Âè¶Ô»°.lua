--description: ������_ţţ��
--author: wangzg
--date: 2003/7/18
--modify 2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main(sel)
	UTask_world37=GetTask(65)
	if ((UTask_world37==0) and (GetLevel() >= 2)) then		-- Ҫ��ȼ�����2��
		Say("�Ҽ�ţţһ�쵽��˵Ҫȥ�������������ֲ�֪���ܵ���ȥ�ˣ����Ǽ��������Ҽ�ţţһ�쵽��˵Ҫȥ�������������ֲ�֪���ܵ���ȥ�ˣ����Ǽ�������",2,"��ɩ���ģ��Ұ�����/yes", "��ȥ��/no")
	elseif (UTask_world37==2) then
		Talk(1,"","��ɩ���ģ��Ұ�����")
	else
		Talk(1,"","��������̫ƽ�������ֲ����������ǲ��İ�!")
	end
end;

function yes()
	Talk(1,"","�����Ǻ��ˣ����鷳���æ��")
	SetTask(65,2)
	AddNote("�����񣺰�ţţ���Һ���")
	Msg2Player("�����񣺰�ţţ���Һ���")
end

function no()
end
