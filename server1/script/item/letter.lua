--包袱内的信件（新任务系统龙五的包袱）正派
--by xiaoyang(2004\12\25)

Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
local curCamp = nt_getCamp()
	Uworld1001 = nt_getTask(1001)  --正派
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	local name = GetName()
	if ( Uworld183 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj075.spr>龙五的信<link><enter>龙五："..name.."，家国大难，江湖乱起。生在这个时代，许多时候都会身不由己。我很高兴你一直想做个正直的人，所以告诉你一个秘密，也许它能帮到你。不知从何时起，江湖的不同阵营间忽然传出这样的消息，在群雄争霸的背后，有着更为庞大的组织暗中操纵。我不知道传闻是否可信，但正道武林有个隐于市集，实力庞大的组织却是我可以肯定的。据说这个组织的名字叫武林客栈。我想，初出道时能进入这样一个组织，对你的前程会更好，也能免去许多不必要的麻烦。你可以去大理找一个叫莫愁的女子，她会给你具体指令。但切切不可在她面前提起我，原因以后自知。匆匆数言，以此收笔，遥祝心愿早成。龙五。",1,"收起信函/no")
		nt_setTask(183,30)
		if ( Uworld1001 < 10 ) then
	  		nt_setTask(1001,10) --正派任务开始
	  	end
	end
	return 0
end
	
