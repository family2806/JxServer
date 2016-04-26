/*
if not AMULET then
	Include ("\\script\\item\\hecheng\\amulet.lua")
end

if not PENDANT then
	Include ("\\script\\item\\hecheng\\pendant.lua")
end

if not RING then
	Include ("\\script\\item\\hecheng\\ring.lua")
end
if not SHOSHI then
	SHOUSHI = 1
end
*/

--========类定义====================================--
--类名：Convert
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	负责计算鸡年神秘礼物升级关系的价值量和用鸡年神秘
--礼物兑换奖品的价值量。以及选择奖品。
--
--成员变量：
--	__gifttabfile：神秘礼物价值量tabfile
--	__bonustabfile：奖品的tabfile
--	__giftWorth：神秘礼物升级的价值量表
--	__bonusWorth：奖品的价值量表
--成员函数：
--	:loadSettings()：载入价值量设定文件。
--	:convert(worth)：用worth换取奖品
--
--用例：
--
--
--
--==================================================--

if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

if not WORTHANALYSE_HEAD then
	Include ("\\script\\item\\hecheng\\worthanalyse.lua")
end

Convert = {
--========函数定义==================================--
--函数原形：:loadSettings()
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	载入配置文件并进行价值量的计算。该函数首先载入
--settings/event/chinesenewyear/giftlvlup.txt和
--settings/event/chinesenewyear/bounslist.txt文件，
--然后根据这两份文件分别计算神秘礼物升级的价值量表和
--神秘礼物兑换奖品的价值量表。
--参数：
--	无
--返回值：
--	无
--用例：
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__ringtabfile = new(KTabFile,"/settings/event/juanzhouhecheng/ringlist.txt","RING")
		self.__amulettabfile = new(KTabFile,"/settings/event/juanzhouhecheng/amuletlist.txt","AMULET")
		self.__pendanttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/pendantlist.txt","PENDANT")
		self.__pendantWorth = new(WorthAnalyse,80)
		self.__amuletWorth = new(WorthAnalyse,80)
		self.__ringWorth = new(WorthAnalyse,80)
		return
	end,
	
	
--========函数定义==================================--
--函数原形：:convert(worth)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	由价值量worth计算出玩家将要的到的奖励编号。
--参数：
--	worth：神秘礼物的价值量之和。
--返回值：
--	如果成功，则返回所得到奖励的索引，否则为nil
--用例：
--
--==================================================--
	convertring = function(self,worth,mark)
		for i=1,self.__ringtabfile:getRow() do
			if (tonumber(self.__ringtabfile:getCell("五行",i)) == mark or tonumber(self.__ringtabfile:getCell("五行",i)) == 9) then
				self.__ringWorth:addWorth(i, tonumber(self.__ringtabfile:getCell("Worth",i)), tonumber(self.__ringtabfile:getCell("mID",i)))
			else
				self.__ringWorth:addWorth(i, 0, tonumber(self.__ringtabfile:getCell("mID",i)))
			end
		end
		self.__ringWorth:makeBaseP()
		self.__ringWorth:makeWorthP(worth)
		return self.__ringWorth:getFromWorth()
	end,
	convertpendant = function(self,worth, mark)
		for i=1,self.__pendanttabfile:getRow() do
			if (tonumber(self.__pendanttabfile:getCell("五行",i)) == mark or tonumber(self.__pendanttabfile:getCell("五行",i)) == 9) then
				self.__pendantWorth:addWorth(i, tonumber(self.__pendanttabfile:getCell("Worth",i)), tonumber(self.__pendanttabfile:getCell("mID",i)))
			else
				self.__pendantWorth:addWorth(i, 0, tonumber(self.__pendanttabfile:getCell("mID",i)))
			end
		end
		self.__pendantWorth:makeBaseP()
		self.__pendantWorth:makeWorthP(worth)
		return self.__pendantWorth:getFromWorth()
	end,
	convertamulet = function(self,worth, mark)		
		for i=1,self.__amulettabfile:getRow() do
			if (tonumber(self.__amulettabfile:getCell("五行",i)) == mark or tonumber(self.__amulettabfile:getCell("五行",i)) == 9) then
				self.__amuletWorth:addWorth(i, tonumber(self.__amulettabfile:getCell("Worth",i)), tonumber(self.__amulettabfile:getCell("mID",i)))
			else
				self.__amuletWorth:addWorth(i, 0, tonumber(self.__amulettabfile:getCell("mID",i)))
			end
		end
		self.__amuletWorth:makeBaseP()
		self.__amuletWorth:makeWorthP(worth)
		return self.__amuletWorth:getFromWorth()
	end	 
}

