--中原南区 稻香村 茶店老板对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(204) == 1 then
		allbrother_0801_FindNpcTaskDialog(204)
		return 0;
	end

Say("喝茶让身体健康，客官想喝一杯吗?",0)

end;
