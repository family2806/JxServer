--description: 中原北区 汴京府 路人13张寡妇对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
--	UTask_tr = GetTask(4)		--没必要理会大任务状态
--	if (UTask_tr == 62) then
	UTask_trsub60 = GetByte(GetTask(28),1)
	if (UTask_trsub60 == 1) and (HaveItem(63) == 1) then
		Talk(2, "", " 这根银簪是城里的曲铁匠托我送给你的，他一直对你有情意，只是没有勇气表白，不知你.....", "其实、其实我对他也早有好感，只是、只是我是一个寡妇，怎么好先开口呢？这个香囊是我亲手缝制的，麻烦你替我送给他，就、就算是信物吧!")
		DelItem(63)
		AddEventItem(64)
		SetTask(28, SetByte(GetTask(28),1,2))
		AddNote("猜对孙秀才的所有字谜，获赠断水刀 ")
		Msg2Player("获得一个香袋 ")
	elseif (UTask_trsub60 == 2) and (HaveItem(64) == 0) then
		AddEventItem(64)
		Talk(1,"","你。为什么不拿香袋，人也不见?")
	elseif (UTask_trsub60 >= 2) then 
		Talk(1,"","谢你替我和老曲牵线，要不然我真的就要孤老终死了! ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","张寡妇：我男人前年得病死了，我独守空闺，真是度日如年啊。")
		else
			Talk(1,"","张寡妇：我听说，城北的方老太为她那从未谋面的丈夫活活守了三十年寡，这真是太可怕了！")
		end
	end
end;
