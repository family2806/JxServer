-------------------------------------------------------------------------
-- FileName		:	messenger_turenpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:46:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄ³ö¿Ú´¦¶Ô»°npc£¬ÏôÕò
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --Ôö¼ÓÍ¬°é¾çÇéÈÎÎñÍê³ÉµÄ¿ØÖÆÅĞ¶Ï
Include("\\script\\activitysys\\g_activity.lua")			--»î¶¯±à¼­Æ÷
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")		--»î¶¯±à¼­Æ÷

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--¿ª±¦Ïä¹¤¾ßº¯Êı

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>VŞ anh hïng nµy. T×m ta cã viÖc g× kh«ng?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)

	tbDailog:AddOptEntry("Ta muèn ®i ra",messenger_main);
	
	--µ¯³ö¶Ô»°¿ò
	tbDailog:Show()
end

function messenger_main()
--	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		Describe(DescLink_XiaoZhen..":"..name..", cã ph¶i ng­¬i ®· th«ng qua kh¶o nghiÖm cña Thiªn B¶o Khè, cã cÇn ra khái ¶i kh«ng?"
			,3
			,"§óng! Ta muèn rêi khái/messenger_comeback"
			,"Ta ch­a hoµn thµnh kh¶o nghiÖm, ta muèn ®i ra mét chót/messenger_icantdo"
			,"Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")	
		
--		if ( Uworld1206 == 0 ) then
--			Describe(DescLink_XiaoZhen.."£º"..name.."£¬ÄãÊÇ²»ÊÇÒÑ¾­Í¨¹ıÁËÇ§±¦¿âµÄ¿¼Ñé£¬ĞèÒª³ö¹Ø£¿",3,"ÊÇµÄ£¬ÎÒÒª³ö¹Ø/messenger_comeback","ÎÒÃ»Íê³É¿¼Ñé£¬²»¹ıÎÒ²»Ïë¼ÌĞø×öÁË/messenger_icantdo","²»ÊÇ£¬ÎÒ»¹ÒªÔÙ´ô´ô/no")	
--		elseif ( Uworld1206 == 1 ) then
--			Describe(DescLink_XiaoZhen.."£ºÄ¾ÅÆĞÅÊ¹"..name.."£¬ÄúÊÇ²»ÊÇÒÑ¾­Í¨¹ıÁËÇ§±¦¿âµÄ¿¼Ñé£¬ĞèÒª³ö¹Ø£¿",3,"ÊÇµÄ£¬ÎÒÒª³ö¹Ø/messenger_comeback","ÎÒÃ»Íê³É¿¼Ñé£¬²»¹ıÎÒ²»Ïë¼ÌĞø×öÁË/messenger_icantdo","²»ÊÇ£¬ÎÒ»¹ÒªÔÙ´ô´ô/no")
--		elseif ( Uworld1206 == 2 ) then
--			Describe(DescLink_XiaoZhen.."£ºÍ­ÅÆĞÅÊ¹"..name.."´óÈË£¡ÄúÊÇ²»ÊÇÒÑ¾­Í¨¹ıÁËÇ§±¦¿âµÄ¿¼Ñé£¬ĞèÒª³ö¹Ø£¿",3,"ÊÇµÄ£¬ÎÒÒª³ö¹Ø/messenger_comeback","ÎÒÃ»Íê³É¿¼Ñé£¬²»¹ıÎÒ²»Ïë¼ÌĞø×öÁË/messenger_icantdo","²»ÊÇ£¬ÎÒ»¹ÒªÔÙ´ô´ô/no")
--		elseif ( Uworld1206 == 3 ) then
--			Describe(DescLink_XiaoZhen.."£ºÒøÅÆĞÅÊ¹"..name.."´óÈË£¡ĞÁ¿àÄúÀ­£¡ÄãÊÇ²»ÊÇÒÑ¾­Í¨¹ıÁËÇ§±¦¿âµÄ¿¼Ñé£¬ĞèÒª³ö¹Ø£¿",3,"ÊÇµÄ£¬ÎÒÒª³ö¹Ø/messenger_comeback","ÎÒÃ»Íê³É¿¼Ñé£¬²»¹ıÎÒ²»Ïë¼ÌĞø×öÁË/messenger_icantdo","²»ÊÇ£¬ÎÒ»¹ÒªÔÙ´ô´ô/no")
--		elseif ( Uworld1206 == 4 ) then
--			Describe(DescLink_XiaoZhen.."£º½ğÅÆĞÅÊ¹"..name.."´óÈË£¡ÕâÃ´´óÀÏÔ¶µÄ¸Ï¹ıÀ´ÕæÊÇÀÍÄú·ÑĞÄÁË£¬ÄúÏÖÔÚÊÇ²»ÊÇÒÑ¾­Í¨¹ıÁËÇ§±¦¿âµÄ¿¼Ñé£¬ĞèÒª³ö¹Ø£¿",3,"ÊÇµÄ£¬ÎÒÒª³ö¹Ø/messenger_comeback","ÎÒÃ»Íê³É¿¼Ñé£¬²»¹ıÎÒ²»Ïë¼ÌĞø×öÁË/messenger_icantdo","²»ÊÇ£¬ÎÒ»¹ÒªÔÙ´ô´ô/no")
--		elseif ( Uworld1206 == 5 ) then
--			Describe(DescLink_XiaoZhen.."£ºÓù´Í½ğÅÆĞÅÊ¹"..name.."´óÈË£¡ÎÒ»¹´ÓÀ´Ã»¿´µ½¹ıÓù´Í½ğÅÆÄØ£¬½ñÌìËã¿ªÁËÑÛÁË£¡ÄúÕæÀ÷º¦¡£ÄúÊÇ²»ÊÇÒÑ¾­Í¨¹ıÁËÇ§±¦¿âµÄ¿¼Ñé£¬ĞèÒª³ö¹Ø£¿",3,"ÊÇµÄ£¬ÎÒÒª³ö¹Ø/messenger_comeback","ÎÒÃ»Íê³É¿¼Ñé£¬²»¹ıÎÒ²»Ïë¼ÌĞø×öÁË/messenger_icantdo","²»ÊÇ£¬ÎÒ»¹ÒªÔÙ´ô´ô/no")
--		end
	end
