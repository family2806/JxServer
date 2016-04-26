
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
		return Say(format("等级不够 %s级, 不能参加此活动.",50), 0)
	end
	
	local tbSay = 
	{
		"<dec><npc>你想要兑换什么奖品?<enter>奖品1: '风' x 1 + '火' x 1 + '连' x 1 + '城' x 1 + 3 万两<enter>奖品2: 祝贺'' x 3 + 'VLTK' x 3 + '3' x 3 + '岁' x 3 + 10 万两<enter>奖品3: '祝贺' x 3 +'VLTK' x 3 + '3' x 3 + '岁' x 3 + 大喜礼包x 1",
		format("领取奖品1/#%s:draw(1)", self.szClassName),
		format("领取奖品2/#%s:draw(2)", self.szClassName),
		format("领取奖品3/#%s:draw(3)", self.szClassName),
		"我待会回来/OnCancel"
	}
	CreateTaskSay(tbSay)
end


function pingzi0805:draw(nRecipeId)
	self:ResetTask()
	if GetLevel() < 50 then
		return Say(format("等级不够 %s级, 不能参加此活动.",50), 0)
	end
	local nCount = GetTask(self.TSK_Recipe1Count)
	if nRecipeId == 1 and nCount >= self.nMaxRecipe1Count then
		return Say(format("这个奖品只能兑换<color=yellow>%d<color>次.", nCount),0)
	end
	local tbRecipe = self.tbRecipe[nRecipeId]
	if nRecipeId == 1 then
		pingzi0805_ComposeClass:Compose("所带原料不够.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName, 1, SetTask, self.TSK_Recipe1Count, nCount + 1)
	else
		pingzi0805_ComposeClass:Compose("所带原料不够.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName)
	end
end

function pingzi0805:Detailed(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc><enter>奖品1: '风' x 1 + '火' x 1 + '连' x 1 + '城' x 1 + 3 万两 = 2百万经验.<enter>奖品2: 祝贺'' x 3 + 'VLTK' x 3 + '3' x 3 + '岁' x 3 + 10 万两 = 如意蛋糕和随机奖励.<enter>奖品3: '祝贺' x 3 +'VLTK' x 3 + '3' x 3 + '岁' x 3 + 大喜礼包x 1= 如意蛋糕和随机奖励或吉祥蛋糕.",
			format("领取奖励/#%s:main()", self.szClassName),
			"我一会再来/OnCancel"
		}
	else
		tbSay = 
		{
			"<dec><npc>万年家: 活动期间，大侠在打怪时有机会拾到各种礼包，里面有我需要的原料.<enter>活动时间：从11-06-2008到24:00 13-07-2008",
			format("奖品有些什么?/#%s:Detailed(1)", self.szClassName),
			"我一会再来/OnCancel"
		}	
	end
	
	CreateTaskSay(tbSay)
end