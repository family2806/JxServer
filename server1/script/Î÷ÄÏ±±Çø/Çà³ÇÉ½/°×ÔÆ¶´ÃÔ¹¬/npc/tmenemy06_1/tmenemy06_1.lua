--description: 唐门30级任务 青城山白云洞绑匪
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+20) then 
		Talk(1,"","哼！就算打败了我，你也别想轻易得到《火器谱》。老实告诉你，《火器谱》就在那个宝箱里，开宝箱的钥匙你有本事就在洞里慢慢找吧!")
		SetTask(2, 30*256+30)
		AddNote("打败头目狂沙，知道火器谱放在宝箱里! ")
		Msg2Player("打败头目狂沙，知道火器谱放在宝箱里! ")
	end
end;	
