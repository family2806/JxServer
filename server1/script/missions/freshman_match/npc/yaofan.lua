--武林大会药贩 对话脚本
--lixin 2005-04-11

function main()
	Say("欢迎各位来观看武林新秀联赛，我是给武林新秀联赛提供药品的独家供应商-临安药店老板。大家谁有需要，请和我说。", 2,"我想买药/buy_medicine","暂时不用/no");
end

function buy_medicine()
	Sale(53);
end;

function no()
end;
