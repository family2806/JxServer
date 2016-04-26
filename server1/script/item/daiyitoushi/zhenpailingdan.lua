-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一镇派灵丹
-- 食用后能提升１点技能点
-- 与镇派灵药共用变量，第一个Byte记录灵丹使用次数，第二个Byte记录灵药使用次数

-- Edited by 子非魚
-- 2008/03/03 23:29

-- ======================================================
Include("\\script\\lib\\gb_modulefuncs.lua")


TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_FLAG				=	1881						-- “带艺投师”退出门派的标记
														--	 0：未申请转投门派或转投门派成功（与转职次数一起决定）；1：成功申请转投门派；
TSK_TOUSHI_COUNT			=	1883						-- “带艺投师”转职的次数

function main(nItemIdx)
--	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
--		Say("对不起，该功能暂时被关了，打开时间会在稍候通知", 0);
--		return 1;
--	end
	
	local nValue	= GetTask(TSK_ZHENPAILINGDAN_USECNT);
	local nTimes = GetByte(nValue, 1);
	local str={
		"研究一会镇派灵丹还是不会使用(未转门派不能使用)",
		"刚刚喝完镇派灵丹感觉一股活力在身体流动(增加1个技能点)",
		"手拿镇派灵丹发现它没有功效了(已使用到最高上限了)"
		}
	if(nTimes >= 15) then              	-- 使用次数已达到上限
		Msg2Player(str[3])
		return 1;
	elseif (GetTask(TSK_TOUSHI_FLAG) == 0 and GetTask(TSK_TOUSHI_COUNT) <= 0) then     	-- 转投门派成功才可使用
		Msg2Player(str[1])
		return 1;
	else                            	-- 奖励1点技能点
		AddMagicPoint(1);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(nValue, 1, nTimes + 1));
		Msg2Player(str[2]);
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tAdd MagicPoint 1 by ZhenPaiLingDan",
						"镇派灵丹",
						GetLocalDate("%Y-%m-%d %X"),
						GetName(), GetAccount()));
		return 0;
	end
end
