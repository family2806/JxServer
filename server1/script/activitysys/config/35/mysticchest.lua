Include("\\script\\activitysys\\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
function main(nIdx)
	if tbVngMysticChest:IsActive() ~= 1 then
		Talk(1, "", "����Ʒֻ���ڴ�ʱ����ʹ��: <color=red>2011��10��22��00ʱ00��2011��10��31��24ʱ00<color>")
		return 1
	end
	if PlayerFunLib:VnCheckInCity("default") ~= 1 or PlayerFunLib:CheckFreeBagCell(2,"default") ~= 1 then
		return 1
	end
	 tbVngMysticChest:Use()
	return 0
end

MysticChestAnnounce = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>��ϲ<color=yellow>%s<color=green> �ѻ����Ʒ<color=yellow>%s<color=green> ��ʹ��<color=yellow>������<color>", GetName(), strItemName)
	local handle = OB_Create()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Tong(nTongId, strMessage)
	end
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbVngMysticChest = {}
tbVngMysticChest.tbAward =
{
	{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=10, CallBack = MysticChestAnnounce},
	{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2, CallBack = MysticChestAnnounce},
	{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=2, CallBack = MysticChestAnnounce},
	{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.6, CallBack = MysticChestAnnounce},
	{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.4, CallBack = MysticChestAnnounce},
	{szName = "�i����ֵ", nExp=50000000,nRate=70},
	{szName = "�i����ֵ", nExp=100000000,nRate=13},	
}

function tbVngMysticChest:IsActive()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate < 201110220000 or nCurDate > 201110312400 then
		return 0
	end
	return 1
end

function tbVngMysticChest:Use()
	tbAwardTemplet:Give(self.tbAward, 1, {"Event_Thang10", "SuDungRuongThanBi"})
end
