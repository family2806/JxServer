--走马灯npc

--每轮按顺序点完4个灯的玩家可以获得奖励
--+前10名点完灯的玩家获得10.000.000 EXP
--+ 11名及11名以后的玩家获得2.000.000 EXP
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	local tbFnagxiang = 
	{
		[1] = "东走马灯",
		[2] = " 西走马灯",
		[3] = "南走马灯",
		[4] = "北走马灯",
	}
	local nNpcIndex = GetLastDiagNpc();
	local nCurNpcType = GetNpcParam(nNpcIndex, 1)
	local nTaskStep = GetNpcParam(nNpcIndex, 3)
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("只有50级充值玩家才能参加活动.", 0)
		return 
	end
	local tbItem = {szName="红蜡烛", tbProp={6, 1, 1820, 1, 0, 0},nCount = 1}
	
	if (GetNpcParam(nNpcIndex, 4) == 1 ) then
		return
	end;
	
	SetNpcParam(nNpcIndex, 4, 1);
	
	local nTaskState = GetTask(zhongqiu0808_TSK_TaskState)
	
	if (nCurNpcType == 1 or nTaskStep - nTaskState == 1) and ((nTaskStep - nTaskState) < -4 or (nTaskStep - nTaskState) > 0) then
		if ConsumeEquiproomItem(tbItem.nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4]) ~= 1 then
			
			Say("需要1只红蜡烛点灯.", 0)
		else
			SetTask(zhongqiu0808_TSK_TaskState, nTaskStep)
			Msg2Player(format("点灯%s", tbFnagxiang[nCurNpcType]))
			
			if nCurNpcType == 4 then
				local nRank = GetNpcParam(nNpcIndex, 2)
				nRank = nRank + 1
				Msg2Player(format("恭喜，大侠是第%d人点亮所有灯.", nRank))
				if nRank <= 10 then
					tbAwardTemplet:GiveAwardByList({nExp = 10000000}, "走马灯活动." )
				else
					tbAwardTemplet:GiveAwardByList({nExp = 2000000}, "走马灯活动." )
				end
				SetNpcParam(nNpcIndex, 2, nRank)
			end
		end
		
		
		
		
	elseif (nTaskStep - nTaskState) >= -4 and (nTaskStep - nTaskState) <= 0  then
		Msg2Player("走马灯已经点亮.")
	elseif tbFnagxiang[nCurNpcType-1] then
		Msg2Player(format("首先需要点灯%s", tbFnagxiang[nCurNpcType-1]))
	end
	
	
	SetNpcParam(nNpcIndex, 4, 0);
end

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;