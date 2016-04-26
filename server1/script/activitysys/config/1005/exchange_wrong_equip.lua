Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
tbExchangeWrongEquip = {}
tbExchangeWrongEquip.nStartIdx = 1425
tbExchangeWrongEquip.nEndIdx = 1514
tbExchangeWrongEquip.tbBitTask = tbBITTASK_EXCHANGE_WRONG_EQUIP
function tbExchangeWrongEquip:GetGoldEquipListInRoom()
	local tbRoomItems = GetRoomItems(0)
	local tb = {}
	if getn(tbRoomItems) <= 0 then
		Talk(1, "", "װ����յģ����ټ��")
		return
	end
	local nItemIdx
	for i=1, getn(tbRoomItems) do
		nItemIdx = tbRoomItems[i]
		if nItemIdx > 0 and GetItemQuality(nItemIdx) == 1 then
			nItemEqIdx = GetGlodEqIndex(nItemIdx)
			if GetItemBindState(nItemIdx) == -2 and nItemEqIdx >= self.nStartIdx and nItemEqIdx <= self.nEndIdx then
				if not tb[nItemEqIdx] then
					tb[nItemEqIdx] = nItemIdx
				end
			end
		end
	end
	
	self:CheckItems(tb)
end

function tbExchangeWrongEquip:CheckItems(tb)
	local nFoundIDX = 0
	for i = 0, 8 do
		local nTempIDX = self.nStartIdx + i * 10
		if tb[nTempIDX] then
			nFoundIDX = nTempIDX
			break;
		end
	end
	if nFoundIDX == 0 then
		Talk(1, "", "û�к��ʵ�װ�����Ի�")
		return
	end
	local tbEq2Consume = {}
	for i = 0, 9 do
		if tb[nFoundIDX+i] then
			tinsert(tbEq2Consume, tb[nFoundIDX+i])
		else
			Talk(1, "", "������������Ҫ����װ����װ���䣬Ȼ������")
			return
		end
	end
	if getn(tbEq2Consume) < 10 then
		return
	end
	local tbOpt = {}
	local strTittle = "����װ�������ջأ����ټ��һ��:\n"
	for i = 1, getn(tbEq2Consume) do
		strTittle = strTittle.."<color=red>"..GetItemName(tbEq2Consume[i]).."<color>\n"
	end
	tinsert(tbOpt, {"�ظ���ȡ", tbExchangeWrongEquip.Exchange, {tbExchangeWrongEquip, tbEq2Consume}})
	tinsert(tbOpt, {"����"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbExchangeWrongEquip:Exchange(tbItem)
	for i = 1, getn(tbItem) do
		local strItemName = GetItemName(tbItem[i])
		if IsMyItem(tbItem[i]) ~= 1 or RemoveItemByIndex(tbItem[i]) ~= 1 then
			Talk(1, "", "����װ���ѱ��Ƴ�����ȡʧ�ܣ�ʧȥһЩװ��")
			return
		else
			tbLog:PlayerActionLog("��������", "��ȡ����װ������", "ɾ��Item: "..strItemName)
		end
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTask, 1)
	local tbItem = {szName = "����֮��", tbProp={6,1,30146,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=10080}
	tbAwardTemplet:Give(tbItem, 1, {"��������", "��ȡ����װ������" })
end