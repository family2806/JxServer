Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	newyear0901_resettask();
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("该物品已过期.");
		return 0;
	end
	SetTask(newyear0901_TSK_GetExpUpLimit, 300000);
	Say("大侠可以获得的经验值最高为30亿", 0);
end