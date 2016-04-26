--龙泉村 职能 铁匠
--龙泉村新手任务：修刀
-- By: Dan_Deng(2003-09-03)
Include("\\script\\global\\global_tiejiang.lua")
Include("\\Script\\Global\\TimerHead.lua")

TIEJIANG_DIALOG = "<dec><npc>想买什么兵器? 这里的武器很有名，不信的话你可以去问问龙泉皇家的清名试试!"

function main(sel)
	UTask_world19 = GetTask(19)
	if(UTask_world19 == 2) then
		if (HaveItem(229) == 1) then
			tiejiang_village("<dec><npc>这把刀损毁得很严重，要花不少钱来修理呢.要120两", "交修刀钱/W19_repair")
		else
			Talk(2,"","要修刀吗? 带来给我看看吧","算了! 我的刀忘在彭放处了! 我会回来拿的")
		end
	elseif (UTask_world19 == 4) then
		tiejiang_village("<dec><npc>大侠的刀正在修, 请等下"..GetRestSec(7).."<#>一会再来拿.")
	elseif (UTask_world19 == 6) then
		Talk(2,"","你的刀已经修好了","真好! 谢谢!")
		SetTask(19,8)
		AddEventItem(230)
		AddNote("拿宝刀还给彭放.")
		Msg2Player("拿宝刀还给彭放.")
	elseif (UTask_world19 == 8) and (HaveItem(230) == 0) then
		Talk(1,"","你把刀忘在我这里了")
		AddEventItem(230)
		Msg2Player("我来拿忘在铁匠处的到.")
	else
		tiejiang_village();
	end
end;

function W19_repair()
	if (GetTimerId() > 0) then		-- 另有计时器在运行中
		Talk(1,"","你正在进行这样紧急的任务，还乱跑?")
	else
		if (GetCash() < 120) then
			Talk(1,"","你钱没带够")
		else
			Talk(1,"","可以!我2小时后来拿")
			Pay(120)
			SetTask(19,4)
			DelItem(229)
			SetTimer(2 * CTime * FramePerSec, 7)
			AddNote("把宝刀交给铁匠修理, 2小时之后来拿.")
			Msg2Player("把宝刀交给铁匠修理, 2小时之后来拿.")
		end
	end
end;

function yes()
Sale(28);  				--弹出交易框
end;
