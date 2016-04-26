Include("\\script\\misc\\eventsys\\eventsys.lua")

pEventType =  EventSys:NewType("AddNpcOption")


function pEventType:Reg(szNpcName, szOptName, fn, tbParam, fnLimit, tbLimitParam)
	
	self.MapEvnent[szNpcName] = self.MapEvnent[szNpcName] or {}
	local nNewId = getn(self.MapEvnent[szNpcName]) + 1
	self.MapEvnent[szNpcName][nNewId] = 
	{
		szOptName = szOptName,
		fn = fn,
		tbParam = tbParam,
		fnLimit = fnLimit,
		tbLimitParam = tbLimitParam,
		nPackNo = curpack(),
	}
	return nNewId
end

function pEventType:OnEvent(szNpcName, tbDailog, nNpcIndex)
	if not self.MapEvnent[szNpcName] then
		return
	end
	for nId=1, getn(self.MapEvnent[szNpcName]) do
		local tbProcParam = self.MapEvnent[szNpcName][nId]
		
		local fnLimit = tbProcParam.fnLimit
		if not self:CanAdd(tbProcParam.fnLimit, tbProcParam.tbLimitParam, nNpcIndex) then
			return 
		end
		
		
		tbDailog:AddOptEntry(tbProcParam.szOptName, self.OnSelectOpt, {self, tbProcParam.nPackNo, tbProcParam.fn, tbProcParam.tbParam})
		
	end
end

function pEventType:CanAdd(fnLimit, tbLimitParam, nNpcIndex)
	if fnLimit then
		local tbParam = {}
		if tbLimitParam then
			for i = 1, getn(tbLimitParam) do
				tinsert(tbParam, tbLimitParam[i])
			end
		end
		tinsert(tbParam, nNpcIndex)
		if not call(fnLimit, tbParam) then
			return 
		end		
	end
	return 1
end

function pEventType:OnSelectOpt(nPackNo, fn, tbParam)
	local nPlayerIndex = PlayerIndex
	local nOldPack = usepack(nPackNo)
	CallPlayerFunction(nPlayerIndex, fn, unpack(tbParam))
	usepack(nOldPack)
end