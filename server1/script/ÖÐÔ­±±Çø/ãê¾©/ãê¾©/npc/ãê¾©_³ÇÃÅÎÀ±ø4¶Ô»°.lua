--中原北区 汴京府 城门卫兵4对话（少林入门任务）
-- by：Dan_Deng(2003-08-01)

Include("\\script\\global\\map_helper.lua")
npc_name = "<#>城门卫兵"

function default_talk()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(121) == 0)) then		--入门任务进行中
		Say("你吃了雄心豹子胆了啊？敢来闹衙门，你受得起这个罪吗？.",4,"你需要服从这里的命令/enroll_S1_wrong","行侠仗义者，为国为民/enroll_S1_correct","普天之下，莫非王土，率土之滨，莫非王臣 /enroll_S1_wrong","尽心报国，死而无憾/enroll_S1_wrong")
	else
		Talk(1,"","金人不像我们汉人，他们不懂什么是廉耻!")
	end
end;

function enroll_S1_correct()
	Talk(1,"","赤铜矿虽然不值什么钱，但是，送给你做礼物!")
	AddEventItem(121)
	Msg2Player("获得赤铜矿")
	AddNote("回答卫兵的问题，获得赤铜矿")
end;

function enroll_S1_wrong()
	Talk(1,"","金人不像我们汉人，他们不懂什么是廉耻!")
end;
