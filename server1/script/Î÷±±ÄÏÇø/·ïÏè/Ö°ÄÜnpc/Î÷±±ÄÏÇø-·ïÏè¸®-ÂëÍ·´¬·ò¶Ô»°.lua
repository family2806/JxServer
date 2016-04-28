--西北南区 凤翔府 码头船夫对话
--suyu
--200306015

CurWharf = 1;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("船夫：（唱）我把那东山日头背上西山～～, 脚踏黄土心坦然～～, 你晓得天下黄河几十几道弯～～, 九十九个艄公吆把船儿扳～～你要过河去哪里？", 2, "坐船/WharfFun", "不坐/OnCancel");
	else
		Say("黄河九道湾, 我在这头你在那头....", 2, "坐船/WharfFun", "不坐/OnCancel");
	end

end;

---------------------------------------------------------------
function  OnCancel()

   Say("船夫：没银子可哪里也去不了！",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(241);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","要坐船去桃花岛"..AEXP_TICKET.."两，你够吗？")
	end
end
---------------------------------------------------------------
