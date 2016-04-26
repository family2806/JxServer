--description: 峨嵋派苏词馨 
--author: yuanlan	
--date: 2003/3/5
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if ((UTask_em == 40*256) and (GetLevel() >= 40) and (GetFaction() == "emei")) then
			Talk(2, "L40_get","在众多师姐妹中，我和秦师姐的感情最好，她快要过生日了，我想送她一份礼物。秦师姐精于音律，她一直想得到曲中极品<color=Red>《百鸟朝凤》曲谱<color>.","我四处寻访打听，得知<color=Red>青城山<color>中有一位隐居的<color=Red>高人<color>藏有这份曲谱，但是找了很久都没有找到他，秦师姐的生日就快到了，怎么办呢?")
		elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 1)) then					--得到百鸟朝凤曲谱
			L40_prise()
		elseif (UTask_em >= 50*256) and (GetFaction() == "emei") then   							--已经完成40级任务，尚未出师
			Talk(1,"","秦师姐见到曲谱后开心极了，这都多亏你帮忙啊!")
		else
			Talk(1,"","最近江湖不安，好像有大事发生")
		end
	elseif (UTask_em >= 70*256) then										--已经出师
		Talk(1,"","小师妹，以后行走江湖有了什么难处，别忘了回来找我们啊!")
	else
		Talk(1,"","欧阳公创作歌曲《蝶恋花》有句，庭院深深深几许，这句话的用字工夫真是让人佩服!")
	end
end;

function L40_get()
	Say("你愿意帮我去寻访那位高人吗?", 2, "愿意 /L40_get_yes", "没时间 /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","太好了！那位<color=Red>高人<color>就隐居在<color=Red>青城山中部<color>的<color=Red>神仙洞<color>里.")
	SetTask(1, 40*256+10)
	AddNote("左偏殿见苏词馨，去找百鸟朝凤. ")
	Msg2Player("接任务，找百鸟朝凤曲谱")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","《百鸟朝凤》曲谱！太好了！秦师姐见到一定会很开心的，谢谢你，小师妹! ")
	DelItem(22)
	SetRank(17)
	SetTask(1, 50*256)
--	AddMagic(86)
	add_em(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你成为青莲弟子，学到流水")
	AddNote("回峨眉，交：《百鸟朝凤》曲谱给苏词馨，完成任务，升为青莲仙子")
end;
