Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function zhongqiu0808_zoumadeng_buy()
	local tbSay = 
	{
		"<dec><npc>��һ֧��������Ҫ5000������ͬ������",
		"ȷ��/zhongqiu0808_zoumadeng_buy_ok",
		"����/OnExit"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_zoumadeng_buy_ok()
	local tbItem =	{szName="������", tbProp={6, 1, 1820, 1, 0, 0}}
	local nJxb = 5000
	if Pay(5000) == 1 then
		tbAwardTemplet:GiveAwardByList(tbItem,"�������" )
	else
		Say("������������!", 0)
	end
end