--�������� ������ �ƺ���ͷ����Ի�
--suyu
--20031029

CurWharf = 10;
Include("\\script\\global\\station.lua")

function main(sel)
	if (GetLevel() >= 5) then		--�ȼ��ﵽ�弶
		Say("�������������������ĺ����࣡��ɹ�紵�ģ������������˴���ˣ�����˭�������!", 2, "����/WharfFun", "����/OnCancel")
	else		
		Talk(1,"","����̫���ˣ��������޸���֮����һ�������ҵ��������ͷ������!")
	end
end;

function  OnCancel()
   Talk(1,"","ûǮ������! ")
end;