--西南北区 成都 船夫对话

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("这里虽然没有船，但是我也能带你去!", 2, "去桃花岛 (6) /go_thd", "不坐/OnCancel")
	else
		Talk(1, "", "不懂什么时候这里才有船!")
	end
end;

function  OnCancel()
   Talk(1,"","没钱不能坐船! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(240);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","去桃花岛的费用为"..AEXP_TICKET.."两，你够吗? ")
	end
end
---------------------------------------------------------------
