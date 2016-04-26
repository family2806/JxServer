
--攻城战 中转地图to城战地图（守城方）
--Trap ID：攻城战
--211，1622，3249      211，1608，3235
Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1858,3590)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 2) then 
			Msg2Player("去不了，要去的话的要到敌军的伏击处. ");
			SetPos(1858,3590)
		else
			SetPos(1862,3597)
			SetFightState(0)
		end;
	end;
end;
