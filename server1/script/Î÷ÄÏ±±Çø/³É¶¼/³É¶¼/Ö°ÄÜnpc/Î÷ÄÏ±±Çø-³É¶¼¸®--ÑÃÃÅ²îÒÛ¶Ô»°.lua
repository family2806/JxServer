--西南北区 成都府 衙门差役对话 世界任务（成都杀野猪）
-- Update: Dan_Deng(2004-03-19)

FESTIVAL06_NPCNAME = "<color=yellow>:<color>";

Include("\\script\\global\\repute_head.lua")

Include([[\script\global\路人_衙门卫兵.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	Uworld11 = GetTask(11)
	if (Uworld11 == 100) then			-- 任务完成
		W11_prise()
	elseif (Uworld11 < 255) and (Uworld11 >= 1) then		-- 任务中
		Talk(1,"","想领奖啊？去杀十只野猪回来再说!")
	elseif (Uworld11 > 255) then		-- 任务已经完成
		Talk(1,"","成都附近有很多山，经常有野猪出现，此次有你才能确保今年的收成.")
	else			-- 未接任务
		Talk(1,"","你敢冲入衙门？真是吃了雄心豹子胆了!")
	end
end;

function W11_prise()
	Talk(1,"","已杀死十只野猪？太好了，我代表成都百姓感谢你和各位英雄。这是500两奖赏!")
	Earn(500)
	SetTask(11,date("%Y%m%d"))
	i = random(0,99)
	if (i < 50) then			-- 50%几率
		x = 3
	elseif (i < 85) then		-- 35%几率
		x = 4
	else							-- 15%几率
		x = 5
	end
	AddRepute(x)
	Msg2Player("任务完成，奖励50两，你的名望增加"..x.."点.")
end;
