--description: 天忍教日月坛主
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	Uworld51 = GetTask(51)
	if (Uworld51 == 50) then		-- 洗清冤屈任务进行中
		Talk(5,"Uworld51_55","南兵奸诈，我们此次离间计也不输给他们，哈哈。他们自相残杀，泄露秘籍给我们，南朝人才已尽，有什么好怕的？","听说上次杀了几个少林弟子让他们和唐门陷入恐慌，这次再杀几个...恩，丐帮老是和我们作对，这次杀丐帮弟子。对了，在进菊洞伏击他们.","你是谁？来这里做什么?","在下刚来，就遇到大名鼎鼎、玉树临风、聪明绝顶、武功天下第四的日月坛主乌坛主，一时激动。好久不见坛主了，越来越威风了.","哈哈哈，好.")
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 20*256) and (GetLevel() >= 20) then
			AddNote("在天忍教广场见日月坛主乌合萨，回答他的问题. ")
			Msg2Player("在天忍教广场见日月坛主乌合萨，回答他的问题. ")
			Talk(8,"L20_get_test","哎呀，丢完了，没有脸见人了.....","什么事?","我被欺负了!","乌坛主武功盖世，谁敢欺负你？","一个小孩!","小孩?","我在东边树林里遇到一个小孩，那小鬼问我一个问题，但是我回答不了，所以，把日月双轮输给他了。此事如果传到外面，会被人笑死。虽然我武功高强，但是不能拿回来，怎么还有脸面在江湖上闯呢?","问题到底是怎么样?")
		elseif (UTask_tr == 20*256+10) then 
			L20_get_test()
		elseif (UTask_tr == 20*256+20) then 
			L20_get()
		elseif (UTask_tr == 20*256+80) and (HaveItem(58) == 1 ) then
			L20_prise()
		elseif (UTask_tr == 30*256+20) then	--接到30级任务，要直接切换到秦始皇陵
			Say("想我送你去秦始皇陵？没问题，先拿五百两银子来!", 2, "麻烦你送我一程 /L30_deliver_yes", "我还是自己走吧! /L30_deliver_no")
		elseif (UTask_tr == 40*256+20) then	--接到40级任务，要直接切换到剑阁中原
			Say("想我送你去秦始皇陵？没问题，先拿七百两银子来!", 2, "麻烦你送我一程 /L40_deliver_yes", "我还是自己走吧! /L40_deliver_no")
		elseif (UTask_tr >= 20*256+30) and (UTask_tr < 20*256+80) then					--已经接到20级任务，尚未完成
			Talk(1,"","那小鬼就在<color=Red>东面的树林<color>里，替我好好教训他")
		elseif (UTask_tr >= 30*256) then					--已经完成20级任务，尚未出师
			Talk(1,"","虽然你的武功没有我厉害，不过你能帮我夺回日月双轮，我也服气你!")
		else
			Talk(4, "", "知道我是谁吗？我就是玉树临风、聪明绝顶、武功天下第四的日月坛主乌合萨!", "武功天下第四?", "是啊，我们教主武功天下第一，除了教主、耶律辟离和端木睿以外，我就是最厉害的啦！怎么样？你服不服气？不服气的话就让你尝尝我日月双轮的厉害!", "服气！服气!")
		end
	elseif (GetTask(30) == 5) then		--接到禹王剑任务，要直接切换到华山
		Say("想我送你去秦始皇陵？没问题，先拿五百两银子来!", 2, "麻烦你送我一程 /L30_deliver_yes", "我还是自己走吧! /W30_deliver_no")
	elseif (UTask_tr >= 70*256) then							--已经出师
		Talk(1,"","你要走啦？我会想你的，呜呜呜")
	else
		Talk(4, "", "知道我是谁吗？我就是玉树临风、聪明绝顶、武功天下第四的日月坛主乌合萨!", "武功天下第四?", "是啊，我们教主武功天下第一，除了教主、耶律辟离和端木睿以外，我就是最厉害的啦！怎么样？你服不服气？不服气的话就让你尝尝我日月双轮的厉害!", "服气！服气!")
		end
end;

function L20_get_test()
	Say("有一头头朝北的牛，先向右转原地转三圈，然后向后转原地转三圈，接着再往右转，这时候它的尾巴朝哪?", 5, "朝东/L20_get_fail", "朝南/L20_get_fail", "朝西/L20_get_fail", "朝北 /L20_get_fail", "朝地 /L20_get_pre")
end;

function L20_get_fail()
	SetTask(4, 20*256+10)
	Talk(1,"","原来你也不知道啊，真是个笨蛋!")
end;

function L20_get_pre()
	SetTask(4,20*256+20)
	Talk(2, "L20_get", "哈哈哈，这个问题太简单啦！不管那头笨牛怎么转，它的尾巴都是朝地的呀!", "! 哇！你太聪明啦！不如你去帮我教训教训那个小鬼，找他要回<color=Red>日月双轮<color> .")
end;

function L20_get()
	Say("就算我求你了，帮帮忙吧?", 2, "好吧，我试试/L20_get_yes", "我还有别的事. /L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","太好了！那小鬼就在<color=Red>东面的树林<color>里，替我好好教训他")
	SetTask(4, 20*256+30)
	AddNote("聪明小孩任务：找到小孩，拿到日月双轮给乌合萨. ")
	Msg2Player("聪明小孩任务：找到小孩，拿到日月双轮给乌合萨. ")
end;

function L20_get_no()
	Talk(1,"","连你都不肯帮我，我还能找谁啊，呜呜呜.")
end;

function L20_prise()
	Talk(1,"","你帮我要回日月双轮，简直就是我的救命恩人啊！不不不，你简直就是我的再生父母!")
	SetRank(57)
	DelItem(58)
	SetTask(4, 30*256)
--	AddMagic(137)
	add_tr(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("你升为天忍死士，学到幻影飞狐 ")
	AddNote("把日月双轮给乌合萨，完成聪明小孩任务，升为死士")
end;

function W30_deliver_yes()		--禹王剑任务，要直接切换到华山
	if (GetCash() >= 300) then
		Pay(300)
		NewWorld(2, 2288, 4091)
	else
		Talk(1,"","没有银子可请不到我大名鼎鼎、玉树临风、聪明绝顶、武功天下第四的日月坛主乌合萨.")
	end
end;

function W30_deliver_no()
	Talk(1,"","这点银子能买到什么?")
end;

function L30_deliver_yes()	--天忍30级任务，要直接切换到秦始皇陵
	if (GetCash() >= 500) then
		Pay(500)
		NewWorld(7, 2235, 2847)
	else
		Talk(1,"","谁都知道，没有银子可请不到我大名鼎鼎、玉树临风、聪明绝顶、武功天下第四的日月坛主乌合萨.")
	end
end;

function L30_deliver_no()
	Talk(1,"","破财消灾听说过没有？这么点银子也舍不得花，小心命丧中途啊!")
end;

function L40_deliver_yes()	--40级任务，要直接切换到剑阁中原
	if (GetCash() >= 700) then
		Pay(700)
		NewWorld(43, 1695, 3200)
	else
		Talk(1,"","谁都知道，没有银子可请不到我大名鼎鼎、玉树临风、聪明绝顶、武功天下第四的日月坛主乌合萨.")
	end
end;

function L40_deliver_no()
	Talk(1,"","那你慢慢走吧，小心迷路，嘿嘿!")
end;

----------------------- 世界任务 --------------------------
function Uworld51_55()
	SetTask(51,55)
	Msg2Player("偷听乌合萨说话，此事果然由天忍教做，快回去报信. ")
end
