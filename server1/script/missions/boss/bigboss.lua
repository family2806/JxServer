Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\sharedata.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
--Fix bug missing lib - modified by DinhHQ - 20110425
Include("\\script\\lib\\droptemplet.lua")
IncludeLib("LEAGUE")

BigBoss = {}

BigBoss.TSK_PLAYER_BOSSKILLED = 2598; -- 玩家击杀BOSS数量统计
BigBoss.TSK_BIGBOSS_REWARD = 2661; -- 记录玩家当天是否领奖和领奖类型 日期 | 获得闯关翻倍 | 获得宋金翻倍 |获得经验翻倍奖励 | 是否领奖
BigBoss.CAN_GET_REWARD_BIT = 1;
BigBoss.EXP_REWARD_BIT = 2;
BigBoss.SONGJIN_REWARD_BIT = 3;
BigBoss.CHUANGGUAN_REWARD_BIT = 4;

BigBoss.tbKillRecord = {};
BigBoss.IsBigBossDead = 0;
BigBoss.CallBackParam = {}

BigBoss.tbGlobalReward = 
{
	{szName="今天21:00宋金战场, 将有双倍积累", nRate=25, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.SONGJIN_REWARD_BIT, 1); Msg2Player(format("大侠得到奖品 <color=yellow>%s<color>","今天21:00宋金战场, 将有双倍积累"))end},
	{szName="今天21:00过关, 将有双倍积累", nRate=25, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CHUANGGUAN_REWARD_BIT, 1); Msg2Player(format("大侠得到奖品<color=yellow>%s<color>","今天21:00过关, 将有双倍积累"))end},
	{szName="打怪1小时的双倍经验", nRate=25, pFun=function() AddSkillState(967, 1, 1, 64800); PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.EXP_REWARD_BIT, 1); Msg2Player(format("大侠得到奖品<color=yellow>%s<color>","打怪1小时的双倍经验"))end},
	{nExp = 10000000, nRate=25},
}

BigBoss.tbKillerReward = 
{
	{tbProp = {6,1,2127,1,0,0}, nCount=1, nExpiredTime=43200},
	{tbProp = {4,239,1,1,0,0}, nCount=10},
	{tbProp = {4,238,1,1,0,0}, nCount=10},
	{tbProp = {4,240,1,1,0,0}, nCount=10},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,907,1,0,0}, nCount=8, nExpiredTime=10080},
	{tbProp = {6,1,1075,1,0,0}, nCount=8},
	{tbProp = {6,1,2126,1,0,0}, nCount=1, nExpiredTime=10080},
}

BigBoss.tbNormalDrop = 
{
	{tbProp = {6,1,1075,1,0,0}, nCount=3},
	{tbProp = {4,239,1,1,0,0}, nCount=20},
	{tbProp = {4,238,1,1,0,0}, nCount=20},
	{tbProp = {4,240,1,1,0,0}, nCount=20},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {6,1,1672,1,0,0}, nCount=10},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,2115,1,0,0}, nCount=10},
	{tbProp = {6,1,2117,1,0,0}, nCount=10},
	{tbProp = {6,0,6,1,0,0}, nCount=20},
	{tbProp = {6,0,3,1,0,0}, nCount=20},
	{tbProp = {6,1,71,1,0,0}, nCount=20},
	{tbProp = {6,1,1765,1,0,0}, nCount=10},
	{tbProp = {6,1,26,1,0,0}, nCount=10},
	{tbProp = {6,1,22,1,0,0}, nCount=10},
}

