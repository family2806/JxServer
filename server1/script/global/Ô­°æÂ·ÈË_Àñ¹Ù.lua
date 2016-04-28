
---------------------------------------------------------------------------------
--  ÑÏÖØÉùÃ÷£º´ËÎÄ¼ş²»³é×Ö·û´®
---------------------------------------------------------------------------------

-- Àñ¹Ù½Å±¾
-- Li_Xin 2004-8-17
--Include( "\\script\\global\\ÖĞÇï»î¶¯.lua" )

--TASKID_HOLIDAY_GIFT_DATE = 160;				-- ÈÎÎñ±äÁ¿ID of Íæ¼Ò×îºóÒ»´ÎÁìÈ¡½ÚÈÕÀñÎïÊ±¼ä
--TASKTMPID_HOLIDAY_GIFT_DATE = 160;			-- ÁÙÊ±ÈÎÎñ±äÁ¿ID of Íæ¼Ò×îºóÒ»´ÎÁìÈ¡½ÚÈÕÀñÎïÊ±¼ä
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")	-- Ö÷³Ç½±Àø
Include("\\script\\event\\superplayeract2007\\event.lua")----³¬¼¶Íæ¼Ò»î¶¯
Include("\\script\\event\\great_night\\event.lua")	-- Huy hoµng chi ®ªm 
Include("\\script\\misc\\ex_goldequp_coin.lua");	-- ¶Ò»»»Æ½ğ×°±¸½ğÅÆ
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua");
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\Npc.lua") -- Á¶½ğ»î¶¯


