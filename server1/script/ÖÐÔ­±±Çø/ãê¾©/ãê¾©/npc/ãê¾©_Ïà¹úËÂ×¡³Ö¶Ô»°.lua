--中原北区 汴京府 相国寺住持对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	
	if allbrother_0801_CheckIsDialog(190) == 1 then
		allbrother_0801_FindNpcTaskDialog(190)
		return 0;
	end
Say("大渡禅师：方外之人，原本应该四大皆空，不论国事，可是眼看江山凋敝，生灵涂炭，世人苦难良多，教人怎不痛心疾首？", 0);
end;


