--description: 唐门江津村唐元 50级任务
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld123 = GetTask(123)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetLevel() >= 90) and (Uworld123 < 10) and (Uworld37 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~= "tangmen") then		-- 任务启动条件：90级、是唐门记名弟子、任务未做过、声望等级5级
		Talk(2,"U123_get","最近不染师兄行踪诡异，也许我太多虑了，我总是感觉有什么危险在里面!","这样啊，我好像没感觉!")
	elseif (Uworld123 >= 10) and (Uworld123 < 255) then			-- 任务进行中
		Talk(1,"","千万不要传出去，不染师兄是门主最疼爱的一个，如果传到他耳朵里，我们恐怕性命难保!")
	elseif (UTask_tm == 50*256+40) then  				--50级任务
		Talk(7, "", "找我有什么急事吗?", "五师兄，昨晚你有去过暗器房吗?", "有啊，我是去做清洁的，打扫完就离开了!", "你有见到三师兄吗?", "说来奇怪，我昨晚在暗器房的后面看见一个人很像三师兄，我叫了他一声，哪知他急匆匆就走了，我还以为我认错了人呢!", "你可知三师兄现在何处?", "我早上出门的时候，看见他往 <color=Red>青城山<color>方向去了，可能去了<color=Red>响水洞<color>, 听说他在那里有些朋友.")
		SetTask(2, 50*256+60)
		Msg2Player(" 在江津村找到唐元，知道唐禾去了青城山的响水洞")
		AddNote("在江津村找到唐元，知道唐禾去了青城山的响水洞")
	elseif (UTask_tm == 50*256+60) then  
		Talk(1,"","三师兄可能去了<color=Red>响水洞<color>, 听说他在那里有些朋友.")
	else
		Talk(1,"","我父母早逝，是舅舅把我养大的，他是我最亲的人.")
	end
end;

function U123_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","算了，你没有什么本事，说这些只添麻烦罢了!")
	else
		Say("最近好像他心神不定?",2,"听一会就信一点/U123_get_yes","人家的事，不用太在意/no")
	end
end

function U123_get_yes()
	SetTask(123,10)
	Msg2Player("嫁祸一尘任务：调查唐不染的奇怪行踪")
	AddNote("嫁祸一尘任务：调查唐不染的奇怪行踪")
end

function no()
end
