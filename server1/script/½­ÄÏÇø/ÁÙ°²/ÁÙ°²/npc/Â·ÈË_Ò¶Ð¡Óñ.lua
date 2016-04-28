-- ÁÙ°²¡¡Â·ÈË¡¡ L¸ tiÓu ngäc 
-- by£ºDan_Deng(2003-09-16)

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()

	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	if (GetSex() == 0) then
		tbDailog.szTitleMsg = "<npc> C«ng tö  ta ch­a ra c¸c , nhÜ l·o lµ theo ch©n ta , rèt cuéc lµm g× giíi ? nÕu ®Ó cho ta n¨m biÕt , n¹i m¹t chí ®­îc . "
	else
		tbDailog.szTitleMsg = "<npc> Muéi tö , ng­¬i cã g× giíi chuyÖn sao ? "
	end
	G_TASK:OnMessage(" L¸ tiÓu ngäc ", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;
