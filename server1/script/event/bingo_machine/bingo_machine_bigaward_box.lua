--百宝箱精炼石包
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\common.lua")

local tbItem = 
{
	["6,1,3060"] = {szName="混元灵露", tbProp={6,1,2312,1,0,0}},
}

local _GetItem = function (nCount)
	AskClientForNumber("refining_box_getpotion", 0, nCount, "请输入要拿出的数量")
end

local _OpenBox = function (nPlayerIndex, szName, nCount)
	if DynamicExecuteByPlayer(nPlayerIndex, "", "GetName") ~= szName then
		return
	end	
	
	lib:DoFunByPlayer(nPlayerIndex, %_GetItem, nCount)
	
end

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount == 0 then
		Say("已领取里面所有的混元灵露，可以取消.", 0)
		return 0
	end
	
	SetTaskTemp(114, nItemIndex)
	if GetFightState() == 1 then
		tbProgressBar:OpenByConfig(12, %_OpenBox, {PlayerIndex, GetName(), nCount})
	else
		AskClientForNumber("refining_box_getpotion", 0,nCount, "请输入要拿走的数量")
	end
	
	return 1
end


function refining_box_getpotion(nPickCount)
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount / 50 then
		nPickCount = nFreeItemCellCount * 50
	end
	local nItemIndex = GetTaskTemp(114)
	if IsMyItem(nItemIndex) == 1 then
		local Gid, Did, Pid = GetItemProp(nItemIndex);
		local szItemId = format("%d,%d,%d",Gid, Did, Pid)
		if not %tbItem[szItemId] then  --是不是这类道具
			return
		end
		
		local nCount = GetItemParam(nItemIndex, 1);
		if nPickCount > nCount then
			nPickCount = nCount
		end
		
		local nBindState = GetItemBindState(nItemIndex);
		local tbPotion = clone(%tbItem[szItemId]);
		tbPotion.nCount = nPickCount;
		tbPotion.nBindState = nBindState;
		if tbAwardTemplet:GiveAwardByList(tbPotion, "混元灵露") == 1 then
			nCount = nCount - nPickCount
			if nCount <= 0 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --同步客户端
				SetItemBindState(nItemIndex, nBindState)
			end
		end
	else
		print("物品不在人物身上")
	end
end

function GetDesc(nItemIndex)
	local nCount= GetItemParam(nItemIndex, 1);

	return format("还剩:<color=yellow>%d<color>", nCount)
end
