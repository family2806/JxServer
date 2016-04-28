Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\head_qianzhuang.lua")
TV_LAST_APPLY_TIME = 1571 -- ÉÏ´ÎÉêÇë´«¹¦Ê±¼ä
TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr> ®éc c« kiÕm :<link>"

function chuangong_login()
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Describe(strimg.." ng­¬i tr­íc m¾t <color=yellow> th©n thØnh ®İch truyÒn c«ng ®· chuÈn bŞ tháa ®¸ng <color> , tïy thêi cã thÓ tíi ta chç truyÒn c«ng ", 2, "H¶o , ta biÕt , ®Õn lóc ®ã ta sÏ tíi b¸i pháng . /cg_OnCancel", "Kh«ng , minh chñ , ta kh«ng muèn truyÒn c«ng liÔu , ta muèn hñy bá truyÒn c«ng th©n thØnh /cg_undo");
		else
			Describe(strimg.." ng­¬i tr­íc m¾t <color=yellow> ®· th©n thØnh truyÒn c«ng , "..(num2datestr(applytime)).." <color> sau lµ ®­îc truyÒn c«ng ", 2, "C¸m ¬n minh chñ nh¾c nhë , v·n bèi ë chç nµy c¸m ¬n /cg_OnCancel", "Kh«ng , minh chñ , ta kh«ng muèn truyÒn c«ng liÔu , ta muèn hñy bá truyÒn c«ng th©n thØnh /cg_undo");
		end
	end
end

function chuangong_msg()
	print("msgmsg")
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Msg2Player("Ng­¬i tr­íc m¾t <color=yellow> th©n thØnh ®İch truyÒn c«ng ®· chuÈn bŞ hoµn thµnh <color=> , tïy thêi cã thÓ ®Õn ®éc c« kiÕm chç chİnh thøc truyÒn c«ng  truyÒn c«ng cÇn tèn hao 2 tÊm ng©n phiÕu , xin/mêi còng nãi tr­íc chuÈn bŞ xong . ")
		else
			Msg2Player("Ng­¬i tr­íc m¾t <color=yellow> ®· th©n thØnh truyÒn c«ng , truyÒn c«ng thêi gian ë "..(num2datestr(applytime)).."<color> sau , truyÒn c«ng cÇn tèn hao 2 tÊm ng©n phiÕu , xin/mêi còng nãi tr­íc chuÈn bŞ xong . ")
		end
	end
end

function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.." n¨m "..month.." th¸ng "..day.." ngµy "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.." ta ®Õn "..num2datestr(nowday).." liÒn cã thÓ chuÈn bŞ xong gióp ng­¬i truyÒn c«ng liÔu , ng­¬i thËt kh«ng muèn truyÖn sao ? ",2,"§óng vËy , ta kh«ng muèn truyÒn c«ng liÔu /cg_undo_sure", "Kh«ng , ta cßn lµ muèn truyÖn , míi võa råi nhÊt thêi khÈn tr­¬ng nãi sai råi mµ th«i . /cg_OnCancel")
	else
		Describe(strimg.." ng­¬i kh«ng cã ®· nãi víi ta muèn truyÒn c«ng a . ch­a nãi qua nh­ thÕ nµo hñy bá ®©y ? ",1,"KÕt thóc ®èi tho¹i /cg_OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.." ®­îc råi , vËy nh÷ng thø nµy tµi liÖu ta tr­íc thu l¹i , nÕu nh­ lÇn sau muèn truyÖn lêi cña n÷a chuÈn bŞ ®i ",1,"C¸m ¬n minh chñ /cg_OnCancel")
end

function cg_OnCancel()
		
end

if (GetProductRegion() ~= "vn") then
	login_add(chuangong_msg, 2)
end