-- Ô½ÄÏ0904½â·Å»î¶¯
--Include("\\script\\event\\jiefang_jieri\\200904\\zhanshenzhujiu\\jiu_hecheng.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\jinnangshijian\\jinnangshijian.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

Include("\\script\\event\\guoqing_jieri\\200908\\compose.lua")
Include("\\script\\event\\other\\jilixinwanjia\\200908\\npcdailog.lua")

-- Ô½ÄÏ0905ÉúÈÕ»î¶¯
--Include("\\script\\event\\birthday_jieri\\200905\\npc\\npc_liguan_dailog.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_npc.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\activitysys\\npcfunlib.lua")

Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
Include("\\script\\vonghoa\\exchangitem\\exchangeitem.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua");--20100908 haint code function trao giai thdnb
Include("\\script\\baoruongthanbi\\dialogmain.lua")
Include("\\script\\vlkh\\vlkh1.lua")

--tinhpn 20101022: Event Thang 10
Include("\\script\\vng_event\\201010\\head.lua")
Include("\\script\\vng_event\\compensate.lua")
Include("\\script\\vng_event\\traogiai\\vldnb2010\\vlbnb.lua")

--[DinhHQ]
	--[20110107]:trao giai Phuong Anh Hao thang 12 2010
	Include("\\script\\vng_event\\traogiai\\pah_12_2010\\head.lua")
	--[20110124]:Vip account 2011
	Include("\\script\\vng_event\\vip_account_2011\\npc\\lequan.lua")
	--[20110216]:THDNB8
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_thdnb8_award.lua")
	--[20110225]: 8/3/2011
	Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\lequan.lua")
	--[20110311]: NPAH thang 02 2011
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_npah0211.lua")
	
	Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_main.lua")

function main()
	

	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
--[DinhHQ]
	--[20110107]:Áì½±·½Ó¢ºÀ½±Àø
	--	tbPAH122010_Head:addDialog(tbDailog)
	--[20110124]:Vip account 2011
	tbVNG_VipAcc2011_LeQuan:addDialog(tbDailog)
	--[20110216]:THDNB8
	tbVNG_THDNB8:AddDialog(tbDailog)
	--[20110225]: 8/3/2011
	tbVNGWD2011_LeQuan:AddDialog(tbDailog)
	--[20110311]: NPAH thang 02 2011
	tbVNG_NPAH0211:AddDialog(tbDailog)
	--½»¹â»·VLMC2011 - Modified by DinhHQ - 20110523
	tbVLMC2011_Tittle:AddDialog(tbDailog)
	tbVngToolAward:AddDialog(tbDailog)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--µ¯³ö¶Ô»°¿ò
	tbDailog:AddOptEntry("Huy hoµng chi ®ªm ", onGreat_Night)
--	tbDailog:AddOptEntry("Tham gia thÇn bİ b¶o r­¬ng ho¹t ®éng ", BRTB_Dialog_main)
--	tbDailog:AddOptEntry("DÉn vâ l©m ®Ö nhÊt bang chung kÕt t­ëng ", GetBonusVLDNB2010_main)
--	tbDailog:AddOptEntry("NhËn lÊy ®ång tiÒn ", Compensate_main)
--	if (VH_ActiveDay()==1) then
--		tbDailog:AddOptEntry("Ta ®Ó ®æi 8 th¸ng ®İch event vËt phÈm ", ExChangeItem_main)
--	end
	tbDailog:AddOptEntry("Khai Pass r­¬ng ", ResetBox.ShowDialog, {ResetBox})
	
	--tinhpn 20101022: Event Thang 10
--	if (Event201010:IsActive() == 1) then
--		tbDailog:AddOptEntry("§æi 10 th¸ng ®İch ho¹t ®éng phÇn th­ëng ", Event201010.ShowDialog, {Event201010}) 	
--	end
	
	if IsIPBonus() then
		tbDailog:AddOptEntry("C¬ khİ sö dông CSM trî gióp ", IpBonus)
	end
	
	--tinhpn 20100817: Online Award
--	if (OnlineAward_StartDate() ~= 0 and OnlineAward_Check_TransferLife() ~= 0) then
--		tbDailog:AddOptEntry("Tham gia online dÉn t­ëng ", OnlineAward); 
--	end
	
	local ncity = gb_GetTask("MAINCITYCFG", 1);
	local nCurMapID = SubWorldIdx2ID(SubWorld);
	if (ncity >= 1 and ncity <= 7 and nCurMapID == TB_MAINCITY_CITYWAR_T[ncity][2]) then
		tbDailog:AddOptEntry("NhËn lÊy Th¸i thó phÇn th­ëng ", maincity_award_entry)	
	end
	if tbJILIWanJia0908:IsActDate() then
		tbDailog:AddOptEntry("Kİch tay míi ho¹t ®éng ", tbJILIWanJia0908.DailogMain, {tbJILIWanJia0908} )
	end
		
		
	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("ChiÕn sÜ dïng/uèng ®¹o cô ", FreedomEvent2010.LiGuanEventItemDlg, {FreedomEvent2010}) 	
	end
	
	if tbRefiningIron:CheckCondition() == 1 then
		tbDailog:AddOptEntry("RÌn luyÖn thiÕt ho¹t ®éng ", tbRefiningIron.NpcTalk, {tbRefiningIron}) 	
	end
	
	tbDailog:Show()
end

function jiefang0904_act()
	Say(" lÔ quan : b©y giê lµ ¨n mõng gi¶i phãng ngµy ho¹t ®éng trong lóc , ®¹i nh©n ®øa trÎ còng h­ng cao th¶i liÖt ®Şa ¨n mõng th¾ng lîi , ®¹i hiÖp muèn tham gia sao ?", 6, 
			" ta tíi nhËn lÊy cÈm nang sù kiÖn /jf0904_getjinnangshijian",
			format("Th¾ng lîi r­îu ho¹t ®éng /tbJiefang0904_jiu:OnDailogMain()"),
			" lªn ®Ønh FanXiPan ho¹t ®éng /about_denggao",
			" oanh liÖt thiªn thu ho¹t ®éng /about_shuizei",
			" tiªu diÖt n­íc tÆc nhiÖm vô /about_shuizei",
			" ta ch¼ng qua lµ xem mét chót !/OnCancel");
end

Include([[\script\event\menglan_2006\menglan_2006.lua]]);
function v_menglanjie()
	Say("Ta ®¹i biÓu ThiÕu L©m ph­¬ng tr­îng c¶m t¹ còng chóc phóc ng­¬i !", 7, 
		" ta ®em kim liªn xµi hÕt hoµn d©ng tÆng cho ng­¬i /v_mljaward(1)",
		" ta ®em méc hoa sen hµo quang d©ng tÆng cho ng­¬i /v_mljaward(2)",
		" ta ®em n­íc hoa sen hµo quang d©ng tÆng cho ng­¬i /v_mljaward(3)",
		" ta c©y ®uèc hoa sen hµo quang d©ng tÆng cho ng­¬i /v_mljaward(4)",
		" ta ®em ®Êt hoa sen hµo quang d©ng tÆng cho ng­¬i /v_mljaward(5)",
		" ta ®em hoa sen hµo quang d©ng tÆng cho ng­¬i , mçi hÖ mét ./v_mljaward_all",
		" ta ch¼ng qua lµ tß mß ®i ngang qua xem mét chót mµ th«i !/OnCancel"
	);
end;

function v_mljaward(nIdx)
	if (CalcEquiproomItemCount(6,1,tab_NPCIdx[nIdx][1] + 5,-1) < 1) then
		Say("Ng­¬i kh«ng muèn d©ng tÆng "..tab_NPCIdx[nIdx][2].." sao ? ng­¬i thËt gièng nh­ kh«ng cã mang "..tab_NPCIdx[nIdx][2].."!", 1, "Ta ®i tr­íc chuÈn bŞ !/OnCancel")
		return
	end;
	
	local nCount = GetTask(tab_NPCIdx[nIdx][3]);
	if (nCount >= SIMGER_LIMIT) then
		Say("Ng­¬i ®· d©ng tÆng ®ñ "..tab_NPCIdx[nIdx][2].." liÔu  d©ng tÆng ®iÓm kh¸c ®İch ®i !", 0);
		return
	end;
	
	ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[nIdx][1] + 5, -1);
	SetTask(tab_NPCIdx[nIdx][3], nCount + 1);
	AddOwnExp(500000);
	Say("Qu¸ tr©n quı  ®©y lµ ThiÕu L©m ph­¬ng tr­îng cïng Nga Mi ch­ëng m«n ®­a cho ng­¬i mét chót t©m ı .", 1, "TiÕp nhËn lÔ vËt ./OnCancel");
	Msg2Player("Ng­¬i lÊy ®­îc <color=yellow>500000<color> chót kinh nghiÖm .");
