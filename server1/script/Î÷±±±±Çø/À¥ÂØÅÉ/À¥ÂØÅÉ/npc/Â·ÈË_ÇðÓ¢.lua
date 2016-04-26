-- 西北北区\昆仑派\npc\路人_丘英.lua
-- by xiaoyang (2004\4\20)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(6) == 1 then
		allbrother_0801_FindNpcTaskDialog(6)
		return 0;
	end
Uworld121 = GetTask(121)
	if (Uworld121 == 40 ) and (HaveItem(376) == 1 ) then
		Talk(7,"Uworld121_qiuying","请问是丘英吗?","谁这么大胆敢直呼老子名字?","我奉何姑娘之令来这","暮雪？你快来这里坐，喝点茶吃点点心. ","不必了，这里有一物交给你","这正是暮雪常带在身边的手绢！年轻人，多谢","何姑娘说你看到这块手绢就会明白了")
	elseif (Uworld121 == 40 ) and (HaveItem(376) == 0 ) then
		Talk(1,"","你没和我开玩笑吧，东西呢?")
	elseif (Uworld121 >= 50) then
		Talk(1,"","暮雪和你说了什么没有？我大概什么时候可以见到她?")
	else
		Talk(1,"","没什么事就不要打扰我了!")
	end
end

function Uworld121_qiuying()
	Talk(3,"","哼...! 杨湖那个老家伙配让暮雪这样帮他吗. 但是暮雪也给我带了手绢要我帮他，那一定是有原因的!","好了，年轻人你听着，我将把这次昆仑的计划告诉你","知道了，告辞")
	DelItem(376)
	Msg2Player("知道昆仑的计划回去报告给杨湖")
	AddNote("知道昆仑的计划回去报告给杨湖")
	SetTask(121,50) --设置任务变量为50
end
