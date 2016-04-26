--西南北区 江津村 路人5虎子爹对话
--江津村新手任务：虎子拜师
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world20 = GetTask(48);
	UTask_world44 = GetTask(44)
	if (UTask_world44 == 0) then		-- 任务启动（1级即可接任务)
		Say("村外那个武师看起来很有本事啊。我们家虎子从小好武，要是能拜那位武师为师就好了。我们可是平凡人家，不知道学武是不是很花银子啊，你能帮我去问问那位武师吗!?", 2, "帮助 /yes", "不帮助 /no")
	elseif(UTask_world44 == 10) then
		Talk(1,"","那位武师就在村子东边的茅屋旁.")
	elseif(UTask_world44 == 20) then
		Talk(1,"","什么，他答应了？哎呀，那真是太好了，这顶帽子是我自己做的，虽然不值什么钱，聊表谢意吧!")
		SetTask(44, 100)
		AddRepute(5)
		AddNote("告诉虎子爹，那个师傅同意收虎子为徒了，任务完成")
		Msg2Player("告诉虎子爹，那个师傅同意收虎子为徒了，任务完成")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0,7,6,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("获得一块布巾")
		else
			AddItem(0,7,8,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("获得一个银叉")
		end
		Msg2Player("你的名望增加5点")
	else			-- 非任务对话
		Talk(1,"","我家那口子什么都好，就是喜欢给人作媒!")
	end
end;

function yes()
	Talk(1,"","那位武师就在村子东边的茅屋旁.")
	SetTask(44, 10)
	AddNote("接任务：去帮虎子求学武功 ")
	Msg2Player("接任务：去帮虎子求学武功")
end;

function no()
end;
