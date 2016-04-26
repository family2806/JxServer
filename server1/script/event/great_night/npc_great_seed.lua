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
	
	if  nSeedLevel ~= 4 and nGetSeedLevel~= nSeedLevel then -- 如果级别不对,不能进行拾取
		--这里告诉玩家级别不对,不能拾取
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("只有90级以下的玩家才可以拾取这类果实!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("只有90到119级的玩家才可以拾取这类果实.")
		else
			Msg2Player("120级以上的玩家才可以拾取这类果实!")
		end
		return
	elseif nSeedLevel == 4 and nGetSeedLevel ~= 3 then
			Msg2Player("只有120级以上的玩家才可以拾取这类果实!")
			return
	end;
	Msg2Player("果实还未成熟，要再等5分钟.")
end;