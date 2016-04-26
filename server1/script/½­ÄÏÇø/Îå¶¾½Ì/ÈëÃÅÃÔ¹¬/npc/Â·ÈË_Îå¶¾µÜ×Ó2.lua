-- 五毒 路人NPC 五毒弟子2 入门任务（完成）
-- by：Dan_Deng(2003-08-05)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- 入门任务完成
		if (HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(224) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) then
			enroll_prise()
		else
			Talk(1,"","练功时间不够，你怎么又来这?")
		end
	else							-- 常规对话
		Talk(1,"","五毒洞里很危险，你不要乱走")
	end
end;

function enroll_prise()
	Talk(1,"","五根孔雀毛已经够了. 太好了!你已正式成为本门记名弟子")
	DelItem(227)
	DelItem(223)
	DelItem(224)
	DelItem(225)
	DelItem(226)
	i = ReturnRepute(25,29,5)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld37 = SetByte(GetTask(37),2,127)
	SetTask(37,Uworld37)
	AddNote("完成五毒洞练功任务。正式成为<color=red>记名弟子<color>本门. ")
	Msg2Player("完成五毒洞练功任务, 正式成为本门记名弟子. ")
end;
