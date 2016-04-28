-- ÎÄ¼þÃû¡¡£ºgoldboss.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£º»Æ½ðbossµ÷Õû£¬ÐÂÔöboss24Ð¡Ê±ºó×Ô¶¯É¾³ý
-- PS	   : ÓÉÓÚÔÚ¸ÃÎÄ¼þ¼ÓÔØµÄÊ±ºòÐèÒª½øÐÐbossËÀÍö×¢²á£¬ÖØ¸´¼ÓÔØ£¬bossËÀÍö»á¶à¸ø½±Àø
-- ´´½¨Ê±¼ä£º2011-10-02 08:15:46

Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
--Change boss award 2012 - Modified By DinhHQ - 20120315
Include("\\script\\lib\\awardtemplet.lua")
--local tbEquiptAward =
--{
--	[1873] = 
--	{
--		
--	},
--	[1874] = 
--	{
--		
--	},
--	[1875] = 
--	{
--		
--	},
--}

local tbDropItem = {
	[1]={{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={1,0,0,0,0,0}, },},
	[2]={{szName="Tö M·ng Chi B¶o (¸o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={5,0,0,0,0,0}, },},
	[3]={{szName="Tö M·ng Chi B¶o (H¹ng Liªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={0,0,0,0,0,0}, },},
	[4]={{szName="Tö M·ng Chi B¶o (Ngäc Béi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={8,0,0,0,0,0}, },},
	[5]={{szName="Tö M·ng Chi B¶o (GiÇy)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={7,0,0,0,0,0}, },},
	[6]={{szName="Tö M·ng Chi B¶o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={3,0,0,0,0,0}, },},
	[7]={{szName="Tö M·ng Chi B¶o (NhÉn Trªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=5,tbParam={2,0,0,0,0,0}, },},
	[8]={{szName="Tö M·ng Chi B¶o (NhÉn D­íi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=5,tbParam={9,0,0,0,0,0}, },},
	[9]={{szName="Tö M·ng Chi B¶o (§ai L­ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=8,tbParam={4,0,0,0,0,0}, },},
	[10]={{szName="Tö M·ng Chi B¶o (Vò KhÝ)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=3,tbParam={6,0,0,0,0,0}, },},
	[11]={{szName="Lam Thñy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	[12]={{szName="Lôc Thñy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	[13]={{szName="Tö Thñy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	[14]={{szName="Tinh Hång B¶o Th¹ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
	[15]={{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=60},},
	[16]={{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3210},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[17]={{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3220},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[18]={{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1},},
	[19]={{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1},},
	[20]={{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1},},
	[21]={{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1},},
	[22]={{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1},},
	[23]={{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1},},
	[24]={{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1},},
	[25]={{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1},},
	[26]={{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1},},
	[27]={{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.5},},
	[28]={{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.3},},
	[29]={{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=4},},
	[30]={{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=6},},
	[31]={{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},},
	[32]={{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},},
	[33]={{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},},
	[34]={{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=6},},
	[35]={{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=5},},
	[36]={{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=3},},
	[37]={{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=3},},
	[38]={{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=2},},
	[39]={{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1.8},},
	[40]={{szName="Kim ¤ Kim Bµi",tbProp={6,1,3001,1,0,0},nCount=1,nRate=1},},
	[41]={{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=70,nExpiredTime=10080},},
	[42]={{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.9, },},
	[43]={{szName="B¶o R­¬ng Kim ¤ Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.9, },},
	[44]={{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.8, },},
	[45]={{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.8, },},
	[46]={{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.8, },},
	[47]={{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.9, },},
	[48]={{szName="B¶o R­¬ng Kim ¤ Béi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.8, },},
	[49]={{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.6, },},
	[50]={{szName="B¶o R­¬ng Kim ¤ H¹ Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.6, },},
	[51]={{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.4, },},
}
local tbNpcInfo = 
{
	[1] = {1873,"Tr­¬ng Tuyªn",},		
	[2] = {1874,"Kim ThÝ L­îng",},		
	[3] = {1875,"Mé Dung Toµn",},		
}

function checkNpc(nNpcIndex)
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local szName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		if (szNpcName == szName) and (nNpcId == %tbNpcInfo[i][1]) then
			return 1
		end
	end
	return 0
end

function addNews(nNpcIndex, nPlayerIndex)
	local szName = GetName(nPlayerIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local szNews = format("§¹i hiÖp <color=yellow>%s<color> t¹i <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),szNpcName)
	AddGlobalNews(szNews)
end

function goldbossdeath(nNpcIndex, nPlayerIndex)
--	print("boss ËÀÍö " .. GetNpcName(nNpcIndex))
	if checkNpc(nNpcIndex) ~= 1 then
		return 
	end
	
	addNews(nNpcIndex, nPlayerIndex)
	--¶Ò»»½±Æ· - Modified by DinhHQ - 20111009
	local tbItemAward = 
	{
		[1873] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1874] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1875] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	}
	--¶ªÆú½±Æ·ÌìÖ®Ïä - Modified by DinhHQ - 20111009
--	local tbOtherAward = 
--	{
--		[1873] = {90, 30},
--		[1874] = {94.825, 30},
--		[1875] = {94.825, 40},
--	}
	
	local nKind = GetNpcParam(nNpcIndex, 1)
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,tbItemAward[nKind],format("killed_%s",szNpcName))
	--¶ªÆú½±Æ·R­¬ng Thiªn Chi - Modified by DinhHQ - 20111009
--	local nRate = random(1,10000) / 100
--	if nRate <= tbOtherAward[nKind][1] then
--		local tbTeam = getPlayerTeam()
--		addTianzhibaoxiang(tbOtherAward[nKind][2], nNpcIndex, tbTeam)
--	else
--		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
--	end
	--Change boss award 2012- Modified by DinhHQ - 20120315
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbDropItem,format("killed_%s",szNpcName))	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
	--PhÇn th­ëng exp
	local tbAwardExp = {
		["Killer"] = {nExp = 20e6, szName = "§iÓm kinh nghiÖm"},
		["Around"] = {nExp = 10e6, szName = "§iÓm kinh nghiÖm"},
	}
	nOldPlayer = PlayerIndex	
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho tæ ®éi tiªu diÖt "..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi tiªu diÖt "..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi ®øng gÇn "..szNpcName})
	end
	PlayerIndex = nOldPlayer
end

function getPlayerTeam()
	local tbTeam = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		tinsert(tbTeam, PlayerIndex)
	else
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			tinsert(tbTeam, nPlayerIndex)
		end
	end
	return tbTeam
end

function addTianzhibaoxiang(nCount, nNpcIndex, tbTeam)
	local tbTianzhibaoxiang = 
	{
		szName = "R­¬ng Thiªn Chi", 
		nLevel = 95,
		nNpcId = 1876,
		nIsboss = 0,
		nTime = 5 * 60,		-- ´æÔÚÊ±¼ä 5 ·ÖÖÓ
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\tianzhibaoxiang.lua",
	}
	local nNpcX,nNpcY,nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	tbTianzhibaoxiang.tbNpcParam = tbTianzhibaoxiang.tbNpcParam or {}
	tbTianzhibaoxiang.tbNpcParam[1] = GetLocalTime()		-- µÃµ½´´½¨µÄÊ±¼ä
	tbTianzhibaoxiang.tbNpcParam[2] = getn(tbTeam)
	for i=1, getn(tbTeam) do
		tbTianzhibaoxiang.tbNpcParam[i+2] = tbTeam[i]
	end
	
	local nRow = 6
	local nOffset = 3 * 32
	-- ÖÐ¼äÔ¤ÁôÒ»¸öÎ»ÖÃ·ÅÖÃThiªn Linh §¬n£¬ËùÒÔÔÚ¼ÆËã¿ÉÏÔÊ¾ÐÐÊýÊ±£¬ÔÚ×ÜÊýÉÏÐèÒª+1
	local nClow = floor(nCount / nRow) + 1
	local nMidRow = floor(nRow / 2)
	local nMidClow = floor(nClow / 2)
	local nStartX = nNpcX - nMidRow * nOffset
	local nStartY = nNpcY - nMidClow * nOffset
	
	-- Ã¿ÐÐ6¸ö±¦Ïä£¬ÒÔbossËÀÍöµÄÎ»ÖÃÎªÖÐÐÄ³É¾ØÕóÅÅÁÐ
	for j=1, nClow do
		for i=1, nRow do
			if nCount > 0 then
				-- ÖÐÐÄÎ»ÖÃÏÔÊ¾Thiªn Linh §¬n£¬²»·ÅÖÃ±¦Ïä
				if j ~= nMidClow or i ~= nMidRow then
					local x = nStartX + i * nOffset
					local y = nStartY + j * nOffset
					basemission_CallNpc(tbTianzhibaoxiang, nMapId, x, y)
					nCount = nCount - 1
				end
			else
				break
			end
		end
	end	
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function register()
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		EventSys:GetType("NpcDeath"):Reg(szNpcName, goldbossdeath)
	end
end

register()