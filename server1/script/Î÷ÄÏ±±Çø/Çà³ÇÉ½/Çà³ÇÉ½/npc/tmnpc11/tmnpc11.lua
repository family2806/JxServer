--description: 唐门耿子奇 40级任务 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(7) == 1 then
		allbrother_0801_FindNpcTaskDialog(7)
		return 0;
	end
	UTask_tm = GetTask(2)
	if (UTask_tm == 40*256+20) then
		if (GetTaskTemp(4) == 31) then  --已经打败五只宠物
			Talk(7, "L40_step42", "晚辈唐门弟子，见过耿子奇大侠! ", "唐野是你什么人?", "是晚辈师叔.", "哼！他是没脸来见我，还是不敢来见我？派你这个小辈来做什么?", "前辈误会了，当年师叔不是见死不救，而是因为本门立有门规，不得为外人治病，所以他实在情非得已，这些年他也一直十分愧疚!", "这些缘由他为什么不亲自来向我解释?", "前辈对师叔误会甚深，恐怕一见面还等不及开口，就?")
		else
			Talk(1,"","不管你是谁，有什么事先打败了我的<color=Red>五只家畜——灰狼、猛虎、金钱豹、野猪、棕熊<color>再说!")
--			AddNote("在青城山西部找到耿子奇，需要先打败他的五只家畜才会被耿子奇理会。")
		end
	elseif (UTask_tm == 40*256+60) then
		if (HaveItem(43) == 1) and (HaveItem(44) == 1) and (HaveItem(45) == 1) and (HaveItem(46) == 1) and (HaveItem(47) == 1) then		--已经得到五种药材
			Talk(2, "", "前辈，这五种就是治疗怪病的药材，师叔说只要吃三次就可以痊愈了!", " 太好了！我女儿有救了！谢谢你！谢谢你！多谢谢你师叔，是我误会了他!")
			DelItem(43)
			DelItem(44)
			DelItem(45)
			DelItem(46)
			DelItem(47)
			SetTask(2, 40*256+80)
			AddNote("交药方给耿子奇，成功化解他与唐野的恩怨")
			Msg2Player("找到5种药材给耿子奇，成功化解他与唐野的恩怨")
		else
			Talk(3, "", "你真的有办法救我女儿吗?", "唐野师叔已经告诉了我药方，我正在寻找治疗怪病所需的五种药材", "太谢谢你了。")
		end
	elseif (UTask_tm >= 40*256+40) and (UTask_tm < 40*256+80) then					--尚未完成40级任务
		Talk(1,"","你真的有办法救我女儿吗?")
	elseif (UTask_tm >= 40*256+80) and (UTask_tm < 70*256) then					--已经完成40级任务，尚未出师
		Talk(1,"","我误会了你师叔，真是羞愧!")
	else									--尚未完成40级任务（缺省对话）
		Talk(1,"","我毕生最大的恨事，就是我最好的朋友竟然是一个无情无义之辈!")
	end
end;

function L40_step42()
	SetTask(2, 40*256+40)
	AddNote("打败耿子奇的5种家畜，知道他女儿得了奇怪的病，想找唐野师叔寻求治病的药方")
	Talk(4,"","其实我就是杀了他又有什么用？我妻子再也活不过来了，本来我已了无生趣，只是为了年幼的女儿才苟活至今，想不到连我唯一的女儿也得上了同样的怪病，如果连女儿也没有了，我、我活下去还有什么意思?", "前辈，你别着急，你女儿一定会有救的!", "能有什么办法？你师叔是天下第一的神医，他不能出手相救，还有谁能救得了我女儿!", "我自有办法，我这就去找师叔!")
end;
