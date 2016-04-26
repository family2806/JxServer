--两湖区 巴陵县 路人7方可为对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(200) == 1 then
		allbrother_0801_FindNpcTaskDialog(200)
		return 0;
	end

i = random(0,2)

if (i == 0) then
Say("方可为：我们巴陵县是个小地方,但老百姓的日子过得倒也安乐。",0)
return
end;

if (i == 1) then
Say("方可为：天王帮就是我们的青天,如果没有他们替天行道,那些贪官污吏还不知要怎么压榨我们老百姓呢!",0)
return
end;

if (i == 2) then
Say("方可为：在老百姓眼里,天王帮里个个都是大英雄,真好汉!我们这里年轻小伙子都想加入天王帮呢!",0)
end;

end;

