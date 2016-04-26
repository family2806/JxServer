Include("\\script\\event\\other\\caipiao\\head_gs.lua")


function main()
	
	
	
	if tbCaiPiao:UseCailuLimit() ~= 1 then
		return 1
	end
	
	local nWidth, nHeight, nCount = 1,1,2
	--判断背包空间
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Talk(1, "", format("为保护大侠财产安全, 请整理出 %d %dx%d背包空间", nCount, nWidth, nHeight))
		return 1
	end
	
	tbAwardTemplet:GiveAwardByList(tbCaiPiao.tbTicket, "use cailuhongbao", 2)
	TaskManager:AddTask(tbCaiPiao.TSKG_ID, tbCaiPiao.TSK_USE_CAILU, 1)
	return 0
end