--DC 奖励 boss 独孤- Modified By DinhHQ - 20111010
BigBoss.tbVngNewDropItem = {
	[1] = {
		[1]={{szName="紫蟒盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=13},},
		[2]={{szName="紫蟒衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=13},},
		[3]={{szName="紫蟒腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=13},},
		[4]={{szName="紫蟒护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=13},},
		[5]={{szName="紫蟒项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=13},},
		[6]={{szName="紫蟒佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=13},},
		[7]={{szName="紫蟒鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=13},},
		[8]={{szName="紫蟒上戒图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=8},},
		[9]={{szName="紫蟒下戒图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=8},},
		[10]={{szName="紫蟒器戒图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=8},},
		[11]={{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=10},},
		[12]={{szName="如意钥匙",tbProp={6,1,2744,1,0,0},nCount=1,nRate=30},},
		[13]={{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=60},},
		[14]={{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=60},},
		[15]={{szName="青驹令",tbProp={6,1,2369,1,0,0},nCount=1,nRate=15},},
		[16]={{szName="云鹿令",tbProp={6,1,2353,1,0,0},nCount=1,nRate=20},},
		[17]={{szName="紫水晶",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
		[18]={{szName="蓝水晶",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
		[19]={{szName="绿水晶",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
		[20]={{szName="猩红宝石",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
		[21]={{szName="铁罗汉",tbProp={6,1,23,1,0,0},nCount=2,nRate=80},},
		[22]={{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=30},},
		[23]={{szName="混元灵露",tbProp={6,1,2312,1,0,0},nCount=1,nRate=25},},
		[24]={{szName="黄金印(强化)",tbProp={0,3209},nCount=1,nRate=20,nQuality = 1,nExpiredTime=20160,},},
		[25]={{szName="黄金印(弱化)",tbProp={0,3219},nCount=1,nRate=20,nQuality = 1,nExpiredTime=20160,},},
	},
	[2] = {
		{szName="紫蟒盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=12},
		{szName="紫蟒衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=13},
		{szName="紫蟒腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=14},
		{szName="紫蟒护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=12},		
		{szName="紫蟒佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=12},		
		{szName="紫蟒鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=13},
		{szName="紫蟒佩图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=11},
		{szName="紫蟒上戒图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=5},
		{szName="紫蟒下戒图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=5},
		{szName="紫蟒器戒图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=3},
	},	
	[3] = {
		{szName="天灵丹",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	},
}

BigBoss.tbVngNewDropEquip = 
{
	{szName="紫蟒无相珠链",tbProp={0,1825},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒四空佛珠",tbProp={0,1835},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒清净项链",tbProp={0,1845},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒崇明链",tbProp={0,1855},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒定海项链",tbProp={0,1865},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒宣威项链",tbProp={0,1875},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒出尘珠链",tbProp={0,1885},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒沐雪珠链",tbProp={0,1895},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒青霜珠链",tbProp={0,1905},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒砌香珠链",tbProp={0,1915},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒蚀骨项链",tbProp={0,1925},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒穿心项链",tbProp={0,1935},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒狼牙项链",tbProp={0,1945},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒青雾项链",tbProp={0,1955},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒风霜项链",tbProp={0,1965},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒密云项链",tbProp={0,1975},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒火云项链",tbProp={0,1985},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒熔金项圈",tbProp={0,1995},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒燎原项链",tbProp={0,2005},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒真元符",tbProp={0,2015},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒真武符",tbProp={0,2025},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒断水项链",tbProp={0,2035},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="紫蟒摘星符",tbProp={0,2045},nCount=1,nRate=0.09,nQuality = 1,},
	{szName="紫蟒无相上戒",tbProp={0,1827},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒四空上戒",tbProp={0,1837},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒清净上戒",tbProp={0,1847},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒崇明上戒",tbProp={0,1857},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒定海上戒",tbProp={0,1867},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒宣威上戒",tbProp={0,1877},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒出尘上戒",tbProp={0,1887},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒沐雪上戒",tbProp={0,1897},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒青霜上戒",tbProp={0,1907},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒砌香上戒",tbProp={0,1917},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒蚀骨上戒",tbProp={0,1927},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒穿心上戒",tbProp={0,1937},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒狼牙上戒",tbProp={0,1947},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒青雾上戒",tbProp={0,1957},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒风霜上戒",tbProp={0,1967},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒密云上戒",tbProp={0,1977},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒火云上戒",tbProp={0,1987},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒熔金上戒",tbProp={0,1997},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒燎原上戒",tbProp={0,2007},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒真元上戒",tbProp={0,2017},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒真武上戒",tbProp={0,2027},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒断水上戒",tbProp={0,2037},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒摘星上戒",tbProp={0,2047},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒无相下戒",tbProp={0,1834},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒四空下戒",tbProp={0,1844},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒清净下戒",tbProp={0,1854},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒崇明下戒",tbProp={0,1864},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒定海下戒",tbProp={0,1874},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒宣威下戒",tbProp={0,1884},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒出尘下戒",tbProp={0,1894},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒沐雪下戒",tbProp={0,1904},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒青霜下戒",tbProp={0,1914},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒砌香下戒",tbProp={0,1924},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒蚀骨下戒",tbProp={0,1934},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒穿心下戒",tbProp={0,1944},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒狼牙下戒",tbProp={0,1954},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒青雾下戒",tbProp={0,1964},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒风霜下戒",tbProp={0,1974},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒密云下戒",tbProp={0,1984},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒火云下戒",tbProp={0,1994},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒熔金下戒",tbProp={0,2004},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒燎原下戒",tbProp={0,2014},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒真元下戒",tbProp={0,2024},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒真武下戒",tbProp={0,2034},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒断水下戒",tbProp={0,2044},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒摘星下戒",tbProp={0,2054},nCount=1,nRate=0.075,nQuality = 1,},
	{szName="紫蟒无相缠手",tbProp={0,1831},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒四空僧棍",tbProp={0,1841},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒清净戒刀",tbProp={0,1851},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒崇明锤",tbProp={0,1861},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒定海枪",tbProp={0,1871},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒宣威宝刀",tbProp={0,1881},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒出尘剑",tbProp={0,1891},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒沐雪缠手",tbProp={0,1901},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒青霜刀",tbProp={0,1911},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒砌香鸳鸯刀",tbProp={0,1921},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒蚀骨缠手",tbProp={0,1931},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒穿心刀",tbProp={0,1941},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒狼牙飞刀",tbProp={0,1951},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒青雾袖箭",tbProp={0,1961},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒风霜镖",tbProp={0,1971},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒密云缠手",tbProp={0,1981},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒火云杖",tbProp={0,1991},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒熔金枪",tbProp={0,2001},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒燎原刀",tbProp={0,2011},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒真元剑",tbProp={0,2021},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒真武剑",tbProp={0,2031},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒断水刀",tbProp={0,2041},nCount=1,nRate=0.05,nQuality = 1,},
	{szName="紫蟒摘星剑",tbProp={0,2051},nCount=1,nRate=0.05,nQuality = 1,},
}	


function AddKillRecord_CallBack(Param, ResultHandle)
	szName = BigBoss.CallBackParam[Param][1];
	nSecondes = BigBoss.CallBackParam[Param][2];
	BigBoss.CallBackParam[Param] = nil;
	if (OB_IsEmpty(ResultHandle) == 0) then
		BigBoss.tbKillRecord = ObjBuffer:PopObject(ResultHandle);
	end
	
	local nIdx = 0;
	
	local nIdx = 0;
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i][2] > nSecondes) then
			nIdx = i;
			break;
		end
	end
	
	if (nIdx == 0) then
		nIdx = getn(BigBoss.tbKillRecord) + 1;
	end
	
	tinsert(BigBoss.tbKillRecord, nIdx, {szName, nSecondes});
	
	local nCount = 0;
	
	-- 保留最好成绩
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i] and BigBoss.tbKillRecord[i][1] == szName) then
			nCount = nCount + 1;
			if (nCount > 1) then
				tremove(BigBoss.tbKillRecord, nIdx);
			end
		end
	end
	
	SaveShareData("FUNC_BIGBOSS_LADDER", 0, 0, BigBoss.tbKillRecord);
end

function BigBoss:AddKillRecord(szName, nSecondes)
	self.CallBackParam[getn(self.CallBackParam)+1] = {szName, nSecondes};
	
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, "AddKillRecord_CallBack", getn(self.CallBackParam));
end

function BigBoss:GetKillRecord(szCallBack, nParam)
	nParam = nParam or 0;
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, szCallBack, nParam);
end

function BigBoss:BigBossGlobalReward()
	self.CallBackParam[getn(self.CallBackParam) + 1] = PlayerIndex;
	RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "IsBigBossDead", 0, "BigBossGlobalReward_CallBack", getn(self.CallBackParam));
end

function BigBossGlobalReward_CallBack(Param, ResultHandle)
	local Index = BigBoss.CallBackParam[Param]
	if (Index and Index > 0) then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = Index
		if (OB_IsEmpty(ResultHandle) == 0) then
			IsBigBossDead = ObjBuffer:PopObject(ResultHandle);
			if (IsBigBossDead == 1) then
				PlayerFunLib:AddTaskDaily(BigBoss.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
				if (PlayerFunLib:CheckTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 1, "今日大侠已领奖!") == 1) then
					PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 0);
					tbAwardTemplet:GiveAwardByList(BigBoss.tbGlobalReward, format("[%s] big boss global reward",date("%Y%m%d")));
				end
			else
				Talk(1, "", format("今天还没有打败<color=red>%s<color>","独孤天峰"));
			end
		end
		--
		PlayerIndex = OldPlayerIndex
		BigBoss.CallBackParam[Param] = nil
	end
end

function BigBoss:BigBossDeath(nNpcIndex)
	-- 记录时间
	local nTime = tonumber(GetLocalDate("%H%M%S"))-194500; -- 死亡时间 - 召唤时间
	
	-- 给最高伤害的人或队伍奖励
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, 100000000, 0, format("%s 奖品","经验奖励给攻击独孤天峰最激烈的人"));
		end
	else -- 一个人
		szName = GetName();
		PlayerFunLib:AddExp(100000000, 0, format("%s 奖品","经验奖励给攻击独孤天峰最激烈的人"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 50000000, 0, format("%s 奖品","经验奖励给攻击独孤天峰最激烈的人"));
	end
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbKillerReward, format("%s 掉","独孤天峰"), 1);
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, -1, self.tbNormalDrop, format("%s 掉","独孤天峰"), 1);
	
	--DC 奖品 - Modified By DinhHQ - 20111010
	--item
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropItem, format("%s 掉","独孤天峰"), 1);
	--trang b?
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropEquip, format("%s 掉","独孤天峰"), 1);
	
	-- BOSS击杀统计
	local nCount = GetTask(self.TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(self.TSK_PLAYER_BOSSKILLED, nCount);
	
	-- BIGBOSS死亡
	local Handle = OB_Create()
	if (Handle > 0) then
		ObjBuffer:PushObject(Handle, 1)
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "SetBigBossDead", Handle);
		OB_Release(Handle)
	end
	
	local szNews = format("组队 <color=yellow>%s<color> 消灭成功<color=yellow>独孤天峰<color>, 赶快到礼官处领奖!",szName);
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	self:AddKillRecord(szName, nTime);
end

function BigBoss:RemoveSongJinBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.SONGJIN_REWARD_BIT, 0);
end

function BigBoss:RemoveChuangGuanBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.CHUANGGUAN_REWARD_BIT, 0);
end

function BigBoss:AddSongJinPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.SONGJIN_REWARD_BIT);
	if (nType == 1) then
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour <= 22) then -- 21点的宋金22:30结束
			nBasePoint = nBasePoint * 2;
		end
		
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:AddChuangGuanPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- 重置变量,以防意外
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.CHUANGGUAN_REWARD_BIT);
	if (nType == 1) then
		nBasePoint = nBasePoint * 2;
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:MakeAllPlayerCanGetReward()
	local nIdx = GetFirstPlayerAtServer();
	while(nIdx > 0) do
		doFunByPlayer(nIdx, PlayerFunLib.AddTaskDaily, PlayerFunLib, self.TSK_BIGBOSS_REWARD, 0);
		doFunByPlayer(nIdx, PlayerFunLib.SetTaskBit, PlayerFunLib, self.TSK_BIGBOSS_REWARD, self.CAN_GET_REWARD_BIT, 1);
		nIdx = GetNextPlayerAtServer();
	end
end