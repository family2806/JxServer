--南方解放纪念日活动
--by小浪多多
--2007-04-13
XINGYUNLIBAO = 2556 --Byte:1.年 2.月 3.日 4.次数

function nanfangjiefangri_main()
	local aryTalk = {
		"<dec><npc>今日，宋金战事日益激烈。各地的武林人士都汇聚参战。他们牺牲性命打退仇人保卫祖国。为了歌颂这种侠义精神，武林盟主决定要给在宋金战场上立下战功的英雄们予以奖励.",
		"我想了解活动./about",
		"我想领功劳令./getGongLaoLin",
		"我想领战场英雄奖励./getXingYunLiBao",
		"真不好意思，我待会再来./no",
	}
	CreateTaskSay(aryTalk)
	
end
function getGongLaoLin()
	if (GetCash()<300000) then
		CreateTaskSay({"<dec><npc>要交30万两登记费用，大侠的钱不够呢！/no"});
		return 0;
	end
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>只有充值玩家才可以领取.","知道了/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>只有50级以上玩家才可以领取.","知道了/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>准备出1个空位放1块<color=yellow>功臣令<color>.","知道了/no"});
		return 0;
	end
	Pay(300000);
	local nidx = AddItem(6,1,1411,1,0,0);
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>你已经领取了1块 <color=yellow>功臣令<color>.","知道了/no"});
end

function getXingYunLiBao()
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>只有充值玩家才可以领取.","知道了/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>只有50级以上玩家才可以领取.","知道了/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>准备出1个空位放1块<color=yellow>功臣令<color>.","知道了/no"});
		return 0;
	end
	local ndate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nlibao = GetTask(XINGYUNLIBAO);
	local olddate = tonumber(GetByte(nlibao,1)..GetByte(nlibao,2)..GetByte(nlibao,3));
	local num = GetByte(nlibao,4);
	if num == nil then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,0));
		num = 0;
	end
	if ndate == olddate then 
		CreateTaskSay({"<dec><npc>每天最多只能领取50个，明天再来吧。","知道了/no"});
		return 0;
	end
	local ngonglao = CalcEquiproomItemCount(6,1,1411,-1)
	local nxunzhang = CalcEquiproomItemCount(6,1,1412,-1)
	if ngonglao < 1 then
		CreateTaskSay({"<dec><npc> 大侠没有带<color=yellow>功臣令<color>.","知道了/no"});
		return 0;
	end
	if nxunzhang < 1 then
		CreateTaskSay({"<dec><npc> 大侠没有带<color=yellow>宋金徽章<color>. 用积累点换宋金徽章","知道了/no"});
		return 0;
	end	
	num = num + 1;
	if num >= 50 then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),1,tonumber(GetLocalDate("%y"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,tonumber(GetLocalDate("%m"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),3,tonumber(GetLocalDate("%d"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,0));
	else
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,num));
	end
	ConsumeEquiproomItem(1, 6, 1, 1411, -1)
	ConsumeEquiproomItem(1, 6, 1, 1412, -1)
	local nidx = AddItem(6,1,1413,1,0,0);
	WriteLog(format("[XINGYUNLIBAO]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>成功领取1个<color=yellow>幸运礼包<color>.","知道了/no"});
end

function about()
	CreateTaskSay({"<dec><npc>从28/4/2007到13/5/2007, 50级以上的充值玩家可以到我这用1块<color=yellow>功臣令<color> (缴纳30万登记费我才承认) 和1个<color=yellow>宋金徽章<color> (在军需官处用500积累点可兑换) 进行兑换","知道了/no"})
end