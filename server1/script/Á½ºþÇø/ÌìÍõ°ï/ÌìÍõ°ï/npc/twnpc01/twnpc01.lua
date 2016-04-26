--description: 天王帮孙道领　天王入门任务
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tw = GetTask(3)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 0) and (GetFaction() ~= "tianwang") and (GetLevel() >= 10) then			-- 记名弟子任务启动
		Say("想要成为本帮的正式弟子要一同抵宋抗金，本座当然无条件欢迎，只需要你带来一壶酒给众兄弟喝共同庆祝就可以看成你已经入门了", 2, "接受任务/Uworld38_get_yes", "算了/no")
	elseif (Uworld38 == 80) and (HaveItem(90) == 1) then					-- 有蓬莱春，任务完成
		Uworld38_prise()
--	elseif (UTask_tw == 5*256+80) then		-- 为天王任务变量被意外改变容错
--		if (GetSeries() == 0) and (GetFaction() == "tianwang") then	-- 如果是天王帮人，则置为刚入帮，否则清零
--			SetTask(3,10*256)
--		else
--			SetTask(3,0)
--		end
	elseif (Uworld38 >= 20) and (Uworld38 < 127) then		-- 入门任务进行中
		Talk(1,"","每次只要想到要把蓬莱春酒给这群酒鬼我就心疼")
	elseif (GetFaction() == "tianwang") then   				--已经入门，尚未出师
		Talk(1,"","好兄弟！有空我们一起喝一杯!")
	elseif (UTask_tw ==70*256) then 					--本门出师，非门派内状态
		Talk(2,"","没关系，每个人都喝","我哥哥,,, 你最后是喝醉了还是上次的酒还没有醒啊? ")
	else
		Talk(1,"","听说酒馆在<color=Red>巴陵县<color>卖着一种叫<color=Red>蓬莱春<color>,这果真是好酒，只想现在就喝!")
	end
end

function Uworld38_get_yes()
	Talk(1,"","听说酒馆在<color=Red>巴陵县<color>卖着一种叫<color=Red>蓬莱春<color>,这果真是好酒，只想现在就喝!")
	Uworld38 = SetByte(GetTask(38),1,20)
	SetTask(38,Uworld38)
	AddNote("在南边的水寨门口见孙思邈<color=red>接弟子记名任务<color>, 到巴陵县买蓬莱春酒'. ")
	Msg2Player("在南边的水寨门口见孙思邈接弟子记名任务到巴陵县买蓬莱春酒'. ")
end;

function Uworld38_prise()
	Talk(1,"","蓬莱春！果真是好酒！才打开就闻到这种香味！看你也是有气魄的人，每个人都流落江湖!")
	DelItem(90)
	Uworld38 = SetByte(GetTask(38),1,127)
	SetTask(38,Uworld38)
	i = ReturnRepute(15,19,2)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	AddNote("回到天王岛，带着蓬莱春交给孙道领完成记名弟子任务")
	Msg2Player("回到天王岛，带着蓬莱春交给孙道领完成记名弟子任务，你的名望增加. "..i.."点.")
end;

function no()
end;
