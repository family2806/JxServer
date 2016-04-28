--Î÷±±ÄÏÇø ·ïÏè¸® Ò©µêÀÏ°å¶Ô»°
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- Á¶ÖÆ»ìÔªÁéÂ¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("Thuèc cña bæn tiÖm toµn lµ thø th­îng h¹ng, cã bÖnh trŞ bÖnh, kh«ng bÖnh c­êng th©n, cã muèn mua mét İt kh«ng? ",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(12) 		--µ¯³ö½»Ò×¿ò
end;

if TEACHERSWITCH then
	tinsert(OPTIONS, "Gióp ta cÊt d­îc töu/brew")
end
tinsert(OPTIONS, "Giao dŞch/yes")
tinsert(OPTIONS, "Ta muèn chÕ t¹o Hçn Nguyªn Linh Lé/refine")
tinsert(OPTIONS, "Kh«ng giao dŞch/Cancel")
