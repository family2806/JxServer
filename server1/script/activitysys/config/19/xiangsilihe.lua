Include("\\script\\activitysys\\config\\19\\extend.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\19\\valentinehead.lua")

function main()
	if IsInValentine() ~= 1 then
		return
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1 
	end
	
	if pActivity:CheckTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,1000000000,"ͨ��õ������Լ���˼��л���ܾ����Ѵﵽ����","<") ~= 1 then
		return 1
	end
	
	
	local tbAward = 
	{
		{nExp_tl = 3000000},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "2011���˽�, ����˼��л�þ���")
	pActivity:AddTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,3000000)
	
end