--特效仙草露
--8小时经验双倍
IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 64800 * 8);
--	else
--		Say("真是遗憾，暂时不能使用特别仙草露.", 0)
--		return 1;
--	end;
--	return 0;
end;