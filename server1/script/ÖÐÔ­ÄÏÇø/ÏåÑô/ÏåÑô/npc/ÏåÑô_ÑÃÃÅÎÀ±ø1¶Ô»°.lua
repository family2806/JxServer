--中原南区 襄阳府 衙门卫兵1对话

FESTIVAL06_NPCNAME = "<color=yellow>衙门卫兵:<color>";
Include([[\script\global\路人_衙门卫兵.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Say("守城大人已从衙门后面的密道逃走了，金贼还没到就这么怕!", 0)
		AddNote("到衙门与卫兵对话，知道守将已从衙门后面的密道逃走. ")
		Msg2Player("原料襄阳已从衙门后面的密道逃走. ")
	else
		Talk(1,"","衙门卫兵：喂！小子，你探头探脑的，搞么斯呀？难道你是金人的奸细？")
	end
end;
