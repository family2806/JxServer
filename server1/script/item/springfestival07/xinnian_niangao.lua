--–¬ƒÍƒÍ∏‚
--p=1342	¡´»ÿ ≤ΩıƒÍ∏‚	100wæ≠—È
--p=1343	πª®∞Ÿπ˚ƒÍ∏‚	200wæ≠—È
--p=1344	¿”„œ„√◊ƒÍ∏‚	500wæ≠—È
--Ωÿ÷¡»’∆⁄2007-3-6

Include("\\script\\item\\springfestival07\\xinnian_head.lua")

function main(nItemIdx)
	if (isTakeXinNianItem(nItemIdx) ~= 1) then
		return 1;
	end;
	
	local _, _, np = GetItemProp(nItemIdx);
	local nCurExp = GetTask(TSK_XINNIANNIANGAO_MAXEXP);
	if (nCurExp >= XINNIAN_MAXEXP) then
		Say("Ng≠¨i chﬁu kh´ng ›t n®m cao , lπi nh◊n th y n®m cao mÈt chÛt cÚng kh´ng muËn ®n rÂi . ", 0);
		return 1;
	end;
	
	if (np == 1342) then
		nAddExp = 1000000;
	elseif (np == 1343) then
		nAddExp = 2000000;
	elseif (np == 1344) then
		nAddExp = 5000000;
	else
		return 1;
	end;
	
	local szmsg = format("Ng≠¨i thu Æ≠Óc %d kinh nghi÷m trﬁ gi∏ ",nAddExp);
	if (nCurExp + nAddExp > XINNIAN_MAXEXP) then
		nAddExp = XINNIAN_MAXEXP - nCurExp;
		szmsg = format("Ng≠¨i thu Æ≠Óc %d kinh nghi÷m trﬁ gi∏ £¨‘Ÿ“≤≤ªœÎ≥‘ƒÍ∏‚¡À",nAddExp);
	end;
	
	AddOwnExp(nAddExp);
	SetTask(TSK_XINNIANNIANGAO_MAXEXP, nCurExp+nAddExp);
	Msg2Player(szmsg);
	WriteLog(format("[ n®m mÌi n®m cao ]\t%s\tName:%s\tAccount:%s\t sˆ dÙng mÈt %s Æπt Æ≠Óc %d kinh nghi÷m ",GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount(), GetItemName(nItemIdx),nAddExp));
end;