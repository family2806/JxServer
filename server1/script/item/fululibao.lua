--剑网三周年活动
--福禄礼包
--拾取时随机获得白米粉、白砂糖、豆沙、红枣4种材料中的一种
--限制 80级 及以上玩家，冲值用户

Include("\\script\\event\\jxanniversary3\\head.lua");

function PickUp(nItemIndex, nPlayerIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 0;
	end;
	
	local nrand = random(100);
	local naddrate = 0;
	for i = 1, getn(tb_JXAN_RESOURCERATE) do
		naddrate = naddrate + tb_JXAN_RESOURCERATE[i][3];
		if (naddrate >= nrand) then
			AddItem(tb_JXAN_RESOURCERATE[i][1][1],tb_JXAN_RESOURCERATE[i][1][2],tb_JXAN_RESOURCERATE[i][1][3],1,1,1);
			Msg2Player("你获得了一个"..tb_JXAN_RESOURCERATE[i][2]);
			break
		end;
	end;
end

function IsPickable(nItemIndex, nPlayerIndex)
	--活动期结束拾取物品不再有效
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nCurDate > JXANNIVERSARY3_ENDDATE) then
		Say("本次活动已经结束，谢谢您的参与！", 0);
		return 1;
	end;

	if (JxAn_cloud_join() ~= 1) then
		return 0;
	end;

	return 1;
end;