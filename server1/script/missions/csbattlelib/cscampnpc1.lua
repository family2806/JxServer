--CheckCondition() 需要该函数用于检查是否符合加入条件
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");

function main()

	if (GetMissionV(1) == 1) then 
			--未进入战场旁观
			if (GetTaskTemp(JOINSTATE) == 0) then
				Say("你想加入黄方还是紫方?", 4, "我想加入黄方 /ChooseCamp", "我想加入紫方 /ChooseCamp", "我想先观察, 之后再说! /ChooseCamp", "我想想看/OnCancel");
				return
			--正在旁观
			else
				if (GetCurCamp() == 0) then 
					Say("你想加入黄方还是紫方?", 4, "我想加入黄方 /ChooseCamp", "我想加入紫方 /ChooseCamp", "我想一想 /OnCancel", "我想离开战场. /ChooseLeave");
					return
				else
					Say("你想离开战场吗?", 2, "嗯, 是的/ChooseLeave", "我还没打完，还不想离开. /OnCancel");	
					return
				end
			end
	else
		Say("还没有到战斗时间!",0);
		return
	end;
end;

function ChooseCamp(nSel)
	
	if (CheckCondition() == 0) then
		return 
	end;
	
	if (nSel == 0) then
		JoinCamp(1)	
	elseif (nSel == 1) then
		JoinCamp(2)
	else 
		SetTaskTemp(JOINSTATE, 1);
		SetPos(CS_CampPos0[2], CS_CampPos0[3]);
	end;
end;

function OnCancel()

end;

function ChooseLeave()
	LeaveGame(0)	
end;

