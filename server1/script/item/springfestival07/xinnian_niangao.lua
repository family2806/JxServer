--新年年糕
--p=1342	莲蓉什锦年糕	100w经验
--p=1343	桂花百果年糕	200w经验
--p=1344	鲤鱼香米年糕	500w经验
--截至日期2007-3-6

Include("\\script\\item\\springfestival07\\xinnian_head.lua")

function main(nItemIdx)
	if (isTakeXinNianItem(nItemIdx) ~= 1) then
		return 1;
	end;
	
	local _, _, np = GetItemProp(nItemIdx);
	local nCurExp = GetTask(TSK_XINNIANNIANGAO_MAXEXP);
	if (nCurExp >= XINNIAN_MAXEXP) then
		Say("你吃了不少年糕，再看到年糕一点儿也不想吃了。", 0);
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
	
	local szmsg = format("你获得了%d经验值",nAddExp);
	if (nCurExp + nAddExp > XINNIAN_MAXEXP) then
		nAddExp = XINNIAN_MAXEXP - nCurExp;
		szmsg = format("你获得了%d经验值，再也不想吃年糕了",nAddExp);
	end;
	
	AddOwnExp(nAddExp);
	SetTask(TSK_XINNIANNIANGAO_MAXEXP, nCurExp+nAddExp);
	Msg2Player(szmsg);
	WriteLog(format("[新年年糕]\t%s\tName:%s\tAccount:%s\t使用了一个%s获得%d经验",GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount(), GetItemName(nItemIdx),nAddExp));
end;