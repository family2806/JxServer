--description: 中原南区 襄阳府 药店老板对话 武当派出师任务
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "现在战场疫情蔓延，请问有什么办法吗?", "想治疗疫情需要5种药 <color=Red> 合欢、玄参、当归、防己、朱砂。<color>.去<color=Red>伏牛山洞<color> 找!")
			SetTask(17, SetByte(GetTask(17),1,5))
			AddNote("药店老板 (201,202) 说伏牛山洞有合欢、玄参、当归、防己、朱砂5种药")
		elseif (UTask_wd60sub == 5) then
			if ( HaveItem(107) == 1 and HaveItem(134) == 1 and HaveItem(135) == 1 and HaveItem(136) == 1 and HaveItem(137) == 1) then
				Talk(2, "", "已找到5种药，请你炼制药丸给战场的士兵用!", "国家有难，匹夫有责。放心，我一定炼制，及时送去!")
				DelItem(107)
				DelItem(134)
				DelItem(135)
				DelItem(136)
				DelItem(137)
				SetTask(17, SetByte(GetTask(17),1,8))
				AddNote("找够5种药料，交给药店老板，抑制了疾病的蔓延.")
				Msg2Player("找够5种药料，交给药店老板，抑制了疾病的蔓延.")
			else
				Say("药店老板：抑制瘟疫需要五种药材：<color=Red>当归、合欢、玄参、防己、朱砂<color>，缺一不可。这五种药材都生长在<color=Red>伏牛山的东部<color>。",
					2,
					"交易/yes",
					"不交易/no")
			end
		else
			Say("各种治疗打伤，跌伤、撞伤、割伤的要都有，你想买什么药?",
				3,
				"交易/yes",
				"我想买混元灵露 /refine",
				"不交易/no")
		end
	else
		Say("药店老板：我这里治疗各种打伤、跌伤、撞伤、割伤、烫伤、烧伤的药比别处都齐全，您家要买么事药？",
			3,
			"交易/yes",
			"炼制混元灵露/refine",
			"不交易/no")
	end
end

function yes()
	Sale(12)  			--弹出交易框
end

function no()
end
