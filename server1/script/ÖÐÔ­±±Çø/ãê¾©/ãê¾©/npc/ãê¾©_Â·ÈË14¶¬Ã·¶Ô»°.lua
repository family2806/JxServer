--description: 中原北区 汴京府 路人14冬梅对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 0) then
			DelItem(130)			--处理重接任务后，玩家捡起任务道具的情况	
			Say("看见我们家小海了吗？他不知又野到什么地方玩儿去了，你能帮我找找吗?", 2, "好的!/L60_sub3_yes", "我还有别的事. /L60_sub3_no")
		elseif (UTask_trsub60 == 2) then
			Talk(1,"","找到我们家小海了吗?")
		elseif (UTask_trsub60 == 4) then
			Talk(2, "", "小海在广场上玩儿呢，过会儿就回来 !", "太谢谢你了，我家小海长大后要是有你一半懂事就好了！我也没什么别的好东西，这把断剑是我们家用来塞墙缝的，看你是一个习武之人，就送给你吧")
			AddEventItem(130)
			Msg2Player("得到断剑“去邪” ")
			SetTask(28, SetByte(GetTask(28),3,10))
			AddNote("回到冬梅家，获得断剑“去邪 ")
		elseif (UTask_trsub60 == 10) and (HaveItem(130) == 0) then
			AddEventItem(130)
			Msg2Player("断剑“去邪")
			Talk(1,"","此剑虽然不值几个钱，但是是我的一点心意，你不要推辞.")
		else
			Talk(1,"","小海他爹不在家，这孩子又不听话，唉! ")
		end
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","冬梅：看见我们家小海了吗？他不知又野到什么地方玩儿去了。")
		elseif (i == 1) then
			Talk(1,"","冬梅：小海他爹不在家，里里外外全靠我，偏偏他还不听话！")
		else
			Talk(1,"","冬梅：现在时局不好，过日子真难啊！")
		end;
	end
end;

function L60_sub3_yes()
	Talk(1,"","太麻烦你了 ! ")
	SetTask(28, SetByte(GetTask(28),3,2))
	AddNote("在东北汴京一个居民区遇到冬梅，帮她找小海")
	Msg2Player("冬梅叫你帮她去找小海 ")
end;

function L60_sub3_no()
	Talk(1,"","唉！这孩子真让人操心啊g! ")
end;
