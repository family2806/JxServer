--description: 新手村_鲁爷
--author: wangzg	
--date: 2003/7/21
---70	UTask_world42
--update 2003/7/24 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world42=GetTask(70)
	if (UTask_world42==0) then
		Say("活在世上没有好书看真是无聊，镇南的老葛家有一本好书，但是我拉不下老脸去借", 2, "我去帮你借/yes", "想看书就要去借. /no")
	elseif (UTask_world42==2) then
		Talk(1,"","这样的话就先谢谢你了，葛老头在镇上的南边.")
	elseif (UTask_world42==4) then
		Talk(2, "step2", "葛老说想用夷坚志换稽神录.","这个老狐狸，想为难我！好吧，麻烦你带去给他")
	elseif ((UTask_world42 == 6) and (HaveItem(189) == 0)) then		-- 书丢了
		Talk(1,"","小子，敢这样，为什么拿着书就跑？")
		AddEventItem(189)
		Msg2Player("得到夷坚志")
	elseif ((UTask_world42==8) and  (HaveItem(188) == 1)) then
		Talk(3, "WTask70_prise", "鲁大叔，这是你要的书.", "太好了","这是牛皮腰带，我用不着，送给你吧。")
	else
		Talk(1,"","年轻人，活在世上要多读书，不要成天磨刀磨剑的")
	end
end;

function yes()
	Talk(1,"","这样的话就先谢谢你了，葛老头在镇上的南边.")
	SetTask(70,2)
	AddNote("接任务帮助鲁老头到镇南找葛老头借书. ")
	Msg2Player("接任务帮助鲁老头到镇南找葛老头借书. ")
end

function no()
end

function step2()
	AddEventItem(189)
	Msg2Player("得到夷坚志")
	SetTask(70,6)
	AddNote("从鲁老处得到夷坚志")
end

function WTask70_prise()
	DelItem(188)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	AddItem(0,6,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
	SetTask(70,10)
	AddRepute(5)		-- 加声望5点
	AddNote("把稽神录给鲁爷，完成任务，得到一条牛皮腰带﹗. ")
	Msg2Player("得到一条牛皮腰带﹗. ")
	Msg2Player("你的声望增加5点")
end
