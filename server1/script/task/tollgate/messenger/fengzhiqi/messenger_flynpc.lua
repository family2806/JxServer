-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ³ö¿Ú´¦¶Ô»°npc£¬·çÖ®Æï½«°×Òí
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --Ôö¼ÓÍ¬°é¾çÇéÈÎÎñÍê³ÉµÄ¿ØÖÆÅĞ¶Ï
Include("\\script\\activitysys\\g_activity.lua")			--»î¶¯±à¼­Æ÷
Include("\\script\\activitysys\\playerfunlib.lua")		--»î¶¯±à¼­Æ÷

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	
	if ( messenger_middletime() == 10  ) then
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_BaiYi..":"..name..", Kh«ng ph¶i b¹n ®· v­ît qua thö th¸ch cña Phong Kú sao? Muèn xuÊt quan µ?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_BaiYi..": Tİn Sø LÖnh - Méc"..name..", Kh«ng ph¶i b¹n ®· v­ît qua thö th¸ch cña Phong Kú sao? Muèn xuÊt quan µ?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_BaiYi..": Tİn sø lÖnh - §ång"..name.."§¹i nh©n! Cã ph¶i ng­êi ®· v­ît qua thö th¸ch cña Phong Kú sao? Muèn xuÊt quan µ?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_BaiYi..": Tİn sø lÖnh - B¹c"..name.."§¹i nh©n! Cã ph¶i ng­êi ®· v­ît qua thö th¸ch cña Phong Kú sao? Muèn xuÊt quan µ?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_BaiYi..": Tİn sø lÖnh - Vµng"..name.."§¹i nh©n! Cã ph¶i ng­êi ®· v­ît qua thö th¸ch cña Phong Kú sao? Muèn xuÊt quan µ?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_BaiYi..": Ngù Tø lÖnh bµi - Vµng"..name.."§¹i nh©n! Ta ch­a thÊy qua Ngù Tø Kim bµi, h«m nay coi nh­ ®­îc më mang tÇm nh×n! ¤ng thËt lîi h¹i!  Ng­êi ®· v­ît qua thö th¸ch cña Phong Kú, muèn xuÊt quan ­?",3,"§óng! Ta muèn rêi khái/messenger_comeback","Ta ch­a hoµn thµnh kh¶o nghiÖm, nh­ng kh«ng muèn tiÕp tôc lµm n÷a/messenger_icantdo","Kh«ng ph¶i! Ta cßn muèn thö tiÕp/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --·çÖ®ÆïÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎªÈÎÎñÍê³É×´Ì¬
		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
		nt_setTask(1214,0)  --¶¨µã´ò¹Ö¿ª¹Ø
		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		nt_setTask(1211,0)	
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_06:doTaskEntity()  --Í¬°é¾çÇéÈÎÎñ
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..":Xin lçi!  B¹n ch­a qua ¶i, trong b¶n ®å Phong Kú İt nhÊt b¹n ph¶i x¸c ®Şnh İt nhÊt <color=red>5 täa ®é<color> míi cã thÓ qua ¶i.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_BaiYi..": Cã ph¶i b¹n muèn rêi khái, nÕu ch­a hoµn thµnh nhiÖm vô mµ rêi khái, b¹n còng cã thÓ ®Õn DŞch Quan giao tr¶ nhiÖm vô vµ nhËn phÇn th­ëng nh­ng phÇn th­ëng sÏ gi¶m xuèng rÊt nhiÒu.",2,"§óng! Ta muèn rêi khái/f_fallmessengertask","§Ó ta nghÜ l¹i xem sao/no")

end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --·çÖ®ÆïÈÎÎñµÄÈÎÎñ±äÁ¿ÉèÖÃÎª¼òµ¥ÈÎÎñÍê³É×´Ì¬
		nt_setTask(1213,0)  --Ë«±¶¾­ÑéÊ±¼ä
		nt_setTask(1214,0)  --¶¨µã´ò¹Ö¿ª¹Ø
		nt_setTask(1215,0)  --bossË¢¹Ö¿ª¹Ø
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
