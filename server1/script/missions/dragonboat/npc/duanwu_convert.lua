tab_dw_material = 
{
	head = {"Long §Çu", {6,1,428},},
	tail = {"§u«i Rång",{6,1,431}},
	body = {"Th©n Rång",{6,1,429}},
	bone = {"X­¬ng Rång",{6,1,430}},
	oar = 	{"M¸i chÌo",{6,1,432}},
	helm = {"B¸nh l¸i", {6,1,433}},
	drum = {"Trèng",{6,1,434}},
	smallboat = { "ThuyÒn Rång nhá ", {6,1,422}, {{"head",1},{ "tail", 1}, {"body",1}, {"bone",1}, {"oar",4}, {"helm",1}, {"drum",1}}  , 100 , "×öĞ¡ÁúÖÛĞèÒª1c¸iLong §Çu, 1 §u«i Rång, 1 Th©n Rång, 4 M¸i chÌo, 1 c¸iB¸nh l¸i£¬1c¸iTrèng." , "dw_convert_sb" },
	boat = {"ThuyÒn Rång truyÒn thèng", {6,1,423}, { {"smallboat",1}, {"oar",4}}   ,50 ,   "×öThuyÒn Rång truyÒn thèngĞèÒª1 Ğ¡ÁúÖÛºÍ4 M¸i chÌo", "dw_convert_nb" },
	horseboat = { "ThuyÒn Rång ®Çu ngùa", {6,1,424}, {{"smallboat",1}, {"boat",1}, {"head", 1}   }       , 40 ,"×öThuyÒn Rång ®Çu ngùaĞèÒª1 ThuyÒn Rång nhá 1 ThuyÒn Rång truyÒn thèng ºÍ1 Long §Çu" , "dw_convert_hb"  },
	birdboat = {"ThuyÒn Rång ®Çu Phông", {6,1,425}, {{"horseboat",1}, {"boat",1} , {"head",1} }, 30       ,  "×öThuyÒn Rång ®Çu PhôngĞèÒª1 ThuyÒn Rång ®Çu ngùa,  1 ThuyÒn Rång truyÒn thèng ºÍ1 Long §Çu"  , "dw_convert_bb"     },
	beastboat = {"ThuyÒn rång h×nh thó ", {6,1,426}, {{"birdboat",1}, {"horseboat",1}, {"head",1} }, 20    ,"×öÊŞĞÎÁúÖÛcÇn 1 ThuyÒn Rång ®Çu Phông, 1 ThuyÒn Rång ®Çu ngùa ºÍ1 Long §Çu"  ,"dw_convert_stb"   },
	hugeboat = {"ThuyÒn Rång to", {6,1,427}, { {"beastboat",1}, {"birdboat",1}, {"horseboat",1}  } ,20  ,"×öThuyÒn Rång to lĞèÒª1 ThuyÒn rång h×nh thó 1 ThuyÒn Rång ®Çu Phông ºÍ1 ThuyÒn Rång ®Çu ngùa"  ,"dw_convert_hgb"            },
}

function printinfo(something)
	print("ph¶i chÕ t¹o"..tab_dw_material[something][1]..":")
	for i = 1, getn(tab_dw_material[something][3]) do 
		print(tab_dw_material[something][3][i][2].."c¸i"..tab_dw_material[tab_dw_material[something][3][i][1]][1])
	end
	print("Tû lÖ ghĞp lµ "..tab_dw_material[something][4])

end

function duanwu_convert()
	Say("ChÕ t¹o c¸c lo¹i thuyÒn rång chØ cÇn <color=red>10000 l­îng<color>, nÕu thÊt b¹i toµn bé sÏ mÊt ®i! Ng­¬i x¸c ®Şnh chÕ t¹o chø?", 7,"ThuyÒn Rång nhá /#dw_convert_first('smallboat')","ThuyÒn Rång truyÒn thèng/#dw_convert_first('boat')","ThuyÒn Rång ®Çu ngùa/#dw_convert_first('horseboat')","ThuyÒn Rång ®Çu Phông/#dw_convert_first('birdboat')", "ThuyÒn Rång ®Çu thó /#dw_convert_first('beastboat')","ThuyÒn Rång to/#dw_convert_first('hugeboat')","Kh«ng cÇn!/OnCancel")
end

function dw_convert_first(item)
	if (GetCash() < 10000) then
		Say(" ChÕ t¹o c¸c lo¹i thuyÒn rång chØ cÇn <color=red>10000 l­îng<color>, TiÒn cña b¹n kh«ng ®ñ.",0)
		return
	end
	GiveItemUI("GhĞp thuyÒn Rång",tab_dw_material[item][5], tab_dw_material[item][6])
end

function dw_convert(itemname , count)
	if(count == 0) then
		Talk(1,"","<#> LÔ quan c­êi hİp m¾t: 'cã g× ®­a ta kh«ng? '","B¹n g·i g·i ®Çu: 'Th«i chÕt! Ta quªn mÊt råi! '")
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
		Say(" Sè l­îng vËt liÖu cÇn thiÕt cho mãn ®å b¹n cÇn ghĞp kh«ng phï hîp víi sè l­îng thùc tÕ, cã ph¶i b¹n lµm sai kh«ng?", 2, "å! §Ó ta ghĞp l¹i/duanwu_convert", "Xin lçi! Ta lµm sai råi! Ta xem l¹i chót nhĞ!/OnCancel")
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
					Say(" VËt liÖu b¹n dÆt vµo kh«ng ®óng, h·y kiÓm tra l¹i!",0)
					return
				end
				break
			end
		end
		if (bValid == 0) then
			Say(" VËt liÖu b¹n dÆt vµo kh«ng ®óng, h·y kiÓm tra l¹i!", 0)
			return
		end
	end
	
	if (Pay(10000) == 0) then
		Say(" ChÕ t¹o c¸c lo¹i thuyÒn rång chØ cÇn <color=red>10000 l­îng<color>, TiÒn cña b¹n kh«ng ®ñ.",0)
		return
	end
	for i=1,count do
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	
	ran = random(1,100)
	if (ran <= tab_dw_material[itemname][4]) then
		AddItem(tab_dw_material[itemname][2][1], tab_dw_material[itemname][2][2], tab_dw_material[itemname][2][3],1,1,1 )
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: t¹o thµnh 1"..tab_dw_material[itemname][1]);
		Say(" Chóc mõng b¹n, "..tab_dw_material[itemname][1].." ®· chÕ t¹o thµnh c«ng!",0)
	else
		Say(" RÊt xin lçi! L·o phu cßn ch­a thuÇn thôc c«ng nghÖ chÕ t¹o, t¹o thÊt b¹i råi!",0)
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