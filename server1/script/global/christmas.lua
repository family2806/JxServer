--���ӡ�������ʥ����
--renbin



seed_name	={
		"����",
		"õ��",
		"ˮ��",
		"�ƽ�"
		}

crystal_name	={
		"����",
		"��ͨ",
		"��Ͼ",
		"����"
		}

seed_sow	={0,0,0,0,0,0}



function main()

	Say("ʥ������: ʥ�����֣���������Ҫ�����˰ɣ���Ȼ���Ҵ�������������ʧ���ġ�����������������е��ر�Ŷ��ֻҪ���������࣬���п���������������ʥ�������ҵ�����Ͳ�����Щ���ϡ��Ͻ�ȥ�ռ�<color=red>����<color>��<color=red>ʥ������<color>�ɣ��ж�Ҫ��Ŷ��",4,"��Ҫ��������/upg_crystal","��Ҫ����ʥ������/sow_seed","̫���ˣ��Ͽ��������ô��ѽ/christ_help","�Ǻǣ�û�£����������ʺ�����/no")

end


function christ_help()

	Say("ʥ�����ˣ�����Ҫ�ȵ�Ұ��ȥ�ռ�һЩ<color=red>�������<color>��<color=red>ʥ������<color>���ҿ��԰���<color=red>��������<color>��<color=red>��������<color>��",3,"���ڱ����Ĳɼ�������/bingjing","�������ӵĲɼ��ͽ���/zhongzi","���Ѿ�֪���ˣ�лл/no")

end

function bingjing()
	Say("ʥ�����ˣ�������<color=red>�������<color>��<color=red>��ͨ����<color>��<color=red>��Ͼ����<color>��<color=red>��������<color>���֡�����Ұ��ֻ�ܲɼ���<color=red>�������<color>�����ܰ����������������֡�",2,"�����Ĳɼ�/bjcj","����������/bjtl")

end


function bjcj()

	Talk(2,"","ʥ�����ˣ�<color=red>���ѱ���<color>�ɼ��طֱ�Ϊ��\n<color=red>��<color>��������⡢�������⡢�㵴ɽ\n<color=red>��<color>���ɶ����⡢������⡢��ˮ��\n<color=red>��<color>���������⡢�������⡢����ɽ","<color=red>��<color>�����ݳ��⡢������⡢����ɽ\n<color=red>��<color>���復���⡢�������⡢��������\n<color=red>��<color>��������⡢ʯ�����⡢��������")
	
end

function bjtl()

	Talk(3,"","ʥ�����ˣ�����������˳��Ϊ��<color=red>�������<color>-><color=red>��ͨ����<color>-><color=red>��Ͼ����<color>-><color=red>��������<color>��","����Ҫ׼��<color=red>һ��ͬ�ȼ���6ɫ����(�졢�ơ������ϡ��̡���)<color>���Ҿ��п��ܰ���������һ�Ÿ��ߵȼ��ı�����","�����ȼ�Խ�ߣ�������������Ӿ͸�����ħ��������������ʥ������ӵ�и��������")
	
end

function zhongzi()

	Say("ʥ�����ˣ�������<color=red>ʥ������<color>��<color=red>ʥ����������<color>��<color=red>ʥ��õ������<color>��<color=red>ʥ��ˮ������<color>��<color=red>ʥ���ƽ�����<color>���֡�����Ұ��ֻ�ܲɼ���<color=red>ʥ������<color>�����ܰ��㽽����������֡�",2,"���ӵĲɼ�/zzcj","���ӵĽ���/zzjg")

end

function zzjg()

	Talk(3,"","ʥ�����ˣ�����<color=red>����<color>����<color=red>ʥ������<color>�����ܵõ�����������ʥ�������������ӡ�","���ӵĽ��෽ʽΪ��\n\n<color=red>����6�����ѱ���<color>��<color=red>ʥ������<color>��<color=red>ʥ����������<color>\n<color=red>����6����ͨ����<color>��<color=red>ʥ������<color>��<color=red>ʥ��õ������<color>","\n\n<color=red>����6����Ͼ����<color>��<color=red>ʥ������<color>��<color=red>ʥ��ˮ������<color>\n<color=red>����6����������<color>��<color=red>ʥ������<color>��<color=red>ʥ���ƽ�����<color>��")

