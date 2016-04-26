--Creator:yfeng
--Date:2004-9-6
--Comm:客户端升级提示信息

STRTAB_LEVELUP={
	[2]="<#>恭喜你升到2级！你可以到村外找武师学习轻功了。",
	[5]="<#>恭喜你升到5级！你已经不再弱不禁风，可以去大城市见见世面了。",
	[10]="<#>恭喜你升到10级！你已经有了一定的功底，可以入派拜师学艺了。新手村里有各大门派的门徒，他们会带你入派，师门会有任务等着你。入派后就可以在门派频道里聊天了。同时，你可以和别人pk了，还能在城镇里摆摊卖东西了。",
	[20]="<#>恭喜你升到20级！你已经会了千里传音，可以在城市频道里聊天了。而且，你可以骑马了，各大城市都有马贩子。你已经是成人了，可以结婚了，带着你的另一半去江津村的月老那里成亲吧。同时不要忘记回趟师门，有新的任务等着你哦！",
	[30]="<#>恭喜你升到30级！你的千里传音境界更高了，可以在世界频道里聊天了。同时不要忘记回趟师门，有新的任务等着你哦！",
	[40]="<#>恭喜你升到40级！你可参加宋金大战了，宋金战场位于襄阳与朱仙镇之间。同时不要忘记回趟师门，有新的任务等着你哦！",
	[50]="<#>恭喜你升到50级！你可以去洗髓岛了，在那里你可以洗掉潜能点和技能点，各大城市的车夫可以带你去。同时不要忘记回趟师门，有50级任务和出师任务等着你哦！",
	[60]="<#>你可以做回师任务了，完成任务后能学会镇派绝学！",
}

function main(lvl)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	if ( GetLevel() == 30 ) then
		if ( Uworld1001 == 60 ) and ( Uworld1002 == 60 ) and ( Uworld1003 == 108) then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("您同时获得了30级的正派，中立，邪派阵营任务。")
		elseif ( Uworld1001 == 60 ) and ( Uworld1002 == 60 )  then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			SendTaskOrder("您同时获得了30级的正派，中立阵营任务。")
		elseif ( Uworld1001 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1001,80)
			nt_setTask(1003,109)
			SendTaskOrder("您同时获得了30级的正派，邪派阵营任务。")
		elseif ( Uworld1002 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("您同时获得了30级的中立，邪派阵营任务。")
		elseif ( Uworld1001 == 60 ) then
			nt_setTask(1001,80)
			SendTaskOrder("您获得了30级的正派阵营任务。")
		elseif ( Uworld1002 == 60 ) then
			nt_setTask(1002,80)
			SendTaskOrder("您获得了30级的中立阵营任务。")
		elseif ( Uworld1003 == 108) then
			nt_setTask(1003,109)
			SendTaskOrder("您获得了30级的邪派阵营任务。")
		end
	elseif ( GetLevel() == 40 ) then
		if ( Uworld1001 == 130 ) and ( Uworld1002 == 110 ) and ( Uworld1003 == 208 ) then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("您同时获得了40级的正派，中立，邪派阵营任务。")
		elseif ( Uworld1001 == 130 ) and ( Uworld1002 == 110 )  then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			SendTaskOrder("您同时获得了40级的正派，中立阵营任务。")
		elseif ( Uworld1001 == 130 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1001,150)
			nt_setTask(1003,209)
			SendTaskOrder("您同时获得了40级的正派，邪派阵营任务。")
		elseif ( Uworld1002 == 110 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("您同时获得了40级的中立，邪派阵营任务。")
		elseif ( Uworld1001 == 130 ) then
			nt_setTask(1001,150)
			SendTaskOrder("您获得了40级的正派阵营任务。")
		elseif ( Uworld1002 == 110 ) then
			nt_setTask(1002,130)
			SendTaskOrder("您获得了40级的中立阵营任务。")
		elseif ( Uworld1003 == 208 ) then
			nt_setTask(1003,209)
			SendTaskOrder("您获得了40级的邪派阵营任务。")
		end
	elseif ( GetLevel() == 50 ) then
		if ( Uworld1001 == 200 ) and ( Uworld1002 == 180 ) and ( Uworld1003 == 328) then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("您同时获得了50级的正派，中立，邪派阵营任务。")
		elseif ( Uworld1001 == 200 ) and ( Uworld1002 == 180 )  then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			SendTaskOrder("您同时获得了50级的正派，中立阵营任务。")
		elseif ( Uworld1001 == 200 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1001,220)
			nt_setTask(1003,329)
			SendTaskOrder("您同时获得了50级的正派，邪派阵营任务。")
		elseif ( Uworld1002 == 180 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("您同时获得了50级的中立，邪派阵营任务。")
		elseif ( Uworld1001 == 200 ) then
			nt_setTask(1001,220)
			SendTaskOrder("您获得了50级的正派阵营任务。")
		elseif ( Uworld1002 == 180 ) then
			nt_setTask(1002,200)
			SendTaskOrder("您获得了50级的中立阵营任务。")
		elseif ( Uworld1003 == 328 ) then
			nt_setTask(1003,329)
			SendTaskOrder("您获得了50级的邪派阵营任务。")
		end
	elseif ( GetLevel() == 60 ) then
		if ( Uworld1001 == 270 ) and ( Uworld1002 == 240 ) and ( Uworld1003 == 408 ) then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("您同时获得了50级的正派，中立，邪派阵营任务。")
		elseif ( Uworld1001 == 270 ) and ( Uworld1002 == 240 )  then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			SendTaskOrder("您同时获得了50级的正派，中立阵营任务。")
		elseif ( Uworld1001 == 270 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1001,290)
			nt_setTask(1003,409)
			SendTaskOrder("您同时获得了50级的正派，邪派阵营任务。")
		elseif ( Uworld1002 == 240 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("您同时获得了50级的中立，邪派阵营任务。")
		elseif ( Uworld1001 == 270 ) then
			nt_setTask(1001,290)
			SendTaskOrder("您获得了50级的正派阵营任务。")
		elseif ( Uworld1002 == 240 ) then
			nt_setTask(1002,260)
			SendTaskOrder("您获得了50级的中立阵营任务。")
		elseif ( Uworld1003 == 408 ) then
			nt_setTask(1003,409)
			SendTaskOrder("您获得了50级的邪派阵营任务。")
		end
	else
		return Msg2Player(STRTAB_LEVELUP[lvl])
	end
end
