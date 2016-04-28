--description: Á½ºşÇø °ÍÁêÏØ Ò©µêÀÏ°å¶Ô»°£¨ÌìÍõ°ï40¼¶ÈÎÎñ¡¢ĞÂÊÖÈÎÎñĞ¡ÓæµùµùµÄ²¡£©
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- ÌìÍõ40¼¶ÈÎÎñ
		Talk(5, "L40_tw_talk2", "T¹i h¹ lµ Thiªn v­¬ng gióp ®İch ®Ö tö , ta cã mét ®ång m«n trung liÔu xİch luyÖn xµ ®İch ®éc , xin/mêi thÇn y cho ta gi¶i d­îc !", "Xİch luyÖn xµ ? thËt sù lµ qu¸ nguy hiÓm .. ta cã thÓ cøu , muèn t×m tµi liÖu tíi chÕ thuèc !", "Kh«ng biÕt muèn c¸i g× tµi liÖu ®©y ? ", "§©y lµ gia truyÒn bİ quyÕt , nh­ng ng­¬i lµ Thiªn v­¬ng ®Ö tö ta liÒn nãi cho ng­¬i nghe ! ph¶i cã <color=Red> löa con th»n l»n ®İch v¶y <color> cïng <color=Red> l«ng xanh con rïa vá rïa th­îng ®İch mao <color>. t×m ®­îc hai thø ®å nµy , ng­¬i ®ång m«n th× cã cøu ", "Kh«ng biÕt cã thÓ t×m ®­îc hai thø ®å nµy sao ? ")
	elseif(UTask_world18 == 1) then				-- ĞÂÊÖ´åĞ¡ÓæÈÎÎñ
		Talk(1,"","Ng« thÇn y: oh ? tiÓu c¸ ®İch phô th©n ng· bÖnh ? ng­¬i tíi thËt lµ kh«ng khĞo , míi võa vµo ®İch mét nhãm tú ba hoµn b¸n hÕt cho Thiªn v­¬ng gióp . nÕu kh«ng , ng­¬i ®i hái mét chót trong th«n Thiªn v­¬ng gióp ®İch ®Ö tö ? ")
		Msg2Player("TiÖm thuèc l·o b¶n nãi cho ng­¬i biÕt tú ba hoµn ®· b¸n xong , cÇn ®i t×m Thiªn v­¬ng gióp ®Ö tö ")
		AddNote("TiÖm thuèc l·o b¶n nãi cho ng­¬i biÕt tú ba hoµn ®· b¸n xong , cÇn ®i t×m Thiªn v­¬ng gióp ®Ö tö ")
	elseif (UTask_tw == 40*256+50) then
		Say("Nghe nãi ë <color=Red> phôc l­u ®éng <color> cã <olor=Red> löa con th»n l»n <color> cïng <color=Red> l«ng xanh con rïa <color>, cã ng­êi ë <color=Red> Thiªn v­¬ng ®¶o <color> gÆp ®­îc . chØ cÇn t×m ®­îc ng­¬i ®ång m«n th× cã cøu ", 2, "Ta ®i tr­íc mua mét chót thuèc /yes", "Ta muèn lËp tøc ®i mua thuèc dÉn /no")
	else							-- ·ÇÈÎÎñ×´Ì¬
		Say("Bæn tiÖm lµ thÇn d­îc! Cã bÖnh sÏ khái bÖnh, kh«ng bÖnh sÏ kháe, gi¸ c¶ ph¶i ch¨ng. Mua mét İt chø? ", 3, "Giao dŞch /yes", "Ta ®Õn nhËn nhiÖm vô s¬ nhËp /yboss","Kh«ng giao dŞch /no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","Nghe nãi ë <color=Red> phôc l­u ®éng <color> cã <color=Red> löa con th»n l»n <color> cïng <color=Red> l«ng xanh con rïa <color>, cã ng­êi ë <color=Red> Thiªn v­¬ng ®¶o <color> gÆp ®­îc ", "§a t¹ thÇn y !")
	SetTask(3, 40*256+50)								-- ÌìÍõ40¼¶ÈÎÎñ
	AddNote("Nghe ba l¨ng huyÒn ®İch thÇn y nãi : muèn mæ r¾n ®éc ph¶i cã löa con th»n l»n da cïng l«ng xanh con rïa ")
	Msg2Player("Muèn mæ r¾n ®éc ph¶i cã löa con th»n l»n da cïng l«ng xanh con rïa .")
end;

function yes()
	Sale(39);  			--µ¯³ö½»Ò×¿ò
end;

function no()
end;
