
--可以：丢弃，交易，摆摊，卖店（0两），叠加 
--物品上的说明：
--“ 中秋节赏月时吃的一种特别月饼”
--使用方法：右键点击使用
--使用截止时间： 2008年10月31日24点
--限制： 
--50级以上的充值玩家才能使用
--未使用过明月酒道具则每个角色最多只能通过2种月饼【 见月月饼 】和【 赏月月饼 】获得15亿经验；使用明月酒道具后则最多能通过2种月饼获得30亿经验。
--zhongchaolong

zhongqiuyubing_tbAward = 
{
	{nExp = 1000000},
	{
		{szName="3级玄晶矿石", tbProp={6, 1, 147, 3, 0, 0}, nRate = 5},
		{szName="4级玄晶矿石", tbProp={6, 1, 147, 4, 0, 0}, nRate = 3},
		{szName="5级玄晶矿石", tbProp={6, 1, 147, 5, 0, 0}, nRate = 2},
		{nRepute = 1, nRate = 24.697},
		{nRepute = 2, nRate = 25},
		{nRepute = 3, nRate = 20},
		{nRepute = 10, nRate = 3},
		{nRepute = 50, nRate = 0.2},		
		{szName="定国钨砂发冠", nQuality=1, tbProp={0, 160}, nRate = 0.008},
		{szName="定国青纱长衫", nQuality=1, tbProp={0, 159}, nRate = 0.01},
		{szName="定国银蚕腰带", nQuality=1, tbProp={0, 163}, nRate = 0.070},
		{szName="定国赤绢软靴", nQuality=1, tbProp={0, 161}, nRate = 0.015},
		{szName="定国紫藤护腕", nQuality=1, tbProp={0, 162}, nRate = 0.1},
		{szName="寒铁荣誉令牌", tbProp={6, 1, 1257, 1, 0, 0}, nRate = 5},
		{szName="青铜荣誉令牌", tbProp={6, 1, 1256, 1, 0, 0}, nRate = 3},
		{szName="白银荣誉令牌", tbProp={6, 1, 1255, 1, 0, 0}, nRate = 1.5},
		{szName="黄金荣誉令牌", tbProp={6, 1, 1254, 1, 0, 0}, nRate = 0.2},	
		{szName="武林秘籍", tbProp={6, 1, 26, 1, 0, 0}, nRate = 0.1},
		{szName="洗髓经", tbProp={6, 1, 22, 1, 0, 0}, nRate = 0.1},
		{szName="神秘大红包", tbProp={6, 1, 402, 1, 0, 0}, nRate = 7},
	}
}
nCellFreeLimit = 10
Include("\\script\\item\\zhongqiu_jieri\\200808\\yuebing.lua")