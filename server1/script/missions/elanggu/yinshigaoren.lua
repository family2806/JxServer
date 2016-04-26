Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>恶狼帮是一伙居住在恶狼谷的强盗，因此才得名恶狼谷。这些人专门去祸害良民，污蔑江湖人士的名誉，很多英雄豪杰都想除去他们。但是，这伙人拥有武林失传已久的护体神功，一般的刀枪兵器都不能伤到他们。30年前，有一个江湖奇才发明了乾坤击力丹，听说该丹威力无穷，如果大侠可以找到它，就能轻松对方他们的护体神功，还百姓一个安静的生活。."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"我想离开!", GoToWaiMian})
	tinsert(tbDailog, {"等一下"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function GoToWaiMian()
	local tbMapList = {{11,3183,5180}, {1,1651,3279}, {37,1704,3222}, {176,1695,3294}, 
											{162,1697,3277}, {78,1596,3379}, {80,1718,3201},}
	local nOutPosId = random(1, getn(tbMapList))
	local tbPos = tbMapList[nOutPosId]
 	NewWorld(tbPos[1], tbPos[2], tbPos[3]) 	
end
