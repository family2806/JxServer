--������ �ٰ��� ������ͷ����Ի�
--suyu
--20031029

CurWharf = 11;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")

function main(sel)
	if (GetLevel() >= 50) then
		Say("�������⴬�ɲ���Ѱ���Ĵ���������Ƕ��ع�����Ҫ����Ҳ�У����ǵ��ȸ�����ʡ�õ�ʱ���ʣ�����һҲ������Ǯ�˵����ӣ����ȸ�ʮ������ɣ�", 3, "����/WharfFun", "����/OnCancel", "<#>�һ���["..AEXP_TICKET.."<#>��]/go_thd");
	else
		Say("�������⴬�ɲ���Ѱ���Ĵ���������Ƕ��ع�����Ҫ����Ҳ�У����ǵ��ȸ�����ʡ�õ�ʱ���ʣ�����һҲ������Ǯ�˵����ӣ����ȸ�ʮ������ɣ�", 2, "����/WharfFun", "����/OnCancel")
	end
end;

function  OnCancel()
   Talk(1,"","����û���ӿ������˴���")
end;

function go_thd()
	nRet = aexp_gotothd(235);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","<#>ȥ�һ���"..AEXP_TICKET.."<#>��������װ������?")
	end
end
