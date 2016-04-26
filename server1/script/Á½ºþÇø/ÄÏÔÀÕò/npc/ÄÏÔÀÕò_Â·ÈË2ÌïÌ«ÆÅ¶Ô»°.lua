--两湖区 南岳镇 路人2田太婆对话
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(201) == 1 then
		allbrother_0801_FindNpcTaskDialog(201)
		return 0;
	end
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","咳咳咳，我肯定不行了，不知道怎么总是感到头疼。咳咳，不知道这个病怎么办了，你赶快离开!")	 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","听说有一位不知从哪座寺庙来的师太法力无边，你去问问看.")
		return
	end

Say("田太婆：我的儿子如果还活着，也差不多有你这么大了。可怜他十五岁的时候得病死了，剩下我一个孤老婆子。",0)

end;

