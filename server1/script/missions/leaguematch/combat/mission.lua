Include( "\\script\\missions\\leaguematch\\head.lua" )

function InitMission()
	SetMissionV(WLLS_MSV_MSID, WLLS_MSID_COMBAT)
end;

function RunMission()
 	local tbPlayer = wlls_get_ms_plidx(0)
 	_M("getn(tbPlayer)="..getn(tbPlayer))
	local oldPlayerIndex = PlayerIndex 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[ i ];
 		_M("PlayerIndex="..PlayerIndex)
		SetPKFlag(2)	--ÍÀÉ±Ä£Ê½
		ForbidChangePK(1);	--½ûÖ¹¸ü»»PKÄ£Ê½
		SetFightState(1);	--¿ªÊ¼Õ½¶·
	end
	PlayerIndex = oldPlayerIndex
	Msg2MSAll( WLLS_MSID_COMBAT, "<color=yellow>Thêi gian chê kÕt thóc, trËn ®Êu b¾t ®Çu." );
end;

function EndMission()
	--¼ì²éËùÓÐcamp in mission£¬¸ø³öÊ¤°Ü½á¹û
	local n_usedtime = WLLS_TIMER_FIGHT_TOTAL * WLLS_TIMER_FIGHT_FREQ * WLLS_FRAME2TIME
	for i = 1, WLLS_MAX_COUNT, 2 do
		local count1 = GetMSPlayerCount( WLLS_MSID_COMBAT, i )
		local count2 = GetMSPlayerCount( WLLS_MSID_COMBAT, i + 1 )

		if ( count1 > 0 and count2 > 0) then --Ë«·½¶¼²»Îª¿Õ
			local _, str_league1 = wlls_camp2league(i)
			local _, str_league2 = wlls_camp2league(i + 1)
			if ( count1 > count2 ) then   --¼×·½ÈËÊý > ÒÒ·½
				wlls_matchresult(str_league1, str_league2, 1, n_usedtime)
			elseif ( count1 < count2 ) then   --ÒÒ·½ÈËÊý > ¼×·½
				wlls_matchresult(str_league2, str_league1, 1, n_usedtime)
			else --ÈËÊýÏàµÈ
				local n_dmg1	= wlls_get_ms_damage(i)
				local n_dmg2	= wlls_get_ms_damage(i+1)
				local str1	= "<color=yellow> §éi cña b¹n nhËn <color=red>"..n_dmg1.."<color> ®iÓm, ®èi thñ tróng <color=red>"..n_dmg2.."<color> s¸t th­¬ng"
				local str2	= "<color=yellow> §éi cña b¹n nhËn <color=red>"..n_dmg2.."<color> ®iÓm, ®èi thñ tróng <color=red>"..n_dmg1.."<color> s¸t th­¬ng"
				if (n_dmg1 < n_dmg2) then
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.." KÕt qu¶: ®éi b¹n th¾ng!", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.." KÕt qu¶: ®éi b¹n thua!", i + 1)
					wlls_matchresult(str_league1, str_league2, 1, n_usedtime)
				elseif (n_dmg1 > n_dmg2) then
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.." KÕt qu¶: ®éi b¹n thua!", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.." KÕt qu¶: ®éi b¹n th¾ng!", i + 1)
					wlls_matchresult(str_league2, str_league1, 1, n_usedtime)
				else
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.." KÕt qu¶: hßa", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.." KÕt qu¶: hßa", i + 1)
					wlls_matchresult(str_league1, str_league2, 0, n_usedtime)
				end
			end
		end
	end
	wlls_remove_camp(0)
	WriteLog(date("%Y-%m-%d %H%M%S, ")..wlls_get_desc(3).." ket thuc lien dau.")
end

