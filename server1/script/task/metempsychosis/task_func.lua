-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 多次转生头文件
-- 文件名　：task_func.lua
-- 创建者　：子非魚
-- 创建时间：2009-02-04 16:21:20

-- ======================================================

IncludeLib("LEAGUE");
IncludeLib("SETTING");
IncludeLib("FILESYS");
IncludeLib("ITEM");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\metempsychosis\\task_head.lua")

-- 记录在第 n_transcount 次转生时 的等级 和所选抗性
function zhuansheng_set_gre(n_transcount, n_level, n_resist)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte, n_level);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte+1, n_resist);
	SetTask(n_taskid, n_taskvalue);
	--WriteLog(format("zhuansheng_set_gre:%d,%d,%d,byte:%d,id:%d", n_transcount, n_level, n_resist,n_taskbyte, n_taskid))
	return 1;
end

-- 返回第n_transcount次转生 等级和所选抗性
function zhuansheng_get_gre(n_transcount)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	
	return GetByte(n_taskvalue, n_taskbyte),GetByte(n_taskvalue, n_taskbyte+1)
end

-- 转生洗掉所有技能点，并增加转生获得的额外 npoint 技能点
function zhuansheng_clear_skill(nlevel, npoint)
	local nskill1 = HaveMagic(210);	--保留轻功
	local nskill2 = HaveMagic(400);	--保留“劫富济贫”
	local nallskill = RollbackSkill();	-- 清除投点技能，不返回技能点
	if (nskill1 ~= -1) then			--返回轻功
		nallskill = nallskill - nskill1;
		AddMagic(210, nskill1);
	end
	
	if (nskill2 ~= -1) then			--返回“劫富济贫”
		nallskill = nallskill - nskill2;
		AddMagic(400, nskill2);
	end
	--nallskill = nallskill - (nlevel -1)	--转生只扣掉升级时给与的技能点
	AddMagicPoint(npoint + nallskill);
end

-- 转生洗掉所有潜能点，并增加转生获得的额外 npoint 潜能点
function zhuansheng_clear_prop(nlevel, npoint, nseries)
	if (not nseries) then
		nseries = GetSeries();
	end
	
	nseries = nseries + 1;
	local Utask88 = GetTask(88)-- 将已分配潜能重置（task(88)是任务中直接奖励的力量、身法等）
	AddProp(100)			-- 为避免没有未分配潜能点可供修复的极端情况，暂时“借”给他100点

	AddStrg(TB_BASE_STRG[nseries] - GetStrg(1) + GetByte(Utask88,1));
	AddDex(TB_BASE_DEX[nseries] - GetDex(1) + GetByte(Utask88,2));
	AddVit(TB_BASE_VIT[nseries] - GetVit(1) + GetByte(Utask88,3));
	AddEng(TB_BASE_ENG[nseries] - GetEng(1) + GetByte(Utask88,4));
	local nallprop = GetProp();
	--nallprop = nallprop - (nlevel - 1) * 5;	--转生只扣掉升级时给与的潜能点
	AddProp(npoint-100);
end


-- 检查是否还有战队关系
function check_zhuansheng_league(ntype)
	local nlg_idx = LG_GetLeagueObjByRole(ntype,GetName());
	if (nlg_idx ~= nil and nlg_idx ~= 0) then
		return 1;			--有战队关系
	else
		return 0;			--无战队关系
	end
end

-- 检查当前转生次和等级是否能够再转生
function check_zhuansheng_level()
	local nlevel = GetLevel();
	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount >= 5) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[7], "可以了./OnCancel"});
		return 0;
	end
	
	
	if (not TB_LEVEL_REMAIN_PROP[nlevel] or not TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[5], "可以了./OnCancel"});
		return
	end
	
	if (nlevel < TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({"<dec><npc>"..format("在第 (%d)次转生, 等级最少要%d!", (ntranscount + 1), TB_LEVEL_LIMIT[ntranscount + 1]), "结束对话/OnCancel"});
		return 0;
	end
	
	return 1;
end

function OnCancel()
end
