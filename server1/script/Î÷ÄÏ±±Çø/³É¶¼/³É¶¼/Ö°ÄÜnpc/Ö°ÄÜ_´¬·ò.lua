--���ϱ��� �ɶ� ����Ի�

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("������Ȼû�д���������Ҳ�ܴ���ȥ!", 2, "ȥ�һ��� (6) /go_thd", "����/OnCancel")
	else
		Talk(1, "", "����ʲôʱ��������д�!")
	end
end;

function  OnCancel()
   Talk(1,"","ûǮ��������! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(240);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","ȥ�һ����ķ���Ϊ"..AEXP_TICKET.."�����㹻��? ")
	end
end
---------------------------------------------------------------
