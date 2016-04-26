-- 五毒 路人NPC 青蜈寨寨主汤弼 50级任务
-- by：Dan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if ((UTask_wu == 50*256+20) and (HaveItem(88) == 1)) then		-- 任务进行中
			L40_prise()
		elseif ((UTask_wu == 50*256) and (GetLevel() >= 50)) then		--50级任务
			Talk(1,"L50_get","这方圆百里的老百姓都要向本教交纳保护费。可是最近有一群出没在武夷山玉华洞附近的流寇，竟敢老虎头上动土，在本教的地盘上横插一手，把本该孝敬本教的玉珊瑚给抢了去，这让本教颜面何存！不能放过他们!")
		else							-- 常规对话
			Talk(1,"","只要练成武功，金银美女就源源而来")
		end
	else
		Talk(1,"","说到女孩，我想到了翠烟门的姑娘。哎呀！真是好看！想不到她的姑娘这么好看。只要想到我心中的火就按耐不住。")
	end
end;

function L50_get()
	Say("你去教训教训这帮流寇，要他们知道本教的厉害!/L50_get_yes","他们同伙太多，属下只怕/L50_get_no")
end;

function L50_get_yes()
	SetTask(10,50*256+10)
	AddNote("到武夷山玉华洞打败两名流寇拿回玉珊瑚。")
	Msg2Player("到武夷山玉华洞打败两名流寇拿回玉珊瑚。")
end;

function L50_get_no()
end;

function L40_prise()
	Talk(2,"","你能独闯虎穴，夺回玉珊瑚，果然有点本事，本寨主看你是个可造之材，就升你为蛊毒尊者吧！不过，你以后要好好替本寨主办事","尊令!")
	SetTask(10,60*256)
	DelItem(88)
	SetRank(54)
--	AddMagic(72)
	add_wu(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	AddNote("带回玉珊瑚给汤弼，晋升为蛊毒尊者")
	Msg2Player("恭喜你！已晋升为蛊毒尊者。学会穿心毒刺")
end;
