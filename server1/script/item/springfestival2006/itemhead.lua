Include("\\script\\lib\\common.lua")

TAB_ACTION = 
{--{地图、missionid、grouptaskid、maxplayercount、是否为打年兽活动、{经验倍数、经验时间}、遁地符乾坤挪移符文件}
	{822, 38, 2330, 10, {0}, 10, {2331, 2332}, [[\settings\maps\chrismas\player.txt]]},
	{824, 40, 2409, 10, {1, 19}, 10, {2410, 2411}, [[\settings\maps\springfestival2006\player.txt]]}
}

--检查道具是否可以被使用
function itemmapcheck(tab)
	if (tab == nil or type(tab) ~= "table") then
		Talk(1, "", "这个道具在这个地图不能使用。");
		return 0;
	end;
    local ww, xx, yy = GetWorldPos();
    for i = 1, getn(tab) do
	    if (tab[i][1] == ww) then
	    	return i;
	    end;
	end;
    Talk(1, "", "这个道具在这个地图不能使用。");
    return 0;
end;

--检查该玩家是否仍在游戏中，成功返回PlayerIndex否则返回nil
function check_pl(szPlayName, nMissionID)
	local nPlIdx = SearchPlayer(szPlayName)	--玩家是否在当前服务器
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(nMissionID, nPlIdx)	--玩家是否在指定Mission中
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end

--生成一个相对于当前玩家的选项
function make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end

--找到对立阵营，年兽——>玩家，玩家——>年兽
function getgroupid(nGroupId, SMALLMAPCOUNT)
    if (nGroupId < 1) then
        return nil
    end;
    
    if (nGroupId > SMALLMAPCOUNT) then
        return nGroupId - SMALLMAPCOUNT;
    else
        return nGroupId + SMALLMAPCOUNT;
    end;
end;