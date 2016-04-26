Include("\\script\\activitysys\\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
function main(nIdx)
	if tbVngMysticChest:IsActive() ~= 1 then
		Talk(1, "", "该物品只能在此时间内使用: <color=red>2011年10月22日00时00至2011年10月31日24时00<color>")
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
	local strMessage = format("<color=green>恭喜<color=yellow>%s<color=green> 已获得物品<color=yellow>%s<color=green> 当使用<color=yellow>神秘箱<color>", GetName(), strItemName)
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
	{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=10, CallBack = MysticChestAnnounce},
	{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2, CallBack = MysticChestAnnounce},
	{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=2, CallBack = MysticChestAnnounce},
	{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.6, CallBack = MysticChestAnnounce},
	{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.4, CallBack = MysticChestAnnounce},
	{szName = "经验值", nExp=50000000,nRate=70},
	{szName = "经验值", nExp=100000000,nRate=13},	
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
