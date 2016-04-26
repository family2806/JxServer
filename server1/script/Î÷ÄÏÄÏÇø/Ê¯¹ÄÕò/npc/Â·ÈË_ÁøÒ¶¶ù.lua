--石鼓镇 路人 柳叶儿 新手任务送饭
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world22 = GetTask(22)
	if (UTask_world22 == 0) then		-- 任务启动
		if (GetSex() == 0) then
			Say("哥哥，我父亲正在村外教武功，你可以帮带饭给他吗? ",2,"帮她带饭. /W22_get_yes","没空，正忙. /W22_get_no")
		else
			Say("姐姐，我父亲正在村外教武功，你可以帮带饭给他吗? ",2,"帮她带饭. /W22_get_yes","没空，正忙. /W22_get_no")
		end
	elseif (UTask_world22 == 5) then
		if (HaveItem(233) == 0) then		-- 道具丢了
			AddEventItem(233)
			if (GetSex() == 0) then
				Talk(1,"","哥哥，你不要忘记带饭哦. ")
			else
				Talk(1,"","姐姐，你不要忘记带饭哦. ")
			end
		else
			if (GetSex() == 0) then
				Talk(1,"","哥哥，可以快点吗？饭都凉了. ")
			else
				Talk(1,"","姐姐，可以快点吗？饭都凉了. ")
			end
		end
	else				-- 非任务对话
		Talk(1,"","我母亲已经跟其他男人了，我由他收养，他的轻功也很好，他经常和村外人练功. ")
	end
end;

function W22_get_yes()
	SetTask(22,5)
	AddEventItem(233)
	AddNote("接任务：帮助柳叶儿带饭给村外的武师. ")
	Msg2Player("接任务：帮助柳叶儿带饭给村外的武师. ")
end

function W22_get_no()
end
