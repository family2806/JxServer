tab_dw_material = 
{
	head = {"龙头", {6,1,428},},
	tail = {"龙尾",{6,1,431}},
	body = {"龙身",{6,1,429}},
	bone = {"龙骨",{6,1,430}},
	oar = 	{"桨",{6,1,432}},
	helm = {"方向盘", {6,1,433}},
	drum = {"鼓",{6,1,434}},
	smallboat = { "小龙舟 ", {6,1,422}, {{"head",1},{ "tail", 1}, {"body",1}, {"bone",1}, {"oar",4}, {"helm",1}, {"drum",1}}  , 100 , "做小龙舟需要1个龙头, 1 龙尾, 1 龙身, 4 桨, 1 个方向盘，1个鼓." , "dw_convert_sb" },
	boat = {"传统龙舟", {6,1,423}, { {"smallboat",1}, {"oar",4}}   ,50 ,   "做传统龙舟需要1 小龙舟和4 桨", "dw_convert_nb" },
	horseboat = { "马头龙舟", {6,1,424}, {{"smallboat",1}, {"boat",1}, {"head", 1}   }       , 40 ,"做马头龙舟需要1 小龙舟 1 传统龙舟 和1 龙头" , "dw_convert_hb"  },
	birdboat = {"鸟头龙舟", {6,1,425}, {{"horseboat",1}, {"boat",1} , {"head",1} }, 30       ,  "做鸟头龙舟需要1 马头龙舟,  1 传统龙舟 和1 龙头"  , "dw_convert_bb"     },
	beastboat = {"兽形龙舟 ", {6,1,426}, {{"birdboat",1}, {"horseboat",1}, {"head",1} }, 20    ,"做兽形龙舟c莕 1 鸟头龙舟, 1 马头龙舟 和1 龙头"  ,"dw_convert_stb"   },
	hugeboat = {"大龙舟", {6,1,427}, { {"beastboat",1}, {"birdboat",1}, {"horseboat",1}  } ,20  ,"做大龙舟 l需要1 兽形龙舟 1 鸟头龙舟 和1 马头龙舟"  ,"dw_convert_hgb"            },
}

function printinfo(something)
	print("需要制造"..tab_dw_material[something][1]..":")
	for i = 1, getn(tab_dw_material[something][3]) do 
		print(tab_dw_material[something][3][i][2].."个"..tab_dw_material[tab_dw_material[something][3][i][1]][1])
	end
	print("合成比例 "..tab_dw_material[something][4])

end

function duanwu_convert()
	Say("制造各种龙舟只需 <color=red>10000 两<color>, 如果失败，全部都会失去! 你确定制造吗 ", 7,"小龙舟/#dw_convert_first('smallboat')","传统龙舟/#dw_convert_first('boat')","马头龙舟/#dw_convert_first('horseboat')","鸟头龙舟/#dw_convert_first('birdboat')", "兽头龙舟 /#dw_convert_first('beastboat')","大龙舟/#dw_convert_first('hugeboat')","不需要!/OnCancel")
end

function dw_convert_first(item)
	if (GetCash() < 10000) then
		Say(" 制造各种龙舟只需 <color=red>10000 两<color>, 你的钱不够.",0)
		return
	end
	GiveItemUI("合成龙舟",tab_dw_material[item][5], tab_dw_material[item][6])
end

function dw_convert(itemname , count)
	if(count == 0) then
		Talk(1,"","<#> 礼官笑道：有什么给我吗？ '","你挠挠头：死了，我忘记了! '")
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
		Say(" 你需要合成的原料数量与实际数量不符，你是不是弄错了?", 2, " 让我再合成一次/duanwu_convert", "对不起! 我错了! 我再看一下 /OnCancel")
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
					Say(" 你放入的原料不对，请检查!",0)
					return
				end
				break
			end
		end
		if (bValid == 0) then
			Say(" 你放入的原料不对，请检查!", 0)
			return
		end
	end
	
	if (Pay(10000) == 0) then
		Say(" 制造各种龙舟只需 <color=red>10000 两<color>, 你的钱不够.",0)
		return
	end
	for i=1,count do
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	
	ran = random(1,100)
	if (ran <= tab_dw_material[itemname][4]) then
		AddItem(tab_dw_material[itemname][2][1], tab_dw_material[itemname][2][2], tab_dw_material[itemname][2][3],1,1,1 )
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 做th祅h 1"..tab_dw_material[itemname][1]);
		Say(" 恭喜你, "..tab_dw_material[itemname][1].." 已制造成功!",0)
	else
		Say(" 很对不起! 老夫还未熟悉制造工艺，制作失败了!",0)
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