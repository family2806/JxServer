Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\lib\\awardtemplet.lua")
--风云令牌 - 完成1次搜集功勋令的任务 - Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")
tbjf0904_shuizei_exp =
{
	[1]	= {nExp = 10, 	nRate = 0.3},
	[2]	= {nExp = 15, 	nRate = 0.4},
	[3]	= {nExp = 20, 	nRate = 0.2},
	[4]	= {nExp = 25, 	nRate = 0.05},
	[5]	= {nExp = 30, 	nRate = 0.05},
};


function join_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("不在活动时间内.", 0);
		return
	end
	
	jf0904_InitTaskctrl();
	
	if(GetTask(jf0904_TSK_shuizei_GetTask) ~= 0) then
		Say("你已领取任务消灭水贼.", 0);
		return
	end
	
	Say("北岸船夫: 今日水贼横行霸道，抢劫了很多读过风陵渡两岸的船只.你要替天行道，消灭这些山贼吗？",2,"我已经给他们上了1课./join_shuizei_act_cf", "我很忙，别的时候再来./OnCancel");
end

function join_shuizei_act_cf()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("大侠等级不够50级或是未充值，因此不能参加活动", 0);
		return
	end

	if (GetTask(jf0904_TSK_shuizei_FulfilTaskTime) <= 0) then
		Say("今天不能能再领取消灭水贼的任务了.", 0);
		return
	end
	
	Say("成功领取消灭水贼任务!", 0);
	SetTask(jf0904_TSK_shuizei_FulfilTaskTime, GetTask(jf0904_TSK_shuizei_FulfilTaskTime) - 1);
	SetTask(jf0904_TSK_shuizei_GetTask, 1);
end

function fullfill_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("不在活动时间内.", 0);
		return
	end
	
	if (GetTask(jf0904_TSK_shuizei_GetTask) ~= 1) then
		Say("还未领取水贼任务，因此无法交任务!", 0);
		return
	end
	
	give_shuizei_award_lingpai();
end


function give_shuizei_award_lingpai()
	GiveItemUI("交追功令", "请把追功令放在下面，每次只能放1块.", "submit_zhuigongling", "no")
end

function submit_zhuigongling(nCount)
	if (nCount ~= 1) then
		Say("放入数量不对!", 2, "不好意思! 我重新放./give_shuizei_award_lingpai", "我一会回来/no")
		return 
	end
	local nItemIdx = GetGiveItemUnit(1);
	local ng, nd, np = GetItemProp(nItemIdx);
	if (ng == 6 and nd == 1 and np == 2015) then
		RemoveItemByIndex(nItemIdx);
		SetTask(jf0904_TSK_shuizei_GetTask, 0);
		Say("船夫：祝贺大侠！这是与英雄相配的奖励.", 0);
		--风云令牌 - 完成1次搜集功勋令的任务 - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FLD_Collect_Item_VNG");
		give_shuizei_award_exp();
	else
		Say("你拿来的物品不对!", 2, "不好意思！我重新给你./give_shuizei_award_lingpai", "我一会回来sau/no");
	end
end


function give_shuizei_award_exp()
	local nstep = random(1, 100000);
	local ncurstep 	= 0;
	local naddedexp = 0;
	for i = 1, getn(tbjf0904_shuizei_exp) do
		if (ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000 >= nstep) then
			naddedexp = tbjf0904_shuizei_exp[i].nExp;
			break;
		end
		ncurstep = ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000;
	end
	
	AddOwnExp(naddedexp * 1000000);
	
end

function jf0904_shuizei_IsActtime()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	return (nDate >= jf0904_act_dateS);
end

function about_shuizei()
	Say("礼官: 消灭水贼活动从28/04/2009开始. 活动期间大侠可以到风陵渡南北岸的个点领奖.", 0);
end