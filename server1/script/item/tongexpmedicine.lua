IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
	--Msg2Player("此功能稍后开放.多谢支持!")
	--return 1
	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 32400);
	else
		Say("目前是系统双倍经验时间，暂时无法使用秘制修身符。", 0)
		return 1
	end
	return 0
end