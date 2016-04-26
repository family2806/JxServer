--description: 两湖区 巴陵县 药店老板对话（天王帮40级任务、新手任务小渔爹爹的病）
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- 天王40级任务
		Talk(5, "L40_tw_talk2", "在下是天王帮的弟子, 我有一个同门中了赤练蛇的毒，请神医给我解药!", "赤练蛇? 真的是太危险了..我可以救, 要找材料来配药!", "不知道要什么材料呢？", "这是家传秘诀, 但你是天王弟子我就说给你听! 要有<color=Red>火蜥蜴的鳞片<color> 和<color=Red>绿毛龟龟壳上的毛<color>. 找到这两样东西，你的同门就有救了", "不知道可以找到这两样东西吗？")
	elseif(UTask_world18 == 1) then				-- 新手村小渔任务
		Talk(1,"","吴神医：噢？小渔的爹爹病倒了？你来的可真不巧，刚进的一批枇杷丸全卖给天王帮了。要不，你去问问村里天王帮的弟子？")
		Msg2Player("药店老板告诉你枇杷丸已卖完，需去寻找天王帮弟子")
		AddNote("药店老板告诉你枇杷丸已卖完，需去寻找天王帮弟子")
	elseif (UTask_tw == 40*256+50) then
		Say("听说在<color=Red>伏流洞<color> 有<olor=Red>火蜥蜴<color> 和<color=Red>绿毛龟<color>, 有人在<color=Red>天王岛<color>见到了. 只要找到你的同门就有救了", 2, "我先去买一点药/yes", "我要立即去买药引/no")
	else							-- 非任务状态
		Say("吴神医：我这里都是上好的药材，有病治病，无病强身，货真价实，如假包换，要买点什么药？", 3, "交易/yes", "我是来做教育任务的/yboss","不交易/no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","听说在<color=Red>伏流洞<color> 有<color=Red>火蜥蜴<color> 和<color=Red>绿毛龟<color>, 有人在<color=Red>天王岛<color>见到了", "多谢神医!")
	SetTask(3, 40*256+50)								-- 天王40级任务
	AddNote("听巴陵县的神医说: 想要解蛇毒要有火蜥蜴皮和绿毛龟")
	Msg2Player("想要解蛇毒要有火蜥蜴皮和绿毛龟.")
end;

function yes()
	Sale(39);  			--弹出交易框
end;

function no()
end;
