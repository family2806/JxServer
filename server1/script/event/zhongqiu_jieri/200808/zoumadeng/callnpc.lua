Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")


local tbNpcList =
{
	{szName = "东走马灯", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua", tbNpcParam = {1}, nTime = 60*60},
	{szName = " 西走马灯", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua",tbNpcParam = {2}, nTime = 60*60},
	{szName = "南走马灯", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua", tbNpcParam = {3}, nTime = 60*60},
	{szName = "北走马灯", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua", tbNpcParam = {4}, nTime = 60*60},
	
}

function zhongqiu0808_CallBoss(nMapId, nPosX, nPosY, nType, nNpcParam1)
	%tbNpcList[nType].tbNpcParam[3] = nNpcParam1
	zhongqiu0808_CallNpc(%tbNpcList[nType], nMapId, nPosX * 32, nPosY * 32)
end