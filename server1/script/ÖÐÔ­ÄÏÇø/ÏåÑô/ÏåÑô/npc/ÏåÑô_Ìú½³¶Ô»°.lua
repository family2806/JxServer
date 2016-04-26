--description: 中原南区 襄阳府 铁匠对话 武当派出师任务
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>我这里专门为驻军打造兵器，忙得很，您家要买么事武器，自己随便挑。"

function main(sel)
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "现在战事紧急，官兵军械不足，你可以快点给我制造一个兵器吗?", "不蛮你说，现在我日夜劳作。但是，军队人数多，我这里的矿石不够用!<color=Red>磁铁矿，亮银矿和赤铜矿<color>都用完了，你可以到<color=Red>西南边<color>帮我找吗?")
			SetTask(17, SetByte(GetTask(17),2,5))
			AddNote("铁匠(193,201)说，想要制造兵器需要3种矿石：磁铁矿，亮银矿和赤铜矿，可以在襄阳城外西南方向找到.")
		elseif (UTask_wd60sub == 5) then 
			if ( HaveItem(138) == 1 and HaveItem(118) == 1 and HaveItem(121) == 1) then
				Talk(2, "", "我找到矿石了，希望可以制造出最好的兵器，帮助兵士抗金", "大家志高如山，一定能赶走他们!")
				DelItem(138)
				DelItem(118)
				DelItem(121)
				SetTask(17, SetByte(GetTask(17),2,8))
				AddNote("找到3种矿石，给铁匠，可以解决兵器不足问题.")
				Msg2Player("找到3种矿石，给铁匠，可以解决兵器不足问题.")
			else
				tiejiang_city("没有矿石，我没法做兵器，你可以去<color=Red>城外南边<color> 找一些 <color=Red> 磁铁矿，亮银矿和赤铜矿<color>?")
			end
		else
			tiejiang_city()
		end		
	else
		tiejiang_city()
	end
end;

function yes()
	Sale(10);  			--弹出交易框
end;

