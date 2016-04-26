Include("\\script\\missions\\datusha\\datusha.lua")
Include("\\script\\lib\\awardtemplet.lua")
function main()
	local tbEgg = {szName="������˵�", tbProp={6, 1, 1714, 1, 0, 0}, nCount = 10, nExpiredTime = 30}
	local pDungeon = DungeonList[MAP_ID]
	if not pDungeon then
		return
	end
	local pData = pDungeon.tbPlayer[GetName()]
	if not pData then
		return
	end
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "", "��������")
	end
	if not pData.bIsGetEgg then
		tbAwardTemplet:Give(tbEgg, 1, {"��ս���ݹ�","��ȡ���˵�"})
		pData.bIsGetEgg = 1
	else
		Talk(1, "", "���Ѿ��콱��")
	end	
end

function OnCancel()
	
end