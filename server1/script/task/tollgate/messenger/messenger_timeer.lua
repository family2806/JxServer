-------------------------------------------------------------------------
-- FileName		:	messenger_timeer.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-06-28 10:45:05
-- Desc			:	送信任务记时器脚本
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")

function messenger_givetime()                   --驿站官员处接信使任务时的记时器
--    local Uworld1221 = nt_getTask(1221)             --获得当前任务日期
--    local messenger_date = tonumber(GetLocalDate("%y%m%d")) --获得现在日期	  	  
--
--    if ( Uworld1221 == 0 ) then               --第一次启动任务时为信使任务记时器设置启动参数 
--      nt_setTask(1221,messenger_date)
--      nt_setTask(1222,7200)
--    end
--      
--    local Uworld1222 = nt_getTask(1222) 		  --获得当日玩家信使关卡剩余时间
--    
--    if ( Uworld1222 == 0 ) and ( Uworld1221 == messenger_date ) then     --当日信使关卡剩余时间为0
--      --return 10                                                        --返回值为10时不能再接任务
--    elseif ( Uworld1222 >= 0 ) and ( Uworld1221 ~= messenger_date ) then --信使关卡的时间已经到了另一天，可以重新开始关卡任务
--      nt_setTask(1223,0)     --设置当日获得积分为0
--      nt_setTask(1273,0)     --设置当日总获得经验为0
--      nt_setTask(1274,0)     --设置当日总获得积分为0
--      nt_setTask(1224,0)     --设置当日领奖开关为0
--      nt_setTask(1222,7200)
--      nt_setTask(1221,messenger_date)
--    end
end 

function messenger_middletime(nMapId)                                 --任务进行中调用的计时器
--	local Uworld1211, Uworld1222, Uworld1221, messenger_date, lasttime = 0,0,0,0,0;
--	local nTeamSize = GetTeamSize();
--	local boldPlayer;
--	local tbPlayer = {};
--	
--	if (nTeamSize <= 1) then
--		return messenger_middletime_do();
--	else
--		local oldPlayer = PlayerIndex;
--		
--		for i = 1, nTeamSize do		--先保存队员
--			tbPlayer[i] = GetTeamMember(i);
--		end;
--		
--		for i = 1, getn(tbPlayer) do	--对每个队员做处理
--			PlayerIndex = tbPlayer[i];
--			
--			if ( nt_getTask(1201) == 20 or  nt_getTask(1202) == 20 or  nt_getTask(1203) == 20 ) then
--				local bp = messenger_middletime_do();
--				if (oldPlayer == PlayerIndex) then	--如果是杀人的人，先保留，后return
--					boldPlayer = bp;
--				else
--					if (bp == 10) then
--						Msg2Player("对不起，"..GetName().."大人，您已经超过了信使任务所需的时间，任务失败。")
--						losemessengertask();
--					end;
--				end;
--
--			end
--		end;
--		
--		PlayerIndex = oldPlayer;
--		return boldPlayer;
--	end;
end

function messenger_middletime_do()
--	local Uworld1211 = nt_getTask(1211)  --任务开始时间（一直在变化）
--	local Uworld1222 = nt_getTask(1222)
--	local Uworld1221 = nt_getTask(1221)             --获得当前任务日期
--	local messenger_date = tonumber(GetLocalDate("%y%m%d")) --获得现在日期	  	 
--	local lasttime   = GetGameTime()
--    
--	if ( Uworld1221 ~= messenger_date  ) then
--		Msg2Player("对不起，你没有在任务规定的日期内完成任务。")
--		return 10                                              
--	elseif ( lasttime - Uworld1211 > Uworld1222  ) then
--		nt_setTask(1222,0)
--		return 10                                               --返回值为10时表示时间已超过当前关卡所需时间 
--	else
--		Uworld1222 = Uworld1222 - ( lasttime - Uworld1211 )
--		nt_setTask(1222,Uworld1222)
--		nt_setTask(1211,lasttime)
--	end
end

function messenger_gettime()  --驿站官员处交信使任务时的记时器
--    local Uworld1222 = nt_getTask(1222)
--    local Uworld1221 = nt_getTask(1221)             --获得当前任务日期
--    local messenger_date = tonumber(GetLocalDate("%y%m%d")) --获得现在日期
--		
--    if ( messenger_date ~= Uworld1221 ) then
--      nt_setTask(1223,0)     --设置当日获得积分为0
--      nt_setTask(1273,0)     --设置当日总获得经验为0
--      nt_setTask(1274,0)     --设置当日总获得积分为0
--      nt_setTask(1224,0)     --设置当日领奖开关为0
--      return 10              --任务失败
--    end
end



