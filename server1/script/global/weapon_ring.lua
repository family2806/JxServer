--用给予界面实现，用五件武器，包含金、木、水、火、土五行各一件，可换取一个垃圾戒指
--designed by yangqi
--written by renbin

function weapon_ring()

	Say("最近江湖上戒指奇缺，我也趁机去多学了样手艺，只要你准备一套五行蓝属性的武器和10万两银子，我就能帮你换得一个蓝属性的戒指，而且每次都奏效哦。请问你要换吗？",3,"好的，我正需要个戒指呢/exchange_weapon","我先了解一下吧/weapon_help","算了吧，我有好多戒指呢/no")

end

function exchange_weapon()

	GiveItemUI( "五行武器换戒指", "您需要准备五件武器，分别为金、木、水、火、土系，只要这<color=blue>五行齐全<color>，并且均带有<color=blue>蓝色属性<color>，就可以换取一个戒指。<color=blue>武器的等级和种类均不受限制，每次需要花费10万两银子，百分百成功率。<color>", "weapon_ring_Confirm", "onCancel" );
	
end

function weapon_ring_Confirm( nCount )

	onSeries = {1,1,1,1,1}
	if ( nCount ~= 5 ) then						--are there 5 weapons
		Say("请再仔细检查一下，您给我的武器不符合要求哦",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )		--get itemindex
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)	--get magic attrib
--			Msg2Player("nSeries = "..nSeries)
--			Msg2Player("magictype = "..magictype)
			if ( ItemGenre ~= 0 ) then
				Say("请再仔细检查一下，您给我的武器不符合要求哦",0)
				return 0
			elseif ( DetailType ~= 0 and DetailType ~= 1) then					--is it weapon
				Say("请再仔细检查一下，您给我的武器不符合要求哦",0)
				return 0
			elseif ( magictype == 0 ) then
				Say("想我经商多年，这个白属性武器也想蒙混过关，没门！",0)
				return 0
			elseif ( nSeries < 0 and nSeries > 4 ) then			--exception
				Say("你的装备好奇怪啊！还给你好了。",0)
				return 0
			elseif ( onSeries[nSeries + 1] == 0 ) then				--五行属性是否齐全
				Say("请再仔细检查一下，您给我的武器的五行不齐全哦",0)
				return 0
			else
				onSeries[nSeries + 1] = 0
			end
		end
			onPay = 100000
			if ( GetCash() < onPay ) then
				Say("没钱可不行，你这些破烂玩意可换不了我的戒指",0)
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
			local _nSeed = SetRandSeed(234)					--固定的戒指
			AddItem(0,3,0,1,0,0,1,0,0,0,0,0)     			--戒指
			SetRandSeed(_nSeed)
			Say("恩～你的东西确实不错，我收下了，这个戒指就是你的了",0)
		
	end
	
end

function weapon_help()

	Say("您需要准备五件武器，分别为金、木、水、火、土系，只要这五行齐全，并且均带有蓝色属性，就可以换取一个戒指。武器的等级和种类均不受限制，每次需要花费10万两银子，百分百成功率。",1,"哦，我明白了，谢谢！/no")

end


function no()

end
