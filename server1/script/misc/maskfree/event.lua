Include("\\script\\lib\\basic.lua")

MASKFREE_SWITH = 1;		--1:Open   
											--nil:Close

TB_MASKFREE_1 = {
	{"面具- 落光", 369},
	{"面具- 银芽", 370},
	{"面具- 霜刀", 371},
	{"面具- 冷刀", 372},
	{"面具- 寒枪", 373},
	{"面具- 奔雷", 374},
	{"面具- 独步", 375},
	{"面具- 降锤", 376},
	{"面具- 赤掌", 377},
	{"面具- 郎俸", 378},
	--{"",},
}
TB_MASKFREE_2 = {
	{"面具-张宗正", 379},
	{"面具- 柳青青", 380},
	{"面具- 扇客", 381},
}

TB_MASKFREE_3 = {
	{"面具- 玄觉大师", 382},
	{"面具- 龙五", 383},
}

TB_MASKFREEINFO_BYBIT = {
	--BIT		MASKTYPE					TABLE-MASK
	[1] = {"5000 越南盾的面具 ", TB_MASKFREE_1},
	[2] = {"20000 越南盾的面具 ", TB_MASKFREE_2},
	[3] = {"60000 越南盾的面具 ", TB_MASKFREE_3},
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
		Say("客官不够领取送面具礼物的条件 ", 0);
		return
	end;
	
	for nbit, maskinfo in TB_MASKFREEINFO_BYBIT do
		if (get_extpoint_bit(6, nbit) == 1 and getn(TB_MASKFREEINFO_BYBIT[nbit]) ~= 0) then
			tinsert(aryMaskFree, TB_MASKFREEINFO_BYBIT[nbit][1].."/#sure2takeMaskFree("..nbit..")")
		end;
	end;
	
	tinsert(aryMaskFree, "等下回来 /no")
	
	Say("你想领哪种面具? ", getn(aryMaskFree), aryMaskFree);
end;

function sure2takeMaskFree(nbit)
	local tbMask = TB_MASKFREEINFO_BYBIT[nbit][2];
	local nItem = random(getn(tbMask));
	
	if (pay_extpoint_bit(6, nbit) == 1 and nItem > 0) then
		local szname, np = unpack(tbMask[nItem]);
		AddItem(0, 11, np, 1, 1, 1);
		Say("这是面具"..szname..".感谢你支持", 0);
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
	local npoint = 2^(nbit-1); -- nBit从1开始计数
	return PayExtPoint(nextp, npoint);
end;
