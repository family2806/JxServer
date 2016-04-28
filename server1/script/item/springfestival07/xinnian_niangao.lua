--ÐÂÄêÄê¸â
--p=1342	Á«ÈØÊ²½õÄê¸â	100w¾­Ñé
--p=1343	¹ð»¨°Ù¹ûÄê¸â	200w¾­Ñé
--p=1344	ÀðÓãÏãÃ×Äê¸â	500w¾­Ñé
--½ØÖÁÈÕÆÚ2007-3-6

Include("\\script\\item\\springfestival07\\xinnian_head.lua")

function main(nItemIdx)
	if (isTakeXinNianItem(nItemIdx) ~= 1) then
		return 1;
	end;
	
	local _, _, np = GetItemProp(nItemIdx);
	local nCurExp = GetTask(TSK_XINNIANNIANGAO_MAXEXP);
	if (nCurExp >= XINNIAN_MAXEXP) then
		Say("Ng­¬i chÞu kh«ng Ýt n¨m cao , l¹i nh×n thÊy n¨m cao mét chót còng kh«ng muèn ¨n råi . ", 0);
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
	
	local szmsg = format("Ng­¬i thu ®­îc %d kinh nghiÖm trÞ gi¸ ",nAddExp);
	if (nCurExp + nAddExp > XINNIAN_MAXEXP) then
		nAddExp = XINNIAN_MAXEXP - nCurExp;
		szmsg = format("Ng­¬i thu ®­îc %d kinh nghiÖm trÞ gi¸ , còng n÷a kh«ng muèn ¨n n¨m cao liÔu ",nAddExp);
	end;
	
	AddOwnExp(nAddExp);
	SetTask(TSK_XINNIANNIANGAO_MAXEXP, nCurExp+nAddExp);
	Msg2Player(szmsg);
	WriteLog(format("[ n¨m míi n¨m cao ]\t%s\tName:%s\tAccount:%s\t sö dông mét %s ®¹t ®­îc %d kinh nghiÖm ",GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount(), GetItemName(nItemIdx),nAddExp));
end;