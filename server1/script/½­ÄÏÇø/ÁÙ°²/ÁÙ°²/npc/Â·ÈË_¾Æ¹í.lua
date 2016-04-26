-- 临安　路人　酒鬼
-- by：Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
	i = random(0,6)
	Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 ~= 0 ) then
		branch_zuihan()
	else
		if (i == 0) then
			Talk(1,"","酒鬼：晋中汾酒，酒液纯净透明，清香雅郁，入口醇厚绵柔而甘冽，余味清爽，回味悠长。")
		elseif (i == 1) then
			Talk(1,"","酒鬼：绵竹剑南春，酒液清澈透明，芳香浓郁，酒味醇厚，醇和回甜，酒体丰满，香味协调，清洌净爽，余香悠长。")
		elseif (i == 2) then
			Talk(1,"","酒鬼：陕西西凤酒，酒液清亮透明，醇香芬芳，清而不淡，浓而不艳，回味舒畅，风格独特。有酸而不涩，苦而不黏，香不刺鼻，辣不呛喉，饮后回甘、味久而弥芳之妙。")
		elseif (i == 3) then
			Talk(1,"","酒鬼：遵义咂酒，酒液清澈透明，香气幽雅舒适，既有大曲酒的浓郁芳香，又有小曲酒的柔绵、醇和、回甜，还有淡雅舒适的药香和爽口的微酸，入口醇和浓郁，饮后甘爽味长。")
		elseif (i == 4) then
			Talk(1,"","酒鬼：贵州茅台，酒质晶亮透明，微有黄色，酱香醇馥幽郁，令人陶醉，敞怀不饮，香气扑鼻，开怀畅饮，满口生香，饮后空杯，留香更大，持久不散。口味幽雅细腻，酒体丰满醇香，回味悠长，茅香不绝。")
		elseif (i == 5) then
			Talk(1,"","酒鬼：酒鬼我毕生最大的心愿就是喝便天下美酒，只要能够达此心愿，虽死无憾。")
		else
			Talk(1,"","酒鬼：要知道，品酒乃是人生一种至高的境界，唉！说了你也不懂。")
		end
	end
end;
