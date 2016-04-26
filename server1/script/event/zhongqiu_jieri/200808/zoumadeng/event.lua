Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function zhongqiu0808_zoumadeng_buy()
	local tbSay = 
	{
		"<dec><npc>买一支红蜡烛需要5000两，你同意买吗？",
		"确认/zhongqiu0808_zoumadeng_buy_ok",
		"放弃/OnExit"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_zoumadeng_buy_ok()
	local tbItem =	{szName="红蜡烛", tbProp={6, 1, 1820, 1, 0, 0}}
	local nJxb = 5000
	if Pay(5000) == 1 then
		tbAwardTemplet:GiveAwardByList(tbItem,"买红蜡烛" )
	else
		Say("您的银两不足!", 0)
	end
end