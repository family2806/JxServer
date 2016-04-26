Include("\\script\\task\\system\\task_string.lua")




YDBZ_item_suipian_ID = {6,1,1606}		--碎片ID
YDBZ_tbgolditem = {
	[1]={--名称，需要碎片，物品ID（g,d,p）
			"燧人装备[金]",	
			{"燧人之赤血元武甲",50,6,1,1536,"{{最大血量}}180-240<enter>{{减少杀枪动作时间}}45-55<enter>{{减少晕眩时间}}30-50<enter>{{最大治防火}}25-30<enter>{{杀枪物理系外功比例比例}}30-50"},
			{"燧人之百炼盔",45,6,1,1537,"<enter>{{最大血量}}180-240<enter>{{最大火防}}25-30<enter>{{最大内力}}180-240<enter>{{减少冰冻时间}}30-50<enter>{{杀枪物理系外功比例比例}}30-50"},
			{"燧人之逐天靴",38,6,1,1539,"{{最大血量}}180-240<enter>{{增加转移速度}}40-50<enter>{{最大内力}}180-240<enter>{{最大普防}}25-30<enter>{{增加雷杀系内功}}80-120"},	
			{"燧人之金缕软猬护腕",38,6,1,1540,"{{最大血量}}180-240<enter>{{最大冰防}}25-30<enter>{{最大内力}}180-240<enter>{{减少晕眩时间}}30-50<enter>{{增加火杀系内功}}80-120"},	
	},
	[2]={
			"伏羲装备[木]",	
			{"伏羲之幻影屐",38,6,1,1549,"{{最大血量}}180-240<enter>{{增加转移速度}}40-50<enter>{{最大内力}}180-240<enter>{{最大冰防}}25-30<enter>{{杀枪物理系外功比例比例}}30-50"},	
			{"伏羲之无量辟邪手",38,6,1,1550,"{{最大血量}}180-240<enter>{{最大冰防}}25-30<enter>{{最大内力}}180-240<enter>{{减少晕眩时间}}30-50<enter>{{增加致命杀枪}}3-5"},	
			{"伏羲之碎心",30,6,1,1551,"{{最大血量}}180-240<enter>{{最大毒防}}25-30<enter>{{最大内力}}180-240<enter>{{减少中毒时间}}30-50<enter>{{增加毒杀系内功}}50-60"},	
	},
	[3]={
			"女娲装备 [水]",	
			{"女娲之红颜发带",38,6,1,1557,"{{最大血量}}180-240<enter>{{最大普防}}25-30<enter>{{最大内力}}180-240<enter>{{减少晕眩时间}}30-50<enter>{{杀枪物理系外功比例比例}}30-50"},	
			{"女娲之六艺霓裳束带",38,6,1,1558,"{{最大血量}}180-240<enter>{{最大雷防}}25-30<enter>{{最大内力}}180-240<enter>{{减少中毒时间}}30-50<enter>{{S杀枪转成内功}}6-10"},	
			{"女娲之寒湘",50,6,1,1561,"{{最大血量}}180-240<enter>{{最大冰防}}25-30<enter>{{最大内力}}180-240<enter>{{减少中毒时间}}30-50<enter>{{增加冰杀系内功}}200-300"},	
	},
	[4]={
			"祝融装备[火]",
			{"祝融之烈焰怒风装",45,6,1,1566,"{{最大血量}}180-240<enter>{{减少受伤动作时间}}45-55<enter>{{减少中毒时间}}30-50<enter>{{最大普防}}25-30<enter>{{S杀枪转成内功}}6-10"},	
			{"祝融之惊炙不灭爪",38,6,1,1570,"{{最大血量}}180-240<enter>{{最大普防}}25-30<enter>{{最大内力}}180-240<enter>{{减少冰冻时间}}30-50<enter>{{增加冰杀系内功}}80-120"},	
			{"祝融之破日",38,6,1,1571,"{{最大血量}}180-240<enter>{{最大火防}}25-30<enter>{{最大内力}}180-240<enter>{{减少冰冻时间}}30-50<enter>{{增加火杀系内功}}200-300"},	
	},
	[5]={
			"神农装备 [土]",	
			{"神农之魈阳地皇衣",50,6,1,1576,"{{最大血量}}180-240<enter>{{减少受伤动作时间}}45-55<enter>{{减少晕眩时间}}30-50<enter>{{最大普防}}25-30<enter>{{杀枪物理系外功比例比例}}30-50"},	
			{"神农之怒雷头环",38,6,1,1577,"{{最大血量}}180-240<enter>{{最大雷防}}25-30<enter>{{最大内力}}180-240<enter>{{减少冰冻时间}}30-50<enter>{{S杀枪转成内功}}6-10"},	
			{"神农之驭风履",40,6,1,1579,"{{最大血量}}180-240<enter>{{增加转移速度}}40-50<enter>{{最大内力}}180-240<enter>{{最大冰防}}25-30<enter>{{增加火杀系内功}}80-120"},	
			{"神农之斩岳",30,6,1,1581,"{{最大血量}}180-240<enter>{{最大毒防}}25-30<enter>{{最大内力}}180-240<enter>{{减少晕眩时间}}30-50<enter>{{增加雷杀系内功}}200-300"},	
	},
}
function YDBZ_golditem()
	local nlen = getn(YDBZ_tbgolditem)
	local tbfun =  {}
	tbfun[1] = "<dec><npc>请选择炎帝黄金图谱!!"
	tbfun[2] = "我只是路过而已./NoChoice"
	for i = nlen,1,-1 do 
		tinsert(tbfun,2,YDBZ_tbgolditem[i][1] .. format("/#YDBZ_golditem_chose(%s)",i) )
	end
	CreateTaskSay(tbfun)
