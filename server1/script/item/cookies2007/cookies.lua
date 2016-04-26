--2007三月初三--烧饼
--完美的烧饼	6,1,1395,1,0,0
--普通的烧饼	6,1,1396,1,0,0
--未熟的烧饼	6,1,1397,1,0,0

Include("\\script\\event\\cookies2007\\head.lua");

function main(nItemIdx)
	if (checkcookies2007Date(20070506) ~= 1) then
		Say("该饼已过使用期，快点扔掉", 0);
		return 0;
	end;
	
	if (checkcookies2007Limit() ~= 1) then
		Say("真是不好意思，只有玩家<color=yellow>50级以上且充值<color> 才能吃饼.", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1395) then
		nexp = 800000;
	elseif (np == 1396) then
		nexp = 500000;
	elseif (np == 1397) then
		nexp = 300000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_33_COOKIES_ADDEXP);
	if (ncurexp >= 300000000) then
		Say("您已吃很多饼了，不能再吃了.", 0);
		Msg2Player("吃饼时，每人只获得3亿经验值.");
		return 1;
	elseif ((ncurexp + nexp) > 300000000) then
		nexp = 300000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_33_COOKIES_ADDEXP, ncurexp + nexp)
	Msg2Player(format("您获得%d 经验值", nexp));
	local szlog = format("[2007 3月3]\t%s\tName:%s\tAccount:%s\t 使用%s 获得%d 经验值",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;