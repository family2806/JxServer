-- 功能：紫色装备系统 - 紫色装备及黄金装备铸造

Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\compound\\atlas.lua" );
function onFoundry()
	Say( "铁匠：如果大侠想要一身称心的装备，就备齐材料来找我。我能帮您铸造出最适合你的物品。", 4, "开始铸造/onFoundryItem", "关于铸造/onAbout", "铸造查询/onQueryPiece","我再想想/onCancel");
end

-- 开始铸造
function onFoundryItem()
	if( isCompoundableToday() == 1 ) then
		FoundryItem();
	else
		Say( "铁匠：老夫本日已经筋疲力尽了，侠士还是明日再来铸造装备吧。", 1, "好，那我先告辞了/onCancel" );
	end
end

function onQueryPiece()
	QueryPiece()
end
-- 关于铸造
function onAbout()
	Talk( 3, "onAbout2", "用属性矿石，玄晶矿石，紫色装备，黄金图谱等特殊的材料，可以铸造出紫色装备以及黄金装备。装备铸造分：提炼、打造、提取、镶嵌和图谱5个部分。如果收集齐了需要的各种材料就可以来我这里铸造了。", "<color=yellow>玄晶矿石<color>：一种特殊的矿石，提取、打造、镶嵌和融合的必须材料之一，用以提升各铸造过程中生成物品的属性品质或者成功率。共10级，等级越高，提升的效果越好。", "<color=yellow>属性矿石<color>：用属性原矿和对应位置上有属性的蓝色装备一起提取，有一定概率得到该属性的属性矿石。如果使用的是暗属性原矿，则蓝色装备的五行属性必须跟属性原矿的五行属性相同。属性矿石共10级，等级越高镶嵌出来的属性数值就可能越高。" );
end

function onAbout2()
	Talk( 2, "", "<color=yellow>紫色装备<color>：用一件蓝色/白色的装备跟一颗玄晶矿石一起打造，有一定概率得到一件带有1~5次镶嵌机会的紫色装备。装备的其他各项属性与使用的材料装备相同。", "<color=yellow>黄金图谱<color>：每件黄金装备都有一张对应的黄金图谱，按照图谱上写明的要求找齐所有的材料，就有一定概率可以融合出该件黄金装备。" );
end

-- 取消
function onCancel()
end