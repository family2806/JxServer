--江南区 临安府 长江码头船夫对话
--suyu
--20031029

CurWharf = 11;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")

function main(sel)
	if (GetLevel() >= 50) then
		Say("船夫：我这船可不是寻常的船，宰相大臣们都载过，你要坐船也行，但是得先付订金，省得到时赖帐，看年一也不箱有钱人的样子，就先付十两订金吧！", 3, "坐船/WharfFun", "不坐/OnCancel", "<#>桃花岛["..AEXP_TICKET.."<#>两]/go_thd");
	else
		Say("船夫：我这船可不是寻常的船，宰相大臣们都载过，你要坐船也行，但是得先付订金，省得到时赖帐，看年一也不箱有钱人的样子，就先付十两订金吧！", 2, "坐船/WharfFun", "不坐/OnCancel")
	end
end;

function  OnCancel()
   Talk(1,"","船夫：没银子可坐不了船！")
end;

function go_thd()
	nRet = aexp_gotothd(235);
	-- if (nRet == 1) then
	--	Msg2Player("船夫：最近去桃花岛的人可真多。好吧，你坐好喽！")
	if (nRet == -1) then
		Talk(1,"","<#>去桃花岛"..AEXP_TICKET.."<#>银两，你装够了吗?")
	end
end
