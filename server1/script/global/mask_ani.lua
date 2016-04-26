

ItemType	=	{{"衣服","戒指","项链","鞋","腰带","帽子","手镯","玉佩"},{1,2,1,1,1,1,1,1}}

function hello()

	Say("变变变，体验快乐无限！你想拥有鹰的眼睛、狼的耳朵、熊的力量、成为百兽之王吗？我这里就能让你梦想成真。",3,"真有那么神奇吗？我倒要瞧一瞧/exchange_mask", "有意思，说来听听吧/about","别吹牛了，我才不信呢！/no")

end

function exchange_mask()

	GiveItemUI( "千奇百怪动物秀", "您需要准备除武器外的一套<color=blue>蓝色属性<color>装备(9件)和<color=blue>20万<color>两银子，就有一定的机会得到一个神奇的面具。请注意，兑换面具无论是否成功,装备和剑侠币都会消失，请不要拿极品。", "exchange_mask_Confirm", "onCancel" );
	
end

function exchange_mask_Confirm( nCount )

	isItemType = {0,0,0,0,0,0,0,0}
	if ( nCount ~= 9 ) then
		Say("请再仔细检查一下，您给我的装备不符合要求哦",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
			if ( ItemGenre ~= 0 ) then
				Say("请再仔细检查一下，您给我的装备不符合要求哦",0)
				return 0
			elseif ( DetailType == 0 ) then
				Say("闯荡江湖不容易啊，义士还是请收回武器防身为好",0)
				return 0
			elseif ( DetailType == 10 ) then
				Say("一路奔波疲劳，义士比我更需要个坐骑呀",0)
				return 0
			elseif ( DetailType == 11 ) then
				Say("我这面具多着呢，还是你自己拿着好了",0)
				return 0
			elseif ( DetailType > 11 ) then
				Say("请再仔细检查一下，您给我的装备不符合要求哦",0)
				return 0
			else
				if ( magictype == 0 ) then
					Say("想我经商多年，这个白装备也想蒙混过关，没门！",0)
					return 0
				else
					isItemType[DetailType - 1] = isItemType[DetailType - 1] + 1
				end
			end
		end
	end
	if ( (ItemType[2][1] == isItemType[1]) and (ItemType[2][2] == isItemType[2]) and (ItemType[2][3] == isItemType[3]) and (ItemType[2][4] == isItemType[4]) and (ItemType[2][5] == isItemType[5]) and (ItemType[2][6] == isItemType[6]) and (ItemType[2][7] == isItemType[7]) and (ItemType[2][8] == isItemType[8]) ) then
		onPay = 200000
		if ( GetCash() < onPay ) then
			Say("我的面具可不一般啦，20万两算是便宜你的了，等有钱了再来吧",1,"好，我回去取钱吧，请记得一定给我留一个哦！")
			return 0
		end
		for i = 1, nCount do
		
			nItemIndex = GetGiveItemUnit( i )
			k = RemoveItemByIndex( nItemIndex )
			if ( k ~= 1 ) then
				Say("怎么回事，你怎么能骗我呢？",0)
				return 0
			end
			
		end
		Pay( onPay )
		iGive = random (1,400000)
		if ( iGive < 10000 ) then
			AddItem(0,11,23,0,0,0,0)     --东北虎
			Say("恩～你的东西确实不错，我收下了，这个面具就是你的了",0)
			
		elseif ( iGive < 20000 ) then
			AddItem(0,11,31,0,0,0,0)     --雪狼
			Say("恩～你的东西确实不错，我收下了，这个面具就是你的了",0)
		elseif ( iGive < 40000 ) then
			AddItem(0,11,38,0,0,0,0)     --棕熊
			Say("恩～你的东西确实不错，我收下了，这个面具就是你的了",0)
		elseif ( iGive < 50000 ) then
			AddItem(0,11,61,0,0,0,0)     --金丝猴
			Say("恩～你的东西确实不错，我收下了，这个面具就是你的了",0)
		elseif ( iGive < 60000 ) then
			AddItem(0,11,63,0,0,0,0)     --雪怪
			Say("恩～你的东西确实不错，我收下了，这个面具就是你的了",0)
		elseif ( iGive < 70000 ) then
			AddItem(0,11,65,0,0,0,0)     --梅花鹿
			Say("恩～你的东西确实不错，我收下了，这个面具就是你的了",0)
		elseif ( iGive < 80000 ) then
			AddItem(0,11,66,0,0,0,0)     --白猪
			Say("恩～你的东西确实不错，我收下了，这个面具就是你的了",0)
		else
			Say("这时候来烦我，你肯定是白忙一场了！",1,"算我倒霉。等你心情好点再来找你吧/no")

		end
	else
		Talk(1,"","请再仔细检查一下，您给我的装备不符合要求哦！")
	end
	
end

function about()

	Say("您需要准备除武器外的一套<color=red>蓝色属性<color>装备(9件)和<color=red>20万<color>两银子，就有一定的机会得到一个神奇的动物面具，包括：金雕、雪狼、东北虎、雪怪、棕熊、白猪、梅花鹿和金丝猴。您需要准备的9件装备分别为：帽子、衣服、腰带、护腕/手镯、护身符/项链、玉佩/香囊、上戒指、下戒指、鞋。不过请注意，兑换面具无论是否成功,装备和剑侠币都会消失。",1,"哦，我明白了，谢谢！/no")
end


function no()

end
