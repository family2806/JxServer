function PickUp( nItemIndex, nPlayerIndex )
	local oldPlyIdx = PlayerIndex;
	local size = GetTeamSize();
	local mySex = GetSex();
	if(size < 2) then
		Msg2Player("孤独的人拾取浓情玫瑰花没有效果。");
		return 0;
	elseif(size > 2) then
		Msg2Player("只有1男1女组队拾取浓情玫瑰花才有奖励。");
		return 0;
	else
		for i = 1, size do
			PlayerIndex = GetTeamMember(i);
			if( mySex ~= GetSex() ) then
				GiveExp(oldPlyIdx,size);
				return 0;
			end
		end
		PlayerIndex = oldPlyIdx;
		Msg2Player("只有1男1女组队拾取浓情玫瑰花才有奖励。");
		return 0;
	end
end

function GiveExp(oldPlyIdx,size)
	local levelexp = {70,160,280,400,520,590,770,850,1000,1200,1500};
	for j = 1, size do
		PlayerIndex = GetTeamMember(j);
		SetTask(1562, GetTask(1562)+1);
		if(GetTask(1562) >= 99 ) then
			AddItem(6,1,833,1,0,0);
			SetTask(1562, 0);
			Msg2Player("你已拾取了99朵浓情玫瑰花，得到1块爱恋巧克力，拾取数清零。");
		end		
		Msg2Player("你已经拾取了"..GetTask(1562).."朵浓情玫瑰花");
		local level = GetLevel();
		local exp_level = floor(level / 10) + 1;
		if(exp_level > 11) then
			exp_level = 11;
		end
		AddOwnExp(levelexp[exp_level]);
	end
	PlayerIndex = oldPlyIdx;
end