end

function zzcj()

	Talk(1,"","ʥ�����ˣ�<color=red>ʥ������<color>�Ĳɼ��ط��У��ٰ����⡢�������⡢��Ȫ���⡢ʮ�����ɸ�������ɽ���һ�Դ��")
	
end


-----------------------��������-----------------------

function upg_crystal()

	Say("ʥ�����ˣ�������ʲô�����أ���������ע�⣬����ÿ�ζ���ɹ���Ŷ���������ʧ�ܵĻ�����ֻ�ܻ�����<color=red>һ��ԭ����<color>��",2,"������ͨ����(2000��)/crystal_medi","��������/no")

end

function crystal_medi()

	local on_pay = 2000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,468,1,1)>=1) and CalcEquiproomItemCount(4,469,1,1)>=1 and CalcEquiproomItemCount(4,470,1,1)>=1 and CalcEquiproomItemCount(4,471,1,1)>=1 and CalcEquiproomItemCount(4,472,1,1)>=1 and CalcEquiproomItemCount(4,473,1,1)>=1) then
			ConsumeEquiproomItem(1,4,468,1,1)
			ConsumeEquiproomItem(1,4,469,1,1)
			ConsumeEquiproomItem(1,4,470,1,1)
			ConsumeEquiproomItem(1,4,471,1,1)
			ConsumeEquiproomItem(1,4,472,1,1)
			ConsumeEquiproomItem(1,4,473,1,1)
			i_medi = random(1,12000)
			if ( i_medi < 1000 ) then
				AddEventItem(474)
				Msg2Player("��õ���һ����ɫ��ͨ����")
				Pay(on_pay)
			elseif ( i_medi < 2000 ) then
				AddEventItem(475)
				Msg2Player("��õ���һ����ɫ��ͨ����")
				Pay(on_pay)
			elseif ( i_medi < 3000 ) then
				AddEventItem(476)
				Msg2Player("��õ���һ����ɫ��ͨ����")
				Pay(on_pay)
			elseif ( i_medi < 4000 ) then
				AddEventItem(477)
				Msg2Player("��õ���һ����ɫ��ͨ����")
				Pay(on_pay)
			elseif ( i_medi < 5000 ) then
				AddEventItem(478)
				Msg2Player("��õ���һ����ɫ��ͨ����")
				Pay(on_pay)
			elseif ( i_medi < 6000 ) then
				AddEventItem(479)
				Msg2Player("��õ���һ����ɫ��ͨ����")
				Pay(on_pay)
			else
				Msg2Player("�Բ�������ʧ���ˣ�ϣ���´��ܳɹ���ǧ��Ҫ����Ŷ��")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(468)
				elseif (i_back < 3000) then
					AddEventItem(469)
				elseif (i_back < 4000) then
					AddEventItem(470)
				elseif (i_back < 5000) then
					AddEventItem(471)
				elseif (i_back < 6000) then
					AddEventItem(472)
				else
					AddEventItem(473)
				end
			end
			check_again(468)	--Is there enough crystals
		
		else
			Talk(1,"","�Բ�������ϸ��鿴������Ҫһ��6����ɫ�����ѱ���Ŷ��")
		end
	else
		Talk(1,"","�Բ�������������ѽ�����ȥȡ�ɡ�")
	end

end


