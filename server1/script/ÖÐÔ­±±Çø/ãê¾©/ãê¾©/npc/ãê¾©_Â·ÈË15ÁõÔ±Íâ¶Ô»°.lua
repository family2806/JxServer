--中原北区 汴京府 路人15刘员外对话
--by xiaoyang  (2004\4\12)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld127 = GetTask(127)
	Uworld30 = GetByte(GetTask(30),1)
	if (Uworld127 < 10) and (GetLevel() >= 90) and (Uworld30 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="tianren" ) then   --符合任务条件
		Talk (14,"Uworld127_step1","哎!. ","老员外，你怎么了? ","一言难尽，你快点离开这里吧，否则也会受到连累","到底发生什么事了，说来我听听看能不能帮忙。在下不才，只有点力， ","阁下是江湖中人吗？","江湖流血，有我一份 ","那就好了，你有听说过大金的七公主完颜决一吗? ","完颜公主聪明伶俐，容颜绝世，是皇上最疼爱的女儿。","没错，我儿子正在公主身边办事 ","那就好了，你还伤心做什么? ","公主被宠坏了，最近听说她想抓一只上百岁的大雕，那大雕已经咬伤很多人，我儿子也被咬了. ","受重伤？那调查的怎么样了? ","老夫只有一点家产，儿子又重伤，如果一个月内不抓到大雕，就要被砍头 ","啊，这么严重啊" )
	elseif (Uworld127 == 10) and (HaveItem(374) == 0) then
		AddEventItem(374)
		Msg2Player("又领到公主的令牌")
		Talk(1,"","看你也一般般，这个令牌拿去!")
	elseif (Uworld127 == 100) or (Uworld127 == 110) then                                                             --任务完成
		Talk(4,"U127_finish","到底你还是来了!"," 刘先生，你的儿子没什么需要担心的了","尽管我很相信你，但是，事实上没有人能抓到大雕，如果抓到，你的大恩，我死都不会忘!","不用客气，在下告辞 .")
	elseif (Uworld127 > 10)and (Uworld127 < 100) then                                            --任务进行中
		Talk(1,"","我家庭性命就掌握在你手里了，你一定要成功!")
	elseif (Uworld127 >= 245) then                                                                 --任务完成后
		Talk(1,"","请恩人进屋坐，人在江湖，生死难料。请保重身体!")
	else    
		Talk(1,"","刘员外：谁坐江山都一样，只要有安乐日子过就行。")
	end
end;

function Uworld127_step1()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","哎，说出来也只是让少侠笑话罢了")
	else
		Say("时限已到，现在该怎么办!",2,"大家不用担心，我倒要看看这个公主有多厉害! /U127_get","公主的势力很强，在下怕不能抵挡/no")  --任务启动
	end
end

function U127_get()
	Talk(3,"","公主是个恶毒好胜之人，最好你不要忍","你放心，我一定平安返回!","很好，这个是进宫令牌，我在这等你的好消息.")
	AddEventItem(374)
	SetTask(127,10)
	Msg2Player("接任务：去找完颜决一，为刘员外找回公道")
	AddNote("接任务：去找完颜决一，为刘员外找回公道")
end

function no()
end

function U127_finish()
	if(GetTask(127) == 110) then
      SetTask(127,255)
   else
      SetTask(127,245)				  --获得声望的设置变量245
	end
	   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
	   AddRepute(add_repute)
	   Msg2Player("完成任务，返回刘家，名望增加"..add_repute.."点.")
	   AddNote(".完成任务，返回刘家 ")
end
