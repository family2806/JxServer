--������ ������ ��������Ի� ����С��������������
--suyu
-- Update: Dan_Deng(2003-08-10)
-- Update: Dan_Deng(2003-08-21) ��������ͱ��ŵ��ӻ�����
-- Update��Dan_Deng(2003-09-05) �������������������

Include("\\script\\global\\���ɽ�������\\������������.lua")

function main(sel)
	UTask_world18 = GetTask(46);
	if(UTask_world18 == 1) and (HaveItem(180) == 0) then
		Talk(1,"","T� B� Ho�n d� nhi�n l� �� c�u ng��i. Ta t�ng ng��i m�t vi�n")
		AddEventItem(180)
--		SetTask(46, 2)				-- Ϊ������������ֻ�����߲��ӱ���ֵ
		Msg2Player("B�n nh�n ���c 1 T� B� Ho�n")
		AddNote("B�n nh�n ���c 1 T� B� Ho�n")
	else
		default_talk()
	end
end;
