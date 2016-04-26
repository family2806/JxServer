Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	--local szTitle = "<npc>需要买药么？"
	--local tbOpt = {}
	--tinsert(tbOpt, {"交易", yes}) 
	--tinsert(tbOpt, {"我随便逛逛"}) 
	--CreateNewSayEx(szTitle, tbOpt);
	Sale(176)
end

function yes()
	Sale(176)
end
