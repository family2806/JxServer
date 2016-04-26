--description: 天忍教弟子　禹王剑任务（天忍记名弟子任务）
--author: yuanlan	
--date: 2003/5/17
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tr = GetTask(4)
	UTask_gb = GetTask(8)
	UTask_world30 = GetByte(GetTask(30),1)
	if (UTask_world30 == 0) and (GetLevel() >= 10) and (GetFaction() ~= "tianren") then		-- 任务启动（要求10级以上）
--		DelItem(50)						--防止重接任务后，玩家捡起任务道具
		Say("在 <color=Red>华山上<color> 藏有一把<color=Red>禹王剑<color>, 谁拿到这把剑将有重赏!", 2, "去拿剑/get_yes", "不喜欢!/get_no")
	elseif ((UTask_world30 == 5) and (HaveItem(50) == 1)) then					--有禹王剑
		world30_prise()
	elseif ((UTask_world30 > 0) and (UTask_world30 < 10)) then
		Talk(1,"","<color=Red>禹王剑<color> 藏在<color=Red>华山<color>, 此去华山路途遥远，路上凶险重重你要小心!")
	elseif (UTask_world30 == 10) then		-- 以前完成任务的人转换变量值
		Utask_world30 = SetByte(GetTask(30),1,127)
		SetTask(30,Uworld30)
		if (GetFaction() == "tianren") then
			Talk(1,"","你找到禹王剑的功劳，本教将会记得，不会亏待你!")
		else
			Talk(1,"","看在你替本教夺得宝剑的份上，就收你入教 ")
		end
	elseif (UTask_tr == 70*256) and (GetFaction() ~= "tianren") then							--已经出师
		Talk(1,"","你想去南方吗？武林中原高手无数，考虑清楚了再去.")
	else
		Talk(1,"","你知道吗？风堂堂正是当今大金皇帝的七公主，不仅漂亮，武功还很高.")
	end
end;

function get_yes()
	Talk(1,"","此去华山路途遥远，路上凶险重重，你可以到<color=Red>汴京<color>坐马车去华山附近的<color=Red>凤翔<color>也可以请本教的<color=Red>日月坛主乌合萨<color> 护送你前往.")
	SetTask(30, SetByte(GetTask(30),1,5))
	AddNote("接任务：去华山找禹王剑. ")
	Msg2Player("接任务：去华山找禹王剑. ")
end;

function get_no()
	Talk(1,"","什么时候都有人想拿禹王剑来获得重赏.")
end;

function world30_prise()
	DelItem(50)
	i = ReturnRepute(15,19,6)		-- 缺省声望15，最大无损耗等级19级，每级递减6%
	Uworld30 = SetByte(GetTask(30),1,127)
	AddRepute(i)
	SetTask(30,Uworld30)
	Earn(500)
	Talk(1,"","看在你替本教夺得宝剑的份上，就收你入教")
	AddNote("返回天忍教，把禹王剑带给天忍士子，成为弟子，获得500两奖励. ")
	Msg2Player("返回天忍教，把禹王剑带给天忍士子，完成任务。成为天忍教弟子，获得500奖励，名望增加. "..i.."点.")
end;

function enroll_prise()
	SetFaction("tianren")    				--玩家加入天忍教
	SetCamp(2)
	SetCurCamp(2)
	AddMagic(135)
	SetRank(55)						--设置称号
	SetRevPos(49, 28)  					--设置重生点
	SetTask(4, 10*256)
	Msg2Player("欢迎加入天忍教，成为杀手，学到残阳如血. ")
	AddNote("加入天忍教，成为杀手，学到残阳如血. ")
end;

function enroll_no()
end;
