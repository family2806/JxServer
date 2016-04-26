-------------------------------------------------------------------------
-- FileName		:	路人_郦秋水.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 14:40:10
-- Desc			:	翠烟90级任务？？
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
Uworld126 = nt_getTask(126)
Uworld1002 = nt_getTask(1002)
	Say(" 人生在世，需要懂得珍惜幸福.",3,"我来做正线任务/branch_branchliqiushui","我来做90级任务/tasknpc_nity","不问了!/no")
end

function tasknpc_nity()
Uworld126 = nt_getTask(126)
	if (Uworld126 == 10) and (HaveItem(391) == 1) then
		Talk(4,"Uworld126_lose","郦小姐，你有信","段思成也有后悔的一天？太晚了，我不再相信男人了.","姑娘何须固执，俗语说，士别三日刮目相待,难道不能给段公子一个机会吗？  ","给他机会？他离开我的时候，有给我机会吗？我不想说了，你没事就去找掌门，她喜欢说这些.")
	elseif (Uworld126 == 10) then			-- 没有书信
		Talk(3,"","郦小姐，你有信","什么信?","啊，我留在段思成那里了.")
	elseif (Uworld126 == 30)then
   	Talk(3,"Uworld126_cant","郦小姐",".....","看来要回去见段公子找办法才行.")
   elseif (Uworld126 == 60)then
   	Talk(12,"Uworld126_beleive","郦小姐，不好了! ","急什么，有什么事慢慢说.","段公子.","他怎么样?","段公子因为保卫她被敌人打成重伤，性命危险!","你不用虚构了，我绝对不会信你!","在下以自己在江湖的名声担保，我不骗姑娘..","难道?....思成。多年这样了，你何须替他人受罪，这些年，我的性情也变了，有很多仇恨，你没有武功，真是苦了自己.","如果那天她原谅他就不会这样了.","这几天我睡不着，心里老想着他，现在他在哪里?","大理 ","我会马上到那里，所有的仇恨都已结束!")	
   elseif (Uworld126 > 10) and (Uworld126 < 60) then				-- 任务中的缺省对话
   	Talk(1,"","我和思成没有任何干连，你不用多说! ")
   else
   	Talk(1,"","门主不能与唐一辰成亲，这样将违反门规.....")
   end
end

function Uworld126_lose()
	DelItem(391)
	nt_setTask(126,20)
	Msg2Player("看信之后，郦秋水没有一点感动，你决定去找尹含姻帮助.")
	AddNote("看信之后，郦秋水没有一点感动，你决定去找尹含姻帮助.")
end

function Uworld126_cant()
	nt_setTask(126,40)
	Msg2Player("郦秋水不听劝告，你决定回去找段思成.")
	AddNote("郦秋水不听劝告，你决定回去找段思成.")
end

function Uworld126_beleive()
	nt_setTask(126,70)
	Msg2Player("郦秋水心里还有段思成，决定去见他最后一面，计划成功.")
	AddNote("郦秋水心里还有段思成，决定去见他最后一面，计划成功.")
end

function branch_branchliqiushui()
	Uworld1002 = nt_getTask(1002)
   	liqiushui()
end

function no()
end