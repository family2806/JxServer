Include([[\script\event\springfestival07\item\libcracker.lua]]);

function main_entrance()
	if (sf07_isactive() == 0) then
		Say("Trong thêi gian ho¹t ®éng (02/02/2007 ®Õn 06/03/2007), ta sÏ gióp mäi ng­êi lµm ph¸o.", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ChØ cã ng­êi ch¬i n¹p thÎ trªn cÊp 50<color> míi cã thÓ tham gia ho¹t ®éng TÕt Nguyªn §¸n", 0);
		return
	end;
	Say("Ta sÏ gióp mäi ng­êi lµm ph¸o ®Ó ®ãn n¨m míi rén r·. Quý kh¸ch muèn lµm lo¹i ph¸o nµo?", 7,
	"Ta muèn lµm Ph¸o trung/#confirm_make(1)",
	"Ta muèn lµm Ph¸o ®¹i/#confirm_make(3)",
	"Ta muèn lµm phong ph¸o tiÓu/#confirm_make(2)",
	"Ta muèn lµm phong ph¸o trung/#confirm_make(4)",
	"Ta muèn lµm phong ph¸o ®¹i/#confirm_make(5)",
	"Ta muèn t×m hiÓu ho¹t ®éng §èt ph¸o giao thõa/detail",
	"Ta sÏ quay l¹i sau!/no"
	);
end;

function detail()
	Describe("Trong thêi gian ho¹t ®éng, ng­êi ch¬i luyÖn c«ng cã thÓ ngÉu nhiªn nhËn ®­îc Bao l× x×, bªn trong chøa c¸c lo¹i ph¸o. Ta cã thÓ gióp mäi ng­êi lµm bÊt cø lo¹i ph¸o nµo. Nh­ng còng cã lóc thÊt b¹i! Hi! Hi! NÕu thµnh c«ng sÏ thµnh Phong ph¸o ®Æc biÖt. NÕu thÊt b¹i sÏ mÊt ®i Phong ph¸o th­êng. Chñng lo¹i ph¸o kh¸c nhau hiÖu qu¶ còng kh¸c nhau.");
end;

tab_Content = {
	{"Ph¸o trung", "3 viªn ph¸o tiÓu", 50, {1352, "Ph¸o trung"}, {1, 1351, "Ph¸o tiÓu"}, "Èç¹ûÖÆ×÷Ê§°Ü,Äã½«ËðÊ§1¿ÅPh¸o tiÓu"},
	{"Phong ph¸o tiÓu", "10¿ÅPh¸o tiÓu, 2¿ÅPh¸o trungºÍ1000Á½.", 20, {1354, "phong ph¸o tiÓu ®Æc biÖt"}, {0, 1357, "phong ph¸o tiÓu th­êng"}, "Èç¹ûÖÆ×÷Ê§°Ü,Äã½«µÃµ½1phong ph¸o tiÓu th­êng. Èç¹û³É¹¦ÁË, ½«µÃµ½1phong ph¸o tiÓu ®Æc biÖt"},
	{"Ph¸o ®¹i", "3¿ÅPh¸o trung", 50, {1353, "Ph¸o ®¹i"}, {1, 1352, "Ph¸o trung"}, "Èç¹ûÖÆ×÷Ê§°Ü,Äã½«Ê§È¥1¿ÅPh¸o trung"},
	{"Phong ph¸o trung", "10¿ÅPh¸o trung, 2¿ÅPh¸o ®¹iºÍ3000Á½.", 20, {1355, "Phong ph¸o trung ®Æc biÖt"}, {0, 1358, "Phong ph¸o trung th­êng"}, "Èç¹ûÖÆ×÷Ê§°Ü,Äã½«½«µÃµ½Phong ph¸o trung th­êng. Èç¹û³É¹¦ÁË, ½«µÃµ½Phong ph¸o trung ®Æc biÖt"},
	{"Phong ph¸o ®¹i", "100 viªn ph¸o ®¹i vµ 5000 l­îng.", 15, {1356, "Phong ph¸o ®¹i ®Æc biÖt"}, {0, 1359, "ÆÕÍ¨Phong ph¸o ®¹i"}, "Èç¹ûÖÆ×÷Ê§°Ü,Äã½«µÃµ½ÆÕÍ¨Phong ph¸o ®¹i. Èç¹û³É¹¦ÁË, ½«µÃµ½Phong ph¸o ®¹i ®Æc biÖt"},
};
function confirm_make(nIndex)
	Say("Muèn chÕ t¹o 1 <color=yellow>"..tab_Content[nIndex][1].."<color> cÇn cã <color=yellow>"..tab_Content[nIndex][2].."<color>. Nh­ng ch­a ch¾c thµnh c«ng ®©u nhÐ! "..tab_Content[nIndex][6].."Lµm chø?", 2, "Ta muèn lµm /#make_crackers("..nIndex..")", "Ta ch­a s½n sµng!/no");
end;

tab_material = {
{1351, "Ph¸o tiÓu"},
{1352, "Ph¸o trung"},
{1353, "Ph¸o ®¹i"},
{-1, " l­îng"},
};
tab_Count = {
{3, 0, 0, 0},
{10, 2, 0, 1000},
{0, 3, 0, 0},
{0, 10, 2, 3000},
{0, 0, 100, 5000},
}
function make_crackers(nIndex)
	if (CalcFreeItemCellCount() < 2) then
		Say("Xin h·y s¾p xÕp l¹i hµnh trang tr­íc ®·!", 0);
		return 1;
	end;
	
	local nSucc = 1;
	for i = 1, 3 do
		if (CalcEquiproomItemCount(6,1,tab_material[i][1],-1) < tab_Count[nIndex][i]) then
			nSucc = 0;
			break;
		end;
	end;
	
	if (GetCash() < tab_Count[nIndex][4]) then
		nSucc = 0;
	end;
	
	if (nSucc == 0) then
		Say("Kh¸ch quan ch­a ®ñ vËt liÖu! Xin quay l¹i sau nhÐ!", 1, "å! Ta ®i chuÈn bÞ thªm!/no");
		return
	end;
	
	Pay(tab_Count[nIndex][4]);
	
	local nSeed = random(1, 100);
	local str;
	if (nSeed <= tab_Content[nIndex][3]) then	-- ³É¹¦ÁË
		delmaterial(nIndex);
		AddItem(6, 1, tab_Content[nIndex][4][1], 1,0,0,0);
		str = "Thµnh c«ng råi! §©y lµ <color=yellow>"..tab_Content[nIndex][4][2].."<color>.";
		Say(str.." Xin nhËn lÊy!", 0);
		Msg2Player(str);
	else
		if (tab_Content[nIndex][5][1] == 1) then
			ConsumeEquiproomItem(1, 6, 1, tab_Content[nIndex][5][2], -1);
			str = "Kh«ng may råi! Quý kh¸ch ®· mÊt 1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>.";
			Say(str, 0);
			Msg2Player(str);
		else
			delmaterial(nIndex);
			AddItem(6, 1, tab_Content[nIndex][5][2], 1,0,0,0);
			str = "Kh«ng may råi! LÇn nµy chØ nhËn ®­îc 1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>."
			Say(str.." Xin nhËn lÊy!", 0);
			Msg2Player(str);
		end;
	end;
end;


function delmaterial(nIndex)
	for i = 1, 3 do
		ConsumeEquiproomItem(tab_Count[nIndex][i],6,1,tab_material[i][1],-1);
	end;
end;
