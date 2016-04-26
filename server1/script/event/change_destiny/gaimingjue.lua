Include("\\script\\event\\change_destiny\\head.lua");

function main(nItemIndex)
	return tbChangeDestiny:onUse(nItemIndex);
end


function tbChangeDestiny:onUse(nItemIndex)
	
--	if self:isCarryOn() ~= 1 then
--		Say("��������������ɢ�ˡ�����", 0 );
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		Say("ֻ��160��179������Ҳſ���ʹ��ת��һ��!", 0 );
		return 1;
	end
	
	local nHasAward	= self:getTask(self.nTask_GaiMing_HasReceive);
	local nHasUsed	= self:getTask(self.nTask_GaiMing_HasUsed);
	
	if nHasAward ~= 1 then
		Say("������������, ����ò�Ҫʹ��.", 0 );
		return 1;
	end
	
	if nHasUsed ~= 0 then
		Say("������������, ʹ�ö��˽�����������.", 0 );
		return 1;
	end
	
	local nOldSkill = GetSkillMaxLevelAddons();
	local nNewSkill = nOldSkill + self.nLimit_AddSkill;
	
	SetSkillMaxLevelAddons(nNewSkill);
	self:setTask(self.nTask_GaiMing_HasUsed, 1);
	
	local szMsg = format("[ChangeDestiny]Eat GaiMingJue: %s Use GaiMingJue and add skill from %d to %d.",GetName(), nOldSkill, nNewSkill);
	WriteLog(szMsg);
	
	Say(format("����ʹ�����������, ���ܵ���  %d�������� %d.", nOldSkill, nNewSkill), 0);
	return 0;
end

