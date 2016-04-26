
-- ====================== 文件信息 ======================

-- 剑侠情缘online 2006 元旦活动武林盟主诏书文件
-- Edited by peres
-- 2005/12/22 PM 15:12

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 读入 2006 元旦活动头文件
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- 随机任务的处理支持
Include("\\script\\task\\random\\task_head.lua");

function main()

Say("武林盟主诏书：当此乱世，各位仍为我武林盟尽心竭力，独孤剑感激不尽。恰逢农历新年将至，元旦佳节，特委派我门下传人为各位送上元旦贺礼，大家可以在<color=yellow>12月30日至1月1日<color>领取，最后祝合家安康，新年如意！ —— 独孤剑",
	7,
	"领取每日的八小时双倍经验/getDoubleExp",
	"领取每日的经验奖励/getMoreExp_Confirm",
	"领取每日的任务卷轴/getTaskBook",
	"关于随机任务触发概率翻倍的消息/getRandomTaskInfo",
	"有关白驹丸的新消息/getBaijuInfo",
	"可以用铜钱购买新道具/getCoppercashInfo",
	"阅读完毕/OnExit");
	
	return 1;

end;


function getDoubleExp()

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNewYearTime()==0 then
		Say("现在已经不是元旦了哦！", 0);
		return
	end;

	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("只有 80 级以上的人才能领取双倍经验哦！", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);	
		
	elseif GetTask(ID_GETDOUBLEEXP_NUM)>=1 then
	
		Say("你今天已经领取过了双倍经验了哦！", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);
			
	end;
	
	-- 80 级以上的人每天可以领取一次 8 小时经验双倍
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("您得到了<color=green> 8 小时的双倍经验！<color>");
		WriteTaskLog("得到了 8 小时的双倍经验！");
		
	else
		Say("只有 80 级以上的人才能领取双倍经验哦！", 0);
	end;

end;


function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNewYearTime()==0 then
		Say("现在已经不是元旦了哦！", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("本次元旦活动只有冲卡用户才能参与哦！", 0);
		return
	end;
	
	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("只有 80 级以上的人才能领取这个任务卷轴哦！", 0);
		return
	end;
	
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	elseif GetTask(ID_GETTASKBOOK_NUM)>=1 then
	
		Say("你今天已经领取过了一个任务卷轴哦！", 0);
		return
		
	else
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	end;
	
	-- 选择一个第二层的随机任务
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- 生成一个任务卷轴
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- 同步物品魔法属性
	SyncItem(nRandomItemIndex);

	Msg2Player("您得到了<color=green>任务卷轴一个！<color>");
	
	WriteTaskLog("得到了一个任务卷轴，编号为："..nRandomTaskID);
	
end;


-- 询问玩家是否领取经验
function getMoreExp_Confirm()
	Say("您在<color=yellow>2005年12月30日至2006年1月1日<color>期间，每日上线都会获得独孤盟主赠送的大批经验。<color=yellow>这三天之内每天能领一次<color>，但两次领取经验之间相隔需要<color=yellow>在线超过1小时<color>。你要现在领取吗？",2,
		"好啊，我要领取/getMoreExpMain",
		"还是再等一下吧/OnExit");
	return
end;


-- 领取每日的经验
function getMoreExpMain()

local nExp = countMoreExpNum();

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isNewYearTime()==0 then
		Say("现在已经不是元旦了哦！", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("本次元旦活动只有冲卡用户才能参与哦！", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- 限制只能升 5 级
		else
			addPlayerExpForLimit(nExp, 0); -- 不限制
		end;
		
		Msg2Player("您得到了元旦活动的经验奖励：<color=yellow>"..nExp.."<color> 点经验！");
		
		writeMoreExpData();  -- 记录领取经验的相关数据
	
		WriteTaskLog("得到每日的奖励经验："..nExp);
		
	else
		Say("你现在的条件不能够领取每日的经验，在12月30日至1月1日期间，每日上线都会获得独孤盟主赠送的大批经验。<color=yellow>这三天之内每天能领一次<color>，但两次领取经验之间相隔需要<color=yellow>在线超过1小时<color>哦！", 0);
		return
	end;


end;


-- 获取铜钱的提示
function getCoppercashInfo()

	Say("近日临安的易容术士新开发了圣诞精灵、新年侠客、新年侠女、驯鹿等一批面具，同时各地的行脚商人处也新进了蓝色妖姬礼盒，节日礼花礼盒与雪花礼盒，并且各地零贩处新进了一种可以自己编辑祝福语言的如意卡，欢迎大家前去选购。", 0);
	return
	
end;


function getBaijuInfo()

	Say("您在 <color=yellow>2005年12月30日至2006年1月1日<color> 每天<color=red>0：00~18：00<color>，使用白驹丸挂机获得的经验将翻倍、技能白驹丸挂机获得熟练度将翻 1.5 倍。", 0);
	return

end;


function getRandomTaskInfo()

	Say("您在 <color=yellow>2005年12月30日至2006年1月1日<color> 获得了随机任务触发概率翻倍的贺礼！", 0);
	return

end;



function OnExit()

end;