-- 少林 路人NPC 知客僧 入门任务
-- by：Dan_Deng(2003-08-01)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld38 = GetByte(GetTask(38),2)
	if (Uworld38 == 20) and (HaveItem(219) == 1) then		-- 任务完成(证明书信)
		Talk(1,"enroll_prise","原来是他的随身纸张，也行.")
	elseif (Uworld38 == 0) and (GetLevel() >=10) and (GetFaction() ~= "shaolin") then		--入门任务
		Say("本门弟子需要满足四个条件，分别是：英勇大胆，浩然正气，坚韧不拔和无私无我。你想做本派记名弟子，需要有这些条件，你接受考验吗?",2,"遵命!/enroll_get_yes","不，我只来玩. /enroll_get_no")
	elseif (GetFaction() == "shaolin") then
		Talk(1,"","师弟要保护好本寺的庄严，不要乱跑，大声喧哗.")
	else							-- 常规对话
		if (GetSex() == 0) then
			Talk(1,"","施主不要带兵器进去")
		else
			Talk(1,"","女客不能进入寺内 ")
		end
	end
end;

function enroll_get_yes()
	Talk(1, "", "考验，你下山游玩，满足4个条件了再回来我这里继续说.")
	Uworld38 = SetByte(GetTask(38),2,10)
	SetTask(38,Uworld38)
	AddNote("证明给知客僧有各项品质：赤胆忠心，浩然正气，坚韧不拔和无私无我")
	Msg2Player("证明给知客僧有各项品质：赤胆忠心，浩然正气，坚韧不拔和无私无我")
end;

function enroll_get_no()
end;

function enroll_prise()
	Talk(1,"","看起来你已经够了这四个品质，恭喜你，从今往后，你成为本门记名弟子了!")
	DelItem(219)
	i = ReturnRepute(12,29,2)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld38 = SetByte(GetTask(38),2,127)
	SetTask(38,Uworld38)
	Msg2Player("完成少林派记名弟子任务，成为少林弟子 ,名望增加. "..i.."点.")
	AddNote("完成少林派记名弟子任务，成为少林弟子. ")
end;
