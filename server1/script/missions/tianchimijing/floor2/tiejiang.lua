Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\global_tiejiang.lua")

function main()
	local szTitle = "<#><npc> 需要交易吗?"
	local tbOpt = {}
	tinsert(tbOpt, {"交易", yes}) 
	tinsert(tbOpt, {"精炼石商店", energy_sale}) 
	tinsert(tbOpt, {"路过而已"}) 
	CreateNewSayEx(szTitle, tbOpt);
end

function yes()
	Sale(35)
end
