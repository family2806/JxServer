-- �ٰ���·�ˡ� L� ti�u ng�c 
-- by��Dan_Deng(2003-09-16)

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
		tbDailog.szTitleMsg = "<npc> C�ng t�  ta ch�a ra c�c , nh� l�o l� theo ch�n ta , r�t cu�c l�m g� gi�i ? n�u �� cho ta n�m bi�t , n�i m�t ch� ���c . "
	else
		tbDailog.szTitleMsg = "<npc> Mu�i t� , ng��i c� g� gi�i chuy�n sao ? "
	end
	G_TASK:OnMessage(" L� ti�u ng�c ", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;
