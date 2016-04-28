--Á½ºþÇø °ÍÁêÏØ ³¤½­ÂëÍ·´¬·ò¶Ô»°
--suyu
--200306015
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

CurWharf = 5;
Include("\\Script\\Global\\station.lua");
---------------------------------------------------------------
function main(sel)

if (GetLevel() >= 5) then		--µÈ¼¶´ïµ½5¼¶
	Say("Ta cã biÖt hiÖu lµ 'L·ng Lý B¹ch §iÒu', ba ®êi ®iÒu sèng dùa vµo s«ng n­íc! Kh¾p Ba L¨ng HuyÖn nµy kh«ng cã ai lµ ®èi thñ! Kh¸ch quan muèn ®i ®©u? ", 2, "Ngåi ThuyÒn/WharfFun", "Kh«ng ngåi/OnCancel");
else		
	Say("§¹t Level 10 råi h·y ®Õn gÆp ta.", 0)
end

end;

---------------------------------------------------------------
function  OnCancel()
   Say("Kh«ng tiÒn kh«ng thÓ ngåi thuyÒn.",0)
end;

------------------------------------------------