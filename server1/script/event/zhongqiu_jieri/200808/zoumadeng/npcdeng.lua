--�����npc

--ÿ�ְ�˳�����4���Ƶ���ҿ��Ի�ý���
--+ǰ10������Ƶ���һ��10.000.000 EXP
--+ 11����11���Ժ����һ��2.000.000 EXP
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	local tbFnagxiang = 
	{
		[1] = "�������",
		[2] = " �������",
		[3] = "�������",
		[4] = "�������",
	}
	local nNpcIndex = GetLastDiagNpc();
	local nCurNpcType = GetNpcParam(nNpcIndex, 1)
	local nTaskStep = GetNpcParam(nNpcIndex, 3)
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("ֻ��50����ֵ��Ҳ��ܲμӻ.", 0)
		return 
	end
	local tbItem = {szName="������", tbProp={6, 1, 1820, 1, 0, 0},nCount = 1}
	
	if (GetNpcParam(nNpcIndex, 4) == 1 ) then
		return
	end;
	
	SetNpcParam(nNpcIndex, 4, 1);
	
	local nTaskState = GetTask(zhongqiu0808_TSK_TaskState)
	
	if (nCurNpcType == 1 or nTaskStep - nTaskState == 1) and ((nTaskStep - nTaskState) < -4 or (nTaskStep - nTaskState) > 0) then
		if ConsumeEquiproomItem(tbItem.nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4]) ~= 1 then
			
			Say("��Ҫ1ֻ��������.", 0)
		else
			SetTask(zhongqiu0808_TSK_TaskState, nTaskStep)
			Msg2Player(format("���%s", tbFnagxiang[nCurNpcType]))
			
			if nCurNpcType == 4 then
				local nRank = GetNpcParam(nNpcIndex, 2)
				nRank = nRank + 1
				Msg2Player(format("��ϲ�������ǵ�%d�˵������е�.", nRank))
				if nRank <= 10 then
					tbAwardTemplet:GiveAwardByList({nExp = 10000000}, "����ƻ." )
				else
					tbAwardTemplet:GiveAwardByList({nExp = 2000000}, "����ƻ." )
				end
				SetNpcParam(nNpcIndex, 2, nRank)
			end
		end
		
		
		
		
	elseif (nTaskStep - nTaskState) >= -4 and (nTaskStep - nTaskState) <= 0  then
		Msg2Player("������Ѿ�����.")
	elseif tbFnagxiang[nCurNpcType-1] then
		Msg2Player(format("������Ҫ���%s", tbFnagxiang[nCurNpcType-1]))
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