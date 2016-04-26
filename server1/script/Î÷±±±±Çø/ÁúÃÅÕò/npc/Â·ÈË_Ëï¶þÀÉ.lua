-- 龙门镇　路人　孙二郎(救小娟任务)
-- by：Dan_Deng(2003-09-16)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(199) == 1 then
		allbrother_0801_FindNpcTaskDialog(199)
		return 0;
	end
	Uworld41 = GetByte(GetTask(41),1)
	if (GetLevel() >= 40) and (GetReputeLevel(GetRepute()) >= 5) then		-- 符合任务条件
		if (Uworld41 == 0) then					-- 任务不能直接从孙二郎处启动
			if (random(0,1) == 0) then
				Talk(1,"","喂!...")
			else
				Talk(1,"","孙二郎:............ ")
			end
		elseif (Uworld41 == 5) then			-- 任务正式启动
			Talk(1,"U41_get","什么事情让你这么烦恼，旁边那位大嫂怎么哭得那么伤心啊?")
		elseif (Uworld41 == 100) then			-- 任务完成
			Talk(2,"U41_prise","多谢英雄，英雄的大恩大德没齿不忘。这里是以前一位少林僧人送我的灵药，说能强身健体，发挥自身潜能。请英雄万勿推辞!","既然这样，我不推辞就是!")
		elseif (Uworld41 == 255) then			-- 任务完成后
			Talk(1,"","我就不敢让小娟出门，但这也不是长久之计，只能嫁给它了.")
		else											-- 任务进行中
			Talk(1,"","昨天小娟被古阳洞的大王抢去了，要让她做压寨夫人。现在说什么都晚了.! ")
		end
	else							-- 否则转缺省对话
		Talk(1,"","有人说我们龙门镇全是强盗，真是什么都不知道！我敢说不要2、3年龙门镇就会出现个顶天立地的人物")
	end
end;

function U41_get()
	Say("唉！我们家小娟前几天被古阳寨的大王看到，说要她做什么压寨夫人，昨天就真的来把她给抢走了",2,"慷慨去救人/U41_get_yes","安慰几句/U41_get_no")
end

function U41_get_yes()
	Talk(2,"","什么大王，光天化日之下竟敢强抢民女！我去把她救回来","就靠大侠了，古阳寨就在古阳洞里!")
	Uworld41 = random(1,15)*256*256 + 10			-- 第三字节为（二进制的0001 - 1111），第一字节为10
	SetTask(41,Uworld41)
	Msg2Player("接任务，把小娟从古阳寨带回来. ")
	AddNote("接任务，把小娟从古阳寨带回来. ")
end

function U41_prise()
	AddProp(1)											-- 奖励1点潜能
	add_repute = ReturnRepute(30,50,3)			-- 声望奖励：最大30点，从50级起每级递减3%
	AddRepute(add_repute)
	Uworld41 = SetByte(GetTask(41),1,255)
	SetTask(41,Uworld41)
	Ubonus86 = GetTask(86) + 1					-- 记录任务奖励了1点潜能(第一字节+1)
	if (GetByte(Ubonus86,1) >= 250) then		-- 容错：上限为250点
		Ubonus86 = 250
	end
	SetTask(86,Ubonus86)
	AddNote("把小娟就回来，任务完成. ")
	Msg2Player("<#> 任务完成，你的声望增加 "..add_repute.."<#> 点.")
	Talk(1,"KickOutSelf","服下灵药，运功。你感觉潜能增加一点.")
end

function U41_get_no()
	Talk(2,"","岂有此理！还有没有王法?","现在还有谁说王法啊?")
end

function no()
end
