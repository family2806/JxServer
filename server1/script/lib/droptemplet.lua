
-- droptemplet.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-03-20 18:55:45

-- 给予玩家奖励 ，可以是 经验 道具 钱, CallBack
--通过GiveAwardByList函数给予玩家奖励，第一个参数是奖励表，第二个参数是log的title ，不填则不写log

--物品表的定义
--tbItem = {}
--tbItem = {tbItem, tbItem, tbItem}

--说明[]内的为可选项目
--szName	物品名字，为空则调用GetItemName( nItemIndex ) 对于可叠加的物品该函数返回空，建议要手动填写
--tbProp	物品的ID G D P之类，对于 黄金 白金 为 {0,nRow}nRow是所在行数
--nQuality	物品的品质，默认为0
--nRate		如有该项目说明该表是随机选一个的表
--nCount	物品个数，默认为 1个
--nExp_tl	附加功能 给物品同时给予 可叠加经验
--nJxb		给物品同时给予经验
--nExp		给物品同时给予不叠加经验

--CallBack		回调函数
--nExpiredTime	物品有效期用法同IB的ITEM_SetExpiredTime
--nBindState	绑定状态-2 为永久  -1为普通绑定

--当tbProp为空时 不给于物品
IncludeLib("ITEM");
Include ("\\script\\lib\\common.lua")
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\item\\battles\\songjinskill.lua");
WLLS_TASKID_HONOUR	= 2501	
if not tbDropTemplet then

tbDropTemplet = {}

function tbDropTemplet:Debug(szMsg)
--	print(szMsg)
	
end

function tbDropTemplet:GiveAwardByRate(nNpcIndex, nBelongerIndex, tbItem, szLogTitle, nAwardCount)
	if tbItem == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			
			return self:GiveAwardByList(nNpcIndex, nBelongerIndex, tbItem[i], szLogTitle, nAwardCount),i
		end
	end
end

--DropItemEx( nSubWorldIdx, nMpsX, nMpsY, nBelonger, nVersion, uRandSeed, nQuality, nItemGenre, nItemDetailType, nItemParticularType, nItemLevel, nItemSeries, nItemLuck, nItemMagicLevel..6 )
function tbDropTemplet:DropItem(nNpcIndex, nBelongerIndex, tbItem)
	local nRow = 0
	if tbItem.nQuality and (tbItem.nQuality == 1 or tbItem.nQuality == 4) then
		nRow = 1
	end
	tbItem.tbParam = tbItem.tbParam or {}
	local wuxing = tbItem.tbProp[5] or 0
	if wuxing == -1 then
		wuxing = random(0,4)
	end
	local nX32,nY32,nMapIndex = GetNpcPos(nNpcIndex)
	
	return DropItemEx(
		nMapIndex,
		nX32,
		nY32,
		nBelongerIndex, 
		tbItem.nVersion or 4,
		format("%u", tbItem.nRandSeed or 0),
		tbItem.nQuality or 0,
		tbItem.tbProp[1] or 0,
		(tbItem.tbProp[2] or 0) - nRow,
		tbItem.tbProp[3] or 0,
		tbItem.tbProp[4] or 0,
		wuxing,
		tbItem.tbProp[6] or 0,
		tbItem.tbParam[1] or 0,
		tbItem.tbParam[2] or 0,
		tbItem.tbParam[3] or 0,
		tbItem.tbParam[4] or 0,
		tbItem.tbParam[5] or 0,
		tbItem.tbParam[6] or 0)
end


function tbDropTemplet:GiveAwardByList(nNpcIndex, nBelongerIndex, tbItem, szLogTitle, nAwardCount)
	if not tbItem then --物品表为空
		self:Debug("物品表空.")
		return 0
	end
	nAwardCount = nAwardCount or 1
	if type(tbItem[1]) == "table" then -- 如果是多个物品
		if tbItem[1].nRate then --按概率给某一个
			for i = 1, nAwardCount do
				self:GiveAwardByRate(nNpcIndex, nBelongerIndex, tbItem, szLogTitle, 1)
			end
			return 1
		else --按顺序给全部
			for i = 1,  getn(tbItem) do
				self:GiveAwardByList(nNpcIndex, nBelongerIndex, tbItem[i], szLogTitle, nAwardCount)
			end	
			return 1;
		end
	end
	local tbItemProp	= tbItem.tbProp;
	local nItemCount	= tbItem.nCount or 1
	nItemCount = nItemCount * nAwardCount
	
	local szNpcName = GetNpcName(nNpcIndex)
	if tbItemProp then --物品
		local nItemIndex	= 0;
		for i = 1, nItemCount do
						
			nItemIndex = self:DropItem(nNpcIndex, nBelongerIndex, tbItem)
			
			if nItemIndex > 0 then
				if tbItem.nExpiredTime then
					ITEM_SetExpiredTime(nItemIndex, tbItem.nExpiredTime)-- 设置有效期
					--SyncItem(nItemIndex) --同步客户端无需同步
				end
				
				if tbItem.nLeftUsageTime then
					ITEM_SetLeftUsageTime(nItemIndex,tbItem.nLeftUsageTime)
					--SyncItem(nItemIndex) --同步客户端 无需同步 
				end
				
				if tbItem.nUsageTime then
					ITEM_SetLeftUsageTime(nItemIndex,tbItem.nLeftUsageTime)
				end
				
				if tbItem.nBindState then
					SetItemBindState(nItemIndex, tbItem.nBindState)--根据nBindState绑定物品
				end
				if type(tbItem.CallBack) == "function" then
					tbItem.CallBack(nItemIndex)
				end
	
				szItemName = tbItem.szName or GetItemName(nItemIndex)
			end
		end
		
		self:WriteLog(szLogTitle, format("npcname(%s) drop %d item %s", szNpcName, nItemCount, szItemName))
	end
	if tbItem.nJxb then --剑侠币
		local nAddJxb = tbItem.nJxb * nItemCount
		
		NpcDropMoney(nNpcIndex, nAddJxb, nBelongerIndex)
		self:WriteLog(szLogTitle, format("npcname(%s) drop %d Jxb", szNpcName, nAddJxb ))
	end
	
	if type(tbItem.pFun) == "function" then
		tbItem:pFun(nItemCount, szLogTitle, nBelongerIndex)
	end
	return 1
end

function tbDropTemplet:WriteLog(szLogTitle, szMsg)
	if szLogTitle then
		
		if type(szLogTitle) == "table" then
			local event_name = szLogTitle.szEventName or ""
			local action = szLogTitle.szAction or ""
			local quantity = szLogTitle.szQuantity or ""
			local item_name = szLogTitle.szItemName or ""
			local item_code = szLogTitle.szItemCode or ""
			local tong_name = GetTongName()
			local bug_desc = szbug_desc or ""
			local string_1 = szstring_1 or ""
			local string_2 = szstring_2 or ""
			local string_3 = szstring_3 or ""
			
			local strLogs = "["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3;	
			
		else
			WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t%s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szMsg))
		end
		
		
		
	else
		self:Debug("物品掉落函没有log")
	end
end


end