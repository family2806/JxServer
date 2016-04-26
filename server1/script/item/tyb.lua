--Create by mengfan ,2004-9-14
--团圆饼
--作用：使用后，使用者及其组队队员30分钟内获得双倍经验时间。
--获得条件：系统发放，集齐获得此物品所需要的所有单字。


IncludeLib("SETTING"); --载入SETTING脚本指令库
function main()	
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	
	if (GetNpcExpRate() > 100) then
		Say("对不起，目前暂时无法使用团圆月饼。", 0)
		return 1
	end

	
	if (nMemCount == 0 ) then
		AddSkillState(451, 20, 1,32400)
		return 0
	end

	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		
		AddSkillState(451, 20, 1, 32400)
	end;
	
	PlayerIndex = nPreservedPlayerIndex;
	return 0
end;