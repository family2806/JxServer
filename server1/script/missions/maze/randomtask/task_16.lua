-- 16.	����ҽ����ҩʦ��ÿ���˶Ի�����һ����������������������ɼ����ϵ�ҩ�ģ�20�����ӣ�ÿ�����Ӵ���һ��ҩ�ģ���
-- Ȼ���������ҩ�Ľ�����Ҫ�������˶��ش���ȷ1����ܹ��أ����д���������ش������ԾͲ����ټ����Ի��ˡ�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

tbTASK16_RIDDLE = {
	{"����", 		"���"},
	{"���", 		"����"},
	{"��ʵ�Һ�", 	"����"},
	{"������� ",	"úҩ"},
	{"����ɱ��",	"������"},
	{"�����μ�����","̫�Ӳ�"},
	{"��������",	"��ζ��"},
	{"�ϰ����� ",	"��ñ"},
	{"���ֺú�", 	"�ݿ�"},
	{"��ʡ���� ", 	"����"},
	{"�Ź�һ", 	"�ٺ�"},
	{"�ా����", 	"�̶�"},
	{"�ǿ�ҽ��",	"����"},
	{"ıʿ�ѵ�", 	"���"},
	{"��ɫ����", 	"����"},
	{"�츮֮��",	"����"},
	{"��������",	"����"},
	{"�˷�Ǯ��",	"������"},
	{"��ɫ����",	"��ҩ"},
	{"�쳾", 		"��ɰ"},
}

pTask = Task:New(16)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_npc = self:GetPosition().t16_npc
	local pos_box = self:GetPosition().t16_box
	self.m_NpcIndex = DlgNpcManager:AddNpc("��ҩʦ", 1718, mapid, pos_npc.x, pos_npc.y, self, 0)
	self.m_Box = {}
	for i = 1, 20 do
		local nNpcIndex = DlgNpcManager:AddNpc(tbTASK16_RIDDLE[i][2], 1698, mapid, pos_box[i].x, pos_box[i].y, self, i)
		tinsert(self.m_Box, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_NpcIndex > 0) then
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Box) then
		for i = 1, getn(self.m_Box) do
			DlgNpcManager:DelNpc(self.m_Box[i])
		end
		self.m_Box = nil
	end
end

function pTask:Say(player, index)
	if (index == 0) then
		local caption = "���ҵ��Ϸ�����ȡһ�ŵ�ҩ�����ݵ�ҩ�����������һ��ҩ�ϣ�Ȼ�󣬸�λ���ŵ�ҩ��ҩ�ϸ��ң������Ҷ��Ҷ���ҩ�ϣ����ܹ��أ��Ҵ���ٲ¡�"
		-- TODO: local options = {""}
	end
end
