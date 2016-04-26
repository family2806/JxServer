IncludeLib("SETTING"); --载入SETTING脚本指令库
Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("该物品已过期.");
		return 0;
	end
	AddSkillState(440, 1, 1, 64800*8);
end