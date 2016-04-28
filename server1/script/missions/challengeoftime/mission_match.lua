-- description	: ±ÈÈüÈÎÎñ
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\event\\storm\\function.lua")	--Storm

-- Æô¶¯±ÈÈü¿ªÊ¼¶¨Ê±Æ÷
function start_match_timer()
	-- 10·ÖÖÓºóÆô¶¯±ÈÈüÈÎÎñ
	StartMissionTimer(MISSION_MATCH, TIMER_MATCH, LIMIT_SIGNUP * 18);
end

-- ¿ªÊ¼±¨Ãû
function start_signup()
	-- ÉèÖÃÎª±¨Ãû×´Ì¬
	SetMissionV(VARV_STATE, 1);
	SetMissionV(VARV_BOARD_TIMER, 0);
	SetMissionS(VARS_TEAM_NAME, "");
	-- Í¨¸æÁúÖÛ±ÈÈü±¨Ãû¿ªÊ¼
	--ÓÉrelayÍ¨¸æ±¨Ãû¿ªÊ¼£¬2´Î
	--local min = floor(LIMIT_SIGNUP / 60);
	--broadcast("<#>Ê±¼äµÄÌôÕ½ÈÎÎñ±¨Ãû¿ªÊ¼ÁË£¬Çë´ó¼ÒËÙÀ´7´ó³ÇÊĞÄôß±³¾´¦×é¶ÓÓÉ¶Ó³¤±¨Ãû£¬±¨ÃûÊ±¼äÎª" .. min .. "·ÖÖÓ");
end

function InitMission()
	start_signup();
	start_match_timer();
end

function EndMission()
	close_match();
	close_board_timer();
	close_close_timer();
end

-- Íæ¼ÒÍË³ö
function OnLeave(index)
	local old_index = PlayerIndex;
	PlayerIndex = index;
	
	-- Big Boss Remove bonus state
	BigBoss:RemoveChuangGuanBonus();
	
	SetCurCamp(GetCamp());
	SetTaskTemp(200,0)
	SetFightState(0);
	SetPunish(1);
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	
	SetTask(1505, 0)
	DisabledUseTownP(0)
	
	Msg2MSAll(MISSION_MATCH, GetName().."Rêi khái khu vùc nhiÖm vô ");
	
	--Storm ¼Ó½±Àø·Ö
	if storm_valid_game(2) then	--·ç±©ÌôÕ½Ã»ÓĞ½áÊø£¨Èç¹ûÊÇÍæ¼ÒÏÂÏß¸Ã¶Î´úÂë²»»áÆğ×÷ÓÃ£©
		storm_add_pointex(2, 40)
		storm_end(2)
	end
	SetTask(STORM_TASKID_GAMEID_SS, 0)	--Çå³ıGameKey
	
	PlayerIndex = old_index;
end

function JoinMission(RoleIndex, camp)
	PlayerIndex = RoleIndex;
	if (camp ~= 1) then
		return
	end
	
	LeaveTeam()
	AddMSPlayer(MISSION_MATCH,camp);
	SetCurCamp(camp);
	SetTaskTemp(200,1)
	SetFightState(1);
	SetLogoutRV(1);
	SetPunish(0);
	str = GetName().."Tham gia 'NhiÖm vô Th¸ch thøc thêi gian'"
	local sf_mapid = SubWorldIdx2ID(SubWorld)
	NewWorld(sf_mapid, BOAT_POSX, BOAT_POSY);
	SetCreateTeam(0);
	Msg2MSAll(MISSION_MATCH,str);
	SetPKFlag(1)
	ForbidChangePK(1);
	SetDeathScript(SCRIPT_PLAYER_DEATH);
	SetTask(1505, 1)
	DisabledUseTownP(1)

	--Storm ¼ÓÈë·ç±©»ı·Ö
	SetTask(STORM_TASKID_GAMEID_SS, random(100000))	--Ö¸¶¨Ëæ»úµÄGameKey
--	if (storm_start(2, 1)) then
--		local level = GetTask(TB_STORM_TASKID[2][STORM_TASKIDX_MODE]) + 1
--		str = "²Î¼ÓÉ±ÊÖÊÔÁ¶ÈÎÎñ¿É»ñµÃ²ÎÓë½±Àø¡ª·ç±©»ı·Ö<color=yellow>40<color>·Ö¡£´³¹Ø³É¹¦µÄÌáÇ°Ê±¼ä¿É×ª»»Îª·ç±©»ı·Ö£¨×î¸ß<color=yellow>60<color>·Ö£©¡£Ã¿ÌìÁ½³¡É±ÊÖÊÔÁ¶£¬È¡³É¼¨×îºÃµÄÒ»³¡¼ÆËã·ç±©»ı·Ö¡£%s<enter>"
--		local tb_levelstr = {
--			"³õ¼¶É±ÊÖÊÔÁ¶ÈÎÎñ£¬Ã¿ÈËÃ¿Ìì×î¶à¿É»ñµÃ·ç±©»ı·Ö<color=yellow>90<color>·Ö¡£",
--			"¸ß¼¶É±ÊÖÊÔÁ¶ÈÎÎñ£¬Ã¿ÈËÃ¿Ìì×î¶à¿É»ñµÃ·ç±©»ı·Ö<color=yellow>100<color>·Ö¡£",
--		}
--		str = format(str, tb_levelstr[level])
--		Talk(1, "", str)
--	end
end

