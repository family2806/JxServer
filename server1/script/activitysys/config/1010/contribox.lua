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
		Msg2Player("δ�μӰ�ᣬ����ʹ�øõ���.");
		return 1
	end
	AddContribution(nBuildFund)
	Msg2Player(format("����%d ���˹��׵�", nBuildFund))
	%tbLog:PlayerAwardLog("���״����", "ʹ����Ʒ�10000000���׵�")
	return 0
end