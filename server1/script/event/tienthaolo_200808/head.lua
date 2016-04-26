-- Event 领取特效仙草露Vinagame
--Th竛g 8 n╩ 2008
-- Created by TuanNA5

TTL_DATE_START = 0808150000
TTL_DATE_END = 0809152400

TTL_GOT_TIME = 1980

MAX_TTL = 8

function get_thaolo()
	local nUsedTime = 0;
	local nTimes = 0;
	
	if check_thaolo_date() == 0 then
		Say("此次活动已结束.",0)
		return 0
	end	
	
	nUsedTime = GetTask(TTL_GOT_TIME)
	nTimes = MAX_TTL - nUsedTime
	
	if nTimes < 0 then
		nTimes = 0
	end
	
	strTalk = "在 10/08/2008 - 10/09/2008时间内，朋友将获赠8个特效仙草露。 仙草露将在朋友收到的2小时内发挥作用。朋友还剩"..nTimes.." 次。如果时间到还没领完仙草露，您将不能领了."
	
	Say(strTalk,2,"我想领/say_yes","还不需要/say_no")
	
end

function say_yes()
	if check_thaolo_date() == 1 then
		local nUsedTime = GetTask(TTL_GOT_TIME)
		if nUsedTime >= 0 and nUsedTime < 8 then
			AddSkillState(440, 1, 1, 64800 * 2);
			SetTask(TTL_GOT_TIME, GetTask(TTL_GOT_TIME) +1)
			Say("仙草露开始发挥作用",0)
			Msg2Player("您获得2小时内的仙草露作用")
			WriteLog("[仙草露活动\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." 获得仙草露")
		else
			Say("您已领购仙草露了",0)
			Msg2Player("您已领购8个仙草露")
			return 0
		end	
	end
end

function check_thaolo_date()
	local nDate = tonumber(GetLocalDate("%y%m%d%H%M"));
	if nDate >=  TTL_DATE_START and nDate <= TTL_DATE_END then
		return 1
	end
	return 0
end

function say_no()
end