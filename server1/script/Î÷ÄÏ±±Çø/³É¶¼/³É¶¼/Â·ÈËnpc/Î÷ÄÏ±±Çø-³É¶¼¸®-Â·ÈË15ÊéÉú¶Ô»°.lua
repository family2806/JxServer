--西南北区 成都府 路人15书生对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(186) == 1 then
		allbrother_0801_FindNpcTaskDialog(186)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Talk(2, "", "宋举人：你晓得不？这望江楼是为了纪念一代才女薛涛而建的，相传薛涛曾在此汲取井水，手制诗签，留下了许多幽怨动人的诗句。", "薛涛一生爱竹，人们便在四周遍植佳竹，凤尾森森，龙吟细细，四季苍翠，情趣无穷，徜徉其间，使人俗念顿消。")
return
end;

if (i == 1) then
Say("宋举人：登望江楼而远眺，蓉城秀貌，锦江春色，尽收眼底，让人心胸为之一畅。",0)
end;

end;
