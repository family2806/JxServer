-- ´óÀí¡¡Â·ÈË¡¡µ¶Á«Ó¢
-- by£ºDan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(187) == 1 then
		allbrother_0801_FindNpcTaskDialog(187)
		return 0;
	end
	Talk(3,"","Trong nhµ ®ang cã kh¸ch, ta ®i mua vµi con c¸ NhÜ H¶i t­¬i sèng vÒ lµm mét mãn c¸ §¹i lı.","§óng råi! Mua thªm mét İt nguyªn liÖu nh­ nÊm h­¬ng, ngäc lan phiÕn, méc nhÜ, t«m kim c©u.")
end;
