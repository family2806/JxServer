tbclass_newyear2008_zongbing = {}
tbclassname = tbclass_newyear2008_zongbing
tbclassname.TITLE = "����"
tbclassname.LIMIT_LEVEL = 50
tbclassname.tbdate = {}
tbclassname.tbdate.nstart = 802020000
tbclassname.tbdate.nend 	= 803312400
tbclassname.mareial =
{
		nexpmax = 2000000000,
		ntask = 1872,
		tbitem = {
			{
				G=6,D=1,P=1662,szname="�ϵ�����",nexp=2000000,
				tbrandomitem =
				{
					ntotalprop = 100,
					tbitem = 
					{
						{G=6,D=1,P=72,LV=1,szname="��ɽ��¶",prob=14.89},
						{G=6,D=1,P=125,LV=1,szname="�𻨾�",prob=16.0},
						{G=0,D=11,P=201,LV=1,szname="�ع�ͷ���",prob=10.90},
						{G=6,D=1,P=1482,LV=1,szname="����",prob=0.01	},
						{G=6,D=1,P=1481,LV=1,szname="����"	 ,prob=0.05	},
						{G=6,D=1,P=1480,LV=1,szname="����"	 ,prob=5.00	},
						{G=6,D=1,P=147,LV=3,szname="3��������ʯ"	 ,prob=22.0	},			
						{G=6,D=1,P=147,LV=4,szname="4��������ʯ",prob=16.0},
						{G=6,D=1,P=147,LV=5,szname="5��������ʯ",prob=2.0},
						{G=6,D=1,P=147,LV=6,szname="6��������ʯ",prob=1.0},
						{G=6,D=1,P=147,LV=7,szname="7��������ʯ",prob=0.10	},
						{G=6,D=1,P=147,LV=8,szname="8��������ʯ"	 ,prob=0.05	},
						{G=6,D=1,P=71,LV=1,szname="�ɲ�¶"	 ,prob=11.00	},
						{G=6,D=1,P=1181,LV=1,szname="�ر��ɲ�¶"	 ,prob=1.0	},					
					}
				} 
			},
			{G=6,D=1,P=1663,szname="�õ�����",nexp=1500000,
				tbrandomitem =
				{
					ntotalprop = 100,
					tbitem = 
					{
						{G=6,D=1,P=124,LV=1,szname="��Ե¶����) ",prob=19.5},
						{G=6,D=1,P=72,LV=1,szname="��ɽ��¶",prob=15.0},
						{G=6,D=1,P=73,LV=1,szname="�ٹ�¶",prob=14.0},
						{G=6,D=1,P=71,LV=1,szname="�ɲ�¶",prob=7.0	},
						{G=6,D=1,P=125,LV=1,szname="�𻨾�"	 ,prob=17.0	},
						{G=0,D=11,P=201,LV=1,szname="�ع�ͷ���"	 ,prob=15.0	},
						{G=6,D=1,P=147,LV=3,szname="3��������ʯ"	 ,prob=7.0	},		
						{G=6,D=1,P=147,LV=4,szname="4��������ʯ"	 ,prob=5.0	},		
						{G=6,D=1,P=147,LV=5,szname="5��������ʯ"	 ,prob=0.5	},						
					}
				}
			},
			{G=6,D=1,P=1664,szname="һ������",nexp=500000},
		},	
}

function main(sel)
	
	local prop = tbclassname:pack(GetItemProp(sel))
	local szkey = format("%s,%s,%s",prop[1],prop[2],prop[3])
	local tbitem = tbclassname:selectitem(szkey)
	if tbitem == nil then
		Say("��Ʒ��������ϵ����Ա",0)
		return 1
	end
	if tbclassname:check() == 0 then
		return 1
	elseif tbclassname:check() == 2 then
		return 0
	end
	tbclassname:useitem(tbitem.nexp)
	if tbitem.tbrandomitem ~= nil then
		tbclassname:getradomitem(tbitem.tbrandomitem)
	end
end
function tbclassname:getradomitem(tbitem)
	local tbclass = tbitem
	local p = random(1,(tbclass.ntotalprop*100))
	local nsum = 0
	for ni,nitem in tbclass.tbitem do
				nsum = nsum + (nitem.prob*tbclass.ntotalprop)
				if nsum >= p then
					AddItem(nitem.G,nitem.D,nitem.P,nitem.LV,0,0)
					local szstr = format("��ϲ����1<color=yellow>%s<color>",nitem.szname)
					Msg2Player(szstr)
					self:sdl_writelog(self.TITLE,szstr)
					return
				end
	end	
end
function tbclassname:useitem(naddexp)
	local nexp = GetTask(self.mareial.ntask)
	local nexpn = naddexp
	if nexp + naddexp > self.mareial.nexpmax then
		nexpn = self.mareial.nexpmax - nexp
	end
	local szstr = format("��ϲ����<color=yellow>%s<color> ����.",nexpn)
	AddOwnExp(nexpn)
	SetTask(self.mareial.ntask,nexp+nexpn)
	Msg2Player(szstr)
	self:sdl_writelog(self.TITLE,szstr)
end
function tbclassname:selectitem(szkey)
	for ni,nitem in self.mareial.tbitem do
		local szitemkey = format("%s,%s,%s",nitem.G,nitem.D,nitem.P)
		if szitemkey == szkey then
			return nitem
		end
	end
	return nil
end
function tbclassname:check()
	if self:check_date() == 0 then
		Say("�����ѹ��ڣ�����ʹ��.",0)
		return 2
	end
	if self:check_level() == 0 then
		Say("�ȼ�����50��������ʹ��.",0)
		return 0
	end
	if self:check_pay() == 0 then
		Say("�㻹δ��ֵ������ʹ��.",0)
		return 0
	end
	if self:check_exp() == 0 then
		Say("�����ӻ�����Ѵﵽ��߾���ֵ��������ʹ����.",0)
		return 0
	end
	if CalcFreeItemCellCount() < 1 then
		Say("��λ���㣬�밲��һ��װ��.",0)
		return 0
	end
	return 1
end

function tbclassname:pack(...) --ת��table
	return arg
end

function tbclassname:check_exp()
	local nexp = GetTask(self.mareial.ntask)
	if nexp >= self.mareial.nexpmax then
		return 0
	end
	return 1
end
function tbclassname:check_date()--�ж�ʱ��
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate >= self.tbdate.nstart and ndate <= self.tbdate.nend then
		return 1
	end
	return 0
end

function tbclassname:check_level()		--�жϵȼ�
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:sdl_writelog(sztitle,szevent)	--��¼,sztitle=�¼���,szevent=�¼�����
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end