--description: Thiªn V­¬ng°ïÇŞ¹¬ Ñîçø¡¡Thiªn V­¬ng³öÊ¦ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø
-- Update£ºDan_Deng(2003-10-27)ÎªÖØ·µÊ¦ÃÅÈÎÎñ¼ÓÈëÈ¡ÏûÈÎÎñ¹¦ÄÜ£¬ÒÔ¼°ÓëĞÂÃÅÅÉ¶ÔÓ¦

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	if (vt06_isactive() ~= 0) then
		Say("T×m ta cã viÖc g×?", 2, "Muèn thØnh gi¸o ®¹i s­!/oldentence", "Mõng lÔ ¢n S­, t¹i h¹ ®· t×m ®ñ “ThÎ ¢n S­” vµ “ThÎ Cao §å”./vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×."
	G_TASK:OnMessage("Thiªn V­¬ng", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 1) then
		tbDailog:AddOptEntry("Häc kü n¨ng cÊp 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end

	UTask_tw = GetTask(3);
	local nFactID = GetLastFactionNumber();

	if (UTask_tw == 70*256) and (GetFaction() == "tianwang") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tw == 70*256) and (GetTask(7) >= 5*256) and (GetTask(7) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(7,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tw == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(3,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tw == 80*256 and nFactID == 1 and GetCamp() == 3 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianwang");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_tw == 70*256 and nFactID == 1 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end
	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(1)", "Muèn thØnh gi¸o viÖc kh¸cÇé/common_talk"};
	
	Say("½üÈÕÎÒÓĞºÜ¶àÊÂÇéÒª½â¾ö£¬ÄãT×m ta cã viÖc g×?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","TriÒu ®×nh nhµ Tèng ngu xuÈn, kh«ng ®éi trêi chung víi D­¬ng gia ta. N¨m x­a Së V­¬ng cïng cha ta thÒ quyÕt diÖt Tèng. D­¬ng Anh tuy bÊt tµi, nh­ng còng quyÕt thùc hiÖn chİ lín!")
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--ÄÃµ½Thiªn V­¬ngÒÅÊé
			Talk(3, "L60_prise", "ÊôÏÂ²»ÈèÊ¹Ãü£¬ÒÑ¾­½«¡¶Thiªn V­¬ngÒÅÊé¡·È¡»Ø£¬Çë°ïÖ÷¹ıÄ¿! ", "Ì«ºÃÁË£¡ÄÃµ½Thiªn V­¬ngÒÅÊé²»µ«¿ÉÒÔ±£È«±¾°ï»¹×èÖ¹ÁËÒ»³¡ÎäÁÖºÆ½Ù£¡Äã×öµÄºÜºÃ£¡½ñÌìÆğÄã¿ÉÒÔ×ÔÓÉ´³µ´½­ºşÁË?", "Chóc mõng b¹n thµnh nghÖ xuÊt s­! B¹n ®­îc phong lµ K×nh Thiªn Nguyªn So¸i, tõ nay vÒ sau cã thÓ tù do hµnh tÈu giang hå! Hy väng b¹n sÏ ph¸t huy n¨ng lùc, ph¸t triÓn tiÒn ®å!")
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", "Ïëµ±Äê£¬³şÍõÔÚ¶´Í¥ºşÆğ±ø£¬ÄÏ¿¹ÕÔËÎ£¬±±µÖ½ğ±ø£¬ºÎµÈÓ¢ĞÛ£¡³şÍõÉí¹Êºó£¬Òå¾ü²Ğ²¿ÍÆ¾ÙÎÒµù´óÊ¥Thiªn V­¬ngÎªÁìĞä£¬¼ÌĞøÁìµ¼ÆğÒå¡£Òå¾ü·¢Õ¹Ñ¸ÃÍ£¬ÒıÆğ³¯Í¢¿Ö»Å£¬ÅÉÖØ±øÇ°À´½ËÃğ£¬ÔÚÄÇ³¡ÑªÕ½ÖĞ£¬ÎÒµù²»ĞÒ±»ÅÑÍ½³öÂô£¬Á¦Õ½²»Çü£¬ÔÚÇàÂİµº±»·ıÎşÉü", "ÊÂºó£¬ÎÒ½«µùµÄÒÂ¹Ú¡¢Åå½£ºÍÒ»±¾±øÊéÒ»ÆğÂñÔÚ <color=Red>ÇàÂİµº<color>. ÄÇ±¾±øÊéÃûÎª<color=Red>'Thiªn V­¬ngÒÅÊé<color>, ÀïÃæ²»½ö¼ÇÔØÁËÎÒµùÉúÇ°ĞĞ¾ü²¼ÕóµÄĞÄµÃÓëÃÜÒª£¬¶øÇÒ»¹ÏêÏ¸¼ÇÂ¼ÁË¶´Í¥ºşµØÇøµÄ¾üÊÂÒªµØºÍË®Â·ÒªÈû£¬Òò´Ë¶ÔÓÚ±¾°ï¶øÑÔÄËÊÇÒ»±¾Ê®·ÖÖØÒªµÄÃÜÊé. ", "ThÕ nh­ng gÇn ®©y kh«ng biÕt bŞ ai ®ã cung cÊp th«ng tin ra ngoµi, cuèn s¸ch nµy bŞ qu©n Kim dß ra, chóng ®· cö bän s¸t thñ ®Õn lÊy c¾p cuèn s¸ch nµy. ")
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			Say("ThÕ nµo! Muèn hµnh tÈu giang hå mét phen µ?",2,"V©ng, xin Bang chñ ©n chuÈn. /goff_yes","Kh«ng, ta tù thÊy c«ng phutËp luyÖn vÉn ch­a ®ñ. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--ÒÑ¾­½Óµ½³öÊ¦ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","<color=Red>'Thiªn V­¬ngÒÅÊé<color>±»²ØÔÚÒ»¸ö<color=Red>±¦ÏäÀï<color>, ±¦Ïä²ØÔÚ<color=Red>ÇàÂİµº±±²¿<color>, Ö®Ç°ÒªÕÒµ½<color=Red>´ò¿ª±¦ÏäµÄÔ¿³×<color>.")
		else
			Talk(1,"","Kim quèc cã ı muèn ng«ng cuång lËt ®æ vâ l©m Trung Nguyªn ta, nÕu nh­ huynh ®Ö chóng ta kh«ng ®ång t©m, lµm sao cã thÓ chèng ®­îc qu©n thï?")
		end
--	elseif (GetTask(7) == 5*256+10) then		-- ×ªÅÉÖÁÉÙÁÖÅÉ
--		Say("Ñîçø£ºÅÑ°ïÕßÒª·ÏÈ¥±¾°ïÈ«²¿Îä¹¦£¬ÄãÕæµÄÒª±³Æú±¾ÃÅÍ¶ÈëÉÙÁÖÅÉ£¿",2,"²»´í£¬ÎÒÒâÒÑ¾ö/defection_yes","²»£¬ÎÒ»¹ÊÇ²»¸ÄÍ¶ÉÙÁÖÁË/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(1,"return_select","Tèt l¾m! Hµnh tÈu giang hå nhí gióp ®ì nh÷ng ng­êi khèn khã!")
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say("Ng­¬i ®· chuÈn bŞ ®ñ 5 v¹n l­îng ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--ÒÑ¾­³öÊ¦
		Talk(1,"","Àë¿ªThiªn V­¬ngÖ®ºóÃ¿¸öÈËÈÔ¾ÉÏñÇ×ÊÖ×ãÒ»Ñù!")
	else
		Talk(1,"","Thiªn V­¬ng°ï²»¿¿ËÎ½ğÈÎºÎÒ»±ßÒ²ÄÜÕ¾ÎÈ£¬ÉõÖÁ·¢Õ¹¿ìËÙ£¬¶¼ÊÇÒòÎª°ïÖÚĞÖµÜÍÅ½áÒ»ĞÄ")
	end
end

---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
	x = 0
	skillID = 38					-- ÅÌ¹Å¾ÅÊ½
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ÈôÓĞ¼¼ÄÜ·¢Éú±ä»¯£¬ÔòÌßÏÂÏß£¬·ñÔò·µ»Ø¼ÌĞøÁ÷³Ì
		Say("Vi s­ lÇn nµy bÕ quan suy nghÜ mÊy ngµy, s¸ng chÕ ra ®­îc chiªu thøc míi, b©y giê truyÒn l¹i cho ng­¬i. Häc xong nhí ph¶i tŞnh d­ìng mét thêi gian ®Ó khái lµm tæn th­¬ng kinh m¹ch.",1,"§a t¹ s­ phô /KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- ÖØ·µÈÎÎñ ----------------------
function goff_yes()
	Talk(1,"","Tèt l¾m! Hµnh tÈu giang hå nhí gióp ®ì nh÷ng ng­êi khèn khã!")
	SetTask(3,70*256)
	AddNote("Àë¿ªThiªn V­¬ng°ï£¬¼ÌĞøĞĞ×ß½­ºş")
	Msg2Player("ÄãÒÑÀë¿ªThiªn V­¬ng°ï£¬¼ÌĞøĞĞ×ß½­ºş")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- Ë¢µô¼¼ÄÜ
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Õ¶Áú¾÷
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Thiªn V­¬ngÇ¹·¨
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Thiªn V­¬ngµ¶·¨
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Thiªn V­¬ng´¸·¨
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- »Ø·çÂäÑã
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ĞĞÔÆ¾÷
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÎŞĞÄÕ¶
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¾²ĞÄ¾÷
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¾ªÀ×Õ¶
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ñô¹ØÈıµş
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Thiªn V­¬ngÕ½Òâ
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÆÃ·çÕ¶
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÅÌ¹Å¾ÅÊ½£¨ÒÑÈ¡Ïû¼¼ÄÜ£©
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¶Ï»êØİ
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÑªÕ½°Ë·½
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ½ğÖÓÕÖ
	AddMagicPoint(n)
-- Ë¢Íê¼¼ÄÜºó¼ÌĞø×ªÃÅÅÉÁ÷³Ì
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- ÎªÔ­ÃÅÅÉ×÷¸ö±ê¼Ç
	SetRank(79)						-- Í·ÏÎ½µÎªÕò°ïÔªË§
	if (GetRepute() < 200) then
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng "..GetRepute().."®iÓm!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng 200®iÓm! ")
		AddRepute(-200)
	end
	AddNote("Ñîçø·ÏÁËÄãThiªn V­¬ng°ïµÄÎä¹¦£¬¶áÀ´Äã¾ªÌìÔªË§µÄÖ°Î»£¬Í¬Ê±¹«¸æÌìÏÂÄãÒÑÀë¿ªThiªn V­¬ng°ï¡£ÏÖÔÚÄã¿ÉÒÔ¼ÓÈëÉÙÁÖÅÉ. ")
	Msg2Player("Ñîçø·ÏÁËÄãThiªn V­¬ng°ïµÄÎä¹¦£¬¶áÀ´Äã¾ªÌìÔªË§µÄÖ°Î»£¬Í¬Ê±¹«¸æÌìÏÂÄãÒÑÀë¿ªThiªn V­¬ng°ï¡£ÏÖÔÚÄã¿ÉÒÔ¼ÓÈëÉÙÁÖÅÉ. ")
	Talk(1,"KickOutSelf","ThËt ®¸ng tiÕc! Ta ph¶i thu håi l¹i vâ c«ng ®· d¹y ng­¬i! Hñy bá danh x­ng K×nh Thiªn Nguyªn So¸i cña ng­¬i")
end

function defection_no()
	SetTask(7,1*256)				-- ÎªÆóÍ¼ÅÑÊ¦×÷¸ö±ê¼Ç£¬ÒÔ±¸½«À´²»Ê±Ö®Ğè
	AddNote("B¹n tõ bá ı ®Şnh gia nhËp ThiÕu L©m ph¸i. ")
	Msg2Player("B¹n tõ bá ı ®Şnh gia nhËp ThiÕu L©m ph¸i. ")
end

function return_select()
	Say("§óng vËy! Søc mét con ng­êi chØ cã h¹n, ph¶i ®oµn kÕt cïng mäi ng­êi th× míi nªn chuyÖn. Bæn bang vÉn cßn tuyÖt kü trÊn ph¸i 'Kim Chung Tr¸o', chØ truyÒn cho nh÷ng ®Ö tö trung thµnh. ThÕ nµo,cã muèn quay l¹i bæn bang kh«ng?",2,"ºÃµÄ£¬ÎÒÏë»ØThiªn V­¬ng°ï/return_yes","Kh«ng, ta chØ buét miÖng nãi vËy th«i. /return_no")
end;

function return_yes()
	Talk(2,"","RÊt tèt! Tr­íc m¾t qu©n ta ®ang giao chiÕn víi qu©n Tèng, qu©n phİ kh«ng ®ñ, ng­¬i nép 50000 l­îng th× cã thÓ trë l¹i bæn bang häc Kim Chung Tr¸o","V©ng! Xin ®Ó ®Ö tö chuÈn bŞ mét chót. ")
	SetTask(3,70*256+20)
	AddNote("ÄÃ³ö5ÍòÁ½¾ü·ÑÖ§³ÖThiªn V­¬ng°ï¾Í¿ÉÒÔ»ØÀ´ÃÅÅÉ. ")
	Msg2Player("ÄÃ³ö5ÍòÁ½¾ü·ÑÖ§³ÖThiªn V­¬ng°ï¾Í¿ÉÒÔ»ØÀ´ÃÅÅÉ. ")
end;

function return_no()
	Talk(1,"","Ta chØ lµ nh©n tiÖn ghĞ th¨m ®ång m«n th«i!")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ÓĞ50000Á½
		Talk(1,"","ºÜºÃ£¡»¶Ó­Äã»ØÀ´Thiªn V­¬ng°ï£¬ÎÒ·âÄãÎª¾ªÌìÔªË§. ")
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
--		if (HaveMagic(36) == -1) then
--			AddMagic(32)
--			AddMagic(41)
--			AddMagic(324)
--			AddMagic(36)
		add_tw(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("ÄãÑ§»áThiªn V­¬ng°ï¼¼ÄÜ£ºThiªn V­¬ngÕ½Òâ£¬Îä¹¦ÎŞĞÄÕ¶£¬ÑªÕ½°Ë·½£¬ÓùÁú¾÷. ")
--		end
		AddNote("»Øµ½Thiªn V­¬ng°ï. ")
		Msg2Faction(GetName().."»Øµ½Thiªn V­¬ng°ï£¬±»·âÎª¾ªÌìÔªË§")
	else
		Talk(2,"","H¶?H×nh nh­ vÉn ch­a ®ñ?","Xin lçi! §Ó ta kiÓm tra l¹i.")
	end
end;

---------------------- ³öÊ¦ÈÎÎñ ----------------------
function L60_get()
	Say("<color=Red>'Thiªn V­¬ngÒÅÊé<color> ¾ø¶Ô²»ÄÜÂäµ½½ğÈËÊÖÖĞ. ÄãÁ¢¿Ìµ½ <color=Red>ÇàÂİµº<color>, ÄÃµ½<color=Red>'Thiªn V­¬ngÒÅÊé<color> »ØÀ´£¡×öµÃµ½Âğ?", 2, "Thuéc h¹ tËn lùc thi hµnh /L60_get_yes", "E r»ng khã cã thÓ nhËn nhiÖm vô /no")
end;

function L60_get_yes()
	Talk(1,"","<color=Red>'Thiªn V­¬ngÒÅÊé<color>²ØÔÚÒ»¸ö<color=Red>±¦Ïä<color>, ±¦Ïä²ØÔÚ<color=Red>ÇàÂİµº±±²¿<color>, Ö®Ç°ÒªÕÒµ½<color=Red>¿ªÆô±¦ÏäµÄÔ¿³×<color>. Äã¸Ï¿ì×ø´¬È¥<color=Red>ÇàÂİµº<color>. ¼Ç×¡ÒªÇ§ÍòĞ¡ĞÄ!")
	SetTask(3, 60*256+20)
	AddNote("ÔÚThiªn V­¬ng°ïÇŞ¹¬(223, 196)¼ûÑîçø, ½ÓÊÜÈÎÎñÈ¥ÇàÂİµºÄÃ»ØThiªn V­¬ngÒÅÊé")
	Msg2Player("ÔÚThiªn V­¬ng°ïÇŞ¹¬(223, 196)¼ûÑîçø, ½ÓÊÜÈÎÎñÈ¥ÇàÂİµºÄÃ»ØThiªn V­¬ngÒÅÊé")
end;

function L60_prise()
DelItem(96)
Msg2Player("Chóc mõng b¹n ®· xuÊt s­ thµnh c«ng, b¹n ®­îc phong lµ TrÊn Bang Nguyªn So¸i! Danh väng t¨ng thªm 120 ®iÓm! ")
--AddGlobalCountNews(GetName().."ÒÕ³É³öÊ¦£¬¸æ±ğÍ¬ÃÅÊ¦µÜ¿ªÊ¼´³µ´½­ºş¡£", 1)
Msg2SubWorld("Thiªn V­¬ng"..GetName().."XuÊt s­ thµnh c«ng, c¸o biÖt D­¬ng bang chñ vµ c¸c ®ång m«n huynh ®Ö, tiÕp tôc hµnh tÈu giang hå. ")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--Íæ¼ÒÍË³öThiªn V­¬ng°ï
SetCurCamp(4)
AddNote("·µ»ØThiªn V­¬ng°ïÇŞ¹¬£¬°ÑThiªn V­¬ngÒÅÊé½»¸ø°ïÖ÷Ñîçø£¬Íê³É³öÊ¦ÈÎÎñ¡£ÉıÈÎ¾ªÌìÔªË§.. ")
end;

function no()
end
