TB_NEWYEAR_DOGGIFT = {
{"如意卡",	{6,1,1016,1,0,0,0},	0.3	},
{"定国之钨砂发冠",	{0,160},	0.001	},
{"定国之青纱长衫",	{0,159},	0.0012	},
{"定国之赤绢软靴",	{0,161},	0.0015	},
{"定国之紫藤护腕",	{0,162},	0.0015	},
{"定国之银蚕腰带",	{0,163},	0.0015	},
{"安邦之冰晶石项链",	{0,164},	0.0005	},
{"安邦之菊花石指环",	{0,165},	0.001	},
{"安邦之田黄石玉佩",	{0,166},	0.001	},
{"安邦之鸡血石戒指",	{0,167},	0.001	},
{"侠骨之铁血衫",	{0,186},	0.001	},
{"侠骨之多情环",	{0,187},	0.001	},
{"侠骨之丹心戒",	{0,188},	0.001	},
{"侠骨之情意结",	{0,189},	0.0005	},
{"柔情之巾帼霓裳",	{0,190},	0.0001	},
{"柔情之淑女项链",	{0,191},	0.001	},
{"柔情之凤仪戒指",	{0,192},	0.001	},
{"柔情之慧心玉佩",	{0,193},	0.001	},
{"福缘露（大）",	{6,1,124,1,0,0,0},	0.2	},
{"武林秘籍",	{6,1,26,1,0,0,0},	0.005	},
{"洗髓经",	{6,1,22,1,0,0,0},	0.005	},
{"6孔天蚕靴(水属性)",	{2,0,5,1,10,2,0,-1,-1,-1,-1,-1,-1},	0.01	},
{"6孔天蚕靴(火属性)",	{2,0,5,1,10,3,0,-1,-1,-1,-1,-1,-1},	0.01	},
{"6孔天蚕靴(土属性)",	{2,0,5,1,10,4,0,-1,-1,-1,-1,-1,-1},	0.01	},
{"6孔飞凤靴(水属性)",	{2,0,5,3,10,2,0,-1,-1,-1,-1,-1,-1},	0.01	},
{"6孔飞凤靴(火属性)",	{2,0,5,3,10,3,0,-1,-1,-1,-1,-1,-1},	0.01	},
{"6孔飞凤靴(土属性)",	{2,0,5,3,10,4,0,-1,-1,-1,-1,-1,-1},	0.01	},
{"紫水晶",	{239},	0.03	},
{"兰水晶",	{238},	0.03	},
{"绿水晶",	{240},	0.03	},
{"猩红宝石",	{353},	0.03	},
{"八级玄晶矿石",	{6,1,147,8,0,0,0},	0.001	},
{"七级玄晶矿石",	{6,1,147,7,0,0,0},	0.005	},
{"六级玄晶矿石",	{6,1,147,6,0,0,0},	0.01	},
{"五级玄晶矿石",	{6,1,147,5,0,0,0},	0.2722	},
{"神秘矿石",	{6,1,398,1,0,0,0},	0.005	},
}			


DOG_BASEVALUE = 10000

function main()
	local sum = 0
	for i = 1, getn(TB_NEWYEAR_DOGGIFT) do
		sum = sum + TB_NEWYEAR_DOGGIFT[i][3] * DOG_BASEVALUE
	end
	local ranvalue = random(sum)
	local addnum = 0
	local itemidx = 0
	for i = 1, getn(TB_NEWYEAR_DOGGIFT) do
		addnum = addnum + TB_NEWYEAR_DOGGIFT[i][3] * DOG_BASEVALUE
		if (addnum >= ranvalue) then
			itemidx = i
			break
		end
	end
	local gift = TB_NEWYEAR_DOGGIFT[itemidx][2]
	if (getn(gift) == 1) then
		AddEventItem(gift[1])
	elseif (getn(gift) == 2) then
		AddGoldItem(gift[1],gift[2])
	elseif (getn(gift) == 7) then
		AddItem(gift[1],gift[2],gift[3],gift[4],gift[5],gift[6],gift[7])
	elseif (getn(gift) == 13) then
		AddQualityItem(gift[1],gift[2],gift[3],gift[4],gift[5],gift[6],gift[7],gift[8],gift[9],gift[10],gift[11],gift[12],gift[13])
	else
		return
	end
	Msg2Player("<#>您获得一个<color=yellow>"..TB_NEWYEAR_DOGGIFT[itemidx][1].."。")
	WriteLog(date().." account:"..GetAccount().." name="..GetName().." 使用狗年吉祥旺旺包获得一个<color=yellow>"..TB_NEWYEAR_DOGGIFT[itemidx][1].."。")
end