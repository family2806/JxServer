--by 廖志山 [2006-09-12]
--2006中秋活动：材料函数
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

tab_material = {
{	"黄色单光纸(制作灯笼材料)"	,	1221	,	2635	}	,
{	"红色单光纸(制作灯笼材料)"	,	1224	,	50	}	,
{	"绿色单光纸(制作灯笼材料)"	,	1223	,	300	}	,
{	"橙色单光纸(制作灯笼材料)"	,	1225	,	15	}	,
{	"蓝色单光纸(制作灯笼材料)"	,	1222	,	1000	}	,
{	"青竹(制作灯笼材料)"	,	1226	,	2000	}	,
{	"蒲草线(制作灯笼材料)"	,	1227	,	2000	}	,
{	"蜡烛"	,	1228	,	2000	}	,
}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(tab_material) do
		nSum = nSum + tab_material[i][3];
		if (nSeed < nSum) then
			AddItem(6, 1, tab_material[i][2], 1, 0, 0, 0);
			Msg2Player("你得到 <color=yellow>"..tab_material[i][1]..". <color>");
			return 0;
		end;
	end;
	AddItem(6, 1, tab_material[1][2], 1, 0, 0, 0);
	Msg2Player("你得到<color=yellow>"..tab_material[1][1]..". <color>");
    return 0;
end
