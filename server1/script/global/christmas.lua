-- m�m m�ng ��������ʥ����
--renbin



seed_name	={
		" may m�n ",
		" hoa h�ng ",
		" th�y tinh ",
		" ho�ng kim "
		}

crystal_name	={
		" v� v�n ",
		" b�nh th��ng ",
		" v� h� ",
		" ho�n m� "
		}

seed_sow	={0,0,0,0,0,0}



function main()

	Say("�ng gi� n� en : gi�ng sinh vui v�  l�i t�i t�m ta mu�n l� v�t �i ? d� nhi�n , ta cho t�i b�y gi� s� kh�ng �� cho c�c ng��i th�t v�ng . b�t qu� , n�m nay ��ch l� v�t c� ch�t ��c bi�t nga , ch� c�n ng��i d�ng t�m t�i b�i , th� c� c� th� d�ng d�c ra xinh ��p c�y gi�ng sinh , ta l� v�t li�n gi�u � nh�ng th� n�y tr�n c�y . v�i v�ng �i thu t�p <color=red> b�ng tinh <color> c�ng <color=red> gi�ng sinh m�m m�ng <color> �i , h�nh ��ng ph�i nhanh nga ",4,"Ta mu�n �� luy�n b�ng tinh /upg_crystal","Ta mu�n t��i r�t gi�ng sinh m�m m�ng /sow_seed","Th�t t�t qu� , nhanh l�n n�i cho ta bi�t l�m g� nha /christ_help","A a , kh�ng c� sao , ta c� � t�i h�i h�u ng�i ��ch /no")

end


function christ_help()

	Say("�ng gi� n� en  ng��i c�n t�i tr��c d� ngo�i �i thu t�p m�t �t <color=red> b� tan t�nh b�ng tinh <color> c�ng <color=red> gi�ng sinh m�m m�ng <color> . ta c� th� gi�p ng��i <color=red> �� luy�n b�ng tinh <color> c�ng <color=red> t��i r�t m�m m�ng <color> . ",3," li�n quan t�i b�ng tinh ��ch ��o ���c c�ng �� luy�n /bingjing"," li�n quan t�i m�m m�ng ��ch ��o ���c c�ng t��i r�t /zhongzi","Ta �� bi�t , c�m �n /no")

end

function bingjing()
	Say("ʥ�����ˣ�������<color=red>�������<color>��<color=red> b�nh th��ng ����<color>��<color=red> v� h� ����<color>��<color=red> ho�n m� ����<color>���֡�����Ұ��ֻ�ܲɼ���<color=red>�������<color>�����ܰ����������������֡�",2,"B�ng tinh ��ch ��o ���c /bjcj","B�ng tinh ��ch �� luy�n /bjtl")

end


function bjcj()

	Talk(2,"","ʥ�����ˣ�<color=red> v� v�n ����<color>�ɼ��طֱ�Ϊ��\n<color=red>��<color>��������⡢�������⡢�㵴ɽ\n<color=red>��<color>���ɶ����⡢������⡢��ˮ��\n<color=red>��<color>���������⡢�������⡢����ɽ","<color=red> b�ch <color> D��ng Ch�u b�n ngo�i th�nh  ��o h��ng th�n b�n ngo�i  la ti�u s�n \n<color=red> xanh bi�c <color> bi�n kinh th�nh b�n ngo�i  Chu ti�n tr�n b�n ngo�i  ki�m c�c t�y nam \n<color=red> lam <color> th�nh ��i L� b�n ngo�i  th�ch c� ngo�i tr�n  ph�c l�u ��ng . ")
	
end

function bjtl()

	Talk(3,"","ʥ�����ˣ�����������˳��Ϊ��<color=red>�������<color>-><color=red> b�nh th��ng ����<color>-><color=red> v� h� ����<color>-><color=red> ho�n m� ����<color>��","Ng��i c�n chu�n b� <color=red> m�t b� ngang h�ng c�p ��ch 6 s�c b�ng tinh ( h�ng  ho�ng  lam  t�  xanh bi�c  b�ch )<color> , ta th� c� c� th� gi�p ng��i �� luy�n ra m�t vi�n ��ng c�p cao h�n ��ch b�ng tinh . ","B�ng tinh c�p b�c c�ng cao , t��i r�t ra ngo�i m�m m�ng th� c�ng c� c� ma l�c , b�i d�c ra ngo�i c�y gi�ng sinh li�n c� h�n phong ph� l� v�t . ")
	
end

