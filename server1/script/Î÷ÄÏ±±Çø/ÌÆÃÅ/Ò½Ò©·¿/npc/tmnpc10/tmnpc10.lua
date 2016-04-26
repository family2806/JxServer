--西南北区\唐门\医药房\npc\tmnpc10.lua
--description: 唐门唐野 40级任务 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
-- Update: xiaoyang(2004\4\13)  加入90级五毒任务

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	Uworld124 = GetTask(124)
	if(GetFaction() == "tangmen") and (GetSeries() == 1) then
		if((UTask_tm == 40*256) and (GetLevel() >= 40) and (GetFaction() == "tangmen")) then		--40级任务启动
			Talk(4,"L40_get","我唐某人一生我行我素，只有一件事，直到今天仍然令老夫耿耿于怀", "老夫曾有一个莫逆之交叫耿子奇，十年前，耿子奇的妻子得了怪病，来求我医治，但是本门早有门规，非唐门中人，一律不得医治。老夫限于门规，不论耿子奇怎么哀求，坚持不肯出手相救，结果他的妻子不久后因病去世，我二人从此反目成仇 ", "前几日老夫收到了耿子奇的一封信，约老夫见面叙旧，我知道他是来找我报仇的，我欠他一条命，还给他本来也没有什么，只是老夫实在是无脸见故友啊! ", "师叔，此事原怪不得你，你应该向他解释清楚原因，让他明白你当年的难处.")
		elseif(UTask_tm == 40*256+40) then 
			Talk(3, "L40_step44", "唐野师叔，耿前辈的女儿得了和母亲同样的怪病，性命危在旦夕，如果你能够救活他的女儿，他一定不会再怪你的!", "可是门规.....", "师叔，你放心，我已经想出了一个好办法，你不必破坏门规也可以救人，只要你把药方告诉我就行!")
		elseif(UTask_tm == 40*256+80) then
			Talk(4, "L40_prise", "唐野师叔，你开的药方果然有效，耿前辈的女儿有救了！他已不再怪你!", "真的吗？太好了！不过他的女儿可不是我救的，而是你救的，你明白我的意思吗?", "明白！这事和师叔无关，是我做的! ", "你果然机灵，老夫没看错你，哈哈哈哈! ")
		elseif(UTask_tm > 40*256) and (UTask_tm < 40*256+60) then					--40级任务中普通对话
			Talk(1,"","<color=Red>耿子奇<color>一直隐居在<color=Red>青城山的西部<color>.")
		elseif(UTask_tm >= 40*256+60) and (UTask_tm < 50*256) then					--尚未完成40级任务
			Talk(1,"","药材一共有五种：<color=Red>蟾蜍的皮<color>，<color=Red>毒蛇的胆<color>、<<color=Red>罂粟的壳<color>、<color=Red>毒蝎的尾<color>、<color=Red>僵蚕的头<color>，这些药材在<color=Red>青城山东北<color>的<color=Red>青阳峰<color>比较多.")
		elseif(UTask_tm >= 50*256) and (GetFaction() == "tangmen") then					--已经完成40级任务，尚未出师
			Talk(1,"","你帮老夫化解了这段十年的恩怨，真不懂怎么感谢你")
		else
			Talk(1,"","朋友翻脸，真让人心疼!")
		end
	elseif (Uworld124 == 20) and (HaveItem(385) == 1) then
		Talk (2,"Uworld_wdutask","唐先生，这里有封信，请你过目!","把它扔了，我不看!")
	elseif (Uworld124 == 20) then
		Msg2Player("信是不是掉在路上了？快去找找")
	elseif (Uworld124 == 25) then
		Talk (15,"Uworld_wdutask2","什么事?","小子，你快丧命了，知道吗?","哦，在下愚昧!","如果我在五毒教没有内奸，今天就中云老儿的计了。这封信是不是云不邪让你带来的？","对.","哈哈，你中计了，这封信有无形的毒，外面什么也看不到，但是，打开的时候会扰乱经脉，云老二原本想害我，不把他人性命当回事.","呜呜，怎么办，先生?","不用担心，云老儿经常害我，是因为我经常救他害的人，你的病交给老夫.","唐野使用内功为你去毒，你感觉有千颗子弹打下了.","唐野：幸亏发现的早，不然你死定了.","感谢唐老爷.","不是白做的，你帮我带这封信回去，我已经放了其他毒药，只要你说是已经发现了他的阴谋，他就立刻打开信赖看，那时，会有人取他性命.","云不邪用毒害人，我一定不会放过他.","你喝完解药就上路吧.","好的")
	elseif(Uworld124 == 30 ) and (HaveItem(386) == 0) then
		Talk (1,"","小子，信在那里，小心点，云老贼不容易对付. ") 
		AddEventItem(386)
		Msg2Player("接受唐野的信 ")
	elseif(UTask_tm == 70*256) then							--已经出师
		Talk(1,"","有空来和我喝酒!")
	else										--未完成40级任务（缺省对话）
		Talk(1,"","唐某一言既出驷马难追!")
	end
end;

function L40_step44()
	SetTask(2, 40*256+60)
	AddNote("返回医药房见唐野，知道药方包括：蟾蜍的皮，毒蛇的胆，罂粟的壳，毒蝎的尾，僵蚕的头.")
	Msg2Player("去青城山，到青阳峰找药材")
	Talk(2,"", "事已如此，想治病需要的药材一共有五种：<color=Red>蟾蜍的皮<color>，<color=Red>毒蛇的胆<color>、<<color=Red>罂粟的壳<color>、<color=Red>毒蝎的尾<color>、<color=Red>僵蚕的头<color>，这些药材在<color=Red>青城山东北<color>的<color=Red>青阳峰<color>比较多，不过那里常有<color=Red>黑鹰<color>、<color=Red>凶鹫<color>、<color=Red>灵雕<color>出没，你要小心!")
end;

function L40_get()
	Say("他恨我，见死不救，怎么能听我解释.", 2, "化解两人之间的恩怨/L40_get_yes", "我不能帮你什么/L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","<color=Red>耿子奇<color>一直隐居在<color=Red>青城山的西部<color>.")
	SetTask(2, 40*256+20)
	AddNote("在医药房见唐野，接<color=red> 耿子奇任务<color>, 化解唐野和耿子奇之间的恩怨")
	Msg2Player("耿子奇任务：化解唐野和耿子奇之间的恩怨 ")
end;

function L40_get_no()
end;

function L40_prise()
	SetRank(29)
	SetTask(2, 50*256)
--	AddMagic(345)
	add_tm(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你升为入阁弟子，可以学到唐门寒冰刺武功. ")
	AddNote("到唐门药房，复命唐野，完成耿子奇任务，升为入阁弟子. ")
end;

function Uworld_wdutask()
	DelItem(385)
	Msg2Player("你扔了云不邪的信 ")
	SetTask(124,25)
end

function Uworld_wdutask2()
	AddEventItem(386)
	Msg2Player("毒素已解完，收到唐野的信，交给云不邪")
	AddNote("带唐野的回信给云不邪")
	SetTask(124,30)
end
