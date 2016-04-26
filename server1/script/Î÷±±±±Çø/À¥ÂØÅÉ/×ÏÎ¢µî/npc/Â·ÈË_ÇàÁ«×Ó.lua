-- 昆仑 弟子 青莲子 40级任务
-- by：Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 40*256+20) and (HaveItem(9) == 1)) then		--40级任务完成
			Talk(2,"L40_prise","护法，这是血魂神剑吗","好剑！真是好剑！哈哈哈！本座没有看错人，你真有才，好，本座要升你做40级大弟子!")
		elseif (UTask_kl == 40*256) and (GetLevel() >= 40) then		--40级任务
			Say("昆仑山以北有一个见性峰，传说此峰上藏有一把绝世好剑——血魂神剑，很多人为了得到它而命丧黄泉，你有胆量去取得这把宝剑吗?",2,"弟子愿前往一试. /L40_get_yes","弟子武艺不精，恐怕不能做好这件事/L40_get_no")
		elseif (UTask_kl >= 50*256) then
			Talk(1,"","宝剑在手，要先除去那个该死的老师兄，之后灭了碍手碍脚的师弟。只等一个机会，哈哈哈")
		else
			Talk(1,"","只要血魂神剑在乎，我就可以……哈哈哈")
		end
	else
		Talk(1,"","我们昆仑团结相爱。特别是我和掌门璇玑子还有玉衡子")
	end
end;

function L40_get_yes()
	Talk(1,"","只要能够拿到血魂神剑，本座就升你做40级大弟子!")
	SetTask(9,40*256+10)
	AddNote("接任昆仑40级任务：在见性顶夺来血魂宝剑. ")
	Msg2Player("接任昆仑40级任务：在见性顶夺来血魂宝剑. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","多谢护法! ")
	DelItem(9)
	SetTask(9,50*256)
	SetRank(23)
--	AddMagic(175)
--	AddMagic(181)
	add_kl(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你！已经升级成昆仑的太微护法，学会武功凄寒傲雪、弃心符")
	AddNote("夺来血魂神剑，完成昆仑40级任务，升为太微护法. ")
end;
