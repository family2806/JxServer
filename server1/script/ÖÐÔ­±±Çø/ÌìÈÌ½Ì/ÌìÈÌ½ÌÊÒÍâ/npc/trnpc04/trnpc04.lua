--description: 天忍教小男孩
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+30) then
		AddNote("在广场东边树林里找到小男孩，回答他的谜语")
		Msg2Player("在广场东边树林里找到小男孩，回答他的谜语")
		Talk(3, "L20_Q1", "小朋友，把日月双轮还给刚才那个大哥哥，好不好?", "要我还日月双轮也行，不过要看你是不是比刚才那个笨蛋聪明一点?","这次的问题和其他不同，你听好了")
	elseif (UTask_tr == 20*256+40) then 
		L20_Q1()
	elseif (UTask_tr == 20*256+50) then
		if (HaveItem(125) == 1) and  (HaveItem(126) == 1) then
			Talk(1,"","啊，小黄！小灰！你们太不乖了，下次不许乱跑了！这两个破轮子既不能吃又不能穿，除了好看以外一点用也没有，只有你们这些傻瓜才把它当成宝贝，还给你吧.")
			DelItem(125)
			DelItem(126)
			AddEventItem(58)
			Msg2Player("把小黄和小灰还给小男孩，换取日月双轮. ")
			SetTask(4, 20*256+80)
			AddNote("把小黄和小灰还给小男孩，换取日月双轮. ")
		else							--已经回答问题，尚未找到小黄狗和小灰驴
			Talk(1,"","如果你能帮我找回丢失的<color=Red>小黄狗<color>和<color=Red>小灰驴<color>，我就把日月双轮还给你.")
		end
	elseif (UTask_tr == 20*256+80) and (HaveItem(58) == 0) then
		AddEventItem(58)
		Talk(1,"","日月双轮拿去吧.")
	else				-- 缺省对话
		if (random(0,1) == 0) then
			Talk(1,"","我的小黄狗和小灰驴既能干又忠心，而且从来不说废话，天底下没有比它们更好的啦!")
		else
			Talk(1,"","我有一只小黄狗和一头小灰驴，它们可乖啦，是我最好的伙伴.")
		end
	end
end;

function L20_Q1()
	Say("一家有兄弟三个，其中只有一个喜欢说真话，大哥说二哥吹牛，二哥说小弟吹牛，而小弟听了后说大哥和二哥都吹牛，你知道这三人中，究竟谁说的是真话吗?", 3, "大哥/no", "二哥/L20_Q1_true", "小弟 /no")
end;

function L20_Q1_true()
	Talk(1,"","恩....虽然你比他聪明一点，但是除非你帮我找回丢失的<color=Red>小黄狗<color>和<color=Red>小灰驴<color>，我才会把日月双轮还给你.")
	SetTask(4, 20*256+50)
	AddNote("回答正确，小男孩要求你帮他找小黄狗和小灰. ")
	Msg2Player("回答对小男孩的问题后，他要求你帮他找小黄狗和小灰. ")
end;

function no()
	Talk(1,"","你就像那个人一样，都是愚蠢的人")
	SetTask(4, 20*256+40)
end;
