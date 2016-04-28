--description: ÌÆÃÅÖñº£µÚ¶ş¹ØµĞÈË
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	UTask_tmtmp = GetTaskTemp(48)
	if (Uworld37 == 20) and (random(0,99) < 50) then		-- ´øÈÎÎñÊ±£¬50%»úÂÊ³öÏÖÏÂÒ»¾ä¿Ú¾÷£¨¹²Îå¾ä£©
		if (UTask_tmtmp == 0) then
			Talk(1,"","2 4 lµ tay")
			Msg2Player("Cã ®­îc khÈu quyÕt  NhŞ Tø Vi Kiªn ")
			SetTaskTemp(48,1)
		elseif (UTask_tmtmp == 1) then 
			Talk(1,"","68 lµ ch©n")
			Msg2Player("Cã ®­îc khÈu quyÕt  B¸t HuyÖt VŞ Tóc ")
			SetTaskTemp(48,2)
		elseif (UTask_tmtmp == 2) then 
			Talk(1,"","tr¸i 3 ph¶i 7")
			Msg2Player("µÃµ½¿Ú¾÷¡°tr¸i 3 ph¶i 7")
			SetTaskTemp(48,3)
		elseif (UTask_tmtmp == 3) then 
			Talk(1,"","§¸i Cöu Lı nhÊt ")
			Msg2Player("µÃµ½¿Ú¾÷¡°§¸i Cöu Lı nhÊt ")
			SetTaskTemp(48,4)
		elseif (UTask_tmtmp == 4) then 
			Talk(1,"","Ngò cø trung ­¬ng")
			Msg2Player("µÃµ½¿Ú¾÷¡°Ngò cø trung ­¬ng")
			SetTaskTemp(48,5)
		else
			if (random(1,99) < 40) then		-- ÍêÕûÏÔÊ¾Ò»´Î¿Ú¾÷£¬È»ºó¾Í¸´Î»ÁÙÊ±±äÁ¿£¨ÔÙ¿´ÒªÖØĞÂÀ´¹ı£©
				SetTaskTemp(48,0)
				Msg2Player("ÍêÕûµÄ¿Ú¾÷Îª£º¶şËÄÎª¼ç£¬Áù°ËÎª×ã£¬tr¸i 3 ph¶i 7£¬§¸i Cöu Lı nhÊt £¬Ngò cø trung ­¬ng")
			end
		end
	end
end
