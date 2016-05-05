--ÖĞÔ­±±Çø ãê¾©¸® ÔÓ»õµêÀÏ°å¶Ô»°
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
Say("ÔÓ»õµêÀÏ°å£ºÄúÒªµãÊ²Ã´£¿Èç½ñÕâÊÀµÀ´ó¼Ò¶¼¹ıµÄ²»ÈİÒ×£¬ËùÒÔÎÒÕâµêÀïµÄ¶«Î÷¶¼²»¹ó£¬Äã¿´¿´ĞèÒªĞ©Ê²Ã´£¿", 2, "Giao dŞch/yes", "Ta sÏ quay l¹i sau/no");

end;


function yes()
Sale(8);  			--µ¯³ö½»Ò×¿ò
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;


