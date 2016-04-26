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
		Msg2Player("未加入帮会，不能使用该道具.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER)then
		TONG_ApplyAddWarBuildFund(nTongID, nBuildFund)		
		Msg2Player(format("交成功%d战备", nBuildFund))
		%tbLog:PlayerAwardLog("战备大礼包", "使用物品获得10000战备点")
		return 0;
	else
		Msg2Player("不是帮主，不能使用该道具.");
		return 1
	end
end