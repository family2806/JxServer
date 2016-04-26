Include("\\script\\task\\newtask\\newtask_head.lua")

function main(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local nWorldMaps = nt_getTask(1027) -- 看看玩家身上有多少个山河社稷图
	if (detail == 440) then
		-- 给玩家增加100个山河社稷图残片
		nWorldMaps = nWorldMaps + 100;
		nt_setTask(1027,nWorldMaps);
	Msg2Player("您得到100个山河社稷图残片！您现在共有 "..nWorldMaps.." 张社稷图残片。");
	elseif (detail == 2514) then
		-- 给玩家增加1000个山河社稷图残片
		nWorldMaps = nWorldMaps + 1000;
		nt_setTask(1027,nWorldMaps);
	Msg2Player("您得到1000个山河社稷图残片！您现在共有 "..nWorldMaps.." 张社稷图残片。");
	end
end
