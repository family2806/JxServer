-- 16.	钰龙医仙柳药师：每个人对话后获得一张字条，根据字条的谜面采集地上的药材（20个箱子，每个箱子代表一种药材），
-- 然后把字条和药材交还，要求所有人都回答正确1题才能过关，如有错误则继续回答，如果答对就不能再继续对话了。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

tbTASK16_RIDDLE = {
	{"故乡", 		"熟地"},
	{"异国", 		"生地"},
	{"老实忠厚", 	"红朴"},
	{"病入膏肓 ",	"煤药"},
	{"武松杀手",	"穿心莲"},
	{"孩儿参见父王","太子参"},
	{"苦辣酸甜淡",	"五味子"},
	{"老蚌生珠 ",	"贝帽"},
	{"绿林好汉", 	"草寇"},
	{"三省我身 ", 	"防已"},
	{"九归一", 	"百合"},
	{"苦熬三九", 	"忍冬"},
	{"骨科医生",	"续断"},
	{"谋士难当", 	"苦参"},
	{"红色顾问", 	"丹参"},
	{"天府之宝",	"川贝"},
	{"假期休完",	"当归"},
	{"浪费钱财",	"金银花"},
	{"黑色丸子",	"乌药"},
	{"红尘", 		"朱砂"},
}

pTask = Task:New(16)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_npc = self:GetPosition().t16_npc
	local pos_box = self:GetPosition().t16_box
	self.m_NpcIndex = DlgNpcManager:AddNpc("柳药师", 1718, mapid, pos_npc.x, pos_npc.y, self, 0)
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
		local caption = "请大家到老夫这领取一颗丹药，根据丹药上面的密语拿一种药料，然后，各位拿着丹药和药料给我，如果大家都找对了药料，就能过关，找错就再猜。"
		-- TODO: local options = {""}
	end
end