end

function messenger_comeback()
	if check_task_state()==30 then
--		nt_setTask(1203,30)  --Ç§±¦¿âÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎªÈÎÎñÍê³É×´Ì¬
--		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
--		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
--		local nRealjifen = 0;
--		if ( Uworld1214 ~= 0 ) then
--			--¸ù¾İ¾È³öµÄÈËÊı¸øÓè¶ÔÓ¦½±Àø
--			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
--				AddOwnExp(50000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*16;
--				nt_setTask(1205,Uworld1214*16+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
--				AddOwnExp(100000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*18;
--				nt_setTask(1205,Uworld1214*18+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
--				AddOwnExp(150000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*24;
--				nt_setTask(1205,Uworld1214*24+Uworld1205)		
--			end				 
--			nt_setTask(1214,0)
--		end
--		local nBeishu = greatnight_huang_event(2);--by Ğ¡É½
--		if (nBeishu > 0) then--by Ğ¡É½
--			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Ğ¡É½
--		end;
--		tongaward_message(nRealjifen);	--by Ğ¡É½
		
		nt_setTask(1203,30)

		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
--		taskProcess_002_08:doTaskEntity()
		SetDeathScript("");
		
--		local n_level = GetLevel();
--		G_ACTIVITY:OnMessage("FinishMail", 3, n_level);
		
		SetPos(1414,3197);
	else
		Describe(DescLink_XiaoZhen..": Xin l­îng thø, hiÖn t¹i ng­¬i vÉn ch­a hoµn thµnh môc tiªu cöa ¶i, ë trong b¶n ®å Thiªn B¶o Khè ng­¬i ph¶i dùa theo thø tù nhiÖm vô më ra 5 B¶o R­¬ng míi ®­îc xem lµ qua ¶i.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function messenger_icantdo()
	if nt_getTask(1203) ==25 then
		Talk(1, "", "NhiÖm vô cña ng­¬i ®· hoµn thµnh, hay lµ ta trùc tiÕp tiÔn ng­¬i ra khái ¶i nhĞ.")
		messenger_comeback()
	else
		Describe(DescLink_XiaoZhen..": Ng­¬i quyÕt ®Şnh rêi khái ­, nhiÖm vô ch­a hoµn thµnh ng­¬i vÉn cã thÓ quay l¹i bÊt cø lóc nµo!",2,"§óng! Ta muèn rêi khái/q_fallmessengertask","§Ó ta nghÜ l¹i xem sao/no")
	end
end

function q_fallmessengertask()
--	local Uworld1207 = nt_getTask(1207)  --ĞÅÊ¹ÈÎÎñµ±Ç°É±¹Ö¼ÇÊıÆ÷
--	local Uworld1204 = nt_getTask(1204)  --ËÍĞÅÈÎÎñËùµ½µØµãÈÎÎñ±äÁ¿
--	local Uworld1214 = nt_getTask(1214)  --»ñ¾ÈÉÙÅ®¾çÇé
--	local name = GetName()
--	
--		nt_setTask(1203,25)  --Ç§±¦¿âÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎª¼òµ¥ÈÎÎñÍê³É×´Ì¬
--		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
--		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
--		local nRealjifen = 0;
--		if ( Uworld1214 ~= 0 ) then
--			--¸ù¾İ¾È³öµÄÈËÊı¸øÓè¶ÔÓ¦½±Àø
--			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
--				AddOwnExp(50000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*16;
--				nt_setTask(1205,Uworld1214*16+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
--				AddOwnExp(100000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*18;
--				nt_setTask(1205,Uworld1214*18+Uworld1205)
--			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
--				AddOwnExp(150000*Uworld1214)
--				local Uworld1205 = nt_getTask(1205)
--				nRealjifen = Uworld1214*24;
--				nt_setTask(1205,Uworld1214*24+Uworld1205)		
--			end				 
--			nt_setTask(1214,0)
--		end
--		local nBeishu = greatnight_huang_event(2);--by Ğ¡É½
--		if (nBeishu > 0) then--by Ğ¡É½
--			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Ğ¡É½
--		end;
--		tongaward_message(nRealjifen);	--by Ğ¡É½

--		nt_setTask(1203,25)  --Ç§±¦¿âÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎª¼òµ¥ÈÎÎñÍê³É×´Ì¬

		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		nt_setTask(1203,21)--ÔİÊ±ÖĞ¶ÏÈÎÎñ
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1414,3197);
end

function no()
end
