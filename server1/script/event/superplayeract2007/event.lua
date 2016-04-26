-- 超级玩家活动（送天山雪莲）
-- By: Feimingzhi(2007-05-08)
-- Content:
--活动期间，凡在2007年06月01日服务器维护至2007年07月01日24点之间新建的角色，有资格参加《超级玩家活动》。 在活动期间内，创建的新角色并等级达到90级， 并完成116个野叟任务链（无间断地完成任务）就可以在新手村和各大城市的礼官处获得一个天山雪莲。记录LOG。
--一个角色只能领取一次。
--90级以及90级以下的玩家，使用天山雪莲，立即升到120 级。
--
-- 	礼官对话设计
--只有在2007年06月01日服务器维护至2007年07月01日24点之间才会出现“超级玩家活动”选项。

SUPERPLAYERACT_BIGENTIME = 20070601     --超级玩家活动开始日期
SUPERPLAYERACT_ENDTIME = 20070701       --超级玩家活动结束日期
SUPERPLAYERACT_LevRequest = 90          --超级玩家活动角色所需等级
SUPERPLAYERACT_TaskTime = 116             --要求野叟任务最少多少次
SUPERPLAYERACT_TaskDataKey = 1044       --存储野叟任务次数的数据key
TSK_SUPERPLAYERACT = 1816               --存储是否领取奖励。
TSXL_ITEM_ID = 1431                     --天山雪莲的物品ID
SUPERPLAYERACT_ExtPoint = 4             --要求新建帐号
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua")    --包含野叟任务

function SuperPlayerAct2007()
    local tDiaStr = 
    {
        "账户可以在<color=green>01-06-2007<color>到<color=green>01-07-2007<color>期间新建 ",
        format("将有机会参加'超级玩家'活动. 在活动期间，当新人物(在新建账户中)级数达到<color=yellow>%s<color> 和完成<color=yellow>",SUPERPLAYERACT_LevRequest),
        format("%s<color> 野叟任务(任务链)将可以到各大城市和新手村的礼官处领取1个<yellow=color>天山雪莲<color>.",	SUPERPLAYERACT_TaskTime)
    }
   Say( format("%s%s%s",tDiaStr[1],tDiaStr[2],tDiaStr[3]),
   		3,
   		"领取天山雪莲/SuperPlayerAct_WinMedal",
   		"天山雪莲是什么？/SuperPlayerAct_ItemDes",
   		"结束对话/OnCancel")
end
--
function SuperPlayerAct_WinMedal()

	local nDay = tonumber(GetLocalDate("%Y%m%d"))
    local szMsg = "";
    if nDay < SUPERPLAYERACT_BIGENTIME and nDay > SUPERPLAYERACT_ENDTIME then
        Msg2Player("真遗憾，活动时间结束了.")
        return 0;
    end;
     
    if GetExtPoint(SUPERPLAYERACT_ExtPoint) ~= 1 then
    	szMsg = "真可惜，不是新建账户，不能参加此活动!";
        Say(szMsg,
        	2,
        	"返回/main",
        	"结束对话/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nLev = GetLevel()
    if nLev < SUPERPLAYERACT_LevRequest then
    	szMsg = format("未到 %s级, 等到 %s级再来找我.",SUPERPLAYERACT_LevRequest,SUPERPLAYERACT_LevRequest)
        Say(szMsg,
        	2,
        	"返回/main",
        	"结束对话/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nTaskEDTime = GetTask(SUPERPLAYERACT_TaskDataKey)
    --local nTaskEDTime = tl_counttasklinknum(1)
    
    if nTaskEDTime < SUPERPLAYERACT_TaskTime then
    	szMsg = format("真可惜，没有完成一个 %s 野叟任务链, 不能领取天山雪莲.",SUPERPLAYERACT_TaskTime)
        Say(szMsg,2,"返回/main","结束对话/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    if  GetTask( TSK_SUPERPLAYERACT ) > 0 then
        Say("真可惜，此任务已经领过奖励了.",2,"返回/main","结束对话/OnCancel")
        return 0
    end
    local nItemIdx = AddItem( 6, 1, TSXL_ITEM_ID, 1, 0, 0 )
    if nItemIdx > 0 then
        SetTask( TSK_SUPERPLAYERACT, 1 )
        Say("这是天山雪莲！要好好保存！!",0)
        Msg2Player("你得到1个天山雪莲.")
        WriteLog(format("[超级玩家活动] \t%s\tName:%s\tAccount:%s\t 得到1个天山雪莲",
		GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
    else
        Say("背包满了，不能领取物品!",2,"返回/main","结束对话/OnCancel")
    end
end
--
function SuperPlayerAct_ItemDes()
    Say("天山雪莲: <enter>50到90级 (包括50和90级)的人使用将会快速提高自己的等级.",2,"返回/SuperPlayerAct2007","结束对话/OnCancel")
end
--
function OnCancel()
end
