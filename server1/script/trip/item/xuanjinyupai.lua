--Ğş½ğÓñÅÆÓ¦¸ÃÊÇ ¿ç·şµÀ¾ß
--²»Ó¦¸ÃºÍ¿ç·şËÎ½ğÓĞ¹Ø£¬Òò´Ë·ÅÔÚÕâÀï
--¸ÃÎÄ¼ş¶¨ÒåµÄÓĞ¹Ø¿ç·şËÎ½ğº¯ÊıÓ¦×ªÒÆÖÁ£¬\mission\battle



Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\battle\\manager.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\script\\trip\\define.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\missions\\battle\\npc\\point2exp.lua")
function main()
	dialog_menu()
	return 1
end

function dialog_menu()
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then
		return 1
	end
	local tbOpt =
	{
		{"Liªn server", across_server},
		{"¼ì²éLiªn serverÒøÁ½", show_across_server_money},
		{"Liªn server¹±Ï×¶È", tbTripBattlePoint2Exp.DialogMain, {tbTripBattlePoint2Exp}},
		{"KÕt thóc ®èi tho¹i"},
	}
	CreateNewSayEx("HuyÒn Kim Ngäc Bµi", tbOpt)
end

function across_server()
	local tbOpt = {}
	local nCount = TripC_GetServerCount()
	for i=1, nCount do
		local szServerName = TripC_GetServerName(i)
		tinsert(tbOpt, {szServerName, sign_up, {i}})
	end
	tinsert(tbOpt, {"Trë vÒ", dialog_menu})
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	CreateNewSayEx("Ng­¬i muèn ®i tíi n¬i nµo?", tbOpt)
end

function show_across_server_money()
	local tbOpt =
	{
		{"Trë vÒ", dialog_menu},
		{"KÕt thóc ®èi tho¹i"},
	}
	local szTitle = format("<color=yellow>%s<color>ÄãÓĞ <color=yellow>%d<color> Liªn serverÒøÁ½, <color=yellow> ¸ÃÒøÁ½ÊıÊÇÄã¿ÉÒÔ´ÓÔ´Í··şÎñÆ÷´øµ½¹«¹²·şÎñÆ÷£¬Íê³ÉµÄ²»ÊÇ¹«¹²·şÎñÆ÷µÄÒøÁ½Êı¡£¹«¹²·şÎñÆ÷£¬Äã¿ÉÒÔÇ××Ôµ½¹«¹²·şÎñÆ÷¼ì²é¡£ <color>", GetName(), GetTask(TSK_TRIP_MONEY))
	CreateNewSayEx(szTitle, tbOpt)
end

function sign_up(nServerId)
	local _, nValue = GetRoleEquipValue()
	local szTitle = format("ÄãÄ¿Ç°µÄ±ø¼×ÊıÖµÎª%d, ÄãÏëÈ¥ËÎ½ğLiªn serverµÄÄÄ¸ö¼¶±ğ? <enter>", nValue)
	local tbOpt = {}
	for i=1, getn(BattleManagerDef) do
		local nMapId = BattleManagerDef[i][2]
		local pManager = BattleManagerList[nMapId]
		if pManager then
			if pManager.nMinEqValue and pManager.nMaxEqValue then
				szTitle = szTitle..format("%s yªu cÇu gi¸ trŞ binh gi¸p(%d~%d)<enter>", pManager.szName, pManager.nMinEqValue, pManager.nMaxEqValue)
			elseif pManager.nMinEqValue and not pManager.nMaxEqValue then
				szTitle = szTitle..format("%s yªu cÇu gi¸ trŞ binh gi¸p %d trë lªn<enter>", pManager.szName, pManager.nMinEqValue)
			elseif pManager.nMaxEqValue and not pManager.nMinEqValue then
				szTitle = szTitle..format("%s yªu cÇu gi¸ trŞ binh gi¸p%d trë xuèng<enter>", pManager.szName, pManager.nMaxEqValue)
			else
				szTitle = szTitle..format("%s kh«ng yªu cÇu gi¸ trŞ binh gi¸p", pManager.szName)
			end
			tinsert(tbOpt, {pManager.szName, select_mamager, {nMapId, nServerId}})
		end
	end
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	CreateNewSayEx(szTitle, tbOpt)
end

function select_mamager(nMapId, nServerId)
	local pManager = BattleManagerList[nMapId]
	if not pManager then
		return
	end
	local _, nValue = GetRoleEquipValue()
	if (not pManager.nMinEqValue or nValue >= pManager.nMinEqValue) and
		(not pManager.nMaxEqValue or nValue <= pManager.nMaxEqValue) then
		local szServerName = TripC_GetServerName(nServerId)
		local nIfCanOffLine = check_if_can_offline()
		if szServerName and nIfCanOffLine == nil then
			TripC_Apply(szServerName, 0, pManager.nMapId, 1541, 3178)
		end
	else
		return  Talk(1, "", format("Gi¸ trŞ binh gi¸p cña ng­¬i(%d)kh«ng phï hîp yªu cÇu", nValue))
	end
end

function get_item()
	tbAwardTemplet:Give({szName="HuyÒn Kim Ngäc Bµi",tbProp={6,1,3035,1,0,0},}, 1, {"TRIP", "get item"})
end

--EventSys:GetType("AddNpcOption"):Reg("VÖ binh thµnh m«n","ÎÒÏëÁìÈ¡HuyÒn Kim Ngäc Bµi", get_item)
