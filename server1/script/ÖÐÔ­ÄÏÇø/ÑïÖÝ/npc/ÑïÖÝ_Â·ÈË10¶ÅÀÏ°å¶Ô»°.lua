--中原南区 扬州府 路人10杜老板对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(195) == 1 then
		allbrother_0801_FindNpcTaskDialog(195)
		return 0;
	end
Say("杜老板：“茱萸湾上夕阳楼，梦里时时访旧游。少日题诗无恙否，绿杨城郭是扬州。”我本是扬州人，出外行商多年，这次回到家乡，才发现已经物是人非事事休了！", 0)

end;

