--中原南区 扬州府 码头船夫对话
--suyu
--200306015

CurWharf = 6;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
---------------------------------------------------------------
function main(sel)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>船夫：咱们扬州是一个水乡，河多、桥多、舟多，那些有钱人要泛舟游览扬州，靠的就是我们这些船夫。"
	tbDailog:AddOptEntry("坐船", WharfFun)
	tbDailog:AddOptEntry("不坐船", OnCancel)
	if GetLevel() >= 50 then
		tbDailog:AddOptEntry("去桃花岛(2) [ "..AEXP_TICKET.." 两]", go_thd)
	end
	G_TASK:OnMessage("月歌岛", tbDailog, "DialogWithNpc")
	if check_showdialog_condition() then
		tbDailog:AddOptEntry("带我到月歌岛", goto_yuegedao)
	end
	tbDailog:Show()
end;

function check_showdialog_condition()
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
	}
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or nFact > 9 then
		return
	end
	local nFactStep = mod(GetTask(2885), 100)
	if nFactStep >= tbFactStepList[nFact] then
		return 1
	end
	return
end

function goto_yuegedao()
	if CalcItemCount(3, 6, 1, 2908, -1) <= 0 then
		Msg2Player("我没有月歌令")
		return
	end
	NewWorld(968, 1436, 3179)
end
---------------------------------------------------------------
function  OnCancel()

   Say("船夫：没钱坐船你就走旱路吧！",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(236);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","需要乘船到桃花岛 "..AEXP_TICKET.."两，你够吗? ")
	end
end
---------------------------------------------------------------
