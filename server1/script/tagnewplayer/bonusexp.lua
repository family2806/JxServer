Include("\\script\\tagnewplayer\\func_check.lua");
function GetLevel165()
	if (CheckObject() ~= 3) then
		Talk(1, "", "请检查参加条件.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) ~= 1) then
			Talk(1, "", "该奖励只领一次 !");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165, 1)
	LevelUp(165)
	Msg2Player("大侠刚刚达到165级")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."领取165级奖励")
end


function GetLevel120()
	if (CheckObject() ~= 1) then
		Talk(1, "", "请检查参加条件.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) ~= 1) then
			Talk(1, "", "该奖励只领一次 !");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120, 1)
	LevelUp(120)
	Msg2Player("大侠刚刚达到120级")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."领取重生一次后升为120级的奖励")
end
