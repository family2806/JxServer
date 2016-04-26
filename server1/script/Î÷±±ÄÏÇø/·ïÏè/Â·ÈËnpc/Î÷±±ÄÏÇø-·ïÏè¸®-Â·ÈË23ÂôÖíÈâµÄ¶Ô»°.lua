--西北南区 凤翔府 路人23卖猪肉的对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(189) == 1 then
		allbrother_0801_FindNpcTaskDialog(189)
		return 0;
	end
Say("朱屠夫：新鲜的猪肉，不新鲜不要钱啊！",0)

end;