--中原南区 扬州府 婉娘

function main(sel)
	Say("卖猴年礼服，贺卡在这!",2,"我选选看. /yes","不买/no")
end;

function yes()
	Say("迎春服装，贺岁女服装，价格为88888 两!",3,"领新衣服/male","贺岁衣服 /female","不买/no")
end;

function no()
	Say("不买也没事! 新年快乐",0)
end;

function male()
	if(GetCash()>=88888)then
		AddItem(0,2,28,7,0,0,0)
		Pay(88888)
	else
		Say("您的钱不够，带够钱后再来!",0)
	end
end;

function female()
	if(GetCash()>=88888)then
		AddItem(0,2,28,8,0,0)
		Pay(88888)
	else
		Say("您的钱不够，带够钱后再来!",0)
	end
end;
