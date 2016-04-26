Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

tbMapList =
{
	[11]	=	1,	
	[1]		=	1,	
	[37]	=	1,	
	[176]	=	1,	
	[162]	=	1,	
	[78]	=	1,	
	[80]	=	1,	
}

function main(nItemIndex)
	local nValueParam =GetItemParam(nItemIndex,1)
	local nMaxCount = 0
	
	if (IsCityMap() ~=1) then
		Talk(1, "", "非战斗城市区域才能使用")
		return 1
	end
	
	if (nValueParam <= 0 ) then
		Talk(1,"","已取出其中的全部富贵锦盒了，可以丢弃.")
		return 0
	end
	
	if (nValueParam >= 60 ) then
		nMaxCount = 59
	else
		nMaxCount = nValueParam
	end
	
	local szTitle = "请输入需要取出的数"
	g_AskClientNumberEx(1, nMaxCount, szTitle, {GetPQCH,{nItemIndex}})
	
	return 1
end

function GetPQCH(nItemIndex,nCount)
	local tbAward = {szName = "富贵锦盒", tbProp = {6,1,2402,1,0,0}, nCount = 1, nExpiredTime = 20160}
	local nItemParam = GetItemParam(nItemIndex,1)
	
	if ( nCount > CalcFreeItemCellCount() ) then
		Talk(1,"",format("装备不足 %d 空位..",nCount))
		return
	end
	
	if (IsMyItem(nItemIndex) ~=1) then
		return
	end
	
	if ( nCount > nItemParam ) then
		Talk(1,"",format("目前你只还有 %d 富贵锦盒..",nItemParam))
		return	
	end
	
	local ntemp =  nItemParam - nCount
	
	if (ntemp <= 0) then
		RemoveItemByIndex(nItemIndex)
	else
		SetSpecItemParam(nItemIndex,1,ntemp)
		SyncItem(nItemIndex)
		SetItemBindState(nItemIndex, -2)
	end
	
	tbAwardTemplet:Give(tbAward, nCount,{"DenBuPQCH2011","NhanPQCHTuTangRuong"})
end

function IsCityMap()
 	local nMapId =GetWorldPos()
	if (tbMapList[nMapId] == 1 and GetFightState() == 0) then
		return 1
	else
		return 0
	end
end

function GetDesc(nItemIndex)
	local nValueParam =GetItemParam(nItemIndex,1)
	return format("还剩余 :<color=yellow>%d<color>富贵锦盒", nValueParam)
end
