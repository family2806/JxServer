-- С�������		���ʹ��
-- By Spe(2004-01-01)

NUM20E = 2000000000;

function main(nItemIdx)
	local ng, _, np = GetItemProp(nItemIdx);
	
	local exp=GetExp();
	
	if (exp < 0) then
		exp = exp*-1;
		if (ng == 6 and np == 12) then
			if (exp >= NUM20E) then
				exp = NUM20E;
			end
		elseif (ng == 6 and np == 2392) then
			exp = floor (exp / 2);
--		elseif (ng == 6 and np == 2393) then		-- ������ľ� �� 100%����
		end
		
		sutra_addexp(exp)
		Msg2Player("����ϸ�о������ľ������о�ȫ���泩��ʵս����ָ�����. ")
		return 0
	end 
	
	Msg2Player("���о������ľ����죬������Ȼ��δ����ʲô")
	return 1;
end


function sutra_addexp(n_exp)
	local n_count = 100;
	while (n_exp > 0) do
		if (n_exp >= 20e8) then
			AddOwnExp(20e8);
			n_exp = n_exp - 20e8;
		else
			AddOwnExp(n_exp);
			n_exp = 0;
			break
		end
	end
end
