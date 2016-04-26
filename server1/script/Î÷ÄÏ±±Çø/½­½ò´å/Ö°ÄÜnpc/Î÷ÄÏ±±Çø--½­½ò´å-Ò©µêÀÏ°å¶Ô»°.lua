--西南北区 江津村 药店老板对话（江津村新手任务：吴老爹的药）
--suyu
-- Update: Dan_Deng(2003-08-11)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	UTask_world21 = GetTask(49);
	Uworld1000 = nt_getTask(1000)	
	if ((UTask_world21 == 1) and (HaveItem(179) == 0)) then
		Say("是吴老爹托你来买药的么？我早就给他准备好了，十颗川贝丸一共纹银二百两。回去跟老爷子说让他注意身体呀!",3,"买川贝丸/buy","买一些其他药/yes","不买/no")
	else
		Say("药店老板：人吃五谷杂粮，谁没个头疼脑热？我这店虽小，可是绝对少不了！你要买点什么药？", 3, "交易/yes", "我来接入门任务/yboss","不交易/no");
	end
end;

function buy()
	if(GetCash() >= 200)then
		Pay(200)
		AddEventItem(179) --得到药
		Msg2Player("你得到十颗川贝丸。")
		AddNote("你得到十颗川贝丸。")
	else
		Talk(1,"","药店老板：药我给你留着，等钱凑够了再过来取药吧。")
	end
end;

function yes()
	Sale(24)						--弹出交易框
end;

function no()
end;
