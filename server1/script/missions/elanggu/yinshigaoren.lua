Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>���ǰ���һ���ס�ڶ��ǹȵ�ǿ������˲ŵ������ǹȡ���Щ��ר��ȥ�����������ｭ����ʿ���������ܶ�Ӣ�ۺ��ܶ����ȥ���ǡ����ǣ������ӵ������ʧ���ѾõĻ����񹦣�һ��ĵ�ǹ�����������˵����ǡ�30��ǰ����һ��������ŷ�����Ǭ������������˵�õ��������������������ҵ������������ɶԷ����ǵĻ����񹦣�������һ�����������."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"�����뿪!", GoToWaiMian})
	tinsert(tbDailog, {"��һ��"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function GoToWaiMian()
	local tbMapList = {{11,3183,5180}, {1,1651,3279}, {37,1704,3222}, {176,1695,3294}, 
											{162,1697,3277}, {78,1596,3379}, {80,1718,3201},}
	local nOutPosId = random(1, getn(tbMapList))
	local tbPos = tbMapList[nOutPosId]
 	NewWorld(tbPos[1], tbPos[2], tbPos[3]) 	
end
