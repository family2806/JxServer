--西北南区 永乐镇 舒奶奶对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(198) == 1 then
		allbrother_0801_FindNpcTaskDialog(198)
		return 0;
	end
Say("鲁老和葛老二人整年都像孩子一样相互斗!",0)

end;