function crystal_high()

	local on_pay = 10000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,474,1,1)>=1) and CalcEquiproomItemCount(4,475,1,1)>=1 and CalcEquiproomItemCount(4,476,1,1)>=1 and CalcEquiproomItemCount(4,477,1,1)>=1 and CalcEquiproomItemCount(4,478,1,1)>=1 and CalcEquiproomItemCount(4,479,1,1)>=1) then
			ConsumeEquiproomItem(1,4,474,1,1)
			ConsumeEquiproomItem(1,4,475,1,1)
			ConsumeEquiproomItem(1,4,476,1,1)
			ConsumeEquiproomItem(1,4,477,1,1)
			ConsumeEquiproomItem(1,4,478,1,1)
			ConsumeEquiproomItem(1,4,479,1,1)
			i_high = random(1,18000)
			if ( i_high < 1000 ) then
				AddEventItem(480)
				Msg2Player("��õ���һ����ɫ��Ͼ����")
				Pay(on_pay)
			elseif ( i_high < 2000 ) then
				AddEventItem(481)
				Msg2Player("��õ���һ����ɫ��Ͼ����")
				Pay(on_pay)
			elseif ( i_high < 3000 ) then
				AddEventItem(482)
				Msg2Player("��õ���һ����ɫ��Ͼ����")
				Pay(on_pay)
			elseif ( i_high < 4000 ) then
				AddEventItem(483)
				Msg2Player("��õ���һ����ɫ��Ͼ����")
				Pay(on_pay)
			elseif ( i_high < 5000 ) then
				AddEventItem(484)
				Msg2Player("��õ���һ����ɫ��Ͼ����")
				Pay(on_pay)
			elseif ( i_high < 6000 ) then
				AddEventItem(485)
				Msg2Player("��õ���һ����ɫ��Ͼ����")
				Pay(on_pay)
			else
				Msg2Player("�Բ�������ʧ���ˣ�ϣ���´��ܳɹ���ǧ��Ҫ����Ŷ��")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(474)
				elseif (i_back < 3000) then
					AddEventItem(475)
				elseif (i_back < 4000) then
					AddEventItem(476)
				elseif (i_back < 5000) then
					AddEventItem(477)
				elseif (i_back < 6000) then
					AddEventItem(478)
				else
					AddEventItem(479)
				end
			end
			check_again(474)	--Is there enough crystals
		
		else
			Talk(1,"","�Բ�������ϸ��鿴������Ҫһ��6����ɫ����ͨ����Ŷ��")
		end
	else
		Talk(1,"","�Բ�������������ѽ�����ȥȡ�ɡ�")
	end

end
	


function crystal_perfect()

	local on_pay = 100000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,480,1,1)>=1) and CalcEquiproomItemCount(4,481,1,1)>=1 and CalcEquiproomItemCount(4,482,1,1)>=1 and CalcEquiproomItemCount(4,483,1,1)>=1 and CalcEquiproomItemCount(4,484,1,1)>=1 and CalcEquiproomItemCount(4,485,1,1)>=1) then
			Pay ( on_pay )
			ConsumeEquiproomItem(1,4,480,1,1)
			ConsumeEquiproomItem(1,4,481,1,1)
			ConsumeEquiproomItem(1,4,482,1,1)
			ConsumeEquiproomItem(1,4,483,1,1)
			ConsumeEquiproomItem(1,4,484,1,1)
			ConsumeEquiproomItem(1,4,485,1,1)
			i_perfect = random(1,30000)
			if ( i_perfect < 6000 ) then
				AddEventItem(486)
				WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName().."���õ�һ������������")
				Msg2Player("��ϲ��õ���һ�������������Ͽ��������ɻƽ����Ӱɣ�")
			else
				Msg2Player("�Բ�������ʧ�ܣ�ϣ���´��ܳɹ���ǧ��Ҫ����Ŷ��")
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(480)
				elseif (i_back < 3000) then
					AddEventItem(481)
				elseif (i_back < 4000) then
					AddEventItem(482)
				elseif (i_back < 5000) then
					AddEventItem(483)
				elseif (i_back < 6000) then
					AddEventItem(484)
				else
					AddEventItem(485)
				end
			end
			check_again(480)	--Is there enough crystals
			
		else
			Talk(1,"","�Բ�������ϸ��鿴������Ҫһ��6����ɫ����Ͼ����Ŷ��")
		end
	else
		Talk(1,"","�Բ�������������ѽ�����ȥȡ�ɡ�")
	end

end

function check_again(i_item)

	local on_pay = 2000
	if ( i_item == 474 )	then
		on_pay = 10000
	elseif ( i_item == 480 )	then
		on_pay = 100000
	end
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,i_item,1,1)>=1) and CalcEquiproomItemCount(4,i_item + 1,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 2,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 3,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 4,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 5,1,1)>=1)	then
			if ( i_item == 468 )	then
				Say("ʥ�����ˣ��㻹�����������ͨ������",2,"�õ�/crystal_medi","�Ȼ���˵��/no")
			elseif ( i_item == 474 )	then
				Say("ʥ�����ˣ��㻹�����������Ͼ������",2,"�õ�/crystal_high","�Ȼ���˵��/no")
			else
				Say("ʥ�����ˣ��㻹�������������������",2,"�õ�/crystal_perfect","�Ȼ���˵��/no")
			end
		end
	end
