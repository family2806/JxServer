Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\global_tiejiang.lua")

function main()
	local szTitle = "<#><npc> ��Ҫ������?"
	local tbOpt = {}
	tinsert(tbOpt, {"����", yes}) 
	tinsert(tbOpt, {"����ʯ�̵�", energy_sale}) 
	tinsert(tbOpt, {"·������"}) 
	CreateNewSayEx(szTitle, tbOpt);
end

function yes()
	Sale(35)
end
