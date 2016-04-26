--description: 峨嵋派妙尘
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) then		-- 入门任务进行中
		if (HaveItem(17) == 0) then		--拿到白玉如意之前
			Talk(1,"","你还没有拿到<color=Red>白玉如意<color>呢!")
		else									--拿到白玉如意之后
			Uworld36_prise()
		end
--	elseif (UTask_em < 6) then 							--尚未完成前三关
--		Talk(1,"","妙尘：要想加入本派，必须先通过茶琴书的考验，你都做到了吗？")
--	elseif (UTask_em == 6) then 							--尚未完成前三关
--		Talk(1,"","妙尘：你已通过茶琴书的考验，接下来你去找<color=Red>谢云萝<color>师妹吧，她就在半山腰的<color=Red>钻天坡入口<color>处。")
	elseif (GetFaction() == "emei") then   				--已经入门，尚未出师
		Talk(1,"","师妹小心，钻天坡很危险!")
	elseif (UTask_em == 70) then   						--已经出师
		Talk(1,"","师妹，你就要下山了吗？我们会想你的!")
	else
		Talk(1,"","钻天坡很危险，请失主不要冒险!")
	end
end;

function Uworld36_prise()
	DelItem(17)
	Uworld36 = SetByte(GetTask(36),1,127)
	i = ReturnRepute(30,19,3)		-- 缺省声望，最大无损耗等级，每级递减
	SetTask(36,Uworld36)
	AddRepute(i)		-- 加声望
	AddNote("给妙尘白玉如意，完成任务，成为峨眉派记名弟子")
	Msg2Player("给妙尘白玉如意，完成任务，成为峨眉派记名弟子, 你的江湖名气增加"..i.."点.")
	Talk(1,"","恭喜你获得白玉如意，顺利过4关，从今往后你成为本派弟子，以后欢迎来峨眉游玩!")
end
