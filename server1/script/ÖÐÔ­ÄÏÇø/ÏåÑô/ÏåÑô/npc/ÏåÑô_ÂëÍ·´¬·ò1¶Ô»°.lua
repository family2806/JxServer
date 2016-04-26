--中原南区 襄阳府 码头船夫1对话
--suyu
--200306015

CurWharf = 4;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")

---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("船夫：我们这些船工祖祖辈辈都在长江上荡划子，别看我这划子小，坐四五个人冇得问题！", 3, "坐船/WharfFun", "不坐/OnCancel", "去桃花岛/go_thd");
	else
		Say("船夫：我们这些船工祖祖辈辈都在长江上荡划子，别看我这划子小，坐四五个人冇得问题！", 2, "坐船/WharfFun", "不坐/OnCancel");
	end
end;

---------------------------------------------------------------
function  OnCancel()

   Say("船夫：没钱坐船你就走旱路吧！",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(237);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","要坐船去桃花岛"..AEXP_TICKET.."亮，你够吗? ")
	end
end
---------------------------------------------------------------
