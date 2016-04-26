-- 临安　路人　谢大爷
-- by：Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(192) == 1 then
		allbrother_0801_FindNpcTaskDialog(192)
		return 0;
	end
	Talk(1,"","谢大爷：我那西服真没话说，比自己的亲闺女还要亲，昨天我伤了风，有点发烧，这不，她就给我买药去了。")
end;
