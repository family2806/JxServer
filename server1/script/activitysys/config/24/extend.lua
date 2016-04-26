Include("\\script\\activitysys\\config\\24\\head.lua")
Include("\\script\\activitysys\\config\\24\\config.lua")

pActivity.tbRankTitle = 
{
	[1] = "����",
	[2] = "����",
	[3] = "�ƾ�",
	[4] = "��ѩ",
	[5] = "����",
	[6] = "����",
	[7] = "����",
	[8] = "����",
	[9] = "����",
	[10] = "�޼�",
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
			Talk(1,"",format("����Ҫ�ﵽ<color=red>%s<color> �����򵽸���Ʒ", self.tbRankTitle[nRank]));
		else
			Talk(1,"","����Ȼ���������Ʒ");
		end
		return nil;
	end
	
	return 1;
end