-- 2007圣诞活动 圣诞糖
-- 使用时间 2007/11/23   00：00~24：00
-- 圣诞糖（极小）	6	1	1622
-- 圣诞糖（小）	6	1	1623
-- 圣诞糖（中）	6	1	1624
-- 圣诞糖（大）	6	1	1625
-- 圣诞糖（极大）	6	1	1626
-- 使用经验上限	1亿

XMASCANDY2007_DATE	=	20071224	-- 圣诞糖使用期限
XMASCANDY2007_EXPLM	=	100000000	--圣诞糖经验上限
TSK_XMASCANDY2007_EXP	=	1861	-- 圣诞糖经验累计记录变量

function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate > XMASCANDY2007_DATE) then		--使用时间判断
		Msg2Player("已过使用期，如果继续使用会有危害，需要放弃");
		Say("已过使用期，如果继续使用会有危害，需要放弃", 0);
		WriteLog(format("[XMASCANDY2007]\t%s\t%s\t%s\t%s",
						GetLocalDate("%Y%m%d %X"),
						GetName(),
						GetAccount(),
						"Delete_Dated_XMASCANDY"	));
		return 0;
	end;
	
	local tb_candy_exp = {
		[1622]	=	15000,
		[1623]	=	25000,
		[1624]	=	40000,
		[1625]	=	50000,
		[1626]	=	100000,
			};
	local ng, nd, np = GetItemProp(nItemIdx);
	local szItemName = GetItemName();
	if (tb_candy_exp[np]) then
		local nCurExp = tb_candy_exp[np] + GetTask(TSK_XMASCANDY2007_EXP);
		if (nCurExp >= XMASCANDY2007_EXPLM) then
			Msg2Player("获得的经验值已达1亿上限，不能再使用了.");
			Say("获得的经验值已达1亿上限，不能再使用了.");
			return 1;
		else
			AddOwnExp(tb_candy_exp[np]);
			SetTask(TSK_XMASCANDY2007_EXP, nCurExp);
			WriteLog(format("[XMASCANDY2007]\t%s\t%s\t%s\t%s%d",
						GetLocalDate("%Y%m%d %X"),
						GetName(),
						GetAccount(),
						"Use_XMASCANDY_Exp:",
						tb_candy_exp[np]	));
		end;
	else
		return 1;
	end;
end;