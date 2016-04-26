-- 天龙寺痴僧对话脚本

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_chiseng()
	else
		Talk(1,"","最近几年，其他地方来的弟子越来越少，方丈不担心寺中的事，只静修。弟子个个都慌忙，目前已经下山招募新的弟子。施主等一段时间后再来吧!");
	end
end
