
Include("\\script\\task\\task_addplayerexp.lua");

function main(nItemIdx)
	--疲劳状态
	local nDate = (GetItemParam(nItemIdx, 2)+2000) * 10000 + GetItemParam(nItemIdx, 3);
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nCurDate > nDate) then
		Say("该物品已过使用期!", 0);
		return 0;
	else
		if (GetTiredDegree() == 2) then
			Say("正处于疲惫状态，不能使用该物品.", 0);
			return 1;
		else
			local nExp= GetItemParam(nItemIdx, 1) * 1000;
			tl_addPlayerExp(nExp);
			Msg2Player(format("您获得%d经验值", nExp));
			WriteLog(format("[累计野叟]\t%s\tName:%s\tAccount:%s\t 获得%d 经验值.",
					GetLocalDate("%Y%m%d %X"),
					GetName(),
					GetAccount(),
					nExp));
			return 0;
		end;
	end;
	return 1;
end;

function GetDesc(nItemIdx)
	local nExp= GetItemParam(nItemIdx, 1) * 1000;
	local nYear = (GetItemParam(nItemIdx, 2)+2000)
	local nMMDD = GetItemParam(nItemIdx, 3)
	local nMonth = floor(nMMDD / 100);
	local nDate = mod(nMMDD , 100);
	
	return format("经验值: %d<enter>使用时间: %d-%d-%d", nExp, nYear, nMonth,nDate);
end;