function zhongzi()

	Say("ʥ�����ˣ� m�m m�ng ��<color=red>ʥ�� m�m m�ng <color>��<color=red>ʥ�� may m�n  m�m m�ng <color>��<color=red>ʥ�� hoa h�ng  m�m m�ng <color>��<color=red>ʥ�� th�y tinh  m�m m�ng <color>��<color=red>ʥ�� ho�ng kim  m�m m�ng <color>���֡�����Ұ��ֻ�ܲɼ���<color=red>ʥ�� m�m m�ng <color>�����ܰ��㽽����������֡�",2,"M�m m�ng ��ch ��o ���c /zzcj","M�m m�ng ��ch t��i r�t /zzjg")

end

function zzjg()

	Talk(3,"","�ng gi� n� en  b�n lo�i <color=red> b�ng tinh <color> t��i r�t <color=red> gi�ng sinh m�m m�ng <color> , l� c� th� l�y ���c c� th� ph�t tri�n th�nh c�y gi�ng sinh ��ch b�n lo�i m�m m�ng . "," m�m m�ng �Ľ��෽ʽΪ��\n\n<color=red>����6�� v� v�n ����<color>��<color=red>ʥ�� m�m m�ng <color>��<color=red>ʥ�� may m�n  m�m m�ng <color>\n<color=red>����6�� b�nh th��ng ����<color>��<color=red>ʥ�� m�m m�ng <color>��<color=red>ʥ�� hoa h�ng  m�m m�ng <color>","\n\n<color=red>����6�� v� h� ����<color>��<color=red>ʥ�� m�m m�ng <color>��<color=red>ʥ�� th�y tinh  m�m m�ng <color>\n<color=red>����6�� ho�n m� ����<color>��<color=red>ʥ�� m�m m�ng <color>��<color=red>ʥ�� ho�ng kim  m�m m�ng <color>��")

end

function zzcj()

	Talk(1,"","�ng gi� n� en <color=red> gi�ng sinh m�m m�ng <color> ��ch ��o ���c ��a ph��ng c�  tr��c khi an b�n ngo�i th�nh  nam nh�c ngo�i tr�n  long tuy�n th�n b�n ngo�i  th�p ��i m�n ph�i ph� c�n  Hoa S�n  hoa ��o nguy�n . ")
	
end


-----------------------��������-----------------------

function upg_crystal()

	Say("�ng gi� n� en  mu�n �� luy�n c�i g� b�ng tinh ��y ? b�t qu� , xin ch� � , kh�ng ph�i l� m�i l�n c�ng s� th�nh c�ng nga , n�u nh� �� luy�n th�t b�i , ta ch� c� th� tr� l�i cho ng��i <color=red> m�t nguy�n li�u <color> . ",2,"���� b�nh th��ng ����(2000��)/crystal_medi","Ta suy ngh� l�i m�t ch�t /no")

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
				Msg2Player("Ng��i l�y ���c m�t ��ɫ b�nh th��ng ����")
				Pay(on_pay)
			elseif ( i_medi < 2000 ) then
				AddEventItem(475)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ b�nh th��ng ����")
				Pay(on_pay)
			elseif ( i_medi < 3000 ) then
				AddEventItem(476)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ b�nh th��ng ����")
				Pay(on_pay)
			elseif ( i_medi < 4000 ) then
				AddEventItem(477)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ b�nh th��ng ����")
				Pay(on_pay)
			elseif ( i_medi < 5000 ) then
				AddEventItem(478)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ b�nh th��ng ����")
				Pay(on_pay)
			elseif ( i_medi < 6000 ) then
				AddEventItem(479)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ b�nh th��ng ����")
				Pay(on_pay)
			else
				Msg2Player("Th�t xin l�i , �� luy�n th�t b�i , hy v�ng l�n sau c� th� th�nh c�ng . ng�n v�n kh�ng mu�n bu�ng tha cho nga ")
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
			Talk(1,"","�Բ�������ϸ��鿴������Ҫһ��6����ɫ�� v� v�n ����Ŷ��")
		end
	else
		Talk(1,"","Th�t xin l�i , ng�n l��ng kh�ng �� nha , mau tr� v� l�y �i . ")
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
				Msg2Player("Ng��i l�y ���c m�t ��ɫ v� h� ����")
				Pay(on_pay)
			elseif ( i_high < 2000 ) then
				AddEventItem(481)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ v� h� ����")
				Pay(on_pay)
			elseif ( i_high < 3000 ) then
				AddEventItem(482)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ v� h� ����")
				Pay(on_pay)
			elseif ( i_high < 4000 ) then
				AddEventItem(483)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ v� h� ����")
				Pay(on_pay)
			elseif ( i_high < 5000 ) then
				AddEventItem(484)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ v� h� ����")
				Pay(on_pay)
			elseif ( i_high < 6000 ) then
				AddEventItem(485)
				Msg2Player("Ng��i l�y ���c m�t ��ɫ v� h� ����")
				Pay(on_pay)
			else
				Msg2Player("Th�t xin l�i , �� luy�n th�t b�i , hy v�ng l�n sau c� th� th�nh c�ng . ng�n v�n kh�ng mu�n bu�ng tha cho nga ")
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
			Talk(1,"","�Բ�������ϸ��鿴������Ҫһ��6����ɫ�� b�nh th��ng ����Ŷ��")
		end
	else
		Talk(1,"","Th�t xin l�i , ng�n l��ng kh�ng �� nha , mau tr� v� l�y �i . ")
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
				WriteLog(date("%H%M%S").." tr��ng m�c "..GetAccount().." , vai tr� "..GetName().."���õ�һ�� ho�n m� ������")
				Msg2Player("��ϲNg��i l�y ���c m�t  ho�n m� �������Ͽ��������� ho�ng kim  m�m m�ng �ɣ�")
			else
				Msg2Player("Th�t xin l�i , �� luy�n th�t b�i , hy v�ng l�n sau c� th� th�nh c�ng . ng�n v�n kh�ng mu�n bu�ng tha cho nga ")
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
			Talk(1,"","�Բ�������ϸ��鿴������Ҫһ��6����ɫ�� v� h� ����Ŷ��")
		end
	else
		Talk(1,"","Th�t xin l�i , ng�n l��ng kh�ng �� nha , mau tr� v� l�y �i . ")
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
				Say("ʥ�����ˣ��㻹��������� b�nh th��ng ������",2,"T�t /crystal_medi","��i l�t n�a r�i h�y n�i /no")
			elseif ( i_item == 474 )	then
				Say("ʥ�����ˣ��㻹��������� v� h� ������",2,"T�t /crystal_high","��i l�t n�a r�i h�y n�i /no")
			else
				Say("ʥ�����ˣ��㻹��������� ho�n m� ������",2,"T�t /crystal_perfect","��i l�t n�a r�i h�y n�i /no")
			end
		end
	end
