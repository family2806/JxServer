-- ThiÕu L©mÂ·ÈËNPC ·½ÕÉĞşÒò 10¼¶ÈÎÎñ¡¢40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-01)
-- Update£ºDan_Deng(2003-10-27)ÖØĞ´ÖØ·µÊ¦ÃÅÈÎÎñ£¬²¢ÖØĞÂÕûÀí½Å±¾

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if (vt06_isactive() ~= 0) then
		Say("T×m ta cã viÖc g×?", 2, "Muèn thØnh gi¸o ®¹i s­!/oldentence", "Mõng lÔ ¢n S­, t¹i h¹ ®· t×m ®ñ “ThÎ ¢n S­” vµ “ThÎ Cao §å”./vt06_prizeenterr");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)

	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc> gÇn ®©y ta cã rÊt nhiÒu viÖc cÇn gi¶i quyÕt, ng­¬i tíi ®©y cã viÖc g×?"
	G_TASK:OnMessage("ThiÕu L©m", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 0) then
		tbDailog:AddOptEntry("Häc kü n¨ng 120", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", oldentence)
	tbDailog:Show() 
end

function oldentence()

	local UTask_sl = GetTask(7)
	local nFactID = GetLastFactionNumber();
	
	if (UTask_sl == 70*256) and (GetFaction() == "shaolin") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("Ph¸t hiÖn lçi hÖ thèng, ®· kŞp thêi phôc håi!",0)
		return
	elseif (UTask_sl == 70*256) and (GetTask(3) >= 5*256) and (GetTask(3) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(3,0)
		Say("Ph¸t hiÖn lçi hÖ thèng, ®· kŞp thêi phôc håi!",0)
		return
	elseif (UTask_sl == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(7,70*256)
		Say("Ph¸t hiÖn lçi hÖ thèng, ®· kŞp thêi phôc håi!",0)
		return
	elseif (GetTask(3) == 70*256) and (GetTask(7) == 70*256) then			-- ×ªÃÅÅÉ´íÎóĞŞÕı
		SetTask(3,75*256)
		Say("Ph¸t hiÖn lçi hÖ thèng, ®· kŞp thêi phôc håi!",0)
		return
	elseif (UTask_sl == 80*256 and nFactID == 0 and GetCamp() == 1 and GetFaction() == "Vµo ®Êu tr­êng") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("shaolin");
			Say("Ph¸t hiÖn lçi hÖ thèng, ®· kŞp thêi phôc håi!",0)
			return
		end
	elseif (UTask_sl == 70*256 and nFactID == 0 and GetCamp() ~= 4 and GetFaction() == "Vµo ®Êu tr­êng") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("Ph¸t hiÖn lçi hÖ thèng, ®· kŞp thêi phôc håi!",0)
			return
		end
	end
	
	local tbDes = {"NghÖ thuËt Toushi/#daiyitoushi_main(0)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("×î½üÎÒÓĞºÜ¶àÊÂÒª½â¾ö£¬T×m ta cã viÖc g×?", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_sl = GetTask(7)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),7) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","¶À¹ÂÃËÖ÷ÓĞ´Ëºê²Å´óÂÔ£¬ÀÏñÄÒ»¶¨Ìı´Ó£¬Ö»ÊÇ±¾ËÂÔÚ½ğÈËÊÖÀï£¬ÀÏñÄ²»ÄÜ²»µÃ²»¿¼ÂÇÖÚµÜ×ÓµÄĞÔÃü£¬²»¸ÒÃ°È»ĞĞÊÂ¡£Âé·³Äã»ØÈ¥ºÍ¶À¹ÂÃËÖ÷ËµÀÏñÄ°ï²»ÁË")
		Uworld40 = SetBit(GetTask(40),7,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 10*256+10) and (HaveItem(26) == 1) then
			L10_prise()
		elseif ((UTask_sl == 10*256) and (GetLevel() >= 10)) then		--10¼¶ÈÎÎñÆô¶¯
			Say("°¢ÃÖÍÓ·ğ£¡ËùÓĞĞÂÈëÃÅµÄµÜ×Ó£¬¶¼ĞèÒª½ÓÊÜ¿¼ºË¡£Äã×¼±¸ºÃÁËÂğ?",2,"ÎÒÒÑ×¼±¸ºÃ!/L10_get_yes","ÎÒÃ»ÓĞ×°±¸ºÃ!/L10_get_no")
		elseif (UTask_sl == 40*256+50) then		-- 40¼¶ÈÎÎñ½øĞĞÖĞ
			SetTaskTemp(43,0)		-- ÁÙÊ±±äÁ¿43,¼ÆÊı»Ø´ğÕıÈ·µÄ»°
			Talk(1,"L40_sele3_1","Á½Î»Ê¦Êå×æÒªµÜ×Ó´ø5¾ä»°¸øÕÆÃÅ£¬ËµÁ½ÈËµÄĞÄÒâ¾ÍÔÚ5¾ä»°ÀïÃæ:")
		elseif ((UTask_sl == 40*256) and (GetLevel() >= 40)) then		--40¼¶ÈÎÎñÆô¶¯
			Say("±¾ÃÅÊ¦Êå×æ¼ÅÃğ¶şÉ®£¬Îä¹¦ÒÑ´ïµ½ÁËÉî²»¿É²âµÄµØ²½£¬µ«ÊÇ¶şÀÏµ±ÄêÎªÁË±Ü¿ª±¾ÅÉµÄÒ»³¡ÃÅ»§Ö®Õù£¬Ò»Ö±×¡ÔÚºóÉ½µÄÃÜÊÒÀï±Õ¹Ø²»³ö£¬Èç½ñÌìÏÂ·×ÂÒ£¬ÖĞÔ­ÎäÁÖá§á§¿ÉÎ££¬ÎªÊ¦ÏëÏò¼ÅÃğ¶şÉ®Çë½ÌÌìÏÂ¾ÖÊÆ£¬ÄãÔ¸ÒâÈ¥ÇëËûÃÇ¶şÀÏ³ö¹ØÂğ?",2,"Í¬Òâ/L40_get_yes","µÜ×ÓÄÜÁ¦ÓĞÏŞ£¬¿ÖÅÂ²»ÄÜÊ¤ÈÎ/no")
		elseif (UTask_sl == 80*256) or (UTask_sl == 80) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë£¬ÒÔ¼°¼¼ÄÜµ÷Õû¼ì²éÅĞ¶Ï
			check_skill()
		else
			Talk(1,"","ºÃ£¬ºÃ¡£¼ÓÓÍ£¡·ğ×æ»á±£ÓÓ®ã.")
		end
--	elseif (UTask_sl == 5*256+20) then			-- ×ªÃÅÅÉÍê³É
--		Talk(1,"defection_complete","ĞşÒò·½ÕÉ£º°¢ÃÖÍÓ·ğ£¬¼ÈÈë¿ÕÃÅ£¬¾ÍºÃºÃÊÕÊ°ĞÄÇé×êÑĞ²Ø¾­¸óÄÚµä¼®£¬²»ÒªÔÙÈ¥¹ÒÂÇÕ½³¡ØËÉ±£¬¹úºŞ¼Ò³ğÁË¡£")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_sl == 70*256) and ((GetTask(3) < 5*256) or (GetTask(3) == 75*256)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(1,"return_sele","Ê¦¸µ£¬µÜ×Ó¿ÉÒÔ½è²Ø¾­¸óÀïµÄ¾­µäÂğ?")
	elseif (GetCamp() == 4) and ((UTask_sl == 70*256+10) or (UTask_sl == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("5 ÍòÁ½×¼±¸ºÃÁËÃ»ÓĞ?",2,"ÒÑ×¼±¸ºÃÁË/return_complete","»¹Ã»×¼±¸ºÃ/return_uncompleted")
--	elseif (GetTask(3) == 70*256+10) and (HaveMagic(21) >= 0) then		-- ÉÙÁÖÅÉÖØ·µÃÅÅÉ£¬ÊÕ»Ø½ğÖÓÕÖ
--		Say("ĞşÒò·½ÕÉ£ºÌìÍõ°ïÓë½ğ±øÕ½»ğÕıº¨£¬ÄãÈôÍ¶ÈëÌìÍõ°ï£¬¿Ö½ğ±øÒÔ´ËÏò±¾ËÂÆôĞÆ¡£",2,"ÎªÃâÊ¦¸¸·³ÄÕ£¬ÇëÊÕ»ØµÜ×ÓÃûºÅ/defection_yes","µÜ×Ó¿¼ÂÇÎ´ÖÜ£¬ÇëÊ¦¸¸Ô­ÁÂ/no")
	else							-- ³£¹æ¶Ô»°
		Talk(1,"","¶ÔÓÚÉÙÁÖÉ®ÈËÀ´Ëµ£¬¹¤·òÊÇĞŞÁ¶£¬Á·¹¦µÄÄ¿µÄÊÇÏë¸Ä±äÈËµÄËØÖÊ£¬ÉÙÁÖÉ®ÈËÕıÊÇÎªÁËĞŞÁ¶.")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
--	if (HaveMagic(273) == -1) then
--		AddMagic(273)					-- ÈçÀ´Ç§Ò¶ÊÖ
--		Msg2Player("ÄãÑ§»áÁË¡°ÈçÀ´Ç§Ò¶ÊÖ¡±")
--		Say("ĞşÒò·½ÕÉ£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬ĞÂ´´ÁËÒ»ÕĞ¡°ÈçÀ´Ç§Ò¶ÊÖ¡±£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	else
		Say("ÄãÒÑ³ÉÎª½­ºşÖĞÈËÁË£¬Èç¹ûÏëÏÂÉ½¾ÍÏÂÈ¥°É!",2,"¶àĞ»·½ÕÉ¶÷×¼ /goff_yes","µÜ×Ó²»¸ÒÂÒÀ´/no")
--	end
end
--------------------- ×ªÃÅÅÉÏà¹Ø ------------------------
function defection_complete()
	Msg2Player("»¶Ó­Äã¼ÓÈëÉÙÁÖÅÉ£¬±ä³ÉÔìµØÉ®. ")
	SetRevPos(103,51)		  			--ÉèÖÃÖØÉúµã
	SetTask(7,10*256)					-- ÈëÃÅ
	SetFaction("shaolin")       	--Íæ¼Ò¼ÓÈëÃÅÅÉ
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	AddMagic(10)
	Msg2Player("Ñ§µ½½ğ¸Õ·üÄ§. ")
	AddNote("¼ÓÈëÉÙÁÖÅÉ£¬³ÉÎªÔìµØÉ®£¬Ñ§µ½½ğ¸Õ·üÄ§. ")
	Msg2Faction("shaolin",GetName().." ÌìÍõµÜ×Ó¼ÓÈëÉÙÁÖÅÉ£¬±¾ÅÉÁ¦Á¿ÔöÇ¿ÁË!",GetName())
end

---------------------- ÖØ·µÃÅÅÉÏà¹Ø --------------------------
function goff_yes()
	Talk(1,"","È¥°É£¬¼ÇµÃÏÂÉ½ºó»¹Òª¼áÊØ´È±¯ĞÄ.")
	SetTask(7,70*256)
	AddNote("Àë¿ªÉÙÁÖËÂ£¬ÏÂÉ½¼ÌĞøĞĞ×ß½­ºş")
	Msg2Player("Àë¿ªÉÙÁÖËÂ£¬ÏÂÉ½¼ÌĞøĞĞ×ß½­ºş")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("³öÊ¦Íê¾Í²»ÊÇÉÙÁËµÜ×ÓÁË£¬µ±ÈÕÊÇ²»ÄÜÁË£¬µ«ÊÇ£¬Èç¹û²Î¿¼·ğÀí£¬ÉÙÁÖ×ÜÊÇ»á½ÓÄÉÖØ·µÃÅÅÉµÄÈË.",2,"ÎÒÏë·µ»ØThiÕu L©m/return_yes","²»ĞèÒª/no")
end;

function return_yes()
	Talk(1,"","·ğÏñ¾Ã²»Î¬ĞŞ£¬ËùÒÔ£¬ÓĞµãËğ»µ£¬Èç¹ûÄã¸ø±¾ËÂ»¯Ôµ50000Á½¾ÍÄÜÖØ·µÉÙÁÖ.")
	SetTask(7,70*256+20)
	AddNote("½»50000Á½¾ÍÄÜÖØ·µÉÙÁÖ")
	Msg2Player("½»50000Á½¾ÍÄÜÖØ·µÉÙÁÖ")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ÓĞ50000Á½
		Talk(1,"","ºÜºÃ£¬¸ù¾İÄã¶Ô±¾ËÂµÄ¹±Ï×£¬ÉıÎª»¤·¨³¤ÀÏ.")
		Pay(50000)
		SetTask(7,80*256)
		SetFaction("shaolin")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(72)
--		if (HaveMagic(273) == -1) then
--			AddMagic(273)
--			AddMagic(21)
		add_sl(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("ÄãÑ§µ½ÉÙÁÖÅÉ¾øÑ§ÈçÀ´ÌìÒ¶£¬Ò×½î¾­. ")
--		end
		AddNote("ÒÑ·µ»ØÉÙÁÖÅÉ. ")
		Msg2Faction(GetName().." ÒÑ·µ»ØÉÙÁÖÅÉ£¬±»·âÎª»¤·¨³¤ÀÏ")
	else
		Talk(1,"","°¢ÃÖÍÓ·ğ£¬ºÃÏñ²»¹»ÎåÍòÁ½.")
	end
end;

------------------------- ÃÅÅÉÈÎÎñÏà¹Ø --------------------------------
function L10_get_yes()
	Talk(1, "", "Ö»ÒªÄãË³ÀûÔÚÄ¾ÈËÏïÄÃµ½½ğÁ«»¨¾ÍÄÜÍ¨¹ı¿¼Ñé")
	DelItem(26)
	SetTask(7,10*256+10)
	AddNote("½ÓÉÙÁÖÅÉÌôÕ½£¬ÔÚÄ¾ÈËÏïÄÃµ½½ğÁ«»¨. ")
	Msg2Player("½ÓÉÙÁÖÅÉÌôÕ½£¬ÔÚÄ¾ÈËÏïÄÃµ½½ğÁ«»¨. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","ºÜºÃ£¬ÄãÉıÎª»¤ÔºÎäÉ®.")
	DelItem(26)
	SetTask(7,20*256)
	SetRank(2)
--	AddMagic(8)
--	AddMagic(4)
--	AddMagic(6)
	add_sl(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("ÄÃµ½½ğÁ«»¨£¬»ØÈ¥¼ûĞşÒò·½ÕÉ£¬Íê³ÉÉÙÁÖÅÉ¿¼Ñé£¬ÉıÎª»¤ÔºÎäÉ®. ")
	Msg2Player("¹§Ï²ÄãÉıÎª»¤ÔºÎäÉ®£¬Ñ§µ½ÉÙÁÖÈ­·¨£¬ÉÙÁÖ¹÷·¨£¬ÉÙÁÖµ¶·¨. ")
end;

function L40_get_yes()
	SetTask(7,40*256+10)
	AddNote("½ÓĞşÒò·½ÕÉÖ®Áî£¬È¥Çë¼ÅÃğ¶şÉ®³ö¹Ø. ")
	Msg2Player("½ÓĞşÒò·½ÕÉÖ®Áî£¬È¥Çë¼ÅÃğ¶şÉ®³ö¹Ø. ")
end;

function L40_sele3_1()
	Say("µÚÒ»¾äÊÇ",5,"ÉúËÀ±äÒì£¬ĞéÎ±ÎŞÖ÷/L40_sele3_2","ËÄ´ó¿à¿Õ£¬ÎåÒõÎŞÎÒ/L40_sele3_2","ÈçÊÇ¹Û²ì£¬½¥ÀëÉúËÀ/L40_sele3_2","ÊÀ¼äÎŞ³£,¹úÍÁÎ£´à/L40_sele3_correct1","ĞÄÊÇ¶ñÔ´,ĞÎÎª×ïŞ´/L40_sele3_2")
end;

function L40_sele3_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_2()
end;

function L40_sele3_2()
	Say("µÚ¶ş¾äÊÇ",5,"ÊÀ¼äÎŞ³£,¹úÍÁÎ£´à /L40_sele3_3","ËÄ´ó¿à¿Õ£¬ÎåÒõÎŞÎÒ /L40_sele3_correct2","ÉúËÀ±äÒì£¬ĞéÎ±ÎŞÖ÷ /L40_sele3_3","ÈçÊÇ¹Û²ì£¬½¥ÀëÉúËÀ /L40_sele3_3","ĞÄÊÇ¶ñÔ´,ĞÎÎª×ïŞ´ /L40_sele3_3")
end;

function L40_sele3_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_3()
end;

function L40_sele3_3()
	Say("µÚÈı¾äÊÇ ",5,"ĞÄÊÇ¶ñÔ´,ĞÎÎª×ïŞ´ /L40_sele3_4","ÈçÊÇ¹Û²ì£¬½¥ÀëÉúËÀ/L40_sele3_4","ËÄ´ó¿à¿Õ£¬ÎåÒõÎŞÎÒ/L40_sele3_4","ÊÀ¼äÎŞ³£,¹úÍÁÎ£´à /L40_sele3_4","ÉúËÀ±äÒì£¬ĞéÎ±ÎŞÖ÷/L40_sele3_correct3")
end;

function L40_sele3_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_4()
end;

function L40_sele3_4()
	Say("µÚËÄ¾äÊÇ",5,"ÈçÊÇ¹Û²ì£¬½¥ÀëÉúËÀ/L40_sele3_5","ĞÄÊÇ¶ñÔ´,ĞÎÎª×ïŞ´ /L40_sele3_correct4","ÊÀ¼äÎŞ³£,¹úÍÁÎ£´à /L40_sele3_5","ÉúËÀ±äÒì£¬ĞéÎ±ÎŞÖ÷/L40_sele3_5","ËÄ´ó¿à¿Õ£¬ÎåÒõÎŞÎÒ/L40_sele3_5")
end;

function L40_sele3_correct4()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_5()
end;

function L40_sele3_5()
	Say("µÚÎå¾äÊÇ ",5,"ËÄ´ó¿à¿Õ£¬ÎåÒõÎŞÎÒ/L40_sele3_result","ÉúËÀ±äÒì£¬ĞéÎ±ÎŞÖ÷/L40_sele3_result","ÈçÊÇ¹Û²ì£¬½¥ÀëÉúËÀ/L40_sele3_correct5","ĞÄÊÇ¶ñÔ´,ĞÎÎª×ïŞ´ /L40_sele3_result","ÉúËÀ±äÒì£¬ĞéÎ±ÎŞÖ÷/L40_sele3_result")
end;

function L40_sele3_correct5()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬È«¶Ô·½¿É½øÈë
	L40_sele3_result()
end;

function L40_sele3_result()
	if (GetTaskTemp(43) == 5) then		-- Îå¾äÈ«¶Ô
		Talk(1,"","Õâ¸öÈÎÎñÄãÍê³ÉºÜºÃ£¬ÎªÊ¦¸øÄãÉıÎª40¼¶£¬²»ÒªÈÃÎÒÊ§Íû")
		SetTask(7,50*256)
		SetRank(5)
--		AddMagic(20)
		add_sl(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		AddNote("ÄÃµ½¼ÅÃğ¶şÉ®µÄÖ¸½Ì£¬Íê³ÉÈÎÎñ£¬ÉıÎª´«¾­ÂŞºº. ")
		Msg2Player("¹§Ï²ÄãÉıÎªÉÙÁÖ´«¾­ÂŞºº£¬Ñ§µ½Ê¨×ÓºğÎä¹¦. ")
	else
		Talk(1,"","ÕâÎå¾äÊÇÔõÃ´»ØÊÂ£¬ÊÇ²»ÊÇÄã¶Á·´ÁË?")
	end
	SetTaskTemp(43,0)			-- ÓÃÍêºóÊÍ·Å±äÁ¿
end;

function no()
end
