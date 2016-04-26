Include("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua")

PrepareGame.nPassTime = 0 --ÿ��������ʼ�������߹���ʱ��


function PrepareGame:InitTimer()
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return
	end
	
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	
	self.nPassTime = 0
	local nTime = 1 * 60
	self.nTimeIndex = AddTimer(nTime * 18, "PrepareGame:OnTime", 0)
	Msg2Map(PREPARE_MAP, "ѵ����ľ�˱����Ѿ���ʼ")
	AddGlobalNews("�ʳ�ѵ����������ʼ�����λ������ȥ�ٰ����ٴ��μӱ���")
end

function PrepareGame:OnTime(nTimerId, nParam)
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return 0, 0
	end
	
	self.nPassTime = self.nPassTime + 60
	local nRestTime = PREPARETIME * 60 - self.nPassTime
	if nRestTime > 0 then
		Msg2Map(PREPARE_MAP, format("���� %d����Ѱ��ľ�˻����ʼ", floor(nRestTime / 60)))
		return 60 * 18, 0
	end
	
	------��������,����Ҵ��ͽ�������---
	self:GoToGame()
	DynamicExecute("\\script\\missions\\zhaojingling\\game\\gametimer.lua", "Game:InitTimer")
	return 0, 0
end

