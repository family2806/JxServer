--description: 新手村_葛爷
--author: wangzg	
--date: 2003/7/21
--update 2003/7/24 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world42=GetTask(70)
	if (UTask_world42==2) then
		Talk(2, "step1", "我可以向你借书看么?","哼，我看你是村北的鲁老头派来的吧。早就和他说过，想要借书就得和我换，让他用《夷坚志》来换我的《稽神录》.")
	elseif ((UTask_world42==6) and (HaveItem(189) == 1)) then		-- 换书
		Talk(2, "step3", "这是你要的书.", "太好了，这就是他想要的书.")
	elseif ((UTask_world == 8) and (HaveItem(188) == 0)) then		-- 书丢了
		Talk(1,"","小子，就知道是这样，干嘛拿了我的书就跑")
		AddEventItem(188)
		Msg2Player("得到稽神录")
	else
		Talk(1,"","小子，做人不一定要看重情面，有的东西说出来就不需要情面了!")
	end
end;

function step1()
	SetTask(70,4)
	AddNote("找到镇南葛家，他想鲁家用夷坚志换稽神录. ")
end;

function step3()
DelItem(189)
AddEventItem(188)
SetTask(70,8)
AddNote("在葛家，用夷坚志换稽神录")
Msg2Player("用夷坚志换稽神录")
end;
