-- 昆仑 仆役 叹息老人 20级任务
-- by：Dan_Deng(2003-07-30)
-- by: xiaoyang(2004\4\20) 私换秘笈任务（昆仑90级任务）

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_kl = GetTask(9)
	Uworld130 = GetTask(130)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 20*256+10) and (HaveItem(7) == 1)) then		--20级任务进行中
			Talk(1,"L20_prise","老人家，这个骆驼头骨是你的吗?")
		elseif ((UTask_kl == 20*256) and (GetLevel() >= 20)) then		--20级任务
			Talk(4,"L20_get","我的骆驼头骨不见了，这可如何是好？哼！一定是被人偷了去!","大爷，你要骆驼头骨干嘛?","你是新来的吧？难怪连我都不认识。我是专门伺候掌门的叹息老人，掌门现在正在练一种绝世神功，需要大量的骆驼头骨，如今被人偷了去，掌门责问下来，我、我这把老骨头就保不住了！怎么办？这可怎么办哪?","为何不下山去买呢？")
		else
			Talk(1,"","白首相知犹按剑,朱门早达笑弹冠")
		end
	elseif (Uworld130 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="kunlun") and (Uworld31 ==127) then
		Talk(8,"Uworld130_get","这个老汉面目狰狞，极其丑陋，每天都在昆仑派里扫落叶，很少说话，因为身体都被遮住因此很少人知道他的事情，听说他正是叹息老人- 前任掌门","老前辈!","老前辈？很久没有人这么叫我了. ","我听说...您正式昆仑前代掌门","那是很久之前的事了，别再提了.","晚辈，听过前辈大名前来请教!","哈哈！你还要告诉我昆仑现在还有一群人在争权夺利是吧?","正是这样")
	elseif (Uworld130 == 20)then
		Talk(8,"Uworld130_help","看到什么了?","什么都没看到","现在昆仑还有这样一些小人，你干嘛要和他们为伍!","我听见他们要交换狂风骤电和五雷正法什么的","以前的秘籍又出现了！老夫也因为多年前把绝招传给3个徒弟，导致他们相互猜忌，最后合谋背叛我。现在诶!","这些徒弟真无耻，不应该这样做的，让他们自生自灭吧.","不管怎么样，我也是昆仑的一员。但我不变出手，可以请你帮个忙吗？老夫感激不尽，在接下来的几年昆仑将会更好!","好的!")
   elseif (Uworld130 == 40) and (GetFaction() ~= "kunlun") then
   	Talk(4,"Uworld130_finish","前辈，我已经帮你教训他们了。但是担心他们本质难改，还是请前辈出手教训","我的武功尽失就是一个废人","什么?","那传说怎么没有提到?")
   elseif (Uworld130 > 10) and (Uworld130 < 40)then
   	Talk(1,"","昆仑命途曲折，钥匙能得到几位出手相助老夫将感激不尽! ")
	else
		Talk(1,"","老了，没什么用了!")
	end
end;

function L20_get()
	Say("买？根本就没得卖！这一个头骨我都是花了老大力气才找来的，这下被偷了我死定了",2,"你别着急，我帮你把骆驼头骨找回来. /L20_get_yes","那就是没有办法了/L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","你真是一个好心肠的孩子，只要你能找到骆驼头骨，我就向掌门保荐你做20级弟子")
	SetTask(9,20*256+10)
	AddNote("接20级任务，找回丢失的骆驼头骨. ")
	Msg2Player("接20级任务，找回丢失的骆驼头骨. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","是了是了，谢谢，我一定向掌门推荐你")
	DelItem(7)
	SetTask(9,30*256)
	SetRank(21)
--	AddMagic(174)
	add_kl(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你已经成为昆仑的紫微护法，学会羁绊符")
	AddNote("找到骆驼头骨，交给叹息老人，完成任务。升级成紫微护法")
end;

function Uworld130_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","对你这种软弱的人是多说无益的，走走!")
	else
		Say("你要是真想学就去后山，只要看了就知道!",2,"去就去/Uworld130_yes","你想教就教不教就算. /Uworld130_no")
	end
end

function Uworld130_yes()
	SetTask(130,10)
	Msg2Player("叹息老人要你绕去后山. ")
	AddNote("叹息老人要你绕去后山. ")
end

function Uworld130_no()
end

function Uworld130_help()
	SetTask(130,30)
	Msg2Player("叹息老人要你阻止内战，你答应了. ")
	AddNote("叹息老人要你阻止内战，你答应了. ")
end

function Uworld130_finish()
	if(GetTask(9) >= 70*256) and (GetTask(9) ~= 75*256) then
		Talk(4,"","这里有一卷昆仑的秘籍，你跟着练习","这是?","只希望你好好练习昆仑有难时，可以出手相助，这样我也就圆满了. ","晚辈尊令")
		if (HaveMagic(372) == -1) then		-- 必须没有技能的才给技能
			AddMagic(372,1)
		end
		if (HaveMagic(375) == -1) then		-- 必须没有技能的才给技能
			AddMagic(375,1)
		end
		if (HaveMagic(394) == -1) then		-- 必须没有技能的才给技能
			AddMagic(394)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("得到一本昆仑秘籍，希望你好好练习。")
 		SetTask(130,255)
	else
	   SetTask(130,245)  --获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("化解内战，完成任务。你的名望增加"..add_repute.."点.")  
   AddNote("化解内战，完成任务")
end
