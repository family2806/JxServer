

ItemType	=	{{"�·�","��ָ","����","Ь","����","ñ��","����","����"},{1,2,1,1,1,1,1,1}}

function hello()

	Say("���䣬����������ޣ�����ӵ��ӥ���۾����ǵĶ��䡢�ܵ���������Ϊ����֮�����������������������档",3,"������ô�������ҵ�Ҫ��һ��/exchange_mask", "����˼��˵��������/about","��ţ�ˣ��ҲŲ����أ�/no")

end

function exchange_mask()

	GiveItemUI( "ǧ��ٹֶ�����", "����Ҫ׼�����������һ��<color=blue>��ɫ����<color>װ��(9��)��<color=blue>20��<color>�����ӣ�����һ���Ļ���õ�һ���������ߡ���ע�⣬�һ���������Ƿ�ɹ�,װ���ͽ����Ҷ�����ʧ���벻Ҫ�ü�Ʒ��", "exchange_mask_Confirm", "onCancel" );
	
end

function exchange_mask_Confirm( nCount )

	isItemType = {0,0,0,0,0,0,0,0}
	if ( nCount ~= 9 ) then
		Say("������ϸ���һ�£������ҵ�װ��������Ҫ��Ŷ",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
			if ( ItemGenre ~= 0 ) then
				Say("������ϸ���һ�£������ҵ�װ��������Ҫ��Ŷ",0)
				return 0
			elseif ( DetailType == 0 ) then
				Say("�������������װ�����ʿ�������ջ���������Ϊ��",0)
				return 0
			elseif ( DetailType == 10 ) then
				Say("һ·����ƣ�ͣ���ʿ���Ҹ���Ҫ������ѽ",0)
				return 0
			elseif ( DetailType == 11 ) then
				Say("������߶����أ��������Լ����ź���",0)
				return 0
			elseif ( DetailType > 11 ) then
				Say("������ϸ���һ�£������ҵ�װ��������Ҫ��Ŷ",0)
				return 0
			else
				if ( magictype == 0 ) then
					Say("���Ҿ��̶��꣬�����װ��Ҳ���ɻ���أ�û�ţ�",0)
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
			Say("�ҵ���߿ɲ�һ������20�������Ǳ�������ˣ�����Ǯ��������",1,"�ã��һ�ȥȡǮ�ɣ���ǵ�һ��������һ��Ŷ��")
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
		iGive = random (1,400000)
		if ( iGive < 10000 ) then
			AddItem(0,11,23,0,0,0,0)     --������
			Say("������Ķ���ȷʵ�����������ˣ������߾��������",0)
			
		elseif ( iGive < 20000 ) then
			AddItem(0,11,31,0,0,0,0)     --ѩ��
			Say("������Ķ���ȷʵ�����������ˣ������߾��������",0)
		elseif ( iGive < 40000 ) then
			AddItem(0,11,38,0,0,0,0)     --����
			Say("������Ķ���ȷʵ�����������ˣ������߾��������",0)
		elseif ( iGive < 50000 ) then
			AddItem(0,11,61,0,0,0,0)     --��˿��
			Say("������Ķ���ȷʵ�����������ˣ������߾��������",0)
		elseif ( iGive < 60000 ) then
			AddItem(0,11,63,0,0,0,0)     --ѩ��
			Say("������Ķ���ȷʵ�����������ˣ������߾��������",0)
		elseif ( iGive < 70000 ) then
			AddItem(0,11,65,0,0,0,0)     --÷��¹
			Say("������Ķ���ȷʵ�����������ˣ������߾��������",0)
		elseif ( iGive < 80000 ) then
			AddItem(0,11,66,0,0,0,0)     --����
			Say("������Ķ���ȷʵ�����������ˣ������߾��������",0)
		else
			Say("��ʱ�������ң���϶��ǰ�æһ���ˣ�",1,"���ҵ�ù����������õ����������/no")

		end
	else
		Talk(1,"","������ϸ���һ�£������ҵ�װ��������Ҫ��Ŷ��")
	end
	
end

function about()

	Say("����Ҫ׼�����������һ��<color=red>��ɫ����<color>װ��(9��)��<color=red>20��<color>�����ӣ�����һ���Ļ���õ�һ������Ķ�����ߣ����������ѩ�ǡ���������ѩ�֡����ܡ�����÷��¹�ͽ�˿�����Ҫ׼����9��װ���ֱ�Ϊ��ñ�ӡ��·�������������/���������/����������/���ҡ��Ͻ�ָ���½�ָ��Ь��������ע�⣬�һ���������Ƿ�ɹ�,װ���ͽ����Ҷ�����ʧ��",1,"Ŷ���������ˣ�лл��/no")
end


function no()

end
