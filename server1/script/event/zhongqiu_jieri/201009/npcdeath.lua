Include("\\script\\event\\zhongqiu_jieri\\201009\\support.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	local szOwnerName = tb2010ZhongQiu.tbNpcSet[nNpcIndex];
	tb2010ZhongQiu.tbNpcSet[nNpcIndex] = nil;
	
	if szOwnerName == nil then 
		return 
	end
	
	if tb2010ZhongQiu:IsActivityTime() ~= 1 then
		Msg2Player("活动已结束!");
		return
	end
	
--	if szOwnerName ~= GetName() then
--		Msg2Player("不是自己召唤的BOSS");
--		return
--	end

	if ST_IsTransLife() ~= 1 and GetLevel() < 50 then
		Msg2Player("需要50级以上才能参加活动!");
		return		
	end
	
	local szNpcName = GetNpcName(nNpcIndex);
	local tbNpcInfo = tb2010ZhongQiu.tbNpcInfo[szNpcName];
	
	if tbNpcInfo == nil then
		return
	end
	
	local nAwardExp = 0;
	
	if type(tbNpcInfo.nAwardExp) == "number" then
		nAwardExp = tbNpcInfo.nAwardExp;
	else
		local nRand = random(1, 100);
		for i = 1,getn(tbNpcInfo.nAwardExp) do
			if nRand <= tbNpcInfo.nAwardExp[i][3] then
				nAwardExp = tbNpcInfo.nAwardExp[i][1];
				break
			end
		end
	end
	
	-- 奖励经验
	tb2010ZhongQiu:AwardExp( nAwardExp, 
													 tbNpcInfo.nTaskId, 
													 tbNpcInfo.nMaxExp, 
													 format("成功打败%s", szNpcName), 
													 format("[中秋活动][打败%s]", szNpcName));
	
	-- 掉落物品
	if tbNpcInfo.tbDrop ~= nil then
		tbDropTemplet:GiveAwardByList(nNpcIndex, 
																	PlayerIndex, 
																	tbNpcInfo.tbDrop, 
																	format("[中秋活动][打败 %s]", szNpcName), 
																	1);
	end

end

