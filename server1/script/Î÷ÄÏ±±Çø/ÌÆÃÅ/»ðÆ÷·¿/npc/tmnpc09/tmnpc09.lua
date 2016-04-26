--description: 唐门唐云 30级任务 
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 1)) then		--30级任务
			L30_prise()
		elseif (UTask_tm >= 40*256) and (GetFaction() == "tangmen") then					--已经完成30级任务，尚未出师
			Talk(1,"","你帮我报此大仇，你说，你要什么，我全都给你!")
		else								--没有完成30级任务（缺省对话）
			Talk(1,"","小川，我可怜的孩子……此仇此恨，一天不报，我死不瞑目!")
		end
	elseif (UTask_tm >= 70*256) then							--已经出师
		Talk(1,"","江湖险诈，你孤身一人行走江湖，要多加小心! ")
	else
		Talk(1,"","我平身最恨杀人抢劫的土匪!")
	end
end;

function L30_prise()
	Talk(2, "", "唐云师叔，我已经找到那些绑匪，替你报了仇，这是夺回的《火器谱》，只要你把它交给掌门，就不会再受责罚了!", "我总算等到这一天了，你说，你要什么，我全都给你!")
	DelItem(42)
	SetRank(28)
	SetTask(2, 40*256)
--	AddMagic(50)
--	AddMagic(54)
--	AddMagic(47)
--	AddMagic(343)
	add_tm(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你升为唐门阶前护卫，学到追心箭，漫天花语，穿心刺. ")
	AddNote("回到火器房，交火器谱给唐云，完成火器谱任务，升为阶前护卫")
end;
