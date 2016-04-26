-- 洱海 路人NPC 船家（翠烟门30级任务）
-- by：Dan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if ((UTask_cy == 30*256+40) and (HaveItem(2) == 0)) then		--30级任务进行中
		Talk(5,"L30_pay","今儿个可真是大丰收啊，捕了一满舱的鱼虾 ","您有银雪鱼吗?","银雪鱼？我今天倒是捕到了几条.","您能卖给一些我吗?","既然你想要，那就卖你一些吧。喏，这些算你1000两银子好了.")
	else
		Talk(1,"","船家: 大理的水弯曲地流淌，兄弟们隔山隔水，山水万重，想见也难.")
--		Talk(1,"","船家：出海捕鱼那个把船航啊，丰收归来那个把家返啊！")
	end
end;

function L30_pay()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(2)
		AddNote("买到银雪鱼")
		Msg2Player("在洱海船家处买到银鳕鱼")
	else
		Talk(1,"","没有钱，那怎么买 ")
	end
end;
