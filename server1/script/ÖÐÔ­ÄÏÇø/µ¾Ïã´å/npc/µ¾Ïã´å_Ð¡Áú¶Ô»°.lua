--description: 新手村_小龙
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 1) then
		Talk(4, "Fpay", "我是小龙，我姐姐在找他，快回去吧!", "我还不想回，姐姐给我10两，让我买糖，但是我把钱弄丢了，姐姐会骂我的","我找了很久，没有找到。呜呜...","不用担心，我给你10两!")
	else
		Talk(1,"","姐姐对我很好，但是我怕她!")
	end
end

function Fpay()
	if (GetCash() < 10) then
		Talk(1,"","我没钱，不能帮你了!")
	else
		Pay(10)
		Talk(1,"","谢谢你，这条腰带，我用不着，给你吧!")
		SetTask(73,10)
		AddNote("找到小龙，给他钱，说服他回家，任务完成. ")
		Msg2Player("找到小龙，给他钱，说服他回家，任务完成. ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		AddItem(0,6,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("获得一条皮腰带. ")
		AddRepute(5)
		Msg2Player("你的名望增加5点 ")
	end				
end

function no()
end
