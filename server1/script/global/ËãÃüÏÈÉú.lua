-- ËãÃüÏÈÉú.lua ¿´ÉùÍûÖµµÄËãÃüÏÈÉú
-- By Dan_Deng(2003-11-11)

sexhead = {"Nam","N÷ "}

Include("\\script\\global\\repute_head.lua")

function main()
	if (GetSex() == 0) then			-- ÄĞÅ®ÓÃ²»Í¬µÄ¶Ô»°
		Say("ÕÅÌú×ì£ºÕâÎ»NamÆøÓî²»·²£¬Ïë²»ÏëÖªµÀNamÄúµÄ½õĞåÇ°³Ì£¿Ö»Òª500Á½Òø×Ó¡£",2,"§­îc, ®Ó ta xem thö/view_repute_yes","Kh«ng cÇn ®©u/no")
	else
		Say("VŞ n÷ hiÖp nµy khİ ph¸ch bÊt phµm!  Cã muèn biÕt t­¬ng lai s¸ng l¹n cña m×nh kh«ng? ChØ cÇn 5000 l­îng!",2,"§­îc, ®Ó ta xem thö/view_repute_yes","Kh«ng cÇn ®©u/no")
	end
end

function view_repute_yes()
	if (GetCash() < 500) then
		Talk(1,"","L¹i mét ng­êi kh«ng cã tiÒn n÷a, lµm phİ mÊt nöa ngµy trêi")		
		return 0
	end
	Pay(500)
	repute_exp = GetRepute()
	repute_lvl = GetReputeLevel(repute_exp)
	if (repute_lvl == -1) then			-- ³ö´íÊ±
		Talk(1,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi")
	elseif (repute_lvl == 0) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.." Giang hå coi ng­¬i lµ <color=red>Míi t¸i xuÊt giang hå<color>.")
	elseif (repute_lvl == 1) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>S¬ nhËp giang hå<color>.")
	elseif (repute_lvl == 2) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>V« Danh tiÓu bèi<color>.")
	elseif (repute_lvl == 3) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>MÆc MÆc v« v¨n<color>.")
	elseif (repute_lvl == 4) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>S¬ HiÓn phong mang<color>.")
	elseif (repute_lvl == 5) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>TiÓu Höu danh khİ<color>.")
	elseif (repute_lvl == 6) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>Danh §Çu h­ëng l­îng<color>.")
	elseif (repute_lvl == 7) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>Uy TrÊn nhÊt ph­¬ng<color>.")
	elseif (repute_lvl == 8) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>Ng¹o ThŞ quÇn hïng<color>.")
	elseif (repute_lvl == 9) then
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>NhÊt §¹i t«ng s­<color>.")
	else
		Talk(2,"","ThÇn long gi¶ lµm ng­êi trÇn gian.MÆc dï hiÖn giê ng­¬i ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh. Ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ mét thiªn tµi","Danh väng giang hå cña ng­¬i hiÖn t¹i lµ"..repute_exp.."Giang hå coi ng­¬i lµ<color=red>TiÕu Ng¹o giang hå<color>.")
	end
end

function no()
end
