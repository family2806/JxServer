-- 贴心杯 by bel at 20090409 10：04

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_jiu_expiredtime) then
		Msg2Player("物品已过使用期.");
		return 0;
	end
	
	jf0904_InitTaskctrl();
	
	SetTask(jf0904_TSK_jiuexplt, 30000);
end
