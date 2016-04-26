
-- ====================== 文件信息 ======================

-- 剑侠情缘online 转生任务 北斗长生术基础篇 道具
-- FileName: jiayi_shengong.lua
-- Edited: 子非鱼
-- 2007-03-30	20:14:00

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")

function main()
	
	if (check_zhuansheng_level() == 1) then
		
		if (GetTask(TSK_ZHUANSHENG_FLAG) == 0) then
			Msg2Player(format("已学得%s, 需要学%s 才能功成名就.", "<北斗长生术-基础篇>", "<北斗长生术-心法篇>"));
			Say(format("已学得 %s,  但是，武功依然还未升级，看起来这里还有秘密没有破解 %s<color=yellow> %s<color> 试了解一下信息.", 
							"<北斗长生术-基础篇>", "明月镇", "北斗老人"), 0);
			
			SetTask(TSK_ZHUANSHENG_FLAG,1);
			
			WriteLog(format("[重生任务]\t%s\tName:%s\tAccount:%s\t 学习级别:%d, 门派:%d",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber()));
			return 0;
		else
			Msg2Player("已学<北斗长生术-基础篇> 了，只能再学<北斗长生术-心法篇> 就能功成名就了.");
			return 1;
		end
	
	end
	return 1;
end
