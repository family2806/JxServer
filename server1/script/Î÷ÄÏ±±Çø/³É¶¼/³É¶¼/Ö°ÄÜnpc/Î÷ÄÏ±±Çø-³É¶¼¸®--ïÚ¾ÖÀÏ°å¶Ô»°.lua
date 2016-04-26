--description: 西南北区成都府镖局老板 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Say("一剑横跨天地，没有谁是对手，你来有什么事？",3,"我来做支线任务/branch_branchlengqiang","我来做峨眉派的40级任务/emei_fourtytask","没事，仰慕，所以来看看!/no")
end;

function branch_branchlengqiang()
Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 >= 60 and Uworld1055 <= 120 ) then
			branch_lengqiang()
	else
		Talk(1,"","谁都认为保镖很舒服，事实上，每次出去，都不敢说哪天能回来!")
	end
end

function emei_fourtytask()
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+40) then 							--峨嵋派40级任务
		Talk(6, "", "听说贵镖局藏有一幅宋徽宗的《芙蓉锦鸡图》我想买，请问要多少银子!", "镖局老板：好大的口气！你知道那幅图的价值吗？多少银子也不卖 ","你们行货运镖的人要一幅画做什么？不如让给我吧，要什么条件只管开口!", "你倒是爽快，好！只要你能为我找来三样东西，我就把《芙蓉锦鸡图》拱手相让.", "哪三样东西?", "<color=Red>灵麝香囊<color>、<color=Red>鹰睛护身符<color>和<color=Red>碧玺戒指<color>，全是保护我们行镖顺利的吉祥玩意儿，不过，可不大好找哦!")
		SetTask(1, 40*256+50)
		SetTask(29,0)				-- 开始子任务之前先清零
		AddNote("与镖局老板对话，接任务，进城找灵麝香囊，鹰睛护身符和碧玺戒指.")
		Msg2Player(" '镖局老板要你去找灵麝香囊，鹰睛护身符和碧玺戒指来换取《芙蓉锦鸡图》 ")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 0)) then		-- 道具丢失的处理
		AddEventItem(21)
		Talk(1,"","我刚刚拿图出来，你跑哪里了？幸亏我守信用!")
	elseif (UTask_em == 40*256+50) then	-- 峨嵋派40级任务中
		if (HaveItem(166)== 1  and  HaveItem(167)== 1  and  HaveItem(168)== 1) then
			Talk(1,"","行走江湖的人信义为先，我原本只是让你知难而退，没想到你真的弄到了这三样东西，好，我就把《芙蓉锦鸡图》送给你!")
			DelItem(166)
			DelItem(167)
			DelItem(168) 
			AddEventItem(21)
			Msg2Player("得到芙蓉锦鸡图'.")
			SetTask(1, 40*256+60)
			SetTask(29,0)
			AddNote("交灵麝香囊，鹰睛护身符和碧玺戒指来换取《芙蓉锦鸡图》.")
		else									--没有做完三个任务
			Talk(1,"","找够  <color=Red>灵麝香囊<color>, <color=Red>鹰睛护身符<color> 和 <color=Red>碧玺戒指<color> 后再说.")
		end
	else
		Talk(1,"","镖局老板：本镖局的镖师们个个都有一身好功夫，本镖局接的生意，如果有人敢打主意，那叫做自不量力！")
	end
end

function no()
end
