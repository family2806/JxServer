-- 剑阁蜀道 战斗NPC 蛮人2 少林20级任务
-- by：Dan_Deng(2003-08-01)
--打蛮人的过程中不可退出，否则要重新打过。

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl >= 20*256+64) and (UTask_sl < 20*256+128) and (GetBit(UTask_sl,2) == 0) then			-- 任务中且这一只未打过
		UTask_sl = SetBit(UTask_sl,2,1)
		if (UTask_sl == 20*256+64+31) then		--如果够(bin(10000 + 01000 + 00100 + 00010 + 00001))
			SetTask(7,20*256+128)
			AddNote("五个蛮人被你教训得心服口服，承诺今后修心养性，不在胡作非为了. ")
			Msg2Player("五个蛮人被你教训得心服口服，承诺今后修心养性，不在胡作非为了. ")
		else
			Msg2Player("你打吧一个蛮人. ")
			SetTask(7,UTask_sl)
		end
	end
end;
