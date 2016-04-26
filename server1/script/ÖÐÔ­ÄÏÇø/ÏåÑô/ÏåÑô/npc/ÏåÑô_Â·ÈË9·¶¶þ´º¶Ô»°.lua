--中原南区 襄阳府 路人9范二春对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

function main(sel)
	if allbrother_0801_CheckIsDialog(184) == 1 then
		allbrother_0801_FindNpcTaskDialog(184)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Say("范二春：邓嫂子屋里太困难了，我等下给她们家送一袋大米去，先救救急。",0)
return
end;

if (i == 1) then
Say("范二春：大家都是街坊，互相帮忙是应该的。",0)
end;

end;

