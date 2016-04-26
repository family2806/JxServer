--description: 峨嵋派叶冰痕
--author: yuanlan	
--date: 2003/3/3
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
--update: Dan_Deng(2003-07-24), 加“重返门派”任务
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）
-- Update: Dan_Deng(2004-01-13)重新设计入门任务，改为记名弟子任务

function main()
	UTask_em = GetTask(1)
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "emei") then			-- 任务启动
		Say("峨眉山乃天地灵秀之地，庸俗之辈是无缘进峨嵋的。你上山是为了游玩，还是想拜师学艺?", 2, "让我看看. /Uworld36_get_yes", "我认输/no")
	elseif (Uworld36 == 20) then 					--完成第一关
		Talk(1,"","你可以继续下面的考验了，下一位是师妹<color=Red>秦倚风<color> 在<color=Red>迎客石<color>")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--尚未入门（可取消入门任务）
--		Say("叶冰痕：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？",2,"我不想加入峨嵋派了/enroll_cancel","继续接受考验/no")
	elseif (GetFaction() == "emei") then   				--已经入门，尚未出师
		Talk(1,"","师妹，你爱喝茶吗?")
	else							--其它对话
		Talk(1,"","石碾轻飞瑟瑟尘，乳香烹出建溪春。世间绝品人难识，闲对茶经忆古人 ..")
	end
end;

function Uworld36_get_yes()
	AddNote("见叶冰痕，接进入连环关任务")
	Msg2Player("见叶冰痕，接进入连环关任务")
	Talk(3, "select", "很好，妹妹需要过<color=Red>4关<color>, 我这里是<color=Red>第一关<color>.", "我爱喝茶，就先请你饮三杯茶，只要你能回答出三个关于茶的问题，就可以顺利过关!.", "如果你答不出来，就请打消拜师的念头吧，我们峨嵋派可不收俗人!")
end;

function no()
end;

------------------- 入门任务问答 -----------------------
function select()
	Msg2Player("用完第一杯茶，回答第一个问题. ")
	Say("第一杯是铁观音，你知道铁观音属于哪一种茶吗?", 3, "红茶/False1", "绿茶/False1", "乌龙茶/True1");
end;

function False1()
	Say("不对不对，再给你一次机会，好好想想。", 3, "红茶/False1", "绿茶/False1", "乌龙茶/True1");
end;

function True1()
	Msg2Player("用完第2杯茶，回答第2个问题. ")
	Say("不错，请喝第二杯茶：这杯是百花茶，用茉莉、玫瑰、蔷薇、秋菊、栀子、木犀等配和绿茶调置而成，集茶香与花香于一体。你知道它是用什么水冲泡的吗?", 3, "三月天的雨/False2", "深山里的泉/False2", "梅花上的雪/True2");
end;

function False2()
	Say("答错了，再试试。", 3, "三月天的雨/False2", "深山里的泉/False2", "梅花上的雪/True2");
end;

function True2()
	Msg2Player("请喝最后一杯茶，然后回答第三个问题")
	Say("看来你还有点灵性。最后一杯是猴魁茶，此茶生长在林壑幽深的峭壁上，人无法攀援采摘，只能依靠训练有素的猴子采摘，故名猴魁，十分稀有，乃是绿茶中的极品。你知道猴魁茶的产地是哪里吗?", 3, "徽州太平/True3", "洞庭君山/False3", "杭州西湖//False3");
end;

function False3()
	Say("你是不是记错了，再想想。", 3, "徽州太平/True3", "洞庭君山/False3", "杭州西湖/False3");
end;

function True3()
	Talk(1,"","你可以继续下面的考验了，下一位是<color=Red>秦倚风<color>师妹，她在<color=Red>迎客石<color>附近")
	Uworld36 = SetByte(GetTask(36),1,20)
	SetTask(36, Uworld36)
	AddNote("你答对3个问题，通过第一关. ")
	Msg2Player("回答对3个问题，就算过了第一关，去迎客石见师妹秦倚风接下面的考验")
end;
