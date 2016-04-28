Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{	
	{szName = "Bπch HÊ Th«n Thπch", tbProp = {6,1,3186,1,0,0}, nCount = 10},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 10
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("ß” b∂o Æ∂m tµi s∂n cÒa Æπi hi÷p, xin h∑y Æ” trËng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1)
	return 0
end