--中原北区 朱仙镇 客栈老板对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(202) == 1 then
		allbrother_0801_FindNpcTaskDialog(202)
		return 0;
	end
Say("客官想休息吗?",0)

end;
