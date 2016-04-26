--description: 中原北区 汴京府 铁匠1对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>曲铁匠：以前我这铁匠铺的生意可红火了，多少名士侠客都到我这儿定制兵刃，现如今……不说也罢！要不要看看我这儿的兵刃？"

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),1)
		if (UTask_trsub60 == 0) then
			tiejiang_city("<dec><npc>我今年三十了，还没有娶上媳妇，唉，为什么没有人喜欢我呢？不瞒你说，其实我挺喜欢城东的张寡妇，但是我一直不敢向她表白，我怕她讨厌我.", "我替你问问她的心意!/L60_sub_yes")
		elseif (UTask_trsub60 == 1) then
			if (HaveItem(63) == 1) then
				tiejiang_city("<dec><npc>太麻烦你了，银簪替我送给她好吗?")
			else
				AddEventItem(63)
				Talk(1,"","你还没拿银簪就走，你真想帮我吗?")
			end
		elseif (UTask_trsub60 == 2) and (HaveItem(64) == 1) then
			Talk(2, "", "其实张寡妇对你也有好感，这是她回送给你的香囊!", "太谢谢你了，如果没有你，我们不知要等多久才能明白对方的心意。我有一把断剑，虽然不值什么钱，但却是我们家祖传的，就送给你作为谢礼.")
			DelItem(64)
			AddEventItem(127)
			SetTask(28, SetByte(GetTask(28),1,10))
			AddNote("交香囊给曲铁匠，得到断剑“掩日'.")
			Msg2Player("得到断剑“掩日'.")
		else
			if (HaveItem(127) == 1) then
				tiejiang_city("<dec><npc>多谢你撮合我和张寡妇的姻缘，要不要看看我这儿的兵刃 ")
			else
				AddEventItem(127)
				Talk(1,"","尽管你施恩不求回报，但是，你帮我大忙了，这把剑无论如何你要收下.")
			end
		end
	elseif (UTask_tr > 60*256+20) then
		tiejiang_city("<dec><npc>多谢你撮合我和张寡妇的姻缘，要不要看看我这儿的兵刃 ")
	else
		tiejiang_city()
	end
end;

function L60_sub_yes()
	Talk(1,"","那太麻烦你了，这根银簪是我亲手打制的，你帮我送给她，如果她接受，就表明她的心里也有我.")
	AddEventItem(63)
	SetTask(28, SetByte(GetTask(28),1,1))
	AddNote("与曲铁匠对话，帮他拿银簪给张寡妇 ")
	Msg2Player("获得一个银簪.")
end;

function yes()
Sale(7);  			--弹出交易框
end;

