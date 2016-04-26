--	2007´º½Ú»î¶¯
if (not _H_SPRINGFESTIVAL_) then
_H_SPRINGFESTIVAL_ = 1;
Include([[\script\lib\pay.lua]]);

TASKID_TOTALEXP = 1795;
UNIT_WAN = 10000;
EXP_MAXIMUM = 5 * UNIT_WAN * UNIT_WAN;
function sf07_isactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20070202 or nDate > 20070306) then
		return 0;
	end;
	return 1;
end;

function sf07_isgoodsactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20070202 or nDate > 20070331) then
		return 0;
	end;
	return 1;
end;

function sf07_isrightuser()
	if (IsCharged() == 0) then
		return 2;
	end;
	
	if (GetLevel() < 50) then
		return 3
	end;
	return 1;
end;

function no()

end;

end;