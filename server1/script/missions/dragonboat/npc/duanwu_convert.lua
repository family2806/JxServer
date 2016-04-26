tab_dw_material = 
{
	head = {"��ͷ", {6,1,428},},
	tail = {"��β",{6,1,431}},
	body = {"����",{6,1,429}},
	bone = {"����",{6,1,430}},
	oar = 	{"��",{6,1,432}},
	helm = {"������", {6,1,433}},
	drum = {"��",{6,1,434}},
	smallboat = { "С���� ", {6,1,422}, {{"head",1},{ "tail", 1}, {"body",1}, {"bone",1}, {"oar",4}, {"helm",1}, {"drum",1}}  , 100 , "��С������Ҫ1����ͷ, 1 ��β, 1 ����, 4 ��, 1 �������̣�1����." , "dw_convert_sb" },
	boat = {"��ͳ����", {6,1,423}, { {"smallboat",1}, {"oar",4}}   ,50 ,   "����ͳ������Ҫ1 С���ۺ�4 ��", "dw_convert_nb" },
	horseboat = { "��ͷ����", {6,1,424}, {{"smallboat",1}, {"boat",1}, {"head", 1}   }       , 40 ,"����ͷ������Ҫ1 С���� 1 ��ͳ���� ��1 ��ͷ" , "dw_convert_hb"  },
	birdboat = {"��ͷ����", {6,1,425}, {{"horseboat",1}, {"boat",1} , {"head",1} }, 30       ,  "����ͷ������Ҫ1 ��ͷ����,  1 ��ͳ���� ��1 ��ͷ"  , "dw_convert_bb"     },
	beastboat = {"�������� ", {6,1,426}, {{"birdboat",1}, {"horseboat",1}, {"head",1} }, 20    ,"����������c�n 1 ��ͷ����, 1 ��ͷ���� ��1 ��ͷ"  ,"dw_convert_stb"   },
	hugeboat = {"������", {6,1,427}, { {"beastboat",1}, {"birdboat",1}, {"horseboat",1}  } ,20  ,"�������� l��Ҫ1 �������� 1 ��ͷ���� ��1 ��ͷ����"  ,"dw_convert_hgb"            },
}

function printinfo(something)
	print("��Ҫ����"..tab_dw_material[something][1]..":")
	for i = 1, getn(tab_dw_material[something][3]) do 
		print(tab_dw_material[something][3][i][2].."��"..tab_dw_material[tab_dw_material[something][3][i][1]][1])
	end
	print("�ϳɱ��� "..tab_dw_material[something][4])

end

function duanwu_convert()
	Say("�����������ֻ�� <color=red>10000 ��<color>, ���ʧ�ܣ�ȫ������ʧȥ! ��ȷ�������� ", 7,"С����/#dw_convert_first('smallboat')","��ͳ����/#dw_convert_first('boat')","��ͷ����/#dw_convert_first('horseboat')","��ͷ����/#dw_convert_first('birdboat')", "��ͷ���� /#dw_convert_first('beastboat')","������/#dw_convert_first('hugeboat')","����Ҫ!/OnCancel")
end

function dw_convert_first(item)
	if (GetCash() < 10000) then
		Say(" �����������ֻ�� <color=red>10000 ��<color>, ���Ǯ������.",0)
		return
	end
	GiveItemUI("�ϳ�����",tab_dw_material[item][5], tab_dw_material[item][6])
end

function dw_convert(itemname , count)
	if(count == 0) then
		Talk(1,"","<#> ���Ц������ʲô������ '","������ͷ�����ˣ���������! '")
		return nil
	end
	local tab = {}
	local reqcount = 0
	for i = 1, getn(tab_dw_material[itemname][3]) do 
		tab[i] = {}
		tab[i][1] = tab_dw_material[itemname][3][i][1]
		tab[i][2] = tab_dw_material[itemname][3][i][2]
		reqcount = reqcount + tab[i][2]
	end
	
	if (reqcount ~= count) then
		Say(" ����Ҫ�ϳɵ�ԭ��������ʵ���������������ǲ���Ū����?", 2, " �����ٺϳ�һ��/duanwu_convert", "�Բ���! �Ҵ���! ���ٿ�һ�� /OnCancel")
		return
	end
	
	for i = 1, count do 
		local itemIdx = GetGiveItemUnit( i )
		local g,d,p = GetItemProp(itemIdx)
		
		local bValid = 0
		for j = 1, getn(tab) do 
			if (tab_dw_material[tab[j][1]][2][1] == g and tab_dw_material[tab[j][1]][2][2] == d and tab_dw_material[tab[j][1]][2][3] == p) then
				bValid = 1
				tab[j][2] = tab[j][2] - 1
				if (tab[j][2] < 0) then
					Say(" ������ԭ�ϲ��ԣ�����!",0)
					return
				end
				break
			end
		end
		if (bValid == 0) then
			Say(" ������ԭ�ϲ��ԣ�����!", 0)
			return
		end
	end
	
	if (Pay(10000) == 0) then
		Say(" �����������ֻ�� <color=red>10000 ��<color>, ���Ǯ������.",0)
		return
	end
	for i=1,count do
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	
	ran = random(1,100)
	if (ran <= tab_dw_material[itemname][4]) then
		AddItem(tab_dw_material[itemname][2][1], tab_dw_material[itemname][2][2], tab_dw_material[itemname][2][3],1,1,1 )
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ��th�nh 1"..tab_dw_material[itemname][1]);
		Say(" ��ϲ��, "..tab_dw_material[itemname][1].." ��������ɹ�!",0)
	else
		Say(" �ܶԲ���! �Ϸ�δ��Ϥ���칤�գ�����ʧ����!",0)
	end
end

--------------------------------------------------------------------------------------------------
function dw_convert_sb(count)
	dw_convert("smallboat", count)
end

function dw_convert_nb(count)
	dw_convert("boat", count)
end

function dw_convert_hb(count)
	dw_convert("horseboat", count)
end

function dw_convert_bb(count)
	dw_convert("birdboat", count)
end

function dw_convert_stb(count)
	dw_convert("beastboat", count)
end

function dw_convert_hgb(count)
	dw_convert("hugeboat", count)
end