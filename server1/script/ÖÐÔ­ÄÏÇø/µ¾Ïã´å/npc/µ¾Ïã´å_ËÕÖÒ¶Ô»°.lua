--description: 新手村_苏忠
--author: wangzg	
--date: 2003/7/22
-- Update: Dan_Deng(2003-08-11)

function main()
	UTask_world43=GetTask(71)
	if (UTask_world43==1) then
		Talk(3, "select", "兄弟是苏忠？你母亲正担心你!", "我不想母亲担心，但是我决定从军了!", "为什么?")
	elseif (UTask_world43==2) then
		Talk(1,"","谢谢指点! ")
	elseif (UTask_world43==3) then
		Talk(1,"","那麻烦你劝我母亲! ")
	else	
		Talk(1,"","父亲死于金人之手，这个仇我不能忘! ")
	end
end;

function select()
Say("现在国家有难，我怎么能只读书?",2,"劝告 /against","赞成 /support")
end

function against()
	Talk(4,"","但是你还年轻，君子报仇十年不晚，多学点本领，日后才能杀敌! ", ".....你说的也有道理","你知道就好，快回去看母亲吧，她很想你!", "好的，谢谢!")
	SetTask(71,2)
	AddNote("劝苏忠成功. ")
	Msg2Player("劝苏忠成功. ")
end

function support()
	Talk(3,"","说的很好，你虽然年轻，但是志气大.","我想入伍，但是担心母亲不给去.","你放心，我帮你劝她了")
	SetTask(71,3)		
	AddNote("支持苏忠的决定，帮助他劝母亲")
	MsgPlayer("支持苏忠的决定，帮助他劝苏大妈")
end
