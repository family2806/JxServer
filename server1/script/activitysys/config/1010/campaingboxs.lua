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
		Msg2Player("δ�����ᣬ����ʹ�øõ���.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER)then
		TONG_ApplyAddWarBuildFund(nTongID, nBuildFund)		
		Msg2Player(format("���ɹ�%dս��", nBuildFund))
		%tbLog:PlayerAwardLog("ս�������", "ʹ����Ʒ���10000ս����")
		return 0;
	else
		Msg2Player("���ǰ���������ʹ�øõ���.");
		return 1
	end
end