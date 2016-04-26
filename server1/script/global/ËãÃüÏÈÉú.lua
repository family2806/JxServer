-- 算命先生.lua 看声望值的算命先生
-- By Dan_Deng(2003-11-11)

sexhead = {"少侠","女侠"}

Include("\\script\\global\\repute_head.lua")

function main()
	if (GetSex() == 0) then			-- 男女用不同的对话
		Say("张铁嘴：这位少侠气宇不凡，想不想知道少侠您的锦绣前程？只要500两银子。",2,"好，给我算一算/view_repute_yes","不用了/no")
	else
		Say("张铁嘴：这位姑娘貌美如花，想不想看看自己的美好未来呢？只要500两银子。",2,"好，给我算一算/view_repute_yes","不用了/no")
	end
end

function view_repute_yes()
	if (GetCash() < 500) then
		Talk(1,"","张铁嘴：又是一个没钱的，白费了半天口水。")		
		return 0
	end
	Pay(500)
	repute_exp = GetRepute()
	repute_lvl = GetReputeLevel(repute_exp)
	if (repute_lvl == -1) then			-- 出错时
		Talk(1,"","张铁嘴：自古英杰多苦难，现在你正受厄灵之困，致使你的江湖声望出现了错误。请去找天神赐福吧。")
	elseif (repute_lvl == 0) then
		Talk(2,"","张铁嘴：金龙岂是池中物，你现在虽然一介布衣，江湖人所不识，但假以时日，必将有惊天动地之能。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>平民百姓<color>。")
	elseif (repute_lvl == 1) then
		Talk(2,"","张铁嘴：神龙乍现人世间，你虽然初出茅庐，但必将迅速堀起，有识之士将会很快注意到你的力量。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>初出江湖<color>。")
	elseif (repute_lvl == 2) then
		Talk(2,"","张铁嘴：雏凤心有鸿鹄志，虽然在江湖中你还只是无名小辈，但超越凡辈对你而言只是触手可及之事。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>无名小辈<color>。")
	elseif (repute_lvl == 3) then
		Talk(2,"","张铁嘴：潜修十载无人问，在江湖中你仍然默默无闻，但潜质已经表露无遗，一飞冲天只是迟早之事。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>默默无闻<color>。")
	elseif (repute_lvl == 4) then
		Talk(2,"","张铁嘴：经历了众多磨练之后的你，已经在众人之前初初显露锋芒，江湖群侠已开始注意到你的堀起。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>初显锋芒<color>。")
	elseif (repute_lvl == 5) then
		Talk(2,"","张铁嘴：你已经渡过了最艰难困苦的阶段，你的名气开始影响到周围的人们，更多的人发现了你的能力。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>小有名气<color>。")
	elseif (repute_lvl == 6) then
		Talk(2,"","张铁嘴：你的堀起正在被越来越多的人重视，江湖中你的名头已经越来越响亮，人们开始真心实意地对你说“如雷贯耳”。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>名头响亮<color>。")
	elseif (repute_lvl == 7) then
		Talk(2,"","张铁嘴：你已成为大多数人眼中的高手，你所拥有的不俗实力使你的名头威镇一方。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>威镇一方<color>。")
	elseif (repute_lvl == 8) then
		Talk(2,"","张铁嘴：傲视群雄的强者可以主宰他人的生死。而你，在不懈努力和艰苦奋斗之下，已经成为了这样的强者。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>傲视群雄<color>。")
	elseif (repute_lvl == 9) then
		Talk(2,"","张铁嘴：你的声望如日中天，江湖为之景仰，尊你为一代宗师，武林大侠。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>一代宗师<color>。")
	else
		Talk(2,"","张铁嘴：身为江湖中的传说人物，江湖后进的奋斗目标，而你却如神龙见首不见尾一般随性而为。","张铁嘴：你现在的江湖声望是"..repute_exp.."，江湖人视你为<color=red>笑傲江湖<color>。")
	end
end

function no()
end
