--�������˶Ի�
--�±�����Ӧ��Ʒ
--mingyuelaoren.lua
--2005-09-07


tbCAKE2GIFT = {
		[891] = { "<#> ��ɳ�±� ", "<#> 1�ɲ�¶",			{ 6, 1, 71, 1, 0, 0, 0 } },
		[893] = { "<#> ���ƶ�ɳ�±�", "<#> 1��Ե¶(��) ",		{ 6, 1, 124, 1, 0, 0, 0 } },
		[895] = { "<#> �����±�", "<#> ���غ��",			{ 6, 1, 402, 1, 0, 0, 0 } },
		[896] = { "<#> ʲ���±� ", "shijin_ex_goldequip()" }
}

tbSHIJIN2GOLDEQUIP = {
		{ "<#> �ƽ�ͼ��- ������ɴ����", { 0, 159 }, 0.12 },
		{ "<#> �ƽ�ͼ��- ������ɰ����", { 0, 160 }, 0.12 },
		{ "<#> �ƽ�ͼ��- ���������ѥ", { 0, 161 }, 0.12 },
		{ "<#> �ƽ�ͼ��- �������ٻ���", { 0, 162 }, 0.12 },
		{ "<#> �ƽ�ͼ��- ������������", { 0, 163 }, 0.12 },
		{ "<#> �ƽ�ͼ��- �������ʯ����", { 0, 164 }, 0.1 },
		{ "<#> �ƽ�ͼ��- ����ջ�ʯָ��", { 0, 165 }, 0.1 },
		{ "<#> �ƽ�ͼ��- �������ʯ����", { 0, 166 }, 0.1 },
		{ "<#> �ƽ�ͼ��- ���Ѫʯ��ָ", { 0, 167 }, 0.1 },
}

function main()
	local tbOpp = {
				"<#> ���Ƕ�ɳ�±�, ��Ʒ��/#cake_ex_gift(891)",
				"<#> ���ǵ��ƶ�ɳ�±�, ��Ʒ��/#cake_ex_gift(893)",
				"<#> ���ǹ����±�, ��Ʒ��/#cake_ex_gift(895)",
				"<#> ����ʲ���±�, ��Ʒ��/#cake_ex_gift(896)",
				"<#> ûʲô����ֻ��̽�����˶���!/OnCancel",
	}
	Say("<#> ����ʦ�������±������ն����ϳ˵�. ÿ���Ҷ�����������. �������л�Ҫ˵��?", getn(tbOpp), tbOpp )
end

function OnCancel()
end

function cake_ex_gift(dtype)
	local count = CalcEquiproomItemCount( 6, 1, dtype, -1 )
	if ( count <= 0 ) then
		Say("<#> �����ˣ�����±��أ���ϷŪ������?", 1, "<#> �Բ����Ҵ���!/OnCancel" )
		return
	end
	Say("<#> ��! ��ǰ��δ�Թ���ô�óԵ��±�������һ����⣡�кóԵ��±�Ҫ�ǵ��û��������ǰ���", 1, "��ȡ����!/#take_ex_gift("..dtype..")")

end

function take_ex_gift(dtype)
	local dpass = ConsumeEquiproomItem(1, 6, 1, dtype, -1)
	if ( dpass ~= 1 ) then
		print("delete item cake error dtype = "..dtype)
		return
	end
	Msg2Player("<#> ��ʧȥ 1 "..tbCAKE2GIFT[dtype][1])
	
	if ( dtype == 896 ) then
		shijin_ex_goldequip()
	else
		AddItem(tbCAKE2GIFT[dtype][3][1], tbCAKE2GIFT[dtype][3][2], tbCAKE2GIFT[dtype][3][3], tbCAKE2GIFT[dtype][3][4], tbCAKE2GIFT[dtype][3][5], tbCAKE2GIFT[dtype][3][6], tbCAKE2GIFT[dtype][3][7] )
		Msg2Player("<#> ��õ� "..tbCAKE2GIFT[dtype][2])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[dtype][1].." in exchange for "..tbCAKE2GIFT[dtype][2])
	end
end

function shijin_ex_goldequip()
	local base = 0
	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		base = base + tbSHIJIN2GOLDEQUIP[ i ][ 3 ]
	end
	base = 100 * base
	
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		sum = sum + tbSHIJIN2GOLDEQUIP[i][3] * 100
		if( sum >= num ) then
			AddGoldItem( tbSHIJIN2GOLDEQUIP[i][2][1], tbSHIJIN2GOLDEQUIP[i][2][2] )
			Msg2Player("<#> ��õ� 1 b?"..tbSHIJIN2GOLDEQUIP[i][1])
			WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[896][1].." in exchange for "..tbSHIJIN2GOLDEQUIP[i][1])
			break
		end
	end
end