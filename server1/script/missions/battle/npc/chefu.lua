Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	local nMode = GetTripMode()
	if nMode ~= 2 then
		NewWorld(20,3546,6226)
		return
	end
	local szTitle = "<npc>".."���뷵����?"
	local tbOpt = 
	{
		{"��", TripS_Return, {}},
		{"ȡ��"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end