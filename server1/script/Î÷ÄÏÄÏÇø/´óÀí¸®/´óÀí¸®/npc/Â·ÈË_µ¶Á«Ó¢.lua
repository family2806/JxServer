-- 大理　路人　刀莲英
-- by：Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(187) == 1 then
		allbrother_0801_FindNpcTaskDialog(187)
		return 0;
	end
	Talk(3,"","家里有客人，我去买几条鱼回来做一道大理鱼.","不管这件事怎么样都可以来 我家吃饭，尝一下我做的鱼，这是大理给客人做的菜，你不用客气。")
end;
