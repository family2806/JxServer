--description: 峨嵋派何怜飘
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 40) then		--入门任务
		Msg2Player("何怜飘的第三个考验是对3个对联. ")
		Say("你能连过两关，看来还有些本事，不过，我这里有三副对子只有上联，如果你能全部对出下联，我才服气。第一副上联是：一弹流水再弹月.", 3, "半入江风半入云/True7", "一寸相思一寸灰/False7", "半壕春水一城花/False7")
	elseif (Uworld == 60) then 					--完成前三关
		Talk(1,"","恭喜你！你已经顺利过了三关考验，现在你去找<color=Red>谢云萝<color>师妹吧，她就在半山腰的<color=Red>钻天坡入口<color>.")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--尚未入门
--		Talk(1,"","何怜飘：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？")
--	elseif (GetFaction() == "emei") then   				--已经入门，尚未出师
--		Talk(1,"","何怜飘：现在咱们是同门好姐妹了，我真开心！")
	elseif (UTask_em == 70*256) then							--已经出师
		Talk(1,"","你出去闯荡江湖，可不要忘了我们这些姐妹哦! ")
	else
		Talk(1,"","江湖险恶，武林多是非!")
	end
end;

function False7()
Say("对不出来吗？", 3, "半入江风半入云/True7", "一寸相思一寸灰/False7", "半壕春水一城花/False7");
end;

function True7()
Say("对得好。第二联：侧身天地更怀古", 3, "万里悲秋常作客/False8", "独立苍茫自咏诗/True8", "空令岁月易蹉跎/False8");
end;

function False8()
Say("认输了吧？", 3, "万里悲秋常作客/False8", "独立苍茫自咏诗/True8", "空令岁月易蹉跎/False8");
end;

function True8()
Say("不错。第三联：一明分日月", 3, "思耕心上田/False9", "闲看门中木/False9", "五岳各丘山/True9");
end;

function False9()
Say("再想想，可不要功亏一篑喔！", 3, "思耕心上田/False9", "闲看门中木/False9", "五岳各丘山/True9");
end;

function True9()
	Talk(1,"","恭喜你！你已经顺利过了三关考验，现在你去找<color=Red>谢云萝<color>师妹吧，她就在半山腰的<color=Red>钻天坡入口<color>.")
	Uworld36 = SetByte(GetTask(36),1,60)
	SetTask(36,Uworld36)
	AddNote("在半山腰见何怜飘，回答正确3个对联，过第三关")
	Msg2Player("在半山腰见何怜飘，回答正确3个对联，过第三关. 回钻天坡找谢云罗师妹接武功考验. ")
end;
