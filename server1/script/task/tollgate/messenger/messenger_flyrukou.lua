-------------------------------------------------------------------------
-- FileName		:	messenger_flyrukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ·çÖ®ÆïÈë¿Ú
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua"); 	--°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- Ô½ÄÏ×ÊÁÏÆ¬ÉúÈÕ»î¶¯
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B¾t ®Çu nhiÖm vô /fly_starttask",
	  	"Rêi khái khu vùc/fly_movecity",
	  	"L¸t n÷a quay l¹i /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, " nhiÖm vô t¹i b¶n ®å Phong Kú/birthday0905_fly");
	end
	 Describe(DescLink_YiGuan..": §· b¾t ®Çu tİnh thêi gian qua ¶i, cè g¾ng lªn! B©y giê b¹n muèn lµm g×?",getn(tbDialog), unpack(tbDialog))
end

function fly_starttask()
	if ( nt_getTask(1201) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:ÉèÖÃÈÎÎñ¿ªÊ¼Ê±¼ä
		nt_setTask(1201,20)
		DisabledUseTownP(1)			--½ûÓÃ»Ø³Ç·û				--1£º½ûÓÃ	--0£ºÆôÓÃ
		SetFightState(1);			--´ò¿ªÕ½¶·×´Ì¬				--1£º´ò¿ª	--0£º¹Ø±Õ
		SetLogoutRV(1);				--¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã		--1£º¶ÏÏßºÍËÀÍöÎªÒ»¸öÖØÉúµã	--0£º¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã
		SetPunish(0);				--¹Ø±ÕËÀÍö³Í·£					--1£ºÓĞËÀÍö³Í·£		--0£ºÃ»ÓĞËÀÍö³Í·£
		SetCreateTeam(1);			--ÔÊĞí×é¶Ó					--1£ºÔÊĞí×é¶Ó		--0£º²»ÔÊĞí×é¶Ó
		ForbidChangePK(1);   		--²»ÄÜ¸ü¸Äpk×´Ì¬		--1£º²»ÄÜ¸ü¸Äpk×´Ì¬		--0:¿ÉÒÔ¸ü¸Äpk×´Ì¬
		SetPKFlag(0);               --ÉèÖÃÎªÁ·¹¦Ä£Ê½            
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1559,3113);
		Msg2Player("§· b¾t ®Çu tİnh thêi gian lµm nhŞªm vô ")
	elseif ( nt_getTask(1201) == 20 ) then
		Describe(DescLink_YiGuan.."B¹n ®· hoµn thµnh nhiÖm vô, kh«ng cÇn tiÕp nhËn l¹i!",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		Describe(DescLink_YiGuan..": Ng­¬i ®· hoµn thµnh nhiÖm vô, sao cßn muèn tiÕp nhËn l¹i nhiÖm vô? Mau rêi khái ®©y ®i!",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1201) == 0 ) then
		Describe(DescLink_YiGuan..": Ng­¬i ®· hoµn thµnh nhiÖm vô Tİn sø råi! Lµm ¬n biÕn cho khuÊt m¾t!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function fly_movecity()
	local name = GetName()
	if ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("Phong Kú DŞch tr¹m cung tèng"..name.."§¹i nh©n ®Õn"..citygo[i][4].."DŞch tr¹m!")
			end
		end	
	elseif ( nt_getTask(1201) == 10 ) or ( nt_getTask(1201) == 0 ) then
		SetLogoutRV(0);
		NewWorld(37,1601,3001)
	end
end

function birthday0905_fly()
	tbBirthday0905.tbTask:reset_task();
	Say("DŞch quan: Tõ ngµy 19/06/2009 ®Õn 24h ngµy 19/07/2009 , nÕu ®¹i hiÖp cã thÓ v­ît qua ®­îc mét trong nh÷ng thö th¸ch sau ®©y th× ®¹i hiÖp sÏ nhËn ®­îc mét trong bèn tİn vËt v« cïng quı gi¸ lµ “B¸ V­¬ng Th­¬ng”. §¹i hiÖp cã b»ng lßng tham gia thö th¸ch kh«ng?", 8, 
		"NhËn nhiÖm vô Tiªu diÖt 500 Kim Quèc gian tÕ./#birthday0905_settask_message(1)",
		"NhËn nhiÖm vô Tiªu diÖt 6 Hæ B¸o Kş./#birthday0905_settask_message(2)",
		"NhËn nhiÖm vô TiÕp xóc 100 täa ®é./#birthday0905_settask_message(3)",
		"Ta ®· hoµn thµnh nhiÖm vô Tiªu diÖt 500 Kim Quèc gian tÕ./#birthday0905_gettask_message(1)",
		"Ta ®· hoµn thµnh nhiÖm vô Tiªu diÖt 6 Hæ B¸o Kş./#birthday0905_gettask_message(2)",
		"Ta ®· hoµn thµnh nhiÖm vô TiÕp xóc 100 täa ®é./#birthday0905_gettask_message(3)",
		"Ta muèn hñy nhiÖm vô hiÖn t¹i/birthday0905_cancel_message",
		"Ta cã chuyÖn gÊp, sÏ quay l¹i sau./no");
end

function no()
	
end
