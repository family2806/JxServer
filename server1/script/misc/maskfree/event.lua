Include("\\script\\lib\\basic.lua")

MASKFREE_SWITH = 1;		--1:Open   
											--nil:Close

TB_MASKFREE_1 = {
	{"���- ���", 369},
	{"���- ��ѿ", 370},
	{"���- ˪��", 371},
	{"���- �䵶", 372},
	{"���- ��ǹ", 373},
	{"���- ����", 374},
	{"���- ����", 375},
	{"���- ����", 376},
	{"���- ����", 377},
	{"���- ��ٺ", 378},
	--{"",},
}
TB_MASKFREE_2 = {
	{"���-������", 379},
	{"���- ������", 380},
	{"���- �ȿ�", 381},
}

TB_MASKFREE_3 = {
	{"���- ������ʦ", 382},
	{"���- ����", 383},
}

TB_MASKFREEINFO_BYBIT = {
	--BIT		MASKTYPE					TABLE-MASK
	[1] = {"5000 Խ�϶ܵ���� ", TB_MASKFREE_1},
	[2] = {"20000 Խ�϶ܵ���� ", TB_MASKFREE_2},
	[3] = {"60000 Խ�϶ܵ���� ", TB_MASKFREE_3},
--	[4] = {},
--	[5] = {},
--	[6] = {},
--	[7] = {},
--	[8] = {},
--	[9] = {},
--	[10] = {},
--	[11] = {},
--	[12] = {},
--	[13] = {},
--	[14] = {},
--	[15] = {},
--	[16] = {},
}

--print(getn(TB_MASKFREEINFO_BYBIT[1][2]))


function takeMaskFree()
	local aryMaskFree = {};
	local nExtValue = GetExtPoint(6);
	
	if (nExtValue <= 0) then
		Say("�͹ٲ�����ȡ�������������� ", 0);
		return
	end;
	
	for nbit, maskinfo in TB_MASKFREEINFO_BYBIT do
		if (get_extpoint_bit(6, nbit) == 1 and getn(TB_MASKFREEINFO_BYBIT[nbit]) ~= 0) then
			tinsert(aryMaskFree, TB_MASKFREEINFO_BYBIT[nbit][1].."/#sure2takeMaskFree("..nbit..")")
		end;
	end;
	
	tinsert(aryMaskFree, "���»��� /no")
	
	Say("�������������? ", getn(aryMaskFree), aryMaskFree);
end;

function sure2takeMaskFree(nbit)
	local tbMask = TB_MASKFREEINFO_BYBIT[nbit][2];
	local nItem = random(getn(tbMask));
	
	if (pay_extpoint_bit(6, nbit) == 1 and nItem > 0) then
		local szname, np = unpack(tbMask[nItem]);
		AddItem(0, 11, np, 1, 1, 1);
		Say("�������"..szname..".��л��֧��", 0);
		WriteLog("[MASKFREE]"..date().." Name:"..GetName().." Account:"..GetAccount().." take a mask : "..szname.." by bit:"..nbit);
	else
		print("ERROR!! PAY EXTPOINT6 FAIL! THE BIT:"..nbit)
	end;
end;

function get_extpoint_bit(nextp, nbit)
	local nvalue = GetExtPoint(nextp);
	return GetBit(nvalue, nbit)
end;

function pay_extpoint_bit(nextp, nbit)
	local npoint = 2^(nbit-1); -- nBit��1��ʼ����
	return PayExtPoint(nextp, npoint);
end;
