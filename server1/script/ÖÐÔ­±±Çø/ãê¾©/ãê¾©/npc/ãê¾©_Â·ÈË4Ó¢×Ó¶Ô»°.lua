--中原北区 汴京府 路人4英子对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(191) == 1 then
		allbrother_0801_FindNpcTaskDialog(191)
		return 0;
	end
Say("英子：我告诉你一个秘密。上次我和小伙伴去铁塔玩捉迷藏，在塔的最下面发现了一个大洞，如果藏在里面，谁也找不着。这是我们俩之间的小秘密，你别告诉别人，好吗？", 0);

end;