end




-----------------------������������-----------------------


------------------------��������-------------------------

function sow_seed()

	Say("��Ҫ������������?ֻҪ��������㹻��ԭ���Ϻͷ��ã���һ���ܽ���ɹ���",3,"����ʥ����������(3000��)/do_sow_seed","����ʥ��õ������(1����)/do_sow_seed","�ҿ��ǿ��ǰ�/no")

end

function do_sow_gold()

	local on_pay = 1000000
	if ( GetCash() >= on_pay ) then
		if ( CalcEquiproomItemCount(4,486,1,1)>=6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			ConsumeEquiproomItem(6,4,486,1,1)
			ConsumeEquiproomItem(1,4,487,1,1)
			Pay( on_pay )
			i_goldseed = random(1,18000)
			if ( i_goldseed < 20000 ) then		--100%rate
				AddItem(6,1,145,1,0,0,0)
				Talk(1,"","��ϲ��! �����ɹ�! ��ȥ������һ�����������������Ӱɣ������ɹ��˾����յ����͵�����������")
				Msg2Player("��õ���һ��"..seed_name[4].."����")
				WriteLog(date("%H%M%S").."���˺�"..GetAccount().."����ɫ"..GetName().."���õ�һ��ʥ���ƽ�����")
				AddGlobalNews(GetName().."��ʥ�����˴������*�ƽ�����*������Ԥף�������������ƽ�ʥ�������õ��ƽ�װ����")
			else
				Talk(1,""," Ŷ������ʧ�ܣ�����Ŭ����!")
			end
		else
			Talk(1,"","�Բ�������ϸ��鿴������Ҫ6������������һ��ʥ�����Ӳ��ܽ��ࡣ")
		end
	else
		Talk(1,"","�Բ�������û�д���ѽ�����ȥȡ�ɡ�")
	end
			

end


function do_sow_seed(nsel)

	nsel1 = nsel
	nsel = nsel * 6
	local on_pay = 2000
	if ( nsel1 == 0 ) then
		on_pay = 3000
	elseif ( nsel1 == 1 ) then
		on_pay = 10000
	else
		on_pay = 100000
	end
	seed_sow[1] = CalcEquiproomItemCount(4,nsel + 468,1,1)
	seed_sow[2] = CalcEquiproomItemCount(4,nsel + 469,1,1)
	seed_sow[3] = CalcEquiproomItemCount(4,nsel + 470,1,1)
	seed_sow[4] = CalcEquiproomItemCount(4,nsel + 471,1,1)
	seed_sow[5] = CalcEquiproomItemCount(4,nsel + 472,1,1)
	seed_sow[6] = CalcEquiproomItemCount(4,nsel + 473,1,1)
	nTotal = seed_sow[1] + seed_sow[2] + seed_sow[3] + seed_sow[4] + seed_sow[5] + seed_sow[6]
	if ( GetCash() >= on_pay ) then
		if ( nTotal >= 6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			Pay ( on_pay )
			nTimes = 6
			for s = 1, 6 do
				if ( seed_sow[s] >= nTimes ) then
						ConsumeEquiproomItem(nTimes,4,nsel + 467 + s,1,1)
					break
				else
					nTimes = nTimes - seed_sow[s]
						ConsumeEquiproomItem(seed_sow[s],4,nsel + 467 + s,1,1)
				end
			end
			ConsumeEquiproomItem(1,4,487,1,1)
			AddItem(6,1,nsel1 + 142,1,0,0,0)
			Talk(1,"","��ϲ��! ����ɹ�! ��ȥ������һ�����������������Ӱɣ������ɹ��˾����յ����͵�������!!")
			Msg2Player("��õ���һ��"..seed_name[nsel1 + 1].."����")
		else
			Talk(1,"","�Բ�������ϸ��鿴������Ҫ6��"..crystal_name[nsel1 + 1].."������һ��ʥ�����Ӳ��ܽ��ࡣ")
		end
	else
		Talk(1,"","�Բ�����������ѽ�����ȥȡ�ɡ�")
	end

end





------------------------�������ӽ���-------------------------


function no()

	Talk(1,"","лл�㻹�ǵ��ң�ף����տ��֣�")

end