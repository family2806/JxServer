--2007年情人节--玫瑰花
--完美的红玫瑰	6,1,1362,1,0,0
--普通的红玫瑰	6,1,1363,1,0,0
--红玫瑰花蕾	6,1,1364,1,0,0

Include("\\script\\event\\valentine2007\\head.lua");

function main(nItemIdx)
	if (checkValentine2007Date(20070306) ~= 1) then
		Say("这朵玫瑰花存放时间太长，已经枯萎了。", 0);
		return 0;
	end;
	
	if (checkValentine2007Limit() ~= 1) then
		Say("不好意思，只有等级达到<color=yellow>80级<color>以上的用户，才能使用玫瑰花。", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1362) then
		nexp = 1500000;
	elseif (np == 1363) then
		nexp = 1000000;
	elseif (np == 1364) then
		nexp = 500000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_VALENTINE_ROSE_ADDEXP);
	if (ncurexp >= 100000000) then
		Say("你使用了很多玫瑰，这朵玫瑰对你已经没有效用了", 0);
		Msg2Player("每个人通过使用玫瑰最多获得一亿经验");
		return 1;
	elseif ((ncurexp + nexp) > 100000000) then
		nexp = 100000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_VALENTINE_ROSE_ADDEXP, ncurexp + nexp)
	Msg2Player(format("你获得了%d经验值", nexp));
	local szlog = format("[2007情人节]\t%s\tName:%s\tAccount:%s\t使用%s获得了%d经验值",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;