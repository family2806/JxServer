Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");
if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main()
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local nBuildFund = 10000
	local _, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("未参加帮会，不能使用该道具.");
		return 1
	end
	AddContribution(nBuildFund)
	Msg2Player(format("你获得%d 个人贡献点", nBuildFund))
	%tbLog:PlayerAwardLog("贡献大礼包", "使用物品活动10000000贡献点")
	return 0
end