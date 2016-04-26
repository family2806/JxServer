-- 文件名　：boss_initialize.lua
-- 创建者　：wangjingjun
-- 内容　　：随机boss出现的位置，并通知gs加载boss
-- 创建时间：2011-08-29 10:00:30

Include("\\script\\lib\\objbuffer_head.lua")

local tbPos = {
	[1] = -- boss 张宣
	{
		[1] = {176,1754,2799},
		[2] = {176,1248,3409},
		[3] = {176,1744,3401},
		[4] = {80,1831,3360},
		[5] = {80,1632,2871},
		[6] = {80,1940,2914},
	},
	[2] = -- boss 金弑亮
	{
		[1] = {78,1682,3534},
		[2] = {78,1353,3137},
		[3] = {78,1401,3441},
		[4] = {162,1741,3000},
		[5] = {162,1773,3346},
		[6] = {162,1335,3205},
		[7] = {11,3004,4840},
		[8] = {11,3316,5279},
		[9] = {11,2915,5231},
	},
	[3] = -- boss 慕容全
	{
		[1] = {959,1503,3098},
	},
}

local tbMapName = {
	[176] = "临安",
	[80] = "扬州",
	[78] = "襄阳",
	[162] = "大理",
	[11] = "成都",
	[959] = "战龙洞",
}

local tbBossInfomation = {
	-- bossid, bosslvl, bossname
	[1] = {1873,95,"张宣",},		
	[2] = {1874,95,"金弑亮",},		
	[3] = {1875,95,"慕容全",},		
}

function makeboss_onlyone_pos(nKind)
	local szFile = "\\script\\missions\\boss\\goldboss_adjust_2011\\callboss.lua"
	
	local nIndex = random(1,getn(%tbPos[nKind]))
	local nMapId = %tbPos[nKind][nIndex][1]
	local nPosX = %tbPos[nKind][nIndex][2]
	local nPosY = %tbPos[nKind][nIndex][3]
	
	local nBossId = %tbBossInfomation[nKind][1]
	local nBossLevel = %tbBossInfomation[nKind][2]
	local nSeries = random(0,4)
	
	local szBossname = %tbBossInfomation[nKind][3]
	local szWorldname = %tbMapName[nMapId]
	local szWorldMsg = format("江湖相传%s已出现在%s，江湖将有一场血战!",szBossname, szWorldname)
	
--	OutputMsg("nIndex = " .. nIndex .. " nMapId = " .. nMapId .. " nPosX = " .. nPosX .. " nPosY = " .. nPosY)
--	OutputMsg("nBossId = " .. nBossId .. " szBossname = " .. szBossname)
	
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, nBossId)
	ObjBuffer:PushObject(handle, nBossLevel)
	ObjBuffer:PushObject(handle, nSeries)
	ObjBuffer:PushObject(handle, nMapId)
	ObjBuffer:PushObject(handle, nPosX)
	ObjBuffer:PushObject(handle, nPosY)
	ObjBuffer:PushObject(handle, szBossname)
	ObjBuffer:PushObject(handle, szWorldMsg)
	-- bossid, bosslvl, series, mapid, posx, posy, bossname, str
	RemoteExecute(szFile, "gbAdjust_MakeBoss", handle)
end