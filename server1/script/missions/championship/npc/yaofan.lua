--武林大会药贩 对话脚本
--lixin 2005-04-11

function main()
	Say("欢迎各位来看武林新秀联赛，我是为比赛提供药品的独家供应商-临安药店老板。任何人有要求不要客气！", 2,"买药品/buy_medicine","暂时不用/no");
end

function buy_medicine()
	Sale(106);
end;

function no()
end;