end

function YDBZ_golditem_chose(nchose)
	local nlen = getn(YDBZ_tbgolditem[nchose])
	local tbfun =  {}
	tbfun[1] = format("<dec><npc>请阁下选择图谱<color=yellow>%s<color>.",YDBZ_tbgolditem[nchose][1])
	tbfun[2] = "我只是路过而已./NoChoice"
	for i = nlen-1,1,-1 do 
		tinsert(tbfun,2,YDBZ_tbgolditem[nchose][i+1][1] .. format("/#YDBZ_golditem_get(%s,%s)",nchose,i+1) )
	end
	CreateTaskSay(tbfun)	
end

function YDBZ_golditem_get(nchose,ni)
	local nlen = getn(YDBZ_tbgolditem[nchose])
	local tbfun =  {}
	tbfun[1] = format("<dec><npc>阁下想 <color=yellow>的图谱 %s<color>  <color=yellow>%s<color> 需要有 <color=yellow>%s<color> 炎帝图腾才能换。阁下想换吗?<enter>合成完图谱后，装备属性如下: <enter>%s",YDBZ_tbgolditem[nchose][1],YDBZ_tbgolditem[nchose][ni][1],YDBZ_tbgolditem[nchose][ni][2],YDBZ_tbgolditem[nchose][ni][6])
	tbfun[2] = format("对，我要换/#YDBZ_golditem_getyes(%s,%s)",nchose,ni)
	tbfun[3] = "我只是路过而已./NoChoice"
	CreateTaskSay(tbfun)		
end

function YDBZ_golditem_getyes(nchose,ni)
	local nitemc = YDBZ_tbgolditem[nchose][ni][2]
	local g = YDBZ_item_suipian_ID[1]
	local d = YDBZ_item_suipian_ID[2]
	local p = YDBZ_item_suipian_ID[3]
	local ncount = CalcEquiproomItemCount(g,d,p,-1)
	if ncount < nitemc then
		Say("阁下不够炎帝图腾来换取炎帝黄金图谱.",0)
		return
	end
	ConsumeEquiproomItem(nitemc, g, d, p, -1)
	local ng = YDBZ_tbgolditem[nchose][ni][3]
	local nd = YDBZ_tbgolditem[nchose][ni][4]
	local np = YDBZ_tbgolditem[nchose][ni][5]
	AddItem(ng,nd,np,1,0,0)
	Msg2Player(format("阁下获得一个黄金图谱- <color=yellow>%s<color>",YDBZ_tbgolditem[nchose][ni][1]))
	YDBZ_sdl_writeLog("换黄金图谱",format("用 %s 炎帝图腾成功换取 %s",nitemc,YDBZ_tbgolditem[nchose][ni][1]))
end

function YDBZ_sdl_writeLog(sztitle,szevent)	--记录,sztitle=事件名,szevent=事件内容
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end