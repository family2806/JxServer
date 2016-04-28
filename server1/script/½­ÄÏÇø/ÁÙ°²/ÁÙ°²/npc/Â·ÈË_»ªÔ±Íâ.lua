-- ÁÙ°²¡¡Â·ÈË¡¡»ªÔ±Íâ
-- by£ºDan_Deng(2003-09-16)
-- edit by Ğ¡ÀË¶à¶à
Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,1)
		Describe("Hoa viªn ngo¹i: Trung thu ®· ®Õn, chØ cÇn thu thËp ®ñ 6 <color=red>m¶nh tranh V©n Du<color> ®Ó hîp thµnh 1 bøc tranh hoµn chØnh mang ®Õn cho ta, ta sÏ tÆng l¹i ®¹i hiÖp 1 b¸nh <color=red>Cèng NguyÖt Phï Dung<color>.",2,"§æi b¸nh Cèng NguyÖt Phï Dung/makeItemUI","Nh©n tiÖn ghĞ qua th«i/NoChoice")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Hoa viªn ngo¹i  ta tuy kh«ng ph¶i lµ ng­êi trong quan tr­êng , nh­ng lµ trong triÒu ®¹i viªn còng cïng ta qu¸ møc thôc , chØ cÇn cã b¹c , cßn sî kh«ng lµm ®­îc chuyÖn ? ")
		else
			Talk(1,"","Hoa viªn ngo¹i  ng­êi ng­êi còng muèn lµm quan , ph¶i biÕt sÜ ®å gian hiÓm , kia cïng ®­îc víi ta nh­ vËy tiªu dao tù t¹i ")
		end
	end
end;
