-- 文件名　：xmas2007_giftbox.lua
-- 创建者　：zhongchaolong
-- 创建时间：2007-11-26 14:42:26

--时间：2008 年01 月13 日 24：00
--时限：2008 年01 月31 日 24：00
--可以：交易，扔掉，摆摊，卖店 = 0 两，叠加50个/位
--使用: 右键点击使用获得各类冰晶

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
xmas2007_GiftBox_tbItemList =
{
	--名称,{物品Prop},概率%,
	{"金冰晶",{6,1,1628,1,0,0},10},
	{"木冰晶",{6,1,1629,1,0,0},15},
	{"水冰晶",{6,1,1630,1,0,0},20},
	{"火冰晶",{6,1,1631,1,0,0},25},
	{"土冰晶",{6,1,1632,1,0,0},30},
}

function main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Msg2Player("物品已过使用期，将消失.")
		return 0;
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_GiftBox_tbItemList);
end


