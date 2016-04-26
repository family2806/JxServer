--�ø������ʵ�֣������������������ľ��ˮ���������и�һ�����ɻ�ȡһ��������ָ
--designed by yangqi
--written by renbin

function weapon_ring()

	Say("��������Ͻ�ָ��ȱ����Ҳ�û�ȥ��ѧ�������գ�ֻҪ��׼��һ�����������Ե�������10�������ӣ��Ҿ��ܰ��㻻��һ�������ԵĽ�ָ������ÿ�ζ���ЧŶ��������Ҫ����",3,"�õģ�������Ҫ����ָ��/exchange_weapon","�����˽�һ�°�/weapon_help","���˰ɣ����кö��ָ��/no")

end

function exchange_weapon()

	GiveItemUI( "������������ָ", "����Ҫ׼������������ֱ�Ϊ��ľ��ˮ������ϵ��ֻҪ��<color=blue>������ȫ<color>�����Ҿ�����<color=blue>��ɫ����<color>���Ϳ��Ի�ȡһ����ָ��<color=blue>�����ĵȼ���������������ƣ�ÿ����Ҫ����10�������ӣ��ٷְٳɹ��ʡ�<color>", "weapon_ring_Confirm", "onCancel" );
	
end

function weapon_ring_Confirm( nCount )

	onSeries = {1,1,1,1,1}
	if ( nCount ~= 5 ) then						--are there 5 weapons
		Say("������ϸ���һ�£������ҵ�����������Ҫ��Ŷ",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )		--get itemindex
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)	--get magic attrib
--			Msg2Player("nSeries = "..nSeries)
--			Msg2Player("magictype = "..magictype)
			if ( ItemGenre ~= 0 ) then
				Say("������ϸ���һ�£������ҵ�����������Ҫ��Ŷ",0)
				return 0
			elseif ( DetailType ~= 0 and DetailType ~= 1) then					--is it weapon
				Say("������ϸ���һ�£������ҵ�����������Ҫ��Ŷ",0)
				return 0
			elseif ( magictype == 0 ) then
				Say("���Ҿ��̶��꣬�������������Ҳ���ɻ���أ�û�ţ�",0)
				return 0
			elseif ( nSeries < 0 and nSeries > 4 ) then			--exception
				Say("���װ������ְ�����������ˡ�",0)
				return 0
			elseif ( onSeries[nSeries + 1] == 0 ) then				--���������Ƿ���ȫ
				Say("������ϸ���һ�£������ҵ����������в���ȫŶ",0)
				return 0
			else
				onSeries[nSeries + 1] = 0
			end
		end
			onPay = 100000
			if ( GetCash() < onPay ) then
				Say("ûǮ�ɲ��У�����Щ��������ɻ������ҵĽ�ָ",0)
				return 0
			end
			for i = 1, nCount do
		
				nItemIndex = GetGiveItemUnit( i )
				k = RemoveItemByIndex( nItemIndex )
				if ( k ~= 1 ) then
					Say("��ô���£�����ô��ƭ���أ�",0)
					return 0
				end
			
			end
			Pay( onPay )
			local _nSeed = SetRandSeed(234)					--�̶��Ľ�ָ
			AddItem(0,3,0,1,0,0,1,0,0,0,0,0)     			--��ָ
			SetRandSeed(_nSeed)
			Say("������Ķ���ȷʵ�����������ˣ������ָ���������",0)
		
	end
	
end

function weapon_help()

	Say("����Ҫ׼������������ֱ�Ϊ��ľ��ˮ������ϵ��ֻҪ��������ȫ�����Ҿ�������ɫ���ԣ��Ϳ��Ի�ȡһ����ָ�������ĵȼ���������������ƣ�ÿ����Ҫ����10�������ӣ��ٷְٳɹ��ʡ�",1,"Ŷ���������ˣ�лл��/no")

end


function no()

end
