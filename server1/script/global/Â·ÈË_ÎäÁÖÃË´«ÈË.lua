--Ìá¹©¸£ÔµÁìÈ¡µÄNPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\event\\storm\\award_npc.lua")	--Storm
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
Include("\\script\\event\\tongwar\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include([[\script\missions\chrismas\ch_head.lua]]);--
--	2007Äê´º½Ú»î¶¯
Include([[\script\event\springfestival07\head.lua]]);
--ÎäÁÖÁî»î¶¯
Include( "\\script\\event\\wulinling\\wulinling.lua" )
Include( "\\script\\event\\nanfangjiefangri\\event.lua" )
Include("\\script\\event\\tongwar\\head.lua");
--dinhhq_20110124:Vip acc 2011
Include("\\script\\vng_event\\vip_account_2011\\npc\\volamtruyennhan.lua")

function main()
	
	-- ·²ÊÇÉæ¼°µ½»î¶¯µÄÎäÁÖÃË´«ÈË¶Ô»°½Ô²åÈëµ½´ËÊı×é -- ÅåÀ×Ë¹ 2006/03/20
	local aryTalk  = {};
	local ndate = tonumber(GetLocalDate("%Y%m%d%H"));
	local Uworld1000 = nt_getTask(1000);
	
	tinsert(aryTalk, "<dec><npc>Giang hå ph©n tranh giã næi m©y vÇn. Ch­ vŞ cao thñ vâ l©m ch¸nh nghÜa, t¹o phóc th­¬ng sinh, nh­ thÕ míi cã thÓ trë thµnh mét ®¹i hiÖp, ®­îc mäi ng­êi ng­ìng mé .");
	--dinhhq_20110124:Vip acc 2011
	tbVNG_VipAcc2011_VLTN:addDialog(aryTalk)
	
	if ndate >= 2007042800 and ndate <= 2007051324 then
	tinsert(aryTalk,"Ho¹t ®éng ngµy gi¶i phãng /nanfangjiefangri_main");
	end
	if (not FALSE(tongwar_checkinphase())) then
		tinsert(aryTalk,"Bang héi chiÕn /tongWar_Start");
	end;
	
---	tinsert(aryTalk, "§i Danh nh©n ®­êng/honor_hall_enter");
	
---	tinsert(aryTalk, "§i Minh NguyÖt trÊn/autumn_enter");
	
	tinsert(aryTalk, "NhËn phóc duyªn /OnGain_Self");

	if( GetTeamSize() > 1 ) then
		tinsert(aryTalk, "NhËn phóc duyªn c¶ ®éi /OnGain_Team");
	end;
	
	tinsert(aryTalk, "NhËn ®iÓm danh väng /W33_prise");
	
	tinsert(aryTalk, "KiÓm tra thêi gian tİch lòy Online /OnQueryTime");
	
	tinsert(aryTalk, "Liªn quan tíi phóc duyªn/OnAbout");
	
	tinsert(aryTalk, "Hñy bá/OnCancel");
	
	if ( Uworld1000 ==340 ) or ( Uworld1000 == 350 ) then
		education_wulinmengchuanren();
		return
	end;
	
	CreateTaskSay(aryTalk);
	
	
end

--ÁìÈ¡Íæ¼Ò±¾ÈËµÄ¸£ÔµµãÊı
function OnGain_Self()
	if( IsCharged() ~= 1 ) then
		Say( "Ng­¬i ch­a ®ñ thêi gian tİch lòy ®Ó nhËn phóc duyªn.", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "Ng­¬i cã vÎ ®· mÖt mái råi, h·y ®i nghØ ng¬i ®i !", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "Ng­¬i míi s¬ nhËp giang hå, n¬i nµy lµ mét lÔ vËt nhá, h·y nhËn lÊy.", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nResult = FuYuan_Gain();
	if( nResult == 0 ) then
		Say( "Ng­¬i x«ng pha giang hå nh­ng vÉn ch­a ®ñ giê tİch lòy! ", 0 );
	elseif( nResult == 1 ) then
		Say( "Ng­¬i x«ng pha giang hå ®· l©u, còng cã 1 chót c«ng lao, ®©y phÇn th­ëng cña ng­¬i.", 0 );
	end
end

--ÁìÈ¡Íæ¼Ò¶ÓÎéËùÓĞ³ÉÔ±µÄ¸£ÔµµãÊı
function OnGain_Team()
	if( IsCharged() ~= 1 ) then
		Say( "Ng­¬i ch­a ®ñ thêi gian tİch lòy ®Ó nhËn phóc duyªn.", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "Ng­¬i cã vÎ ®· mÖt mái råi, h·y ®i nghØ ng¬i ®i !", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "Ng­¬i míi s¬ nhËp giang hå, n¬i nµy lµ mét lÔ vËt nhá, h·y nhËn lÊy.", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	local bAllUnavailable = 1;
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		if( FuYuan_Gain() == 1 ) then
			bAllUnavailable = 0;
		end		
	end
	PlayerIndex = nPreservedPlayerIndex;
	if( bAllUnavailable == 0 ) then
		Say( "Ng­¬i x«ng pha giang hå ®· l©u, còng cã 1 chót c«ng lao, ®©y phÇn th­ëng cña ng­¬i.", 0 );
	else
		Say( "Ng­¬i x«ng pha giang hå nh­ng vÉn ch­a ®ñ giê tİch lòy! ", 0 );
	end
end

--²éÑ¯µ±Ç°¿É»»È¡¸£ÔµµÄÀÛ»ıÔÚÏßÊ±¼ä
function OnQueryTime()
	if( IsCharged() ~= 1 ) then
		Say( "Ng­¬i ch­a ®ñ thêi gian tİch lòy ®Ó nhËn phóc duyªn.", 0 );
		return
	end
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "Ng­¬i míi s¬ nhËp giang hå, n¬i nµy lµ mét lÔ vËt nhá, h·y nhËn lÊy.", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nFYTotalTime, FYValidTime = FuYuan_GetDepositTime();
	Say( "<#>KÓ tõ lÇn nhËn phóc duyªn tr­íc, ng­êi ®· tİch lòy <color=yellow>"..timeToString( nFYTotalTime ).."<#><color> thêi gian Online", 0 );
end

--¹ØÓÚ¸£Ôµ
function OnAbout()
	Talk( 3, "", "Phóc duyªn ®iÓm ®Õm: Th«ng qua tİch lòy thêi gian ch¬i, cã thÓ ®æi ®iÓm phóc duyªn. Cã thÓ tíi T­¬ng D­¬ng thÇn bİ th­¬ng nh©n LiÔu ?t ®æi c¸c lo¹i vËt phÈm ®Æc thï. ", " Phóc duyªn ®æi:tİch lòy hai giê online trë lªn , ®i c¸c ®¹i thµnh thŞ t×m vâ l©m minh chñ truyÒn nh©n lµ ®­îc ®æi . mét ngµy ®­îc ®æi 2 lÇn, tİch lòy ë tuyÕn thêi gian 4 giê trë lªn, mçi giê ®æi 1 ®iÓm phóc duyªn.", "H¹n chÕ ®iÒu kiÖn :Ngåi tï kh«ng ®­îc tİch lòy ®iÓm phóc duyªn." );
end


function W33_prise()				-- ÔÚÏßÊ±¼äËÍÉùÍûÈÎÎñ

Uworld33 = GetTask(33)

if (GetGameTime() - Uworld33 >= 43200) then

	SetTask(33,GetGameTime())
	Talk(1,"","Vâ l©m minh chñ truyÒn nh©n: Ta nh×n thÊy sù cè g¾ng ë trong m¾t cña ng­¬i, ng­¬i tiÕn bé ta còng rÊt vui mõng. H·y tiÕp tôc cè g¾ng lªn !")
	i = random(0,99)
	if (i < 19) then			-- 19%
		AddRepute(1)
		Msg2Player("Danh väng t¨ng lªn 1 ®iÓm. ")
	elseif (i < 36) then		-- 17%
		AddRepute(2)
		Msg2Player("Danh väng t¨ng lªn 2 ®iÓm. ")
	elseif (i < 51) then		-- 15%
		AddRepute(3)
		Msg2Player("Danh väng t¨ng lªn 3 ®iÓm. ")
	elseif (i < 64) then		-- 13%
		AddRepute(4)
		Msg2Player("Danh väng t¨ng lªn 4 ®iÓm. ")
	elseif (i < 75) then		-- 11%
		AddRepute(5)
		Msg2Player("Danh väng t¨ng lªn 5 ®iÓm. ")
	elseif (i < 84) then		-- 9%
		AddRepute(6)
		Msg2Player("Danh väng t¨ng lªn 6 ®iÓm. ")
	elseif (i < 91) then		-- 7%
		AddRepute(7)
		Msg2Player("Danh väng t¨ng lªn 7 ®iÓm. ")
	elseif (i < 96) then		-- 5%
		AddRepute(8)
		Msg2Player("Danh väng t¨ng lªn 8 ®iÓm. ")
	elseif (i < 99) then		-- 3%
		AddRepute(9)
		Msg2Player("Danh väng t¨ng lªn 9 ®iÓm. ")
	else							-- 1% (i = 99)
		AddRepute(10)
		Msg2Player("Danh väng t¨ng lªn 10 ®iÓm. ")
	end

else

	Say("Vâ l©m minh chñ truyÒn nh©n: Ng­¬i vÉn ch­a ®ñ ®iÒu kiÖn ®Ó nhËn danh väng. H·y cè g¾ng h¬n n÷a! ",0)

end

end



--È¡Ïû
function OnCancel()
end

function timeToString( time )
	local nHour = floor( time / 3600 );
	local nMinute = mod( floor( time / 60 ), 60 );
	local nSecond = mod( time, 60 );
	return nHour.."<#>giê "..nMinute.."<#>phót "..nSecond.."<#>gi©y";	
end

function honor_hall_enter()
    NewWorld(897, 1553, 3329);
end