function main()
	local nPlayerLevel = GetLevel();
	local nNpcIdx = GetLastDiagNpc();
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	local nSeedLevel = GetNpcParam(nNpcIdx, 1)
	
	if  nSeedLevel ~= 4 and nGetSeedLevel~= nSeedLevel then -- ������𲻶�,���ܽ���ʰȡ
		--���������Ҽ��𲻶�,����ʰȡ
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("ֻ��90�����µ���Ҳſ���ʰȡ�����ʵ!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("ֻ��90��119������Ҳſ���ʰȡ�����ʵ.")
		else
			Msg2Player("120�����ϵ���Ҳſ���ʰȡ�����ʵ!")
		end
		return
	elseif nSeedLevel == 4 and nGetSeedLevel ~= 3 then
			Msg2Player("ֻ��120�����ϵ���Ҳſ���ʰȡ�����ʵ!")
			return
	end;
	Msg2Player("��ʵ��δ���죬Ҫ�ٵ�5����.")
end;