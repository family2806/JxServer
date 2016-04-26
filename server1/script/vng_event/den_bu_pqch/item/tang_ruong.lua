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
		Talk(1, "", "��ս�������������ʹ��")
		return 1
	end
	
	if (nValueParam <= 0 ) then
		Talk(1,"","��ȡ�����е�ȫ����������ˣ����Զ���.")
		return 0
	end
	
	if (nValueParam >= 60 ) then
		nMaxCount = 59
	else
		nMaxCount = nValueParam
	end
	
	local szTitle = "��������Ҫȡ������"
	g_AskClientNumberEx(1, nMaxCount, szTitle, {GetPQCH,{nItemIndex}})
	
	return 1
end

function GetPQCH(nItemIndex,nCount)
	local tbAward = {szName = "�������", tbProp = {6,1,2402,1,0,0}, nCount = 1, nExpiredTime = 20160}
	local nItemParam = GetItemParam(nItemIndex,1)
	
	if ( nCount > CalcFreeItemCellCount() ) then
		Talk(1,"",format("װ������ %d ��λ..",nCount))
		return
	end
	
	if (IsMyItem(nItemIndex) ~=1) then
		return
	end
	
	if ( nCount > nItemParam ) then
		Talk(1,"",format("Ŀǰ��ֻ���� %d �������..",nItemParam))
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
	return format("��ʣ�� :<color=yellow>%d<color>�������", nValueParam)
end
