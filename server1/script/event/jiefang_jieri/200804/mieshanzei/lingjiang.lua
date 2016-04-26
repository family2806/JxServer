-- 文件名　：lingjiang.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-14 14:34:01

-- 把铁牛郎牙佩到各新手村的礼官NPC 出兑换奖励。
-- 奖励包括：一张战备银票+1个8玄晶+下面物品列表中的随机一个

Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_mieshanzei = {}

jiefang_0804_mieshanzei.szName = "jiefang_0804_mieshanzei"

jiefang_0804_mieshanzei.tbRecipe = 
{
	tbItemList = 
	{
		{szName="铁牛郎牙佩", tbProp={6, 1, 1733}, nCount = 1},		
	},
	nMoney = 0,
	tbAwardItem = 
	{
		[1] = {szName="战备银票", tbProp={6, 1, 1732, 1, 0, 0}, nExpiredTime = 20090111},
		[2] = {szName="8级玄晶矿石", tbProp={6, 1, 147, 8, 0, 0}},
		[3] = {
			{szName="洞察白金雕龙戒", nQuality=1, tbProp={0, 143},nRate = 25},
			{szName="洞察白玉乾坤佩", nQuality=1, tbProp={0, 144},nRate = 25},
                     {szName="洞察白金锈凤戒", nQuality=1, tbProp={0, 145},nRate = 25},
			{szName="洞察翡翠玉项圈", nQuality=1, tbProp={0, 146},nRate = 25},
		}
	},
}

function jiefang_0804_mieshanzei:main()
	local tbSay = 
	{
		"<dec><npc>今日，一批山贼常常到村镇去骚扰百姓，情况日益严重，各位大侠出力赶走山贼. 有机会捡到<color=yellow>铁牛郎牙佩<color> 在山贼身上, 此外老夫还有厚礼相赠.",
		format("我捡到铁牛郎牙佩/#%s:Compose()", self.szName),
		"结束对话/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_mieshanzei:Compose()
	local szMsg = "大侠要尽快加入消灭山贼的队伍吗?"
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose(szMsg, tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "大侠在大腿山贼中表现的很出色，请领取奖励.", 0)
end
