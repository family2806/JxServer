--中原南区 襄阳府 钱庄老板对话
-- Update: Dan_Deng(2003-12-31) 加红包、元宝功能

Include("\\script\\global\\钱庄功能.lua")

function main(sel)
	i = random(0,1)
	if (i == 0) then
		Talk(1,"main_proc","钱庄老板：做生意的人，当然是钱赚得越多越好啦，天下有哪个会嫌钱多呢？")
	else
		Talk(1,"钱庄老板：么事都是假的，只有真金白银是真的。")
	end
end;
