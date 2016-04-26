-- Created by Danielsun 2006-12-07
-- 圣诞礼盒
-- 按几率获得圣诞礼物材料

TB_Giftbox = {
 --1.物品名	    2.物品ID	3.掉落几率
	{"雪花", 			1312,		20	},
	{"茄子",		1313,		20	},
	{"松枝",	1314,		20	},
	{"圣诞帽",		1315,		18	},
	{"围巾 (绿)",	1316,		11	},
	{"围巾 (红)",	1317,		5		},
	{"松",		1318,		1		},
}

function main()
	
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_Giftbox do
		PItem = PItem + TB_Giftbox[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_Giftbox[ngift][2],1,0,0,0);
			Msg2Player("您获得圣诞原料:"..TB_Giftbox[ngift][1]);
			return
		end
	end
	return 1;
end
