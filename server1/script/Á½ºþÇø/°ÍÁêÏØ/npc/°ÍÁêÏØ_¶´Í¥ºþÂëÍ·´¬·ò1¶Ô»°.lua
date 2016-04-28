--Á½ºþÇø °ÍÁêÏØ ¶´Í¥ºþÂëÍ·´¬·ò1¶Ô»°
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)
	Say("C¶ ®êi ta ®iÒu sèng víi s«ng n­íc!. §éng d×nh hå kh«ng n¬i nµo mµ ta kh«ng biÕt! Kh¸ch quan muèn ®i ®©u?", 2, "§i Thiªn V­¬ng §¶o/yes", "Kh«ng ngåi/no")
end;

function yes()
	if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
		if (GetFaction() == "tianwang") then				--Èç¹ûÍæ¼ÒÊÇÌìÍõ°ïµÜ×Ó£¬×ø´¬²»ÊÕÇ®
			Say("Th× ra lµ m«n ®Ö cña Thiªn V­¬ng Bang! ta sÏ ®­a ng­êi ®i miÔn phÝ", 1, "Ngåi ThuyÒn/ok1")
		else	
			Say("N¬i ®ã nguy hiÓm l¾m! NÕu kh¸ch quan muèn ®i xin cho thªm Ýt tiÒn", 1, "Ngåi ThuyÒn/ok2")
		end
	else		
		Talk(1,"","N¬i ®ã nguy hiÓm l¾m! Khi nµo d¹t ®Õn ®»ng cÊp h¬n 10 ta sÏ ®­a kh¸ch quan ®i")
	end
end;

function no()
end;

function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)					--×ª»»Îª·ÇÕ½¶·×´Ì¬
end;

function ok2()
if (GetCash() >= 100) then							--²Î¿¼Öµ
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--×ª»»Îª·ÇÕ½¶·×´Ì¬	
else
	Say("Kh«ng tiÒn kh«ng thÓ ngåi thuyÒn!", 0)		
end
end;
