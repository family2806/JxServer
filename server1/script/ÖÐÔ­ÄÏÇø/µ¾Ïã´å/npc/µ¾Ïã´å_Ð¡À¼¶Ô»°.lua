----description: 新手村_小兰
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/28 yuanlan
--Update: 2003-08-07 Dan_Deng
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel) 
  	UTask_world38=GetTask(66)
  	if ((UTask_world38 == 0) and (GetLevel() >= 6)) then		-- 需要6级以上才能做任务
  		Talk(3, "select", "小姑娘怎么哭的这么伤心呀?", "爷爷病了，但是家里没钱买药.", "想买什么？ ")
  	elseif (UTask_world38 == 1) then
		Talk(1,"","谢谢兄长，之前爷爷的药是药店老板拿的.")
  	elseif (UTask_world38 == 5) then
  		if (HaveItem(186) == 1) then
  			DelItem(186)
  			Talk(1,"","真是谢谢你，我有一个戒指，请你收下!")
  			SetTask(66,10)
  			i = random(0,3)
  			if (i < 3) then 
  				i = 8 
  			else 
  				i = 9 
  			end
  			AddRepute(i)
  			AddNote("交麝香虎骨给小兰，完成任务 ")
  			Msg2Player("交麝香虎骨给小兰，完成任务  ")
  			if (random(0,3) == 0) then				-- 25%的机率得二级戒指
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
  				AddItem(0,3,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("获得戒指. ")
  			else
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
  				AddItem(0,3,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("获得黄玉戒指")
  			end
  			Msg2Player("你的名望增加 "..i.."点.")
  		else
  			Say("你不小心弄丢麝香虎骨膏了，如果想完成任务，需要有麝香虎骨膏.", 2, "我去找钱/find", "找药店老板做新药/redo")
  		end		
	elseif ((UTask_world38 > 1) and (UTask_world38 < 10)) then			-- 任务中的普通对话
		Talk(1,"","谢谢你。之前，爷爷的药是药店老板做的.")
  	elseif (UTask_world38 >= 10) then			-- 完成任务后的对话
  		Talk(1,"","谢谢你，有药了，爷爷的病一定会好.")
	else					-- 非任务对话
  		Talk(1,"","爷爷岁数已高，身体不好。我只希望自己懂医术能帮他治病.")
	end
end;

function select()
	Say("我也不懂是什么药，是之前药店老板给他的.", 2, "帮助做药/yes", "和我没有关系 /no")
end;

function yes()
	Talk(1,"","谢谢你，这个是药店老板给做的药.")
	SetTask(66,1)
	AddNote("接任务：帮小兰找药. ")
	Msg2Player("接任务：帮小兰找药. ")
end;

function no()
end;

function find()
end;

function redo()
Talk(1,"","到药店取药!")
SetTask(66, 2)
SetTask(67, 0)
AddNote("<color=red> 因为麝香虎骨膏丢了，请去找药店老板做药. <color> ")
Msg2Player("因为麝香虎骨膏丢了，请去找药店老板做药. ")
end;
