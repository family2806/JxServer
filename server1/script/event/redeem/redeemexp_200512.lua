
-- ====================== 文件信息 ======================

-- 剑侠情缘online 经验补偿活动头文件
-- Edited by peres
-- 2005/12/21 AM 11:23

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

IncludeLib( "FILESYS" );

Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- 升级所需的经验表

ID_2005EXPISPAY = 2333; -- 记录是否已经领取

-- 2005 年 12 月停机补偿经验的主入口
function getExpiationExp_200512()

local nYear  = tonumber(date("%y"));
local nMonth = tonumber(date("%m"));
local nDay   = tonumber(date("%d"));

	-- 判断是否冲卡
	if IsCharged()==0 then
		Say("真不好意思！这个补偿活动只有 <color=yellow>充值玩家<color>才可以参加!", 0);
		return
	end;
	
	-- 判断等级是否大于 50 级
	if GetLevel()<50 then
		Say("真不好意思！这个补偿活动只有 <color=yellow>50级以上的玩家<color> 才可以参加!", 0);
		return
	end;
	
	-- 判断是否已经领取过了
	if GetTask(ID_2005EXPISPAY)~=0 then
		Say("额！没记错的话你已经领过补偿经验了，不要这么贪心呢!", 0);
		return
	end;
	
	-- 判断是否符合日期：2005/12/23 ~ 2005/12/31
	if nYear==5 and nMonth==12 and nDay>=23 and nDay<=31 then
		compensateExp();
		return
	else
		Say("真不好意思！这次补偿活动是从<color=yellow>23/12/2005<color>开始到<color=yellow>31/12/2005<color>, 现在<color=yellow>己结束<color>, 你回去吧!", 0);
		return	
	end;

end;


-- 补偿经验的主函数
function compensateExp()

local nExp = getRedeemeExp();

	SetTask(ID_2005EXPISPAY, 1);  -- 写入任务变量，先写变量再加经验，以防后面出错后会刷经验

	addPlayerExp(nExp);
	
	Say("这次补偿活动你得到: <color=yellow>"..nExp.."<color> 经验!", 0);
	
	Msg2Player("这次补偿活动你得到:<color=yellow>"..nExp.."<color> 经验!");
	
	WriteTaskLog("经验补偿活动中得到"..nExp.." 经验!");

end;


-- 获取应该补偿的经验
function getRedeemeExp()

local nLevel = GetLevel();

	return nLevel * 8 * 20000;
	
end;


-- 给玩家加指定的经验，叠加类型
function addPlayerExp(myExpValue)
	tl_addPlayerExp(myExpValue)	
end;


--判断玩家是否充过卡
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog(" [补偿经验记录]"..date(" [%y 年 %m 月 %d 日  %H 时%M 分]").." [密码："..GetAccount().."] [人物:"..GetName().."]"..strMain);
end;
