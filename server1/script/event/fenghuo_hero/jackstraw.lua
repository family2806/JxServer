IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		Msg2Player("这个看上去好像是稻草人(还未入帮会无法参加烽火英雄令活动)");
	else
		if (TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) < 120) then
			Msg2Player("帮会的烽火英雄令未积累够120个，不能检查稻草人.");
		else
			Msg2Player("检查完稻草人, 需要5分钟");
		end;
	end;
end;