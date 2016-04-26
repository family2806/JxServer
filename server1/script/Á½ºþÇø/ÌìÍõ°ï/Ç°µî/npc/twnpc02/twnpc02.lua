--description: 天王帮前殿 王佐　天王10级任务
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3);
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 10*256) and (GetLevel() >= 10) then
			Say("你是新加入本帮的兄弟吧？要升为本帮的侍卫长，必须去<color=Red>天王岛山洞<color> 拿到<color=Red>三个鸡血石<color>. 你有胆量接受这个挑战吗?", 2, "当然有. /L10_get_yes", "在下想再多磨练一段时间/L10_get_no")
		elseif (UTask_tw == 10*256+20) and (GetItemCount(91) >= 3 ) then				--鸡血石数目至少为3
			L10_prise()
		elseif (UTask_tw > 10*256) and (UTask_tw < 10*256+50) then					--已经接到10级任务，尚未完成
			Talk(1,"","到 <color=Red>天王山洞<color> 拿到<color=Red>三个鸡血石<color> 之后再来找我!")
		else					--已经完成10级任务，尚未出师（缺省对话）
			Talk(1,"","本门兄弟都是有大抱负的，老夫最恨的就是鸡鸣狗盗之辈")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk(1,"","男子汉大丈夫行走江湖要顶天立地，你要是做了什么违背道义的事情老夫一定不放过你")
	else
		Talk(1,"","老夫视帮助为自己的亲生女儿，不论有什么事老夫都会尽力保护她")
	end
end;

function L10_get_yes()
	Talk(1,"","很好！这才是男子汉！到<color=Red>天王岛山洞<color> 拿到<color=Red>3颗鸡血石<color>之后再回来找我!")
	SetTask(3, 10*256+20)
	AddNote("在天王帮前殿(201, 198) 找王佐，接受 <color=red>鸡血石任务<color>, 到岛上的山洞找3颗鸡血石 ")
	Msg2Player("在天王帮前殿找王佐，接受鸡血石任务到岛上的山洞找3颗鸡血石 . ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","做得好！老夫封你为侍卫长！之后还有很多考验等着你，你要继续努力")
	for i = 1, (GetItemCount(91)) do DelItem(91) end
	SetTask(3, 20*256)
	SetRank(44)
	add_tw(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
--	AddMagic(26)
--	AddMagic(23)
--	AddMagic(24)
	Msg2Player("恭喜你被封为侍卫长。学会天王锤法，天王枪法，天王刀法. ")
	AddNote("回到前殿，把3颗鸡血石交给王佐，完成鸡血石任务，被封为侍卫长")
end;
