--ÒÔ¸£Ôµ³öÊÛÎïÆ·µÄNPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include([[\script\event\mid_autumn06\head.lua]]);
Include("\\script\\vng_feature\\thuongnhanthanbi\\moruongfour\\openchestfour.lua")

function main()
	local tab_Content = {
		"Giao dŞch/OnBuy", 
		"§i Tr­êng b¹ch s¬n /GotoHuanZhuan", 
		"Liªn quan tíi phóc duyªn.../OnAbout",
		"KÕt thóc ®èi tho¹i/OnCancel"
	};
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "Trung thu ho¹t ®éng/au06_lpaw_entrance");
	end;
	--tinsert(tab_Content, "¿ªÏä 4/#tbChectfour:main()");
	Say ( "Kh¸ch quan muèn mua g×? Bæn trang hµng g× còng cã!", getn(tab_Content), tab_Content);
end

function OnBuy()
	Sale( 93, 2 );
end

function OnAbout()
	Talk( 3, "", "Phóc duyªn ®iÓm ®Õm: Th«ng qua tİch lòy thêi gian ch¬i, cã thÓ ®æi ®iÓm phóc duyªn. Cã thÓ tíi T­¬ng D­¬ng thÇn bİ th­¬ng nh©n LiÔu ?t ®æi c¸c lo¹i vËt phÈm ®Æc thï. ", " Phóc duyªn ®æi:tİch lòy hai giê online trë lªn , ®i c¸c ®¹i thµnh thŞ t×m vâ l©m minh chñ truyÒn nh©n lµ ®­îc ®æi . mét ngµy ®­îc ®æi 2 lÇn, tİch lòy ë tuyÕn thêi gian 4 giê trë lªn, mçi giê ®æi 1 ®iÓm phóc duyªn.", "H¹n chÕ ®iÒu kiÖn :Ngåi tï kh«ng ®­îc tİch lòy ®iÓm phóc duyªn." );
end

function au06_lpaw_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("chØ cã sung trŞ gi¸ nhµ ch¬i míi cã thÓ tham gia trung thu ho¹t ®éng", 0);
		return
	end;
	Say("nÕu nh­ ng­¬i cã <color=yellow> 10 th­¬ng cæ lÖnh bµi <color> ta sÏ cho ng­¬i ®æi mét <color=yellow> phông ngô qu¶ dong <color> ®­a kü n¨ng trŞ gi¸ hoÆc lµ 1 <color=yellow> cèng ngô phï dung <color> ®­a tiÒm n¨ng trŞ gi¸", 3, "1 c¸ th­¬ng cæ lÖnh bµi ®æi lÊy t­ëng th­ëng/#shangjialingpai(1)", "10 c¸ th­¬ng cæ lÖnh bµi ®æi lÊy t­ëng th­ëng/#shangjialingpai(2)", "Kh«ng/oncancel");
end;

function shangjialingpai(nIndex)
	if (CalcEquiproomItemCount(6, 1, 1252, -1) < 10) then
		Say("cÇn 10 c¸ th­¬ng cæ lÖnh bµi míi cã thÓ ®æi lÊy t­ëng th­ëng", 0);
		return
	end;
	
	--¿Û³ıÎïÆ·
	if (ConsumeEquiproomItem(10, 6, 1, 1252, -1) ~= 1) then
		return
	end
	
	--¸øÓè½±Àø
	local str = "<color=yellow>Phông ngô qu¶ dong<color>";
	if (nIndex == 1) then -- Ôö¼ÓÒ»¸ö¼¼ÄÜµã
		AddItem(6, 1, 127, 1, 0, 0, 0);
	else -- Ôö¼Ó5¸öÇ±ÄÜµã
		AddItem(6, 1, 128, 1, 0, 0, 0);
		str = "<color=yellow>Cèng ngô phï dung<color>";
	end;
	
	--¸øÓèÌáÊ¾
	Say("Xin mêi nhËn mét chót lÔ vËt", 0);
	Msg2Player("§¹t ®­îc"..str);
end;

function OnCancel()
end
function GotoHuanZhuan()
	NewWorld(934, 49632 / 32, 105696 /32)
end