end;

function v_mljaward_all()
	for i = 1, getn(tab_NPCIdx) do
		if (CalcEquiproomItemCount(6,1,tab_NPCIdx[i][1] + 5,-1) < 1) then
			Say("Ng­¬i kh«ng muèn d©ng tÆng "..tab_NPCIdx[i][2].." sao ? ng­¬i thËt gièng nh­ kh«ng cã mang "..tab_NPCIdx[i][2].."!", 1, "Ta ®i tr­íc chuÈn bŞ !/OnCancel")
			return
		end;
	end;
	
	local nCount = GetTask(TK_LOTUS_ALL);
	if (nCount >= TOGETHER_LIMIT) then
		Say("ThËt lµ c¸m ¬n ng­¬i  nh­ng lµ 12 c¸ bao tiÒn l× x× ®· ®­a hoµn cho ng­êi ta liÔu .", 0);
		return
	end;
	
	for i = 1, getn(tab_NPCIdx) do
		ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[i][1] + 5, -1);
	end;
	SetTask(TK_LOTUS_ALL, nCount + 1);
	
	AddOwnExp(1000000);
	AddItem(6, 1, 1136, 1, 0, 0, 0); --¼ÓÒ»¸ö´ó·ç°ü£»
	Say("Qu¸ tr©n quı  ®©y lµ ThiÕu L©m ph­¬ng tr­îng cïng Nga Mi ch­ëng m«n ®­a cho ng­¬i mét chót t©m ı .", 1, "TiÕp nhËn lÔ vËt ./OnCancel");
	Msg2Player("Ng­¬i lÊy ®­îc <color=yellow>1000000<color> chót kinh nghiÖm cïng 1 c¸ <color=yellow> bao tiÒn l× x× <color>");
end;

-- ½ÚÈÕÁĞ±í
aryHoliday = {	-- ½ÚÈÕÊ±¼ä, ·ûºÏ½ÚÈÕÊ±¼äËùµ÷º¯ÊıÃû, ÖØ¸´ÁìÀñÆ·µÄÌáÊ¾ÎÄ±¾ 
				{ 20040822, onHoliday_QiXi, "Khİ trêi tèt nh­ vËy  c¸c ng­¬i 2 vŞ t¹i sao kh«ng ®i du v­ên ®©y , vÉn cßn ë c¸i nµy lµm g× ?" }
				-- ÆäËü½ÚÈÕ
			 };
	
function valentineGift()
	if (GetBit(GetTask(67),24) == 1) then
		if (GetBit(GetTask(1313),1) ~= 1) then
			SetTask(1313, SetBit(GetTask(1313), 1, 1))
			Talk(1, "", "<> h«m nay lµ nh÷ng thø nµy hØ kÕt l­¬ng duyÕn ng­êi cña ®İch ngµy thËt tèt  ta cã lÔ vËt muèn tÆng cho kÕt h«n ng­êi cña  chóc c¸c vŞ b¹c ®Çu giai l·o ")
			-- ËÍ2¸ö¡°ĞÄĞÄÏàÓ¡·û¡±
			for i = 1, 2 do
				AddItem( 6, 1, 18, 1, 0, 0 ,0);
			end
			Msg2Player( "<> ng­¬i lÊy ®­îc hai t©m t©m t­¬ng Ên phï " );
			-- ËÍ9¶ä¡°Ãµ¹å»¨¡±
			for i = 1, 9 do
				AddItem( 6, 0, 20, 1, 0, 0 ,0);
			end	
			Msg2Player( "<> ng­¬i lÊy ®­îc 9 ®ãa hoa hång !" );
			-- 50¼¶ÒÔÉÏÍæ¼Ò¼ÓËÍ1¸ö¡°ÌìÉ½ÓñÂ¶¡±
			if( GetLevel() >= 50 ) then
				AddItem(6, 1, 72, 1, 0, 0, 0);
				Msg2Player( "<> ng­¬i lÊy ®­îc mét chai Thiªn S¬n b¶o lé " );
			end
		else
			Talk(1, "", "<> ng­¬i kh«ng ph¶i lµ ®· nhËn lÊy qua sao ? ®Ó cho ng­êi kh¸c ®Õn ®©y ®i ")
		end
	else
		Talk(1, "", "<> ng­¬i cßn ch­a cã kÕt h«n , kh«ng thÓ dÉn lÔ vËt ")
	end
end		 	
---------------- È¡Ïû ----------------------------------------
function OnCancel()
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. ": tr­¬ng môc :" .. GetAccount() .. ", nh©n vËt :" .. GetName() .. "," .. object);
end
