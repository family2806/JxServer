-- 酒葫芦 by bel at 20090409 10：04

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_jiu_expiredtime) then
		Msg2Player("该物品已过期.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("大侠还未够50级或者还未充值，所以不能参加活动", 0);
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		Say(format("为确保财产安全，请留下%d 空位", 10), 0);
		return 1;
	end
	
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jiuexp) >= GetTask(jf0904_TSK_jiuexplt)) then
		Say("已达到最高经验，不能再使用酒壶了.", 0);
		return 1;
	end
	
	local nAddedExp = 15;
	if (GetTask(jf0904_TSK_jiuexp) + nAddedExp > GetTask(jf0904_TSK_jiuexplt)) then
		nAddedExp = GetTask(jf0904_TSK_jiuexplt) - GetTask(jf0904_TSK_jiuexp);
	end	
	
	AddOwnExp(nAddedExp * 100000);
	SetTask(jf0904_TSK_jiuexp, GetTask(jf0904_TSK_jiuexp) + nAddedExp);
end
