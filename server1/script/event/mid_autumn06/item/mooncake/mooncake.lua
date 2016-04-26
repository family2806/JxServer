--by 廖志山 [2006-09-12]
--2006中秋活动之吃月饼，吃了得到相应的奖励
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_ITEM_MOONCAKE__) then
	__H_ITEM_MOONCAKE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);
	
--nIndex
tab_Exp = {
	20000 ,
	40000 ,
	100000 ,
	500000 ,
	1000000 ,
	2000000 ,
}

--中秋活动入口函数
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < AU06_BEGINDATE or nDate >= 20061117 or 
			gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		Say("月饼已经过期了,无法使用.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("只有50级以上充值玩家才能食用中秋月饼。", 0);
		return 1;
	end;
	
	if (not nIndex) then
		return 1;
	end;
	
	local nCount = getn(tab_Exp);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	local nExp = GetTask(AU06_TK_EXP);
	if (nExp >= EXP_AWARD_LIMIT) then
		Say("每人通过月饼最多可以获得<color=red>"..EXP_AWARD_LIMIT.."点<color>经验值，你不能再食用了。", 0);
		return 1;
	end;
	--给予奖励
	SetTask(AU06_TK_EXP, nExp + tab_Exp[nIndex]);
	AddOwnExp(tab_Exp[nIndex]);
	
	--公告提示
	Msg2Player("你获得了<color=yellow>"..tab_Exp[nIndex].."<color>点经验。")
	return 0;
end

end; --//end of __H_ITEM_MOONCAKE__