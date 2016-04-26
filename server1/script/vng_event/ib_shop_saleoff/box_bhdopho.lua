Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{	
	{szName="°×»¢¿øÍ¼Æ×",tbProp={6,1,3173,1,0,0},nCount=8},
	{szName="°×»¢ÒÂÍ¼Æ×",tbProp={6,1,3174,1,0,0},nCount=8},
	{szName="°×»¢Ð¬Í¼Æ×",tbProp={6,1,3175,1,0,0},nCount=8},
	{szName="°×»¢Ñü´øÍ¼Æ×",tbProp={6,1,3176,1,0,0},nCount=8},
	{szName="°×»¢»¤ÍóÍ¼Æ×",tbProp={6,1,3177,1,0,0},nCount=8},
	{szName="°×»¢ÏîÁ´Í¼Æ×",tbProp={6,1,3178,1,0,0},nCount=8},
	{szName="°×»¢ÓñÅåÍ¼Æ×",tbProp={6,1,3179,1,0,0},nCount=8},
	{szName="°×»¢ÉÏ½äÍ¼Æ×",tbProp={6,1,3180,1,0,0},nCount=8},
	{szName="°×»¢ÏÂ½äÍ¼Æ×",tbProp={6,1,3181,1,0,0},nCount=8},
	{szName="°×»¢ÎäÆ÷Í¼Æ×",tbProp={6,1,3182,1,0,0},nCount=8},
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 10
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("ÎªÈ·±£²Æ²ú°²È«£¬ÇëÁôÏÂ %d %dx%d ×°±¸¿ÕÎ»", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1)
	return 0
end