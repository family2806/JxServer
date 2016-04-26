--西南北区 成都府 杂货店老板对话 
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_em = GetTask(1);
	UTask_tm = GetTask(2);
	if (UTask_em == 30*256+50) then 		--峨嵋派穆云慈30级任务
Say("杂货店老板：我这里卖的是各种南北杂货，请随意挑，看看有什么用得着的？", 3, "有鸡腿卖吗?/chicken", "交易/yes", "不交易/no")
	elseif ((UTask_em == 40*256+50) and (GetByte(GetTask(29),1) == 1)) then		--峨嵋派40级任务
		Say("各种最新的银簪，只要200两，买一个吧!", 3, "买银簪/hairpin", "买其他东西/yes", "不交易/no")
	elseif (UTask_tm == 10*256+40) then		--唐门唐鹤10级任务
		Say("玛瑙戒指很漂亮，500两一个，不买会后悔!", 3, "买玛瑙戒指. /ring", "交易/yes", "不交易/no")
	else
		local Buttons = store_sel_extend();
		Say("杂货店老板：我这里卖的是各种南北杂货，请随意挑，看看有什么用得着的？", getn(Buttons), Buttons);
	end
end;

function chicken()
	if (GetCash() >= 50) then
		Pay(50)
		AddEventItem(119)
		Msg2Player("买到鸡腿 . ")
		AddNote("在成都杂货铺买到鸡腿 ")
	else
		Say("够钱了再来吧，看看其他东西也行.", 2, "交易/yes", "不交易/no")		
	end
end;

function hairpin()
	if (GetCash() >= 200) then
		Pay(200)
		AddEventItem(63)
		Msg2Player("买到银簪")
--		SetTask(29, 4)
		AddNote("在成都杂货铺买到银簪 ")
	else
		Say("够钱了再来吧，看看其他东西也行.", 2, "交易/yes", "不交易/no")		
	end
end;


function ring()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(165)
		Msg2Player("买到玛瑙戒指 ")
		AddNote("在成都杂货铺买到玛瑙戒指")
	else
		Say("够钱了再来吧，看看其他东西也行.", 2, "交易/yes", "不交易/no")		
	end
end;

function yes()
Sale(14);  		--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;