end




-----------------------������������-----------------------


------------------------���� m�m m�ng -------------------------

function sow_seed()

	Say("Ng��i mu�n t��i r�t lo�i n�o m�m m�ng ? ch� c�n ng��i mang �� r�i ��y �� nguy�n li�u c�ng ph� d�ng , li�n nh�t ��nh c� th� t��i r�t th�nh c�ng . ",3,"����ʥ�� may m�n  m�m m�ng (3000��)/do_sow_seed","����ʥ�� hoa h�ng  m�m m�ng (1����)/do_sow_seed","Ta suy ngh� m�t ch�t �i /no")

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
				Talk(1,"","Ch�c m�ng ng��i ! �� luy�n th�nh c�ng ! nhanh �i c�ng b�ng h�u c�ng nhau b�i d�c c�i n�y hi�m qu� ��ch m�m m�ng �i  b�i d��ng th�nh c�ng l� c� th� nh�n ���c ta t�ng l� v�t n�a/r�i ")
				Msg2Player("Ng��i l�y ���c m�t "..seed_name[4].." m�m m�ng ")
				WriteLog(date("%H%M%S").." tr��ng m�c "..GetAccount().." , vai tr� "..GetName().."���õ�һ��ʥ�� ho�ng kim  m�m m�ng ")
				AddGlobalNews(GetName().."��ʥ�����˴������* ho�ng kim  m�m m�ng *������Ԥף������������ ho�ng kim ʥ�������õ� ho�ng kim װ����")
			else
				Talk(1,"","Nga , �� luy�n th�t b�i , ti�p t�c c� g�ng a !")
			end
		else
			Talk(1,"","�Բ�������ϸ��鿴������Ҫ6�� ho�n m� ������һ��ʥ�� m�m m�ng ���ܽ��ࡣ")
		end
	else
		Talk(1,"","Th�t xin l�i , ng�n l��ng kh�ng c� mang �� nha , mau tr� v� l�y �i . ")
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
			Talk(1,"","��ϲ��! ����ɹ�! ��ȥ������һ�������������� m�m m�ng �ɣ������ɹ��˾����յ����͵�������!!")
			Msg2Player("Ng��i l�y ���c m�t "..seed_name[nsel1 + 1].." m�m m�ng ")
		else
			Talk(1,"","�Բ�������ϸ��鿴������Ҫ6��"..crystal_name[nsel1 + 1].."������һ��ʥ�� m�m m�ng ���ܽ��ࡣ")
		end
	else
		Talk(1,"","Th�t xin l�i , ng�n l��ng kh�ng �� nha , mau tr� v� l�y �i . ")
	end

end





------------------------���� m�m m�ng ����-------------------------


function no()

	Talk(1,"","C�m �n ng��i c�n nh� r� ta , ch�c ng��i ng�y l� vui v� ")

end