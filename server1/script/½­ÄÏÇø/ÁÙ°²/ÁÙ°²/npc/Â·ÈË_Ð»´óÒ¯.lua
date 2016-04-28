-- ÁÙ°²¡¡Â·ÈË¡¡Ð»´óÒ¯
-- by£ºDan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(192) == 1 then
		allbrother_0801_FindNpcTaskDialog(192)
		return 0;
	end
	Talk(1,"","T¹ ®¹i gia  ta kia ©u phôc thËt kh«ng cã lêi nãi , so víi m×nh ®Ých h«n khuª n÷ cßn ph¶i h«n , ngµy h«m qua ta ®¶ th­¬ng phong , cã chót nãng rÇn lªn , c¸i nµy kh«ng , nµng liÒn mua cho ta thuèc ®i . ")
end;
