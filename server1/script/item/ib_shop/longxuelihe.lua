-- 文件名　：longxuelihe.lua
-- 创建者　：wangjingjun
-- 内容　　：龙血礼盒 使用可获得
-- 创建时间：2011-07-11 11:54:21

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "龙血丸", tbProp = {6,1,2117,1,0,0}, nCount = 3},	
	{szName = "宋金飞速丸", tbProp = {6,1,190,1,0,0}, nCount = 5},
	{szName = "宋金外谱丸", tbProp = {6,1,178,1,0,0}, nCount = 5},	-- 物品ID不确定
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保大侠的财产安全，请留下%d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	-- 判断背包空间
	tbAwardTemplet:GiveAwardByList(%tbAward, "使用龙血礼盒", 1)
	return 0
end