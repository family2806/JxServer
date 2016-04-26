Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\signin.lua]]);

SZFILE = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];

function signin_add()
	--进行计数
	if (GetTask(TK_CO_PLAYTIMES) >= CO_MAXPLAYTIMES) then
		Say(CO_SIGNNPCNAME.."今天你已参加<color=yellow>"..CO_MAXPLAYTIMES.." 次<color> 了, 或许你也累了，该去休息了!", 0);
		return 0;
	end;

	if (GetTask(TK_CO_TOTAL) >= 50) then
		Say(CO_SIGNNPCNAME.."你已参加节日活动 <color=yellow>50 次<color> 了, 看起来也累了，需要休息!", 0);
		return 0;
	end;
	
	if (GetLevel() < CO_LEVELLIMIT) then
		Say(CO_SIGNNPCNAME.."你的等级过低，我不想你冒险，什么时候达到<color=yellow>"..CO_LEVELLIMIT.."<color> 来找我.", 0);
		return 0;
	end;
	
	if (IsCharged() == 0) then
		Say(CO_SIGNNPCNAME.."只有充值玩家才能参加节日活动.", 0);
		return 0;
	end;
		
	if (gb_GetTask(FESTIVAL_SHREWMOUSE, 1) ~= 1) then
		local nNowTime = tonumber(GetLocalDate("%H"));
		local bOn = 0;
		if ((nNowTime >= 12 and nNowTime < 14) or 
          (nNowTime >= 19 and nNowTime < 23) or 
          (nNowTime >= 1 and nNowTime < 3)) then
			    bOn = 1;
		end;
		if (bOn == 0) then
			Talk(1, "", CO_SIGNNPCNAME.."30岁人活动将于每天举行，时间为<color=yellow>12: 到 14: 00 , 19: 00 到 23: 00 ，1: 00 到 3: 00 <color>.大家快来参加吧.");
			return 0;
		else
			Talk(1, "", CO_SIGNNPCNAME.."你也想参加'驱赶30岁人'活动吗？遗憾的是，引路人已经走了，他将于第0分, 第15分, 第30分，第45分后回来");
			return 0;
		end;
	end;
	return 1;
end;

--	玩家离开的附加设置
function playerleave_add()
	SetCurCamp(GetCamp());
	tab_Itemlist = {981, 984, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994};
	
	for i = 1, getn(tab_Itemlist) do
        ConsumeItem( -1, 1000, 6, 1, tab_Itemlist[i], 1 );
    end;
end;

-- 	玩家进入准备场的附加设置
function playergetinprepare_add()
end;

--	玩家进入游戏场的附加设置
function playergetingame_add()
	SetTask(TK_CO_PLAYTIMES, GetTask(TK_CO_PLAYTIMES) + 1);
	SetTask(TK_CO_TOTAL, GetTask(TK_CO_TOTAL) + 1);
	SetCurCamp(1);	--设置临时阵营
end;