--description: 武当派小道士清风　捡木桶任务（武当入门任务）
--author: yuanlan
--date: 2003/5/14
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2004-01-12)重新设计入门任务，改为记名弟子任务

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	UTask_world31 = GetByte(GetTask(31),1)
	if (UTask_world31 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "wudang") then			-- 水桶任务启动
		Say("我取水时不小心把水桶线弄断了，结果是<color=Red>把水桶<color> 打落到<color=Red>井里<color>, 没取到水，回去一定被师傅责怪。你可以帮我把水桶拿上来吗?", 2, "同意 /uworld31_get_yes", "我帮不了你/uworld31_get_no")
	elseif (UTask_world31 == 5) and (HaveItem(65) == 1) then					--有木桶
		uworld31_prise()
	elseif (UTask_world31 < 10) then 					--尚未完成捡木桶任务
		Talk(1,"","<color=Red>水桶<color>掉进<color=Red>井里了<color>, 如果找不回<color=Red>木桶<?color>,拿不到水将被师傅责骂.")
	elseif (UTask_world31 == 10) then 					--以前完成捡木桶任务
		UTask_world31 = SetByte(GetTask(31),1,127)
		SetTask(31,UTask_world31)
		Talk(1,"","谢谢你上次帮我拿回水桶，我让你做武当派记名弟子，以后你可以买武当派的武器装备.")
	elseif (GetFaction() == "wudang") then   				--已经入门，尚未出师
		Talk(1,"","每天都叫我来这拿水，哪里还有时间修炼。你有空来和我说话可以吗?")
	elseif (UTask_wd == 70*256) then							--已经出师
		Talk(1,"","你真有本领，什么时候我才能出师啊?")
	else
		Talk(1,"","武当山北通向秦岭，南边与巴山相接壤，连绵起伏，72订雄伟，每年来这游玩的人很多!")
	end
end;

function uworld31_get_yes()
	Talk(1,"","Hay qu? <color=Red>水桶 color> 掉进<color=Red>井里<color> .")
--	DelItem(65)									--防止重接任务后，玩家捡起任务道具
	SetTask(31,SetByte(GetTask(31),1,5))
	AddNote("在山前东边井处遇到小道士清风，接任务：帮助清风下井找水桶 ")
	Msg2Player("接任务：帮助清风下井找水桶 ")
end;

function uworld31_get_no()
	Talk(1,"","那我找其他人帮!")
end;

function uworld31_prise()
	DelItem(65)
	UTask_world31 = SetByte(GetTask(31),1,127)
	i = ReturnRepute(25,24,4)		-- 缺省声望12，最大无损耗等级24级，每级递减8%
	SetTask(31,UTask_world31)
	AddRepute(i)		-- 加声望
	Talk(1,"","谢谢你帮我找回水桶，我在这很久了，你是帮我找回水桶的人，我封你为武当派记名弟子，以后你可以到武当派买武器装备.")
	AddNote("帮助小道士清风找回木桶，任务完成。成为记名弟子，名望增加")
	Msg2Player("帮助小道士清风找回木桶，任务完成。成为记名弟子，名望增加"..i.."点.")
end

function no()
end;
