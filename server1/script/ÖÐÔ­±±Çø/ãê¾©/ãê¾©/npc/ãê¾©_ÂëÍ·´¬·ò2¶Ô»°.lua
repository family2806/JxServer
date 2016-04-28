--中原北区 汴京府 码头船夫2对话
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("船夫：今儿个逆水行船，又遇上顶头风，看来待会光摇橹是不成了，恐怕得上岸拉纤才行。你要去哪儿？", 2, "坐船/WharfFun", "不坐/OnCancel");
	else
		Say("今儿个逆水行船，又遇上顶头风，看来待会光摇橹是不成了，恐怕得上岸拉纤才行。你要去哪儿? ", 2, "坐船/WharfFun", "不坐/OnCancel");		
	end

end;

---------------------------------------------------------------
function  OnCancel()

   Say("船夫：没银子可哪里也去不了！",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(238);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","坐船去桃花岛"..AEXP_TICKET.."两，你够吗? ")
	end
end
---------------------------------------------------------------
