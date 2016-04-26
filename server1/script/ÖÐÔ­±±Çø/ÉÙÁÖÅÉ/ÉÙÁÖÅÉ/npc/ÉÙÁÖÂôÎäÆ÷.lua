--少林派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮
-- Update: xiaoyang(2004\4\23) 加入采集矿石任务，可重复加声望

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	Uworld131 = GetTask(131)
	if (Uworld131 == 10) and (GetItemCount(138) >= 5) and (GetItemCount(121) >= 5) and (GetItemCount(118) >=5) then
		Talk(1,"U131_prise","大师，在下已带回各种矿石，请看看.","这个矿石.....感谢你!")
	elseif (GetFaction() == "shaolin") or (Uworld38 == 127) then
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >=4) and ((Uworld131 < 10) or ((GetGameTime() > Uworld131) and (Uworld131 > 255))) then
			Say("本寺处在金国范围，距离这里100里的铁匠得到金国的命令，不能卖兵器矿石给少林。目前，寺内武器已生锈，如果金军进攻，恐怕不能抵抗。我需要磁铁矿，亮银矿，赤铜矿.",3,"同意去收集矿石. /yes1","在线想买一些兵器/yes","在下还有其他事，下次再来. /no")
		else
			Say("少林武功闻名天下，但是，如果没有武器，什么功夫都没有用.", 2, "交易/yes", "不交易/no")
		end
	else
		Talk(1,"","掌门有令，本派武器只卖给同门")
	end
end;

function yes()
	Sale(69)
end;

function yes1()
	Talk(2,"","少林掌控武林命运已几百年，在下愿意全力以赴!","佛主慈悲，少林需要你帮助。请帮我找磁铁矿，亮银矿，赤铜矿，每种5块.")
	SetTask(131,10)
	Msg2Player("同意帮少林派去找磁铁矿，亮银矿，赤铜矿，每种5块. ")
end

function U131_prise()
	for i=1,5 do
		DelItem(138)
		DelItem(121)
		DelItem(118)
	end
	SetTask(131,GetGameTime()+14400)
	i = GetReputeLevel(GetRepute()) + 2
	AddRepute(i)
	Msg2Player("交矿石给澄末，完成任务，你的名望增加"..i.."点.")
end

function no()
end;
