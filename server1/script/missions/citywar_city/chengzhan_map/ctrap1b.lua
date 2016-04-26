--攻城战 中转地图to城战地图（守城方）
--Trap ID：攻城战

Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1540,3280)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 1) then 
			Msg2Player("去不了，要去的话的要到敌军的伏击处. ");
			SetPos(1540,3280)
		else
			SetPos(1536,3269)
			SetFightState(0)
		end;
	end;
end;
