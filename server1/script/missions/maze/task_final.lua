-- 终极任务
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")



IL("NPCINFO")

NPCID_YULONGHUFA 	= 1628	-- 钰龙护法
NPCID_YULONGBOY		= 1629	-- 钰龙男弟子
NPCID_YULONGGIRL	= 1630	-- 钰龙女弟子
NPCID_DIALOGBOSS	= 1625	-- 龙九天（对话）
NPCID_CUP			= 1627	-- 酒杯	
NPCID_FIGHTBOSS		= 1657	-- 龙九天（战斗）
NPCID_FENGLINGLONG	= 1626	-- 凤玲珑
DEATH_YULONGDIZI	= 1

STR_YULONGHUFA = "想要见庄主要先过了我这关再说，动手吧!"

pTask = Task:New(49)

function pTask:InitStep()
end


-- 第一步
-- 开始：出现钰龙护法和男女钰龙弟子
-- 完成：击败所有男女钰龙弟子
Step1 = Step:New()
Step1.m_Yulongdizi = {}
Step1.m_DiziCount = 0
function Step1:Start(task)
	local pos = task:GetPosition()
	local index = DlgNpcManager:AddNpc("钰龙护法",
		NPCID_YULONGHUFA,
		task:GetMapId(),
		pos.yulonghufa.x,
		pos.yulonghufa.y,
		self)
	if (index > 0) then
		local nNpcIndex = DlgNpcManager:GetNpcIndex(index)
		SetNpcKind(nNpcIndex, 3)
		self.m_NpcIndex = index
	end
	self.m_Task = task
	self.m_SayOnce = 0
end

function Step1:Close(task)
	self:ClearNpc()
end

function Step1:Destroy()
	self:ClearNpc()
end

