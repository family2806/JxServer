Include("\\script\\activitysys\\config\\24\\head.lua")
Include("\\script\\activitysys\\config\\24\\config.lua")

pActivity.tbRankTitle = 
{
	[1] = "凌云",
	[2] = "绝世",
	[3] = "破军",
	[4] = "傲雪",
	[5] = "惊雷",
	[6] = "御风",
	[7] = "批官",
	[8] = "泣神",
	[9] = "敬天",
	[10] = "无极",
}
function pActivity:IsOpen()
	return nil;
end

function pActivity:CheckFortuneRank(nRank)
	local nCurRank = GetPlayerFortuneRank();
	if (type(nRank) ~= "number" or type(nCurRank) ~= "number" or
		nRank <= 0 or nRank > 10 or nCurRank <= 0 or nCurRank > 10 or
		nCurRank < nRank) then
	
		if (type(self.tbRankTitle[nRank]) == "string") then
			Talk(1,"",format("你需要达到<color=red>%s<color> 才能买到该物品", self.tbRankTitle[nRank]));
		else
			Talk(1,"","你依然不能买该物品");
		end
		return nil;
	end
	
	return 1;
end