-- 天山雪莲
-- By: Feimingzhi(2007-05-08)
-- Content:90级以下玩家使用天山雪莲直接升到120级。

IncludeLib("SETTING");
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数
Include("\\script\\lib\\pay.lua")


function main( nItemIndex )
    
    local nPLev = GetLevel()
    if nPLev > 90  or nPLev < 10 or IsCharged() < 1 then
        Say("只有10-90级的人物(包括10和90) 才能使用.", 0)
        return 1
    end
	
    tl_addPlayerExp(37540000)	--10级0%升到120级0%的总经验值
	nPLev = GetLevel()
	Msg2Player(format("恭喜您，目前您的等级为%d.",nPLev))
	WriteLog(format("[使用天山雪莲]\t%s\tName:%s\tAccount:%s\t 刚吃了一个天山雪莲.",
			GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
end
--
