tbPlayer = {}


tbPlayer.TSK_RANK = 3172
tbPlayer.TSK_VICTORY_COUNT = 3173
tbPlayer.TSK_DRAW_COUNT = 3174
tbPlayer.TSK_LOSE_COUNT = 3175
tbPlayer.TSK_CUR_WEEK = 3176
tbPlayer.TSK_CUR_COUNT = 3177



local TITLE_TABLE =
{
	{nMin = 2600, nMax = -1, szTitle = "绝世高手"},
	{nMin = 2400, nMax = 2600, szTitle = "名满江湖"},
	{nMin = 2200, nMax = 2400, szTitle = "侠名远播"},
	{nMin = 2000, nMax = 2200, szTitle = "武林新秀"},
	{nMin = 1800, nMax = 2000, szTitle = "崭露头角"},
	{nMin = 1600, nMax = 1800, szTitle = "薄有微名"},
	{nMin = 1400, nMax = 1600, szTitle = "初入江湖"},
	{nMin = 1200, nMax = 1400, szTitle = "入门弟子"},
	{nMin = -1, nMax = 1200, szTitle = "初窥门径"},
}

function tbPlayer:GetVictoryRate()
	return floor(self:GetVictoryCount() * 100/self:GetTotalCount() + 0.5)
end
function tbPlayer:GetLoseRate()
	return floor(self:GetLoseCount() * 100/self:GetTotalCount() + 0.5)
end


function tbPlayer:GetTotalCount()
	return self:GetVictoryCount() + self:GetDrawCount() + self:GetLoseCount()
end

function tbPlayer:GetVictoryCount()
	return GetTask(self.TSK_VICTORY_COUNT)
end

function tbPlayer:GetDrawCount()
	return GetTask(self.TSK_DRAW_COUNT)
end

function tbPlayer:GetLoseCount()
	return GetTask(self.TSK_LOSE_COUNT)
end

function tbPlayer:GetRank()
	return GetTask(self.TSK_RANK)
end

function tbPlayer:GetCurCount()
	local nYW = tonumber(GetLocalDate("%Y%W"))
	if GetTask(self.TSK_CUR_WEEK) == nYW then
		return GetTask(self.TSK_CUR_COUNT)
	else
		return 0
	end
end

function tbPlayer:GetTitle()
	local nRank =self:GetRank()
	for i=1, getn(%TITLE_TABLE) do
		local tbTitle = %TITLE_TABLE[i]
		local nMin = tbTitle.nMin
		local nMax = tbTitle.nMax
		if (nMin == -1 or nMin <= nRank) and (nMax == -1 or nRank < nMax) then
			return tbTitle.szTitle
		end
	end
	return %TITLE_TABLE[1].szTitle
end

function tbPlayer:GetRankProcess()
	local nRank =self:GetRank()
	for i=1, getn(%TITLE_TABLE) do
		local tbTitle = %TITLE_TABLE[i]
		local nMin = tbTitle.nMin
		local nMax = tbTitle.nMax
		if (nMin == -1 or nMin <= nRank) and (nMax == -1 or nRank < nMax) then
			return nRank, nMin, nMax
		end
	end
	return nRank, 0, -1
end