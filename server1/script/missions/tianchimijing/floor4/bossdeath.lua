Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
local nDistance = 20 * 20

function OnDeath(nNpcIndex,nBelongerIndex)
	local szName = GetNpcName(nNpcIndex)
	local nX, nY, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if (szName ~= "Hoµng Nhan Qu¶ng D­¬ng" or nMapId ~= 947) then
		return
	end
	--New drop award when boss down - Modified By DinhHQ - 20120405
	local tbAwardForNew = 
	{
		[1] = {
			{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=20},
			{szName="B¶o R­¬ng Kim ¤ H¹ Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=20},
			{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=10},	
			{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=50},
		},
		[2] = {
			[1]={{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=20},},
			[2]={{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=20},},
			[3]={{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=20},},
			[4]={{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=20},},
			[5]={{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=20},},
			[6]={{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=20},},
			[7]={{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=20},},
			[8]={{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=15},},
			[9]={{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=15},},
			[10]={{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=10},},
			[11]={{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},},
			[12]={{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=2},},
			[13]={{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=2},},
			[14]={{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=2},},
			[15]={{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=2},},
			[16]={{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=2},},
			[17]={{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=2},},
			[18]={{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=2},},
			[19]={{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1},},
			[20]={{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1},},
			[21]={{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.8},},
			[22]={{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nRate=0.8},},
			[23]={{szName="LÖnh bµi th«ng hµnh",tbProp={6,1,2590,1,0,0},nCount=1,nRate=10},},
			[24]={{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=2,nRate=100},},
			[25]={{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=2,nRate=100},},
		},
	}
	local tbAwardForOld = 
	{
		{szName = "ChÝ T«n BÝ B¶o", tbProp = {6,1,2375,1,0,0}, nRate = 50},
		{szName = "Vâ L©m MËt TÞch", tbProp = {6,1,26,1,0,0}, nRate = 10},
		{szName = "TÈy Tñy Kinh", tbProp = {6,1,22,1,0,0}, nRate = 10},
		{szName = "Tö M·ng LÖnh", tbProp = {6,1,2350,1,0,0}, nRate = 0.5},
		{szName = "HuyÒn Viªn LÖnh", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 10},
		{szName = "Th­¬ng Lang LÖnh", tbProp = {6,1,2352,1,0,0}, nRate = 9.5},
		{szName = "Tiªn Th¶o Lé ®Æc biÖt", tbProp = {6,1,1181,1,0,0}, nRate = 10},		
	}
	--local nBelongerIndex = GetPlayerIndex(nNpcIndex)
	--DynamicExecuteByPlayer(nBelongerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbAwardForOld, "É±ËÀÌì³ØÃØ¾³ËÄ²ãbossHoµng Nhan Qu¶ng D­¬ng»ñµÃ½±Àø", 10)
	tbDropTemplet:GiveAwardByList(nNpcIndex, -1, tbAwardForNew, "Boss tÇng 4 Thiªn Tr× MËt C¶nh r¬i ra", 1)
	
	--Exp award for player or team who killed boss - Modified By DinhHQ - 20120405
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 20e6}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nX, nY, nMapIndex = GetPos()
			if PlayerIndex > 0 and GetLife(0) > 0 and CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
				tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
			end
		end
	end
	PlayerIndex = nOldPlayer
end

function GetPlayerIndex(nNpcIndex)
	local nPlayerIndex = PlayerIndex
	local nTeamSize = CallPlayerFunction(nPlayerIndex, GetTeamSize)
	if nTeamSize == 0 then
		return nPlayerIndex
	else
		local tbTeamIndex = {}
		local nPlayerNum = 0
		local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex)
		for i=1,nTeamSize do
			local nTeamMember = CallPlayerFunction(nPlayerIndex, GetTeamMember, i)
			local nX, nY, nMapIndex = CallPlayerFunction(nTeamMember, GetPos)
			if (nMapIndex >= 0 and nMapIndex == nNpcMapIdx) then			 
				if CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
					nPlayerNum = nPlayerNum + 1
					tbTeamIndex[nPlayerNum] = nTeamMember
				end		
			end
		end
		if nPlayerNum > 1 then
			local nRandomIdx = random(1, nPlayerNum)
			return tbTeamIndex[nRandomIdx]
		else
			return tbTeamIndex[1]
		end
	end
end

function CheckDistance(nX1, nY1, nX2, nY2)
	local nTempDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	if nTempDis <= %nDistance then
		return 1
	end
end