--eg.
Convert:loadSettings()
ringmsg = 
	{
		"黄玉戒指",
		"橄榄石戒指",
		"芙蓉石戒指",
		"翡翠戒指",
		"翠榴石戒指",
		"祖母绿戒指",
		"海蓝宝石戒指",
		"红宝石戒指",
		"蓝宝石戒指",
		"钻石戒指"
	}

pendantmsg = 
	{
		{"熏衣香囊","茉莉香囊","乳香香囊","兰花香囊","合欢香囊","紫苏香囊","沉檀香囊","仙麝香囊","迦楠香囊","龙涎香囊"},
		{"绿蚰玉佩","京白玉佩","桃花玉佩","梅花玉佩","五色玉佩","青玉玉佩","碧玉玉佩","墨玉玉佩","黄玉玉佩","羊脂白玉"}
	}
	
amuletmsg = 
	{
		{"铜项链","银项链","金项链","白金项链","玉珠项链","绿松石项链","水晶项链","孔雀石项链","珍珠项链","钻石项链"},
		{"绿松石护身符","珊瑚护身符","猫眼护身符","虎睛护身符","水晶护身符","琥珀护身符","白翡翠护身符","红翡翠护身符","紫翡翠护身符","绿翡翠护身符"}
	}

MAXGIVENUM = 20  --可以给礼物的最大上限
TF_GIFT_WORTH = 3  --giftlvl.txt中worth项的列数

TF_BONUS_WORTH = 3 
TF_BONUS_SEED = 4
TF_BONUS_P1 = 5
TF_BONUS_P2 = 6
TF_BONUS_P3 = 7
TF_BONUS_P4 = 8
TF_BONUS_P5 = 9
TF_BONUS_P6 = 10
TF_BONUS_P7 = 11
TF_BONUS_F = 12



function main()
	Talk(1, "GiveUIForThing", "合成戒指：每次最多放入<color=yellow>20<color>个鸡年神秘礼物和一件蓝色的<color=yellow>武器装备<color>，可以合成出与其相应等级、五行属性的首饰。放入的鸡年神秘礼物的潜质越高，戒指的属性就越好。<enter>兑换方法：武器换戒指；顶戴或鞋子换腰坠；衣服或腰带换颈带。")
end

function GiveUIForThing()
	GiveItemUI("首饰合成界面","在下面的物品栏里放入最多20个鸡年神秘礼物和一件武器装备。", "ConvertThing", "onCancel" );
end

function ConvertThing(nCount)
	local worth = 0	--礼物价值量
	local maxCount = 0	--礼物的总数
	local wnum = 0
	local thindex = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#>啥都不给，你想干啥呀。")
		return nil
	end
	for i=1,nCount do
		itemIdx = GetGiveItemUnit( i )
		g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 and d ~= 2 and d ~= 5 and d ~= 6 and d ~= 7 ))) then --错误道具  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#>你给的是虾米东西呀，咋看不懂嗫？")
			return nil
		end
		if(g == 0 ) then -- 武器装备
		magictype = GetItemMagicAttrib(itemIdx, 1)
			if (not magictype) then
				Talk(1, "GiveUIForThing", "<#>你给我的必须是一件有蓝色属性的武器装备。")
				return
			end
		if (magictype == 0 ) then
			Talk(1, "GiveUIForThing", "<#>你给我的必须是一件有蓝色属性的武器装备。")
			return
		end	
			wnum = wnum + 1
			thindex = itemIdx
		else --神秘礼物

		end
	end
	if (wnum > 1) then	--只能放一件装备
		Talk(1, "GiveUIForThing", "<#>这么多装备，我不是垃圾桶啊，消化不了这么多……")
		return nil
	end	
	if (wnum < 1) then
		Talk(1, "GiveUIForThing", "<#>这个……你什么武器装备都不放，想要兑换出首饰来？")
		return
	end
	gg, dd = GetItemProp(thindex)
	if(gg == 0 and (dd == 0 or dd == 1)) then -- 戒指
		ConvertRing(nCount)
	elseif (gg == 0 and (dd == 2 or dd == 6)) then --颈带
		ConvertAmulet(nCount)
	elseif (gg == 0 and (dd == 7 or dd == 5)) then --腰坠
		ConvertPendant(nCount)
	end
end

function onCancel()
end