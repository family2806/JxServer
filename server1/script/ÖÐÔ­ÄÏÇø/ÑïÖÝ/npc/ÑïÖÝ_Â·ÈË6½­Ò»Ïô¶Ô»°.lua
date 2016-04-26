--中原南区 扬州府 路人6江一萧对话

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(194) == 1 then
		allbrother_0801_FindNpcTaskDialog(194)
		return 0;
	end
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_jiangyixiao()
	else
		i = random(0,1)

			if (i == 0) then
Say("江一萧：任何姑娘都比不上她，在我的眼中，在我的心里，只有她一个。可是晓真为什么总对我不理不睬呢？",0)
			return
			end;
			
			if (i == 1) then
Say("江一萧：我虽然穷，可是我对晓真是真心实意的。",0)
			end;
			
			
	end
end

