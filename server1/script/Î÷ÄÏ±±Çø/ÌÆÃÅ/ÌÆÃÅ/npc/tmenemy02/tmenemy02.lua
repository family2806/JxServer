--description: 唐门竹海第二关敌人
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	UTask_tmtmp = GetTaskTemp(48)
	if (Uworld37 == 20) and (random(0,99) < 50) then		-- 带任务时，50%机率出现下一句口诀（共五句）
		if (UTask_tmtmp == 0) then
			Talk(1,"","2 4 为肩")
			Msg2Player("得到口诀“二四为肩")
			SetTaskTemp(48,1)
		elseif (UTask_tmtmp == 1) then 
			Talk(1,"","68 为足")
			Msg2Player("得到口诀“六八为足")
			SetTaskTemp(48,2)
		elseif (UTask_tmtmp == 2) then 
			Talk(1,"","左三右七")
			Msg2Player("得到口诀“左三右七")
			SetTaskTemp(48,3)
		elseif (UTask_tmtmp == 3) then 
			Talk(1,"","戴九履一")
			Msg2Player("得到口诀“戴九履一")
			SetTaskTemp(48,4)
		elseif (UTask_tmtmp == 4) then 
			Talk(1,"","五居中央")
			Msg2Player("得到口诀“五居中央")
			SetTaskTemp(48,5)
		else
			if (random(1,99) < 40) then		-- 完整显示一次口诀，然后就复位临时变量（再看要重新来过）
				SetTaskTemp(48,0)
				Msg2Player("完整的口诀为：二四为肩，六八为足，左三右七，戴九履一，五居中央")
			end
		end
	end
end
