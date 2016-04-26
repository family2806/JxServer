--description: 中原南区 襄阳府 杂货店老板对话	武当派20级任务
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+40) and (HaveItem(66) == 1) then
		Talk(2, "", "你可以帮我修补这件道袍吗?", "我儿子上武当山摘蚕叶被火狼洞里的狼<color=Red><color> 给叼走了，谁可以帮我救救他?!","救人紧急，我帮你传达给同胞!")
		SetTask(5, 20*256+50)
		DelItem(66)
		AddNote("在襄阳找到杂货铺老板，知道她的儿子被野狼<color=red>火狼洞里的<color> 给刁走. ")
		Msg2Player("在襄阳找到杂货铺老板，知道她的儿子被野狼<color=red>火狼洞里的<color> 给刁走. ")
	elseif (UTask_wd == 20*256+50) then
		if (HaveItem(67) == 1) then
			Talk(3,"","客官是救我儿子的恩人，需要什么帮助尽管说!","口语帮我修改这件道袍吗?","没问题，为了报答你救命之恩，我不收钱!")
			DelItem(67)
			AddEventItem(68)
			Msg2Player("衣服已修好. ")
			SetTask(5, 20*256+80)
			AddNote("杂货铺老板用蚕丝布修好了衣服. ")
		else
			Say("我儿子上武当山摘蚕叶被火狼洞里的狼<color=Red><color> 给叼走了，谁可以帮我救救他?!", 2, "我只想买一些东西而已/yes", "我知道了. /no")
		end
	elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 0) then		-- 道具丢了
		AddEventItem(68)
		Talk(1,""," 恩人，你忘记道袍了!")
	else
		local Buttons = store_sel_extend();
		Say("杂货店老板：您家要买点么事？是吃的，穿的，还是用的？", getn(Buttons), Buttons);
	end
end;

function yes()
	Sale(11)  			--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;
