-- 33.	20��С����������Χ��һ����ڣ�ر���ɱ��С�ֲ��ܿ���ڣ�ر�����������30%���ʹ��أ�30%���ʼ���ˢС��,40%���ʼ���ˢ��ڣ�ر�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(33)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_box = self:GetPosition().t33_box
	local pos_monster = self:GetPosition().t33_monster
	self.m_BoxIndex = DlgNpcManager:AddNpc("��ڣ�ر�", 1698, mapid, pos_box.x, pos_box.y, self)
	self.m_BarId = 0
	self:AddMonsters()
end

function pTask:DelMonsters()
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:AddMonsters()
	local mapid = self:GetMapId()
	local pos_monster = self:GetPosition().t33_monster
	self.m_Monsters = {}
	for i = 1, 20 do
		local nNpcIndex = FightNpcManager:AddNpc("��������", 1695, mapid, pos_monster[i].x, pos_monster[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_BoxIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BoxIndex)
		self.m_BoxIndex = 0
	end
	self:DelMonsters()
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	self.m_Monsters[nIndex] = 0
end

function pTask:Say(pPlayer)
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("���ڴ�", pPlayer, 3, self)
end

function pTask:OnProgressbarTimeout(nId, param, player)
	self:BroadCast("���ڴ�.")
	self.m_BarId = 0
	local nNum = random(1, 100)
	if (nNum <= 30) then
		player:Say("�������ڿ���, �ɹ��������˻��أ���ϲ��λ�ѹ���")
		self:Proceed()
	elseif (nNum <= 60) then
		self:DelMonsters()
		self:AddMonsters()
		player:Say("�������ڿ���, �����Ѿ��Ѿ��ù��������")
	else
		player:Say("�������ڿ���, �������滹��һ������")
	end
end

function pTask:OnProgressbarBreak(nId)
	self:BroadCast("��ʧ��.")
	self.m_BarId = 0
end
