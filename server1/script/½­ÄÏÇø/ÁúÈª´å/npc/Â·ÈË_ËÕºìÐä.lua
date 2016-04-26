-- 龙泉村　路人　苏红袖
-- by：Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(203) == 1 then
		allbrother_0801_FindNpcTaskDialog(203)
		return 0;
	end
	Talk(1,"","我从小身体就不好，父亲请武师回来教我武功。现在我已经学会了武功，再也不怕被人害了。")
end;
