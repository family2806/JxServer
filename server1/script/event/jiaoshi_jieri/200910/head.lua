tbJiaoShi2009 = {}

tbJiaoShi2009.nStartTime = 20091113
tbJiaoShi2009.nEndTime = 20091202

function tbJiaoShi2009:IsActive()
	local nNow = tonumber(GetLocalDate("%Y%m%d"))
	if (self.nStartTime <= nNow and nNow <= self.nEndTime) then
		return 1
	end
	return 0
end

function tbJiaoShi2009:buy_fenbi()
	if GetCash() < 30000 then
			Say(format("С��: װ��Ǯ����, ����Ҫ %d��.", 30000),0)
			return
	end
	Pay(30000)
	local n_itemidx = AddItem(6,1,2166,1,0,0);
	ITEM_SetExpiredTime(n_itemidx, 20091207);
	SyncItem(n_itemidx);
	local szstr = format("��ϲ�����õ� %s", "����")
	Msg2Player(szstr)
end