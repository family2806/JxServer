--中秋节活动2007 原料包

function IsPickable( nItemIndex, nPlayerIndex )
	if GetExtPoint(0) <= 0 then
			Msg2Player("只有充值玩家才能捡到原料包.")
			return 0
	end
	return 1;
end
tb_Mareial = 
{
	100000,
	{
		{G=6,D=1,P=1503,nrate=0.3		,szname="面粉袋"},
		{G=6,D=1,P=1504,nrate=0.3		,szname="糖袋"},
		{G=6,D=1,P=1505,nrate=0.3		,szname="鸡蛋袋"},
		{G=6,D=1,P=1506,nrate=0.05	,szname="绿豆袋"},
		{G=6,D=1,P=1507,nrate=0.025	,szname="莲藕袋"},
		{G=6,D=1,P=1508,nrate=0.015	,szname="鸡肉袋"},
		{G=6,D=1,P=1509,nrate=0.01	,szname="猪肉袋"}
	}
}
function PickUp( nItemIndex, nPlayerIndex )
		if GetExtPoint(0) <= 0 then
			Msg2Player("只有充值玩家才能使用原料袋.")
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
				Msg2Player(format("您获得1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;	-- 删除物品

end