Include("\\script\\task\\system\\task_string.lua")




YDBZ_item_suipian_ID = {6,1,1606}		--��ƬID
YDBZ_tbgolditem = {
	[1]={--���ƣ���Ҫ��Ƭ����ƷID��g,d,p��
			"����װ��[��]",	
			{"����֮��ѪԪ���",50,6,1,1536,"{{���Ѫ��}}180-240<enter>{{����ɱǹ����ʱ��}}45-55<enter>{{������ѣʱ��}}30-50<enter>{{����η���}}25-30<enter>{{ɱǹ����ϵ�⹦��������}}30-50"},
			{"����֮������",45,6,1,1537,"<enter>{{���Ѫ��}}180-240<enter>{{�����}}25-30<enter>{{�������}}180-240<enter>{{���ٱ���ʱ��}}30-50<enter>{{ɱǹ����ϵ�⹦��������}}30-50"},
			{"����֮����ѥ",38,6,1,1539,"{{���Ѫ��}}180-240<enter>{{����ת���ٶ�}}40-50<enter>{{�������}}180-240<enter>{{����շ�}}25-30<enter>{{������ɱϵ�ڹ�}}80-120"},	
			{"����֮������⬻���",38,6,1,1540,"{{���Ѫ��}}180-240<enter>{{������}}25-30<enter>{{�������}}180-240<enter>{{������ѣʱ��}}30-50<enter>{{���ӻ�ɱϵ�ڹ�}}80-120"},	
	},
	[2]={
			"����װ��[ľ]",	
			{"����֮��Ӱ��",38,6,1,1549,"{{���Ѫ��}}180-240<enter>{{����ת���ٶ�}}40-50<enter>{{�������}}180-240<enter>{{������}}25-30<enter>{{ɱǹ����ϵ�⹦��������}}30-50"},	
			{"����֮������а��",38,6,1,1550,"{{���Ѫ��}}180-240<enter>{{������}}25-30<enter>{{�������}}180-240<enter>{{������ѣʱ��}}30-50<enter>{{��������ɱǹ}}3-5"},	
			{"����֮����",30,6,1,1551,"{{���Ѫ��}}180-240<enter>{{��󶾷�}}25-30<enter>{{�������}}180-240<enter>{{�����ж�ʱ��}}30-50<enter>{{���Ӷ�ɱϵ�ڹ�}}50-60"},	
	},
	[3]={
			"Ů�װ�� [ˮ]",	
			{"Ů�֮���շ���",38,6,1,1557,"{{���Ѫ��}}180-240<enter>{{����շ�}}25-30<enter>{{�������}}180-240<enter>{{������ѣʱ��}}30-50<enter>{{ɱǹ����ϵ�⹦��������}}30-50"},	
			{"Ů�֮������������",38,6,1,1558,"{{���Ѫ��}}180-240<enter>{{����׷�}}25-30<enter>{{�������}}180-240<enter>{{�����ж�ʱ��}}30-50<enter>{{Sɱǹת���ڹ�}}6-10"},	
			{"Ů�֮����",50,6,1,1561,"{{���Ѫ��}}180-240<enter>{{������}}25-30<enter>{{�������}}180-240<enter>{{�����ж�ʱ��}}30-50<enter>{{���ӱ�ɱϵ�ڹ�}}200-300"},	
	},
	[4]={
			"ף��װ��[��]",
			{"ף��֮����ŭ��װ",45,6,1,1566,"{{���Ѫ��}}180-240<enter>{{�������˶���ʱ��}}45-55<enter>{{�����ж�ʱ��}}30-50<enter>{{����շ�}}25-30<enter>{{Sɱǹת���ڹ�}}6-10"},	
			{"ף��֮���˲���צ",38,6,1,1570,"{{���Ѫ��}}180-240<enter>{{����շ�}}25-30<enter>{{�������}}180-240<enter>{{���ٱ���ʱ��}}30-50<enter>{{���ӱ�ɱϵ�ڹ�}}80-120"},	
			{"ף��֮����",38,6,1,1571,"{{���Ѫ��}}180-240<enter>{{�����}}25-30<enter>{{�������}}180-240<enter>{{���ٱ���ʱ��}}30-50<enter>{{���ӻ�ɱϵ�ڹ�}}200-300"},	
	},
	[5]={
			"��ũװ�� [��]",	
			{"��ũ֮�����ػ���",50,6,1,1576,"{{���Ѫ��}}180-240<enter>{{�������˶���ʱ��}}45-55<enter>{{������ѣʱ��}}30-50<enter>{{����շ�}}25-30<enter>{{ɱǹ����ϵ�⹦��������}}30-50"},	
			{"��ũ֮ŭ��ͷ��",38,6,1,1577,"{{���Ѫ��}}180-240<enter>{{����׷�}}25-30<enter>{{�������}}180-240<enter>{{���ٱ���ʱ��}}30-50<enter>{{Sɱǹת���ڹ�}}6-10"},	
			{"��ũ֮Ԧ����",40,6,1,1579,"{{���Ѫ��}}180-240<enter>{{����ת���ٶ�}}40-50<enter>{{�������}}180-240<enter>{{������}}25-30<enter>{{���ӻ�ɱϵ�ڹ�}}80-120"},	
			{"��ũ֮ն��",30,6,1,1581,"{{���Ѫ��}}180-240<enter>{{��󶾷�}}25-30<enter>{{�������}}180-240<enter>{{������ѣʱ��}}30-50<enter>{{������ɱϵ�ڹ�}}200-300"},	
	},
}
function YDBZ_golditem()
	local nlen = getn(YDBZ_tbgolditem)
	local tbfun =  {}
	tbfun[1] = "<dec><npc>��ѡ���׵ۻƽ�ͼ��!!"
	tbfun[2] = "��ֻ��·������./NoChoice"
	for i = nlen,1,-1 do 
		tinsert(tbfun,2,YDBZ_tbgolditem[i][1] .. format("/#YDBZ_golditem_chose(%s)",i) )
	end
	CreateTaskSay(tbfun)
