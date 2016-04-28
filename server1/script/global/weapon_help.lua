-- Ö°ÄÜ¡¡Ìú½³
-- by£ºLi_Xin(2004-07-26)


function help()
        Say("Thî rÌn  gÇn ®©y ®ån ®·i trong chèn giang hå xuÊt hiÖn mét İt vò khİ ®å phæ , y theo ®å phæ cã thÓ t¨ng lªn vò khİ cÊp bËc . ta chç nµy cã mét İt liªn quan tíi vò khİ ®å phæ ®İch ®Çu mèi , ng­¬i nghÜ biÕt kh«ng ? ",11,"Vò khİ ®å phæ th¨ng cÊp l­u tr×nh /onhelp"," l¨ng v­¬ng sóng ®o¸n t¹o tµn thiªn /onhelp","HuyÒn vò chïy chi chÕ t¹o thuËt /onhelp","Rång ng©m kiÕm ®o¸n t¹o ®å /onhelp","Gia C¸t ky qu¸t mËt muèn /onhelp"," liÔu l¸ bÓ phong ®ao  tôy lÊy thiªn /onhelp","HuyÒn th¸ng ®ao tö kinh b¶o lôc /onhelp","Thiªn c¬ c«n ®å phæ /onhelp"," ¸m khİ tæng phæ  cuèn mét /onhelp","Uyªn ­¬ng ®ao  ph¸t ra ¸nh s¸ng thiªn /onhelp","C¸i g× còng kh«ng muèn biÕt /no")
end;

function onhelp(nSel)
        if(nSel == 0) then
        	Talk(1,"","Thî rÌn  ta tíi v× ng­¬i gi¶i thİch mét chót vò khİ ®å phæ ®İch c¸ch dïng ®i . ®em cÇn th¨ng cÊp ®İch vò khİ bá vµo v©y quanh khu«ng chİnh gi÷a vŞ trİ , ®å phæ ®Æt ë cÊp bËc mét lan . nÕu nh­ phï hîp ®iÒu kiÖn , ta tù nhiªn cã thÓ gióp ng­¬i t¨ng lªn vò khİ cÊp bËc . ")
        elseif(nSel == 1) then
        	Talk(1,"","Thî rÌn : l¨ng v­¬ng sóng ®o¸n t¹o tµn thiªn lµ sóng lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn sóng ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 2) then
        	Talk(1,"","Thî rÌn : huyÒn vò chïy chi chÕ t¹o thuËt lµ chïy lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn chïy ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 3) then
        	Talk(1,"","Thî rÌn : rång ng©m kiÕm ®o¸n t¹o ®å lµ kiÕm lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn kiÕm cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 4) then
        	Talk(1,"","Thî rÌn : Gia C¸t ky qu¸t mËt nÕu lµ nç lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn nç ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 5) then
        	Talk(1,"","Thî rÌn : liÔu l¸ bÓ phong ®ao  tôy lÊy thiªn lµ phi ®ao lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn phi ®ao ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 6) then
        	Talk(1,"","Thî rÌn : huyÒn th¸ng ®ao tö kinh b¶o lôc lµ ®ao lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn ®ao ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 7) then
        	Talk(1,"","Thî rÌn : thiªn c¬ c«n ®å phæ lµ c«n lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn c«n ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 8) then
        	Talk(1,"","Thî rÌn : ¸m khİ tæng phæ  cuèn mét lµ phi tiªu lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn phi tiªu ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        elseif(nSel == 9) then
        	Talk(1,"","Thî rÌn : uyªn ­¬ng ®ao  ph¸t ra ¸nh s¸ng thiªn lµ song ®ao lo¹i vò khİ ®İch vò khİ ®å phæ , dïng nã cã thÓ t¨ng lªn song ®ao ®İch cÊp bËc . nghe nãi nã b©y giê ë D­¬ng Ch©u cïng tr­íc khi an ®İch thÇn bİ th­¬ng nh©n trªn tay . ")
        end;
end;
   	
       