function vm_BirthPlan()
	Say("<#> ף�����ִ�����һ�꣬��11/6/2006 �� 18/6 ��λ������������úܶ���Ȥ�Ľ���!", 3,
	"<#> �����յ���./vm_birth_wantcake1",
	"<#> ���ϵ����յ���./vm_birth_wantcake2",
	"<#> ��ֻ�������!/OnCancel")
end

function vm_birth_wantcake1()
	Say("<#> �����յ�����Ҫ<color=yellow>5 ���ۺ�5�Ǿ�<color>.��������", 2,
	"<#> �ԣ���ʦ����æ!/vm_birth_makecake1",
	"<#> �Ժ����!/OnCancel")
end

function vm_birth_makecake1()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and ConsumeEquiproomItem(5, 4, 976, 1, -1) == 1 and ConsumeEquiproomItem(5, 4, 977, 1, -1) == 1) then
		AddItem(6,1,1100,1,1,1)--���յ���
		Say("<#> ���յ��������ã�����ȥ�ʹ�ҷ���!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t ���ִ�������\t"..GetName().."\t"..GetAccount().."\t �����յ���.")
	else
		Say("<#> �����յ�����Ҫ <color=yellow>5 ���ۺ�5�Ǿ�<color>, ��ԭ��������Ŷ", 0)
	end
end

function vm_birth_wantcake2()
	Say("<#> ���ϵ����յ�����Ҫ<color=yellow>5 ���ۺ�5�Ǿ�, 2 ���̺�2������<color>. ��������", 2,
	"<#> �ԡ���ʦ����æ!/vm_birth_makecake2",
	"<#> �Ժ����!/OnCancel")
end

function vm_birth_makecake2()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	local nCount_egg = CalcEquiproomItemCount(4, 978, 1, 1)
	local nCount_milk = CalcEquiproomItemCount(4, 975, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and nCount_egg >= 2 and nCount_milk >= 2) then
		ConsumeEquiproomItem(2, 4, 978, 1, -1)
		ConsumeEquiproomItem(2, 4, 975, 1, -1)
		ConsumeEquiproomItem(5, 4, 976, 1, -1)
		ConsumeEquiproomItem(5, 4, 977, 1, -1)
		AddItem(6,1,1101,1,1,1)--�߼�����
		Say("<#> ���յ��������ã������ȥ���ҷ����!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t ���ִ�������\t"..GetName().."\t"..GetAccount().."\t ���߼�����")
	else
		Say("<#> ���߼�������Ҫ<color=yellow>5 ���ۺ�5�Ǿ�, 2 ���̺�2������<color>, ��ԭ����������", 0)
	end
end