--by 廖志山 [2006-09-12]
--2006中秋活动之做灯笼活动,普通灯笼放在地上可以得到双倍经验
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGHTCAGE__) then
	__H_ITEM_LIGHTCAGE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);

AU06_MINUTE = 18 * 60;
--nIndex
tab_light = {
	{1241, "彩蝶灯笼", 10},
	{1242, "彩星灯笼", 20},
	{1243, "翡翠灯笼", 30},
	{1244, "大红灯笼", 40},
	{1245, "鲤鱼灯笼", 50},
	{1246, "五彩灯笼", 60}
}
--中秋活动入口函数
function main(sel)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061021 or nDate < AU06_BEGINDATE or gb_GetTask("midautumn2006_city_all", 1) ~= 0) then --
		Say("不在活动时间，不能使用。", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("只有50级以上充值玩家才能放置灯笼。", 0);
		return 1;
	end;
	
	local nCount = getn(tab_light);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	--放一个东西在地上
	w, x, y = GetWorldPos();
	world = SubWorldID2Idx(w);
	DropItem(world, x * 32, y * 32, -1, 6, 1, tab_light[nIndex][1], 1, 0, 0, 0);

	--给予奖励和公告
	szName = tab_light[nIndex][2];
	time = tab_light[nIndex][3];
	if (GetItemParam(sel, 1) == 1) then
		AddSkillState(440, 1, 1, time * AU06_MINUTE);
	Msg2Player("你使用了一个<color=yellow>"..szName.."<color>，并获得了<color=yellow>"..time.."小时<color>经验双倍时间和<color=yellow>"..time.."小时<color>120级技能经验双倍时间。");
	else
		Msg2Player("你使用了一个<color=yellow>"..szName.."<color>.");
	end;
	return 0
end


function IsPickable( nItemIndex, nPlayerIndex )
    if (1 == GetItemParam(nItemIndex, 1)) then
       return 1;
    end
    Msg2Player("<color=yellow> 色彩闪烁灿烂. <color>")
	return 0;
end

function PickUp( nItemIndex, nPlayerIndex )
    return 1;
end


end; --//end of __H_ITEM_LIGHTCAGE__
--AddSkillState(440, 20, 1,32400)--30分钟内获得双倍经验时间。