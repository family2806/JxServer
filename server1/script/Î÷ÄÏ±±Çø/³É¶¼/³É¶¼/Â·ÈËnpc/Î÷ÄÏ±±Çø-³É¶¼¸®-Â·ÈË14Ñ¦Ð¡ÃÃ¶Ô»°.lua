--西南北区 成都府 路人14薛小妹对话  峨嵋派40级任务
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
-- 修改Dan_Deng 的错误：QBJ(2003-10-3)

function main(sel)
	UTask_em = GetTask(1)
	UTask_emsub01 = GetByte(GetTask(29),1)
	if (UTask_em == 40*256+50) then		-- 40级任务中
		if (UTask_emsub01 == 0) then
		Talk(5, "", "薛小妹：这位大姐，你老跟住我，有啥子事嘛？", "不好意思，因为妹子你身上有一种奇异的香味，所以……", "薛小妹：啊，你真的闻到了吗？我用的是灵麝香囊，里面的香料可是从西域传过来的呢！", "原来是灵麝香囊，难怪这么香！妹子，你可不可以把这个灵麝香囊卖给我？我有急用。", "薛小妹：卖是不卖的，不过我听说城里的杂货店最近进了一批新款的银簪，你拿一支银簪来跟我换吧！")
			SetTask(29,SetByte(UTask_emsub01,1,1))			-- 设置task(29)第1个字节为1
--			SetTask(29, 2)	
			AddNote("遇见薛小妹(383, 315) 找到灵麝香囊，但是要用银簪交换. ")
			Msg2Player("薛小妹建议用银簪换灵麝香囊")
		elseif ((UTask_emsub01 == 1) and (HaveItem(63) == 1)) then
			Say("薛小妹：好漂亮的银簪，这个香囊就送给你吧！", 1, "得到灵麝香囊/get")
			DelItem(63)
			AddEventItem(166)
			SetTask(29,SetByte(UTask_emsub01,1,10))
--			SetTask(29, 2)
			AddNote("得到灵麝香囊。")
			Msg2Player("得到灵麝香囊。")
		elseif (UTask_emsub01 == 10) and (HaveItem(166) == 0) then
			AddEventItem(166)
			Talk(1,"","薛小妹：买到银簪了吗？")
		else
			Talk(1,"","薛小妹：我没有灵麝香囊了，你还有啥子事？")
		end
	else
		Talk(1,"","薛小妹：你老跟住我，到底想干啥子嘛？")
	end
end;

function get()
end;
