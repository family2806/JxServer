--description: 唐门竹海第二关敌人
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	UTask_tmtmp = GetTaskTemp(48)
	if (Uworld37 == 20) and (random(0,99) < 50) then		-- 带任务时，50%机率出现下一句口诀（共五句）
		if (UTask_tmtmp == 0) then
			Talk(1,"","2 4 l� tay")
			Msg2Player("C� 頲 kh萿 quy誸  Nh� T� Vi Ki猲 ")
			SetTaskTemp(48,1)
		elseif (UTask_tmtmp == 1) then 
			Talk(1,"","68 l� ch﹏")
			Msg2Player("C� 頲 kh萿 quy誸  B竧 Huy謙 V� T骳 ")
			SetTaskTemp(48,2)
		elseif (UTask_tmtmp == 2) then 
			Talk(1,"","tr竔 3 ph秈 7")
			Msg2Player("得到口诀“tr竔 3 ph秈 7")
			SetTaskTemp(48,3)
		elseif (UTask_tmtmp == 3) then 
			Talk(1,"","Цi C鰑 L� nh蕋 ")
			Msg2Player("得到口诀“Цi C鰑 L� nh蕋 ")
			SetTaskTemp(48,4)
		elseif (UTask_tmtmp == 4) then 
			Talk(1,"","Ng� c� trung ng")
			Msg2Player("得到口诀“Ng� c� trung ng")
			SetTaskTemp(48,5)
		else
			if (random(1,99) < 40) then		-- 完整显示一次口诀，然后就复位临时变量（再看要重新来过）
				SetTaskTemp(48,0)
				Msg2Player("完整的口诀为：二四为肩，六八为足，tr竔 3 ph秈 7，Цi C鰑 L� nh蕋 ，Ng� c� trung ng")
			end
		end
	end
end
