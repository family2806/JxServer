--�������� ���� ������ͷ����Ի�
--suyu
--20031029

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("�ƺӾ����壬���ںӵ���ߣ�����ɽ���Ǳߣ������ɽ�������������.", 3, "����/WharfFun", "����/OnCancel", "�iȥ�һ���(5) /go_thd")
	else
		Say("�ƺӾ����壬���ںӵ���ߣ�����ɽ���Ǳߣ������ɽ�������������.", 2, "����/WharfFun", "����/OnCancel")
	end
end;

function  OnCancel()
   Talk(1,"","ûǮ��������! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(239);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","���һ������� "..AEXP_TICKET.."�����㹻��? ")
	end
end
---------------------------------------------------------------
