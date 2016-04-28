-- Ö°ÄÜ¡¡Ìú½³
-- by£ºLi_Xin(2004-08-18)


function help()
	str = 
	{
		"<> thî rÌn  v©y quanh l­u tr×nh chİnh lµ ®em trang bŞ ®Æt ë giíi mÆt chİnh gi÷a vŞ trİ , sau ®ã ®em v©y quanh vËt phÈm ®Æt ë t­¬ng øng lan bªn trong . t¨ng lªn cïng rít xuèng cÊp bËc ®İch v©y quanh vËt phÈm ®Æt ë cÊp bËc lan  söa ®æi ma ph¸p thuéc tİnh ®İch ®Æt ë linh lùc lan  söa ®æi ngò hµnh thuéc tİnh ®İch ®Æt ë ngò hµnh c¸c lan . n÷a ®iÓm kİch v©y quanh hoµn thµnh . mÆt n¹ kh«ng thÓ v©y quanh . ",
		"<> liªn quan tíi thñy tinh v©y quanh /crystalhelp",
		"<> liªn quan tíi vò khİ v©y quanh /weaponhelp",
		"<> liªn quan tíi y phôc v©y quanh /armorhelp",
		"<> liªn quan tíi c¸i mò v©y quanh /helmhelp",
		"<> ta ®· biÕt /no",
	};
	Say(str[1], 5, str[2], str[3], str[4], str[5],str[6])
   	-- Say(str[1], 3,str[2], str[3], str[4])
end

function crystalhelp()
	Talk(1,"","Thî rÌn  ta tíi v× ng­¬i gi¶i thİch mét chót thñy tinh v©y quanh . thñy tinh nh­ng v©y quanh trang bŞ , nh­ng cÇn tû lÖ thµnh c«ng nhÊt ®Şnh . tö thñy tinh t¨ng lªn trang bŞ cÊp bËc  lan thñy tinh söa ®æi trang bŞ ®İch ngò hµnh thuéc tİnh  n­íc biÕc tinh söa ®æi trang bŞ ®İch ma ph¸p thuéc tİnh , thuéc tİnh ngÉu nhiªn söa ®æi . ")
end

function weaponhelp()
	str = {
		"<> thî rÌn  gÇn ®©y ®ån ®·i trong chèn giang hå xuÊt hiÖn mét İt vò khİ ®å phæ , y theo ®å phæ cã thÓ t¨ng lªn vò khİ cÊp bËc . ta cã thÓ nãi cho ng­¬i biÕt mét İt liªn quan tíi vò khİ ®å phæ chuyÖn cña t×nh , ng­¬i nghÜ biÕt kh«ng ? ",
		"<> vò khİ ®å phæ th¨ng cÊp l­u tr×nh /onweaponhelp",
		"<> l¨ng v­¬ng sóng ®o¸n t¹o tµn thiªn /onweaponhelp",
		"<> huyÒn vò chïy chi chÕ t¹o thuËt /onweaponhelp",
		"<> rång ng©m kiÕm ®o¸n t¹o ®å /onweaponhelp",
		"<> Gia C¸t ky qu¸t mËt muèn /onweaponhelp",
		"<> liÔu l¸ bÓ phong ®ao  tôy lÊy thiªn /onweaponhelp",
		"<> huyÒn th¸ng ®ao tö kinh b¶o lôc /onweaponhelp",
		"<> thiªn c¬ c«n ®å phæ /onweaponhelp",
		"<> ¸m khİ tæng phæ  cuèn mét /onweaponhelp",
		"<> uyªn ­¬ng ®ao  ph¸t ra ¸nh s¸ng thiªn /onweaponhelp",
		"<> c¸i g× còng kh«ng muèn biÕt /no",
	};
    Say(str[1],11,str[2], str[3], str[4], str[5],str[6], str[7], str[8], str[9],str[10], str[11], str[12])
end

function onweaponhelp(nSel)
	strHelp = 
	{
		"<> thî rÌn  ta tíi v× ng­¬i gi¶i thİch mét chót vò khİ ®å phæ ®İch c¸ch dïng ®i . ®em cÇn th¨ng cÊp ®İch vò khİ bá vµo v©y quanh khu«ng chİnh gi÷a vŞ trİ , ®å phæ ®Æt ë cÊp bËc mét lan . nÕu nh­ phï hîp ®iÒu kiÖn , ta tù nhiªn cã thÓ gióp ng­¬i t¨ng lªn vò khİ cÊp bËc . ",
		"<> thî rÌn : l¨ng v­¬ng sóng ®o¸n t¹o tµn thiªn lµ sóng lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn sóng ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : huyÒn vò chïy chi chÕ t¹o thuËt lµ chïy lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn chïy ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : rång ng©m kiÕm ®o¸n t¹o ®å lµ kiÕm lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn kiÕm cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : Gia C¸t ky qu¸t mËt nÕu lµ nç lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn nç ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : liÔu l¸ bÓ phong ®ao  tôy lÊy thiªn lµ phi ®ao lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn phi ®ao ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : huyÒn th¸ng ®ao tö kinh b¶o lôc lµ ®ao lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn ®ao ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : thiªn c¬ c«n ®å phæ lµ c«n lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn c«n ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : ¸m khİ tæng phæ  cuèn mét lµ phi tiªu lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn phi tiªu ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
		"<> thî rÌn : uyªn ­¬ng ®ao  ph¸t ra ¸nh s¸ng thiªn lµ song ®ao lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn song ®ao ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ",
	};
	Talk(1,"",strHelp[nSel + 1]);   
end

function armorhelp()
	Talk(1,"","Thî rÌn  ta tíi v× ng­¬i gi¶ng gi¶i y phôc v©y quanh ®İch ph­¬ng ph¸p . lÊy Thiªn S¬n tuyÕt lÜnh ®İch b¨ng tµm v« cùc ti , kÕt hîp víi ta ®o¸n t¹o bİ ph¸p , tr¶i qua thiªn chuy b¸ch luyÖn liÒn cã thÓ tr¨m phÇn tr¨m ®İch thµnh c«ng t¨ng lªn y phôc cña ng­¬i cÊp bËc . lÊy ba miªu c¸nh ®ång hoang vu ®İch nam minh chi tinh , kÕt hîp víi ta ®o¸n t¹o bİ ph¸p , tr¶i qua ®i nhòng l­u tinh liÒn cã thÓ tr¨m phÇn tr¨m ®İch thµnh c«ng rít xuèng y phôc cña ng­¬i cÊp bËc . ")
end

function helmhelp()
	Talk(1,"","Thî rÌn  ta tíi v× ng­¬i gi¶ng gi¶i c¸i mò v©y quanh ®İch ph­¬ng ph¸p . lÊy Thiªn S¬n tuyÕt lÜnh ®İch b¨ng tµm v« cùc ti , kÕt hîp víi ta ®o¸n t¹o bİ ph¸p , tr¶i qua thiªn chuy b¸ch luyÖn liÒn cã thÓ tr¨m phÇn tr¨m ®İch thµnh c«ng t¨ng lªn ng­¬i c¸i mò cÊp bËc . lÊy ba miªu c¸nh ®ång hoang vu ®İch nam minh chi tinh , kÕt hîp víi ta ®o¸n t¹o bİ ph¸p , tr¶i qua ®i nhòng l­u tinh liÒn cã thÓ tr¨m phÇn tr¨m ®İch thµnh c«ng rít xuèng ng­¬i c¸i mò cÊp bËc . ")
end

