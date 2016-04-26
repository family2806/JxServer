
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机任务触发入口脚本
-- Edited by peres
-- 2005/09/01 PM 16:40

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 同伴系统的支持
IncludeLib("PARTNER");

-- 读入任务系统头文件，包含随机任务
Include("\\script\\task\\system\\task_main.lua");


-- 子母袋头文件
Include("\\script\\item\\ib\\zimudai.lua");


function main()
	local szRegion = GetProductRegion();

	if (szRegion == "vn") then	--越南没有随机任务
		do return end
	end;

	if (szRegion == "cn_ib") then
		-- IB 子母袋定时检查有效期
		zmd_check_expire_timer();
		do return end
	end	
	
	
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- 获得召唤出同伴的index,同伴状态为召出或为不召出
	local nResult = 0;

	local nRandomMax = 8;  -- 随机任务几率的最大随机值

	-- 没有同伴的跟随无法触发任务
	if partnerindex==0 or partnerstate==0 then
		return
	end;
	

	if (szRegion == "cn") then
		-- 如果是xx活动，则加大一倍的概率
		--if isEventDay()==1 then nRandomMax = 4; end;
	end
	
	-- 如果不是特殊活动，则有 1/8 的几率触发随机任务
	if random(1,nRandomMax)==1 then
	
		nResult = initRandomTask();
		
		if nResult==0 then
			CDebug:MessageOut("随机任务选取到了与上一个任务相同的 ID！");
		end;
		
	end;

	return 0;

end;

-- 获取每次随机任务的触发时间，每 12 分钟触发
function GetRandomTimer()
	return 720;
end;
