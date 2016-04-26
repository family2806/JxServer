--西南北区 成都府 路人20茶摊老板对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(185) == 1 then
		allbrother_0801_FindNpcTaskDialog(185)
		return 0;
	end
Say("辛二婶：要喝啥子茶？泡一壶毛尖如何？",0)

end;
