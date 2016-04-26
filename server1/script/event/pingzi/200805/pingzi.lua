
Include("\\script\\event\\pingzi\\200805\\compose.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\pingzi\\200805\\head.lua")
Include("\\script\\event\\pingzi\\200805\\recipe.lua")


function pingzi0805:main()
	self:ResetTask()
	
	if not self:IsActTime() then
		return 
	end
	
	
	if GetLevel() < 50 then
		return Say(format("�ȼ����� %s��, ���ܲμӴ˻.",50), 0)
	end
	
	local tbSay = 
	{
		"<dec><npc>����Ҫ�һ�ʲô��Ʒ?<enter>��Ʒ1: '��' x 1 + '��' x 1 + '��' x 1 + '��' x 1 + 3 ����<enter>��Ʒ2: ף��'' x 3 + 'VLTK' x 3 + '3' x 3 + '��' x 3 + 10 ����<enter>��Ʒ3: 'ף��' x 3 +'VLTK' x 3 + '3' x 3 + '��' x 3 + ��ϲ���x 1",
		format("��ȡ��Ʒ1/#%s:draw(1)", self.szClassName),
		format("��ȡ��Ʒ2/#%s:draw(2)", self.szClassName),
		format("��ȡ��Ʒ3/#%s:draw(3)", self.szClassName),
		"�Ҵ������/OnCancel"
	}
	CreateTaskSay(tbSay)
end


function pingzi0805:draw(nRecipeId)
	self:ResetTask()
	if GetLevel() < 50 then
		return Say(format("�ȼ����� %s��, ���ܲμӴ˻.",50), 0)
	end
	local nCount = GetTask(self.TSK_Recipe1Count)
	if nRecipeId == 1 and nCount >= self.nMaxRecipe1Count then
		return Say(format("�����Ʒֻ�ܶһ�<color=yellow>%d<color>��.", nCount),0)
	end
	local tbRecipe = self.tbRecipe[nRecipeId]
	if nRecipeId == 1 then
		pingzi0805_ComposeClass:Compose("����ԭ�ϲ���.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName, 1, SetTask, self.TSK_Recipe1Count, nCount + 1)
	else
		pingzi0805_ComposeClass:Compose("����ԭ�ϲ���.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName)
	end
end

function pingzi0805:Detailed(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc><enter>��Ʒ1: '��' x 1 + '��' x 1 + '��' x 1 + '��' x 1 + 3 ���� = 2������.<enter>��Ʒ2: ף��'' x 3 + 'VLTK' x 3 + '3' x 3 + '��' x 3 + 10 ���� = ���⵰����������.<enter>��Ʒ3: 'ף��' x 3 +'VLTK' x 3 + '3' x 3 + '��' x 3 + ��ϲ���x 1= ���⵰�������������鵰��.",
			format("��ȡ����/#%s:main()", self.szClassName),
			"��һ������/OnCancel"
		}
	else
		tbSay = 
		{
			"<dec><npc>�����: ��ڼ䣬�����ڴ��ʱ�л���ʰ���������������������Ҫ��ԭ��.<enter>�ʱ�䣺��11-06-2008��24:00 13-07-2008",
			format("��Ʒ��Щʲô?/#%s:Detailed(1)", self.szClassName),
			"��һ������/OnCancel"
		}	
	end
	
	CreateTaskSay(tbSay)
end