end

function YDBZ_golditem_chose(nchose)
	local nlen = getn(YDBZ_tbgolditem[nchose])
	local tbfun =  {}
	tbfun[1] = format("<dec><npc>�����ѡ��ͼ��<color=yellow>%s<color>.",YDBZ_tbgolditem[nchose][1])
	tbfun[2] = "��ֻ��·������./NoChoice"
	for i = nlen-1,1,-1 do 
		tinsert(tbfun,2,YDBZ_tbgolditem[nchose][i+1][1] .. format("/#YDBZ_golditem_get(%s,%s)",nchose,i+1) )
	end
	CreateTaskSay(tbfun)	
end

function YDBZ_golditem_get(nchose,ni)
	local nlen = getn(YDBZ_tbgolditem[nchose])
	local tbfun =  {}
	tbfun[1] = format("<dec><npc>������ <color=yellow>��ͼ�� %s<color>  <color=yellow>%s<color> ��Ҫ�� <color=yellow>%s<color> �׵�ͼ�ڲ��ܻ��������뻻��?<enter>�ϳ���ͼ�׺�װ����������: <enter>%s",YDBZ_tbgolditem[nchose][1],YDBZ_tbgolditem[nchose][ni][1],YDBZ_tbgolditem[nchose][ni][2],YDBZ_tbgolditem[nchose][ni][6])
	tbfun[2] = format("�ԣ���Ҫ��/#YDBZ_golditem_getyes(%s,%s)",nchose,ni)
	tbfun[3] = "��ֻ��·������./NoChoice"
	CreateTaskSay(tbfun)		
end

function YDBZ_golditem_getyes(nchose,ni)
	local nitemc = YDBZ_tbgolditem[nchose][ni][2]
	local g = YDBZ_item_suipian_ID[1]
	local d = YDBZ_item_suipian_ID[2]
	local p = YDBZ_item_suipian_ID[3]
	local ncount = CalcEquiproomItemCount(g,d,p,-1)
	if ncount < nitemc then
		Say("���²����׵�ͼ������ȡ�׵ۻƽ�ͼ��.",0)
		return
	end
	ConsumeEquiproomItem(nitemc, g, d, p, -1)
	local ng = YDBZ_tbgolditem[nchose][ni][3]
	local nd = YDBZ_tbgolditem[nchose][ni][4]
	local np = YDBZ_tbgolditem[nchose][ni][5]
	AddItem(ng,nd,np,1,0,0)
	Msg2Player(format("���»��һ���ƽ�ͼ��- <color=yellow>%s<color>",YDBZ_tbgolditem[nchose][ni][1]))
	YDBZ_sdl_writeLog("���ƽ�ͼ��",format("�� %s �׵�ͼ�ڳɹ���ȡ %s",nitemc,YDBZ_tbgolditem[nchose][ni][1]))
end

function YDBZ_sdl_writeLog(sztitle,szevent)	--��¼,sztitle=�¼���,szevent=�¼�����
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end