--中原北区 汴京府 码头船夫1对话
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("船夫：九曲黄河九道弯，一道弯来一道坎，咱们这些在风口浪尖上讨生活的人，不知道跑了这趟还有没有下趟！你要去哪儿？", 2, "坐船/WharfFun", "不坐/OnCancel");
	else
		Say("九曲黄河九道弯，一道弯来一道坎，咱们这些在风口浪尖上讨生活的人，不知道跑了这趟还有没有下趟！你要去哪儿？", 2, "坐船/WharfFun", "不坐/OnCancel");
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
