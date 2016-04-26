--description: 新手村_张大元
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan

function main()
	UTask_world44=GetTask(72)
	if (UTask_world44==2) then
		Talk(8,"","你是张大元么?","我是，有什么事情?","有位盈盈姑娘要我把这条鸳鸯帕给你，还要我传话，今晚三更，老地方，不见不散","什么！张大元！你居然和那个裁缝女勾搭上?"," 怎么会？我根本没和她说过话，娘子你要相信我.","但是....."," 喂，你可不要随便诬陷好人啊",".....?")
		SetTask(72,4)
		Msg2Player("不料因为一条丝帕被骂，回去见盈盈. ")
		AddNote("找到张大元，传话给他，不料他已有老婆，不能给他丝帕，还被骂了一场. ")		
	elseif (UTask_world44==4)  then
		Talk(1,"","不要诬告好人")
	else
		Talk(1,"","做人真是不容易，做男人更加不容易，做一个桃花男人更加的难.")
	end
end
