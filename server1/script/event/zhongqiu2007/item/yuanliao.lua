--����ڻ2007 ԭ�ϰ�

function IsPickable( nItemIndex, nPlayerIndex )
	if GetExtPoint(0) <= 0 then
			Msg2Player("ֻ�г�ֵ��Ҳ��ܼ�ԭ�ϰ�.")
			return 0
	end
	return 1;
end
tb_Mareial = 
{
	100000,
	{
		{G=6,D=1,P=1503,nrate=0.3		,szname="��۴�"},
		{G=6,D=1,P=1504,nrate=0.3		,szname="�Ǵ�"},
		{G=6,D=1,P=1505,nrate=0.3		,szname="������"},
		{G=6,D=1,P=1506,nrate=0.05	,szname="�̶���"},
		{G=6,D=1,P=1507,nrate=0.025	,szname="��ź��"},
		{G=6,D=1,P=1508,nrate=0.015	,szname="�����"},
		{G=6,D=1,P=1509,nrate=0.01	,szname="�����"}
	}
}
function PickUp( nItemIndex, nPlayerIndex )
		if GetExtPoint(0) <= 0 then
			Msg2Player("ֻ�г�ֵ��Ҳ���ʹ��ԭ�ϴ�.")
			return 0
		end
		local nrate = random(1,tb_Mareial[1]);
		local nsum = 0
		for nkey,nitem in tb_Mareial[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				local szitemname = nitem["szname"]
				Msg2Player(format("�����1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;	-- ɾ����Ʒ

end