function Step1:ClearNpc()
	if (self.m_NpcIndex > 0) then
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Yulongdizi ~= nil) then
		for i = 1, getn(self.m_Yulongdizi) do
			local nIndex = self.m_Yulongdizi[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
			end
		end
		self.m_Yulongdizi = nil
		self.m_DiziCount = 0
	end
end

function Step1:AddYulongdizi(pts, name, npcid)
	local mapid = self.m_Task:GetMapId()
	for i = 1, 10 do
		local pt = pts[i]
		local nParam = getn(self.m_Yulongdizi) + 1
		local nIndex = FightNpcManager:AddNpc(name, npcid, mapid, pt.x, pt.y, self, nParam, 1, 1)
		tinsert(self.m_Yulongdizi, nIndex)
		if (nIndex > 0) then
			self.m_DiziCount = self.m_DiziCount + 1
		end
	end
end

function Step1:Say(player)
	player:Say("想要见庄主要先过了我这关再说，动手吧!")
	if (self.m_SayOnce == 0) then
		local pos = self.m_Task:GetPosition()
		self:AddYulongdizi(pos.yulongboys, "钰龙男弟子", NPCID_YULONGBOY)
		self:AddYulongdizi(pos.yulonggirls, "钰龙女弟子", NPCID_YULONGGIRL)
		self.m_SayOnce = 1
	end
end

function Step1:OnDeath(nKilled, pPlayer, nParam)
	self.m_Yulongdizi[nParam] = 0
	self.m_DiziCount = self.m_DiziCount - 1
	if (self.m_DiziCount <= 0) then
		self.m_Task:Proceed()
	end
end

-- 第二步
-- 开始：龙九天变为战斗NPC（龙老虎技能）
-- 完成：打到低于50%生命

Step2 = Step:New()
function Step2:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local boss = FightNpcManager:AddNpc("龙九天", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "<color=yellow>各位真是人中龙凤，可以越过重重危险到这来见我。现在各位面对着最后的试炼，只要打败我和我妻子就可以得到最极品的装备和最高贵的威名. <color>")
		self.m_Boss = boss
		self.m_Timer = TimerList:AddTimer(self, 9)
	end
	self.m_Task = task
	self.m_MapId = mapid
end

function Step2:Close(task)
	self:Clear()
	self.m_Task = nil
end

function Step2:Destroy()
	self:Clear()
end

function Step2:OnDeath()
	self.m_Boss = nil
	self:Clear()
	if (self.m_Task ~= nil) then
		self.m_Task:Proceed()
	end
end

function Step2:OnTime()
	if (self.m_Boss ~= nil and self.m_Task ~= nil) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(self.m_Boss)
		local cur_life = NPCINFO_GetNpcCurrentLife(nNpcIndex)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(nNpcIndex)
		if (cur_life < max_life * 0.5) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step2:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
end

-- 第三步
-- 开始：出现3个一模一样的龙九天（龙老虎技能），其中随机一个是真的
-- 完成：把真的打到40%的血时才会进入下一步
Step3 = Step:New()

function Step3:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local tb = {}
	self.m_BossIndex = random(1, 3)
	for i = 1, 3 do
		local idx = self:AddBoss("龙九天", mapid, pos.bosses[i], i)
		tinsert(tb, idx)
	end
	self.m_Bosses = tb
	self.m_Timer = TimerList:AddTimer(self, 9)
	self.m_Task = task
	self.m_MapId = mapid
end

function Step3:Close(task)
	self:Clear()
end

function Step3:Destroy()
	self:Clear()
end

function Step3:Clear()
	if (self.m_Bosses ~= nil) then
		for i = 1, getn(self.m_Bosses) do
			local nIndex = self.m_Bosses[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
			end
		end
		self.m_Bosses = nil
	end
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	self.m_BossIndex = nil
end

function Step3:OnTime()
	if (self.m_BossIndex ~= nil) then
		local npc = self.m_Bosses[self.m_BossIndex]
		local nNpcIndex = FightNpcManager:GetNpcIndex(npc)
		local cur_life = NPCINFO_GetNpcCurrentLife(nNpcIndex)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(nNpcIndex)
		if (cur_life < max_life * 0.4) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step3:OnDeath(killed, player, index)
	self.m_Bosses[index] = 0
	if (index == self.m_BossIndex) then
		if (self.m_Timer ~= nil) then
			TimerList:DelTimer(self.m_Timer)
			self.m_Timer = nil
		end
		self.m_BossIndex = nil
		self.m_Task:Proceed()
	end
end

function Step3:AddBoss(name, mapid, pt, param)
	local boss = FightNpcManager:AddNpc(name, NPCID_DIALOGBOSS, mapid, pt.x, pt.y, self, param, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "<color=yellow>看来我败在各位手下了，看我的百变魔身! <color>")
		return boss
	else
		return 0
	end
end

-- 第四步
-- 开始：龙九天（对话NPC）说话，凤玲珑出现
-- 完成：显示完对话N秒后
Step4 = Step:New()
function Step4:Start(task)
	local pos = task:GetPosition()
	local mapid = task:GetMapId()
	local boss = FightNpcManager:AddNpc("龙九天", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SetNpcKind(nNpcIndex, 3)
		SyncNpc(nNpcIndex)
		local delay = 4
		local seconds = 0
		NpcChat(nNpcIndex, "<color=yellow>各位真是百年一遇的高手，不瞒各位，钰龙山庄的主人正是大金国王，宋朝灭亡是迟早的事了，各位何必要做这样无益的牺牲，还不如加入本山庄助大金一臂之力，大业完成后荣华富贵都是各位的。不知各位意下如何？<color>")
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>你们要是一直这么固执的话就不要怪我不留情面了，你们已经被我下了金蚕绝命蛊，只要我妻子招招手蛊毒就会发作，到时候求生不得求死无门，哈哈! <color>", seconds)
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>玲珑，动手吧，让这群老顽固尝尝我的厉害! <color>", seconds)
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>玲珑！玲珑！人呢怎么还不动手？快激发他们的蛊毒，我受不了他们了! <color>", seconds)
		self.m_Timer = TimerList:AddTimer(self, (seconds + 1) * 18, 1)
		self.m_Boss = boss
		self.m_Task = task
		self.m_MapId = mapid
		self.m_Pos = pos
	end
end

function Step4:Close(task)
	self:Clear()
end

function Step4:Destroy()
	self:Clear()
end

function Step4:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
	if (self.m_Girl ~= nil) then
		DlgNpcManager:DelNpc(self.m_Girl)
		self.m_Girl = nil
	end
end

function Step4:OnTime(id)
	if (id == 1) then
		local girl = DlgNpcManager:AddNpc("凤玲珑", NPCID_FENGLINGLONG, self.m_MapId, self.m_Pos.fenglinglong.x, self.m_Pos.fenglinglong.y)
		if (girl > 0) then
			self.m_Girl = girl
			local nGirlIndex = DlgNpcManager:GetNpcIndex(girl)
			SetNpcKind(nGirlIndex, 3)
			SyncNpc(nGirlIndex)
			NpcChat(nGirlIndex, "<color=yellow>天哥，你怎么还不醒悟？多少年了你都用那些好装备诱惑江湖好汉，用剑家闻名天下，杀害了不知多少武林高手，你为什么要一辈子做金人的走狗呢？今天我不能让你继续害人了。<color>")
			local nBoyIndex = FightNpcManager:GetNpcIndex(self.m_Boss)
			NpcChat(nBoyIndex, "<color=yellow>玲珑！你！你！诶！<color>")
		end
		self.m_Timer = TimerList:AddTimer(self, 2 * 18, 2)
		return 0
	elseif (id == 2) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = FightNpcManager:AddNpc("龙九天", NPCID_FIGHTBOSS, self.m_MapId, self.m_Pos.boss.x, self.m_Pos.boss.y, self, nil, 1, 1)
		self.m_Timer = TimerList:AddTimer(self, 18 * 5, 3)
		return 0
	elseif (id == 3) then
		-- 给玩家加血
		self.m_Task:IterPlayers(self, self.AddBlood)
		return 1
	else
		return 0
	end
end

function Step4:AddBlood(player)
	-- 慈航普渡
	player:CastSkill(93, 20)
end

function Step4:OnDeath()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	self.m_Boss = nil
	self.m_Task:Proceed()
end

pTask:AddStep(clone(Step1))
pTask:AddStep(clone(Step2))
pTask:AddStep(clone(Step3))
pTask:AddStep(clone(Step4))
