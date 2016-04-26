-- 用铜钱出售易容物品的NPC
-- Fanghao Wu
-- 2004.11.1

function main()

	Say("易容术士：这位客官，想要什么好东西直接去<color=yellow>奇珍阁<color>里挑就是了，老夫终于可以清闲清闲了呢！什么？不懂怎么去<color=yellow>奇珍阁<color>？直接点击<color=green>右下角的那个圆形的图标<color>就是了。", 0);
	return
	
	-- Say ( "易容术士：想学易容术？其实很简单，在我这买一个特制的易容面具我就可以教你。不同的面具可以易容成不同的样子，大侠要不要看一看？", 3, "购买/OnBuy", "暂时不买了/OnCancel", "关于易容面具/OnAbout" );
end

function OnBuy()
	Sale( 95, 3 );
end

function OnCancel()
end

function OnAbout()
	Say( "将任意面具装备到装备栏中<color=yellow>面具<color>一格，玩家人物的外貌改变为该面具对应的NPC形象，人物名称和所有属性均<color=yellow>不改变<color>，也<color=yellow>不影响<color>人物正常使用各种装备道具及功能。将面具从装备栏取下，人物外貌变回原来的样子，面具的使用次数<color=yellow>减少一次<color>。", 0 );
end