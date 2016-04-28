-- ÄÏÂùÀÏÈË.lua (Ê¥µ®»î¶¯)
Include([[\script\missions\chrismas\ch_head.lua]]);
Include([[\script\missions\chrismas\xmas_day.lua]]);

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20061222) then
		Describe(DescLink_LiGuan.." lÔ gi¸ng sinh vui vÎ !", 1, "KÕt thóc ®èi tho¹i /oncancel");
	else
		Describe(DescLink_LiGuan.." ha ha  lÔ gi¸ng sinh vui vÎ  muèn biÕt n¨m nay lÔ gi¸ng sinh cã c¸i g× ho¹t ®éng sao ?", 5, 
			" nghe nãi «ng giµ n« en rít hµnh lı /want_xmasevent",
			" ta muèn t¹o ng­êi tuyÕt ./want_snowman",
			" ta muèn dïng ng­êi tuyÕt ®æi lÔ phÈm ./want_gift",
			" ta muèn hiÓu râ ho¹t ®éng néi dung /xmas_about",
			" ta b©y giê bÒ bén nhiÒu viÖc , chê mét chót trë l¹i ./oncancel");
	end;
end;

function want_xmasevent()
	if (isXmasTime() ~= 1) then
		Describe(DescLink_LiGuan.." c¸m ¬n ng­¬i , ta ®· t×m ®­îc tói hµnh lı liÔu .",1, "KÕt thóc ®èi tho¹i /oncancel");
		return 0;
	end;
	Describe(DescLink_LiGuan.." ta míi võa rít mét tói hµnh lı , bªn trong cã rÊt nhiÒu quµ gi¸ng sinh , ng­¬i cã thÓ gióp ta t×m trë vÒ sao ?", 4,
	" dÜ nhiªn cã thÓ n÷a/råi ./onok",
	" ta ®· t×m ®­îc bän hä ./award",
	" kÕt thóc gi¸ng sinh ho¹t ®éng ./detail",
	" b©y giê ta bÒ bén nhiÒu viÖc , cã r·nh rçi trß chuyÖn tiÕp nga ./oncancel")
end;


function onok()
	if (50 > GetLevel()) then
		strTalk = DescLink_LiGuan.." ng­¬i lŞch l·m kh«ng cã ®¹t tíi 50 cÊp , vÉn kh«ng thÓ tham gia gi¸ng sinh ho¹t ®éng . ";
		Describe(strTalk, 1, "KÕt thóc ®èi tho¹i /oncancel");
		return
	end;
	Describe(DescLink_LiGuan.." nga , vËy th× thËt lµ c¸m ¬n nhiÒu , ng­¬i tíi tr­íc bªn kia chuÈn bŞ mét chót , ta mét håi liÒn dÉn ng­¬i ®Õn bän hä ®i vøt ®Şa ph­¬ng . ", 2, "Tèt . /wantjoin", "Ta ®ét nhiªn cã chót viÖc gÊp , tr­íc hÕt chê mét chót ®i . /oncancel");
end;

function award()
	local nCount = GetTask(TK_COUNT_ONETIME);
	local nRank = GetTask(TK_RANK);
	SetTask(TK_COUNT_ONETIME, 0);
	SetTask(TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Describe(DescLink_LiGuan.." ng­¬i thËt gièng nh­ kh«ng cã t×m ®­îc bÊt kú ®İch gi¸ng sinh tinh linh ®i . ", 1, "KÕt thóc ®èi tho¹i /oncancel");
		return
	end;
	local strSay = format("Ng­¬i thËt t×m ®­îc bän hä , b©y giê thËt tèt qu¸  ta xem mét chót , ng­¬i tæng céng t×m ®­îc %d c¸ <color=yellow> gi¸ng sinh tinh linh <color> , lµ t×m ®Õn tinh linh thø %d nhiÒu ng­êi , tíi tíi , ®©y lµ lÔ vËt cho ng­¬i , nhËn lÊy ®i , a a a ~", nCount, nRank);
	Describe(DescLink_LiGuan..strSay, 1, "NhËn lÊy lÔ vËt . /oncancel");
	giveaward(nRank);
end;

function detail()
	Describe(DescLink_LiGuan.." t×m tinh linh ho¹t ®éng mét cuéc v× <color=yellow>15<color> phót , trong ®ã cã <color=yellow>5<color> phót chuÈn bŞ thêi gian , ë ghi danh tham gia sau ng­¬i sÏ bŞ mang tíi chuÈn bŞ b¶n ®å , ho¹t ®éng b¾t ®Çu sau ng­¬i sÏ bŞ mang tíi gi¸ng sinh tinh linh ®i vøt ®Şa ph­¬ng , nÕu nh­ ng­¬i ë ®©y n¬i ®ã thÊy <color=yellow> gi¸ng sinh tinh linh <color> lêi cña chØ cÇn dïng con chuét <color=yellow> bªn tr¸i kiÖn ®iÓm kİch <color> h¾n lµ ®­îc råi , dÜ nhiªn ng­¬i cã lÏ sÏ bŞ nh÷ng kh¸c nhµ ch¬i ®İch ng¨n trë , lóc nµy ng­¬i cã thÓ dïng ho¹t ®éng ®¹o cô tíi ®èi phã nh÷ng t×nh huèng nµy , chØ cÇn ng­¬i t×m ®­îc nhiÒu ®ñ ®İch <color=yellow> gi¸ng sinh tinh linh <color> nh­ vËy «ng giµ n« en sÏ cho ng­¬i tèt lÔ vËt nga . ", 1, "ThËt thÇn kú nh­ vËy ? ta xem mét chót . /oncancel");
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = " ng­¬i thu ®­îc mét hoµng kim mÇm mãng "
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = " ng­¬i thu ®­îc mét thñy tinh mÇm mãng "
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = " ng­¬i thu ®­îc mét hoa hång mÇm mãng "
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = " ng­¬i thu ®­îc mét may m¾n mÇm mãng "
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function wantjoin()
	local w, x, y;
	w, x, y = GetWorldPos();
	SetTask(TK_LEAVERMAPID, w);	--´æ´¢Íæ¼ÒÀë¿ªµÄ×ø±ê
	SetTask(TK_LEAVERPOSX, x);
	SetTask(TK_LEAVERPOSY, y);
	joingame() --¼ÓÈëµ½ÓÎÏ·ÖĞ
end;

function xmas_about()
	Describe(DescLink_LiGuan.." ®ang ho¹t ®éng thêi gian bªn trong , nhµ ch¬i cÇn ®¸nh tr¸ch tíi thu tËp hép quµ , bªn trong sÏ cã <color=yellow> b«ng tuyÕt , gia tö , tïng chi , c¸i mò , tïng c©y , vi c©n <color>, lµ dïng tíi luyÖn chÕ <color=yellow> ®Æc biÖt ng­êi tuyÕt ®İch nguyªn liÖu <color>. nh©n c«ng luyÖn chÕ thÊt b¹i , ®em lµm ra <color=yellow> mét lo¹i ng­êi tuyÕt <color>. sau ®ã , cã thÓ dïng ng­êi tuyÕt ®Ó ®æi lÊy lÔ phÈm .", 1, "Ta biÕt /main");
end;

function oncancel()	--È¡Ïû

end;
