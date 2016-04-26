function valentine2008_lib_AddAwardByRate(tbList, szActName)
	
	if tbList == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbList) do
		rstep=rstep+floor(tbList[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			valentine2008_lib_AddAward(tbList[i], szActName)
			return i;
		end
	end
	return 0
end
function valentine2008_lib_AddAward(tbItemList, szActName)
	local tbItemProp	= tbItemList.tbProp
	local szItemName	= tbItemList.szName
	local nExp			= tbItemList.nExp
	if tbItemProp and szItemName then
		local nPropCount = getn(tbItemProp)
		if nPropCount == 6 then
			AddItem(tbItemProp[1],tbItemProp[2],tbItemProp[3],tbItemProp[4],tbItemProp[5],tbItemProp[6]);
		elseif nPropCount == 2 then
			AddGoldItem(tbItemProp[1],tbItemProp[2])
		end
		Msg2Player(format("得到一个%s。",szItemName))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tget a item %s.",szActName,
	            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	end
	if nExp then
		AddOwnExp(nExp)
		Msg2Player(format("获得%d经验。", nExp))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tget exp %d.",szActName,
	            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(), nExp ))
	end
end