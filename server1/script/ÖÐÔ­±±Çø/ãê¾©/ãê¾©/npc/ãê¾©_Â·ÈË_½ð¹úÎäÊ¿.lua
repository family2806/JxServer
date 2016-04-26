-- 汴京 路人NPC 武士（少林入门任务）
-- by：Dan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(218) == 0)) then		--入门任务进行中
		Say("少林？身在金国，还有心思想少林? ",2,"坚持 /enroll_S3_step2","继续思考/enroll_S3_wrong")
	else
		Talk(1,"","只有坚持不懈的人才能实现自己的理想.")
	end
end;

function enroll_S3_step2()
	Talk(1,"enroll_S3_step3","好小子，敢倔强 ?")
	Msg2Player("痛打你一顿")
end;

function enroll_S3_step3()
	Say("我再给你一个机会，说，你杀了少林的人了吗?",2,"依然坚持 /enroll_S3_correct","继续思考 /enroll_S3_wrong")
end;

function enroll_S3_correct()
	Talk(1,"","很好。只有坚持不懈的人才能实现自己的理想. ")
	AddEventItem(218)
	Msg2Player("获得坚晶石")
	AddNote("证明你的坚决，获得坚晶石")
end;

function enroll_S3_wrong()
	Talk(1,"","这个愚蠢的家伙，不要侮辱了 坚韧不拔 四个字")
end;
