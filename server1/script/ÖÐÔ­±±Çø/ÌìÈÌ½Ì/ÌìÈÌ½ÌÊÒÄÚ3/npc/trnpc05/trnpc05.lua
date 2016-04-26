--description: 天忍教风堂堂主完颜雪衣
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)
-- Update: xiaoyang(2004\4\12) 加入90级门派任务

Include("\\script\\global\\skills_table.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_tr = GetTask(4);
	Uworld127 = GetTask(127)
	if(GetSeries() == 3) and (GetFaction() == "tianren") then
		if(UTask_tr == 30*256) and (GetLevel() >= 30) then
			Say("再过几日就是我母后――大金皇后的生日了，本堂主打算做一件金镂玉衣给母后作为贺礼，但是还缺四种宝石 <color=Red>鸽血红、冰晶蓝、祖母绿、云梦紫color>. 我听说在 <color=Red>秦陵里<color> 有许多价值连城的宝石，你愿意帮我去找找吗?", 2, "为公主效劳荣幸之至/L30_get_yes", "属下还有一个事/L30_get_no")
		elseif(UTask_tr == 30*256+20) and (HaveItem(59) == 1) and (HaveItem(60) == 1) and (HaveItem(61) == 1) and (HaveItem(62) == 1) then
			L30_prise()
		elseif(UTask_tr > 30*256) and (UTask_tr < 40*256) then					--已经接到30级任务，尚未完成
			Talk(1,"","你可以叫 <color=Red>乌堂主 color> 带到 <color=Red>秦陵<color>, 记得4种宝石<color=Red>鸽血红<color>, <color=Red>冰晶蓝<color>, <color=Red>祖母绿<color>, <color=Red>云梦紫 color>.")
		else					--已经完成30级任务，尚未出师（缺省对话）
			Talk(1,"","父王需要我帮助收复武林中原，如果天忍教不能得到我父王的帮助，就不能这么发展.")
		end
	elseif(Uworld127 == 10) and (HaveItem(374) == 1) then
		Talk(15,"Uworld127_killer","恭敬七公主殿下","他从哪里来，为什么来?你想死啊","在下不敢拿自己的性命开玩笑.","啊，你真是大胆，来人，拉出去喂狗.","听说公主找一只大雕？嗯，你知道哪里有吗?","虽然在下不懂，但是只需要你答应一个条件，我就立刻能抓到它!","又是一个喜欢吹的家伙.","大金兵马雄厚，怎么不怕死？我怎么敢欺骗七公主?","你要什么条件?","在我回来的时候，不能杀府内任何人","真是好笑，如果一年后你还没回来，怎么办?","我保证一个月回来.","好，君子一言。一个月后，如果不见你，就杀完他们!","没有那一天.")
	elseif(Uworld127 == 10) then
		Talk(1,"","没有令牌，你敢进公主府？真是胆大，原谅你不是恶意，快离开这里，下一次不要怪我.")
	elseif(Uworld127 == 20) and (HaveItem(374) == 0) then
		Talk(1,"","这小子，快滚。快走，不然割了你的腿")
	elseif(Uworld127 == 30)and(HaveItem(369) == 1) then
		DelItem(369)
		Talk(6,"Uworld127_over","雪衣公主，这是你要的大雕.","好，好。你果然不错","但是，还是有人想要取我的头.","不要和他们计较，以后你跟着我就行了.","请原谅，在下行走江湖惯了，不想跟谁了",".....敢在我面前这样说，只有一个人.")
	elseif(Uworld127 == 30) then
		Talk(1,"","大雕呢？拿到快点拿出来")
	elseif(Uworld127 == 255) then
		if(GetSex() == 0) then
			Talk(1,"","好姐姐，下次来和雪衣玩.")
		else
			Talk(1,"","好哥哥，下次来和雪衣玩.")
		end
	elseif(UTask_tr >= 70) then							--已经出师
		Talk(1,"","你真是少有的英雄，希望我们是兄弟，不是仇人，有机会我向父王推荐你，服务大金，要让南朝皇帝赔命")
	else
		Talk(1,"","天忍教教主是大金国师，父王很重用他，所以，让我加入本教做堂主")
	end
end;

function L30_get_yes()
	Talk(1,"","风堂堂主太好了，但是听说去秦陵的路很危险，很多人去找珠宝都丧命了，你可以到汴京去找车夫，但是 <color=Red>乌堂主<color> 熟悉西边区域，你可以让他带你去.")
	SetTask(4, 30*256+20)
	AddNote("在天忍教第三层见风堂堂主完颜雪衣(213, 201) , 接 <color=red>宝石任务<color>. 去秦陵找4种宝石")
	Msg2Player("在天忍教第三层见风堂堂主完颜雪衣(213, 201) , 接 <color=red>宝石任务<color>. 去秦陵找4种宝石")
end;

function L30_get_no()
	Talk(1,"","..........?")
end;

function L30_prise()
	Talk(1,"","你真是厉害，这种宝石也能找到，母后一定很喜欢这件玉衣!")
	SetRank(58)
	DelItem(59)
	DelItem(60)
	DelItem(61)
	DelItem(62)
	SetTask(4, 40*256)
--	AddMagic(141)
--	AddMagic(138)
--	AddMagic(140)
	add_tr(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("把四种宝石拿给风堂堂主完颜雪衣，完成宝石任务. 被封：幽冥子士，学到武功：烈火晴天，推山填海，飞鸿无寂. ")
	AddNote("回天忍教，把四种宝石拿给风堂堂主完颜雪衣，完成宝石任务. 被封：幽冥子士。")
end;

function Uworld127_killer()
	DelItem(374)
	SetTask(127,20)
	AddNote("接任务：到剑阁抓大雕")
	Msg2Player("接任务：到剑阁抓大雕")
end

function Uworld127_over()
	if (GetTask(4) >= 70*256) and (GetTask(4) ~= 75*256) then		-- 是天忍出师弟子
		Talk(2,"","天忍秘书交给你，如果拒绝，我就杀了你，绝不食言.","既然如此，在下不得不接受.")
		if (HaveMagic(361) == -1) then		-- 必须没有技能的才给技能
      	AddMagic(361,1)
		end
		if (HaveMagic(362) == -1) then		-- 必须没有技能的才给技能
   	   AddMagic(362,1)
		end
		if (HaveMagic(391) == -1) then		-- 必须没有技能的才给技能
	      AddMagic(391)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("把大雕给完颜雪衣，学到云龙击，天外流星，摄魂乱心。回去报信给刘老爷. ")
		SetTask(127,110)
	else
		Talk(1,"","好，下次记得来看雪衣!")
		SetTask(127,100)
		Msg2Player("把大雕给完颜雪衣，回去报信给刘老爷")
	end
end
