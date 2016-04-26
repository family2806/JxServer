--剑网三周年活动
--寿禧礼包
--蓝怪掉落，右键使用 随机获得物品

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	local ntotalrate = 0;
	local naddrate = 0;
	local nrand = 0;
	local nItemN = 0;
	for i = 1, getn(tb_JXAN_SHOUXIGIFT) do
		naddrate = naddrate + tb_JXAN_SHOUXIGIFT[i][3];
	end;
	
	nrand = random(naddrate);
	naddrate = 0;
	for i = 1, getn(tb_JXAN_SHOUXIGIFT) do
		naddrate = naddrate + tb_JXAN_SHOUXIGIFT[i][3];
		if (naddrate >= nrand) then
			nItemN = i;
			break
		end;
	end;
	
	local nG, nD, nP, nL = tb_JXAN_SHOUXIGIFT[nItemN][1][1], tb_JXAN_SHOUXIGIFT[nItemN][1][2], tb_JXAN_SHOUXIGIFT[nItemN][1][3], tb_JXAN_SHOUXIGIFT[nItemN][1][4];
	if (nD == 2) then
		shouxi_CreateBook()
	else
		AddItem(nG, nD, nP, nL, 1, 1);
		Msg2Player("您得到了<color=green>"..tb_JXAN_SHOUXIGIFT[nItemN][2].."<color>一个");
		WriteLog(date().."\t[剑网三周年]\tName:"..GetName().."\tAccount:"..GetAccount().."\t从寿禧礼包中获得"..tb_JXAN_SHOUXIGIFT[nItemN][2].."一个")
	end;
end;