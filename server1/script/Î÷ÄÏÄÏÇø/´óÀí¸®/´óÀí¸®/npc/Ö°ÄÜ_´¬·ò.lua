--西南南区 大理府 长江码头船夫对话
--suyu
--20031029

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("黄河九曲湾，你在河的这边，我在山的那边，相隔苍山洱海，想见都难.", 3, "坐船/WharfFun", "不坐/OnCancel", "去桃花岛(5) /go_thd")
	else
		Say("黄河九曲湾，你在河的这边，我在山的那边，相隔苍山洱海，想见都难.", 2, "坐船/WharfFun", "不坐/OnCancel")
	end
end;

function  OnCancel()
   Talk(1,"","没钱不能坐船! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(239);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","到桃花岛费用 "..AEXP_TICKET.."两，你够吗? ")
	end
end
---------------------------------------------------------------
