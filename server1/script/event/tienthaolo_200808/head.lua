-- Event ¡Ï»°Ãÿ–ßœ…≤›¬∂Vinagame
--Th∏ng 8 n®m 2008
-- Created by TuanNA5

TTL_DATE_START = 0808150000
TTL_DATE_END = 0809152400

TTL_GOT_TIME = 1980

MAX_TTL = 8

function get_thaolo()
	local nUsedTime = 0;
	local nTimes = 0;
	
	if check_thaolo_date() == 0 then
		Say("Hoπt ÆÈng l«n nµy Æ∑ k’t thÛc.",0)
		return 0
	end	
	
	nUsedTime = GetTask(TTL_GOT_TIME)
	nTimes = MAX_TTL - nUsedTime
	
	if nTimes < 0 then
		nTimes = 0
	end
	
	strTalk = "Trong thÍi gian 10/08/2008 - 10/09/2008 bªng h˜u sœ Æ≠Óc t∆ng 8 Ti™n Th∂o LÈ Æ∆c bi÷t. Ti™n Th∂o LÈ sœ ph∏t huy t∏c dÙng trong vﬂng 2 giÍ ngay sau khi bªng h˜u nhÀn Æ≠Óc. Bªng h˜u cﬂn "..nTimes.." l«n. N’u h’t thÍi hπn kh´ng nhÀn h’t Ti™n Th∂o LÈ bªng h˜u sœ kh´ng nhÀn Æ≠Óc n˜a."
	
	Say(strTalk,2,"Ta muËn nhÀn/say_yes","Ch≠a c«n/say_no")
	
end

function say_yes()
	if check_thaolo_date() == 1 then
		local nUsedTime = GetTask(TTL_GOT_TIME)
		if nUsedTime >= 0 and nUsedTime < 8 then
			AddSkillState(440, 1, 1, 64800 * 2);
			SetTask(TTL_GOT_TIME, GetTask(TTL_GOT_TIME) +1)
			Say("Ti™n Th∂o LÈ bæt Æ«u ph∏t huy t∏c dÙng",0)
			Msg2Player("Bπn nhÀn Æ≠Óc t∏c dÙng Ti™n Th∂o LÈ trong 2 giÍ.")
			WriteLog("[Hoπt ÆÈng Ti™n Th∂o LÈ]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." NhÀn Æ≠Óc Ti™n Th∂o LÈ")
		else
			Say("Ng≠¨i Æ∑ nhÀn ÆÒ Ti™n Th∂o LÈ!",0)
			Msg2Player("Bπn nhÀn Æ∑ nhÀn ÆÒ 8 Ti™n Th∂o LÈ.")
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