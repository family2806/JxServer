-- ������Ʒ�нű�
-- lixin 2005-8-31

zq_tab_award = {	--������Ʒ�п��Ի�õ���Ʒ�����ʣ�
	{	"1�����",	0.43145	,	 528 ,	},
	{	"2�����",	0.05	,	 529 ,	},
	{	"3�����",	0.015	,	 530 ,	},
	{	"4�����",	0.003	,	 531 ,	},
	{	"5�����",	0.0005	,	 532 ,	},
	{	"6�����",	0.00005	,	 533 ,	},
	{	"1������",	0.43145	,	 534 ,	},
	{	"2������",	0.05	,	 535 ,	},
	{	"3������",	0.015	,	 536 ,	},
	{	"4������",	0.003	,	 537 ,	},
	{	"5������",	0.0005	,	 538 ,	},
	{	"6������",	0.00005	,	 539 ,	},
}

function main()
	local base = 100000
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( zq_tab_award ) do
		sum = sum + zq_tab_award[i][2] * 100000
		if( sum >= num ) then
			zq_award( zq_tab_award[i] )
			break
		end
	end
end

function zq_award( item )
	local name = item[1]
	AddEventItem( item[ 3 ] )
	Msg2Player("��ϲ��������1��"..name)
	Talk(1,"","��٣���ϲ������<color=yellow>"..name.."<color>��")
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName().."����������Ʒ���еõ�  "..name)
end