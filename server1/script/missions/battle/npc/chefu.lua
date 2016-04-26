Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	local nMode = GetTripMode()
	if nMode ~= 2 then
		NewWorld(20,3546,6226)
		return
	end
	local szTitle = "<npc>".."你想返回吗?"
	local tbOpt = 
	{
		{"想", TripS_Return, {}},
		{"取消"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end