function OnLeave( org_player )
	local oldindex = PlayerIndex
	PlayerIndex = org_player;
	local org_playername = GetName()
	local org_camp = GetTask(WLLS_TASKID_ORGCAMP)
	wlls_clear_pl_state()		--»¹Ô­Íæ¼Ò×´Ì¬
	SetPKFlag(0);	--Õ½¶·Ä£Ê½ÖÃÎªÁ·¹¦
	ForbidChangePK(0);	--ÔÊÐí¸Ä±äÕ½¶·Ä£Ê½
	PlayerIndex = oldindex

	--Èç¹û±¾ÈËÒÑ¾­Íê³É±ÈÈü »ò ±ÈÈüÒÑ¾­½áÊø£¬²»ÓÃ×öÏÂÃæµÄ´¦Àí
	if (org_camp == 0 or GetGlbValue(GLB_WLLS_PHASE) == 3) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, org_playername)
	local str_lgname = LG_GetLeagueInfo(n_lid)

	--·¢ËÍÀë³¡ÏûÏ¢
	_M("Msg2MSAll")
	Msg2MSAll(WLLS_MSID_COMBAT, "<color=yellow>ChiÕn ®éi ["..str_lgname.."] "..org_playername.." rêi khái ®Êu tr­êng!")

	--µÃµ½¼º·½¡¢¶Ô·½MissionÕóÓª±àºÅ
	local emy_camp
	if ( mod(org_camp,2) == 0 ) then
		emy_camp = org_camp - 1
	else
		emy_camp = org_camp + 1
	end
	
	--ÅÐ¶ÏÊÇ·ñÔì³É±ÈÈü½áÊø£¬¼ÇÂ¼±ÈÈü½á¹û»ò·¢ËÍÕ½±¨
	local org_count = GetMSPlayerCount( WLLS_MSID_COMBAT, org_camp )
	local emy_count = GetMSPlayerCount( WLLS_MSID_COMBAT, emy_camp )
	_M("OnLeave : "..org_camp.." VS "..emy_camp.."  "..org_count.."/"..emy_count)
	if (emy_count > 0) then --Èç¹û¶Ô·½»¹ÓÐÈËµÄ»°
		if ( org_count > 0 ) then	--ÎÒ·½»¹ÓÐ¶ÓÔ±ÔÚ±ÈÈüÖÐ
			str = "<color=pink>§éi ®èi ph­¬ng cßn "..org_count.." ng­êi"
			Msg2MSGroup(WLLS_MSID_COMBAT, str, emy_camp)
			
			--×ÔÉíÉËº¦×ÜÁ¿¼ÇÔÚ¶ÓÓÑÉíÉÏ 
			local n_oldidx	= PlayerIndex
			PlayerIndex	= org_player;
			local n_damage	= ST_GetDamageCounter();

			local tb_pidx	= wlls_get_ms_plidx(org_camp)
			for i = 1, getn(tb_pidx) do
				if (tb_pidx[i] ~= org_player) then
			 		PlayerIndex = tb_pidx[i];
			 		ST_IncreaseDamageCounter(n_damage);
			 		break;
			 	end
			end
			PlayerIndex	= n_oldidx
		else	--ÎÒ·½ÒÑÈ«¾ü¸²Ã»
			local n_emy_dmg	= wlls_get_ms_damage(emy_camp)

			local n_oldidx = PlayerIndex
			PlayerIndex	= org_player
			local n_our_dmg	= ST_GetDamageCounter()
			Msg2Player("<color=yellow>S¸t th­¬ng ®éi b¹n tróng ph¶i lµ <color=red>"..n_our_dmg.."<color> ®iÓm, ®èi thñ tróng <color=red>"..n_emy_dmg.."<color> s¸t th­¬ng")
			PlayerIndex	= n_oldidx
			
			Msg2MSGroup(WLLS_MSID_COMBAT, "<color=yellow>S¸t th­¬ng ®éi b¹n tróng ph¶i lµ <color=red>"..n_emy_dmg.."<color> ®iÓm, ®èi thñ tróng <color=red>"..n_our_dmg.."<color> s¸t th­¬ng", emy_camp)
			
			--µÃ³ö±ÈÈü½á¹û
			local n_usedtime = (GetGlbValue(GLB_WLLS_TIME) + 1) * WLLS_TIMER_FIGHT_FREQ * WLLS_FRAME2TIME
			if GetGlbMSRestTime then	--´ËÖ¸ÁîÔÝÊ±»¹Ã»ÓÐ¼ÓÈë
				n_usedtime = n_usedtime - GetGlbMSRestTime(WLLS_MSID_COMBAT, WLLS_TIMERID_COMBAT)
			end
			local _,emy_league = wlls_camp2league(emy_camp)
			wlls_matchresult(emy_league, str_lgname, 1, n_usedtime)
			wlls_remove_camp(emy_camp)
		end
	end
end;
