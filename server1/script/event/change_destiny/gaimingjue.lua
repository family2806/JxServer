Include("\\script\\event\\change_destiny\\head.lua");

function main(nItemIndex)
	return tbChangeDestiny:onUse(nItemIndex);
end


function tbChangeDestiny:onUse(nItemIndex)
	
--	if self:isCarryOn() ~= 1 then
--		Say("逆天改命诀随风消散了。。。", 0 );
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		Say("只有160到179级的玩家才可以使用转生一次!", 0 );
		return 1;
	end
	
	local nHasAward	= self:getTask(self.nTask_GaiMing_HasReceive);
	local nHasUsed	= self:getTask(self.nTask_GaiMing_HasUsed);
	
	if nHasAward ~= 1 then
		Say("此物来历不明, 你最好不要使用.", 0 );
		return 1;
	end
	
	if nHasUsed ~= 0 then
		Say("此物来历不明, 使用多了将会有损身体.", 0 );
		return 1;
	end
	
	local nOldSkill = GetSkillMaxLevelAddons();
	local nNewSkill = nOldSkill + self.nLimit_AddSkill;
	
	SetSkillMaxLevelAddons(nNewSkill);
	self:setTask(self.nTask_GaiMing_HasUsed, 1);
	
	local szMsg = format("[ChangeDestiny]Eat GaiMingJue: %s Use GaiMingJue and add skill from %d to %d.",GetName(), nOldSkill, nNewSkill);
	WriteLog(szMsg);
	
	Say(format("您已使用逆天改命诀, 技能点由  %d提升到了 %d.", nOldSkill, nNewSkill), 0);
	return 0;
end

