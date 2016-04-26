-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 千年何首乌
-- 文件名　：qiannian_heshouwu.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-21 12:17:35
-- 转生后角色使用，通过此物品最多获得25点潜能点

-- ======================================================

IncludeLib("SETTING");

TSK_QIANNIAN_HESHOUWU_PROP = 2597;

function main()
	if (GetTask(TSK_QIANNIAN_HESHOUWU_PROP) >= 25) then
		Msg2Player("该物品不能升级大侠的功力.");
		return 1;
	end
	
	if (ST_IsTransLife() ~= 1) then
		Msg2Player("大侠不能获得任何效果.");
		return 1;
	end
	
	local tb_prop = {
		{pot=3,msg="一点"},
		{pot=4,msg="未承诺"},
		{pot=5,msg="一些"},
		{pot=6,msg="不少"},
		{pot=7,msg="有点多"},
		};
	
	local n_rand = random(1,5);
	local n_prop = tb_prop[n_rand].pot
	if (n_prop + GetTask(TSK_QIANNIAN_HESHOUWU_PROP) > 25) then
		n_prop = 25 - GetTask(TSK_QIANNIAN_HESHOUWU_PROP);
	end
	
	AddProp(n_prop);
	
	SetTask(TSK_QIANNIAN_HESHOUWU_PROP,GetTask(TSK_QIANNIAN_HESHOUWU_PROP)+ n_prop);
	
	Msg2Player(format("使用后可以获得%s 效果",tostring(n_prop)));
end
