--description: 唐门唐不染 30级任务 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>祭祖厅是祭祀本派列祖列宗的，常人不得进入!"
	G_TASK:OnMessage("唐门", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("我来有其他事情", main2)
	tbDailog:Show() 
end

function main2()
	UTask_tm = GetTask(2)
	Uworld123 = GetTask(123)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then		-- 唐门门派任务
		if (UTask_tm == 30*256) and (GetLevel() >= 30) then		--30级任务启动
			Talk(3, "L30_get", "<color=Red>火器房<color>的<color=Red>唐云<color>师叔真可怜，两年前，一伙来历不明的人绑架了他的独生子小川，要挟他交出本门秘笈<color=Red> 《火器谱》 <color>。", "唐云师叔不敢违背门规，结果第二天那伙人就送来了小川的手臂，师叔只有这么一个儿子，肝胆俱裂之下不得已交出了《火器谱》。可是没想到换来的却是小川的尸首，师叔伤痛欲绝，发誓一定要手刃仇敌。", "但是由于唐云师叔泄漏了唐门秘笈，必须接受门规处罚，所以他终生不能再离开唐门半步，此仇此恨恐怕今生都报不了了！!")
		elseif (UTask_tm == 30*256+50) then
			Talk(2, "", "我已经找到了绑架唐云师叔儿子的匪徒，夺回了<color=Red>《火器谱》<color>.", " 太好了，<color=Red>唐云<color>师叔一定会感到欣慰的，你快去把<color=Red>《火器谱》<color>交给他，他就在<color=Red>火器房<color>里.")
			Msg2Player("回祭祖厅找唐不染，知道唐云师叔正在火器房")
			SetTask(2,30*256+60)
		elseif (UTask_tm == 30*256+60) then
			Talk(1, "", "师叔一定会感到欣慰的，你快去<color=Red>火器房<color>告诉他这个好消息!")
		elseif (UTask_tm > 30*256) and (UTask_tm < 40*256) then					--已经接到30级任务，尚未完成
			Talk(1,""," 我已暗中探察过，那伙绑匪好像经常出没在<color=Red>青城山东边白云洞<color>一带.")
		elseif (UTask_tm >= 40*256) then					--已经完成30级任务，本门弟子
			Skill150Dialog("你能帮唐云师叔洗脱冤屈，看来我要对你刮目相看了!")
		else		
			Skill150Dialog("这祭祖厅是本门拜祭列祖列宗的地方，寻常人等不得擅入!")
		end
	elseif (Uworld123 == 10) then											-- 唐门90级技能任务
		Say("可以帮我带一封信吗?",2,"遵命!/Uworld123_get","真是不好意思，掌门刚刚叫我过去他那里. /L30_get_no")
	elseif (Uworld123 == 20) and (HaveItem(379) == 0) then		-- 唐不染任务，道具丢了
		Talk(1,"","你真是.., 信还未拿就跑了!")
		AddEventItem(379)
		Msg2Player("接唐不染的信")
	elseif (Uworld123 == 30) and (HaveItem(380) == 1) then		-- 唐不染任务，开打
		Talk(3,"Uworld123_step2","哈哈哈，果然妙计，让唐一尘死无葬身之地!","你是谁？怎么不是阿才?","你听到了秘密，想活命也不行了，看招!")
	elseif (Uworld123 == 40) then											-- 没打完，继续打
		Talk(1,"Uworld123_step2","别跑，看招!")
	elseif (Uworld123 == 50) then
		if (GetSex() == 0) then
			sexstr = "大侠 "
		else
			sexstr = "女侠"
		end
		Talk(8,"Uworld123_step3","公子何须忧虑，虽然我和公子不亲，但是，也不会坏了公子的事 ","你，你. ","公子身为唐家堡少主，我虽不才，但是，不帮公子，难道去帮他人吗？","不错，正如英雄所说，请问尊姓大名? ","在下"..GetName().."啊","原来如此 "..GetName()..sexstr.."久闻大名，没想到今天在这相遇. ","大侠如此支持我，不知能否将此书带给端木瑞？此书对我来说，极其重要。事情重大，不能靠他人了. ","小事一桩，交给我就行了. ")
	elseif (Uworld123 == 60) and (HaveItem(377) == 0) then		-- 秘笈丢了
		if (GetSex() == 0) then
			Talk(1,"","大侠忘记带秘笈了!")
		else
			Talk(1,"","少侠忘记带秘笈了!")
		end
		AddEventItem(377)
		Msg2Player("拿到唐门秘笈")
	elseif (Uworld123 == 70) or (Uworld123 == 75) then			-- 任务完成
		Talk(1,"Uworld123_prise","哈哈哈，我等你的好消息，真是感谢你!")
	elseif (Uworld123 >= 10) and (Uworld123 < 80) then		-- 唐不染任务进行中
		Talk(1,"","我说的，你赶紧去做，不要浪费时间!")
	elseif (GetTask(51) >= 90) then		-- 一尘“洗清冤屈”任务之后，对话改变
		Talk(1,"","为什么他得到宠爱，而我却不能？真是不公!")
	elseif (Uworld123 >= 80) then									-- 唐不染任务已经完成
		Talk(1,"","这次多亏了你，我成为掌门后，一定不会忘记你的!")
	elseif (UTask_tm >= 70*256) then							--已经出师
		Skill150Dialog("我想出去，但是，父亲不同意?")
	else
		Skill150Dialog("这祭祖厅是本门拜祭列祖列宗的地方，寻常人等不得擅入!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("唐门", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get()
--	DelItem(42)							--防止重接任务后，玩家捡起任务道具
	Say(" 唐云师叔曾经说过，不管是谁，只要能帮他报杀子之仇，夺回<color=Red>《火器谱》<color>，他会倾尽所有报答这个人!", 2, "寻找绑匪 /L30_get_yes", "不关我事!/L30_get_no")
end;

function L30_get_yes()
	Talk(1,""," 我已暗中探察过，那伙绑匪好像经常出没在<color=Red>青城山东边白云洞<color>一带.")
	SetTask(2, 30*256+20)
	AddNote("见唐不染在( 514, 318) , 接<color=Red>火器谱任务<color>, 帮唐云师叔夺回火器谱")
	Msg2Player("接火器谱任务，帮唐云师叔夺回火器谱")
end;

function Uworld123_get()
	Talk(1,"","好，快替我带这封信到汴京给白公子，快去快回!")
	SetTask(123,20)
	Msg2Player("接任务：替唐不染带信给白公子")
	AddEventItem(379)
	Msg2Player("收到唐不染的信")
end

function Uworld123_step2()
	DelItem(380)
	SetTask(123,40)
	SetFightState(1)
	NewWorld(229,1616,3195)
end

function Uworld123_step3()
	AddEventItem(377)
	SetTask(123,60)
	Msg2Player("拿到唐门秘笈. ")
end

function Uworld123_prise()
	AddRepute(10)
	Earn(20000)
	if (GetTask(123) == 70) then			-- 不是本门
		SetTask(123,245)
	else
		SetTask(123,255)
	end
	Msg2Player("任务完成，奖励2万两，信誉增加10点. ")
	AddNote("任务完成，奖励2万两，信誉增加10点. ")
end

function L30_get_no()
end;
