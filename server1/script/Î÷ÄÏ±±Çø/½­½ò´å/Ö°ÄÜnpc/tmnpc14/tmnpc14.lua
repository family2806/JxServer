--description: 唐门江津村唐元舅舅 50级任务 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+40) then
		Talk(1,""," 咳咳咳，咳咳咳……我这个外甥真贴心啊，我一病，他立刻就来看我了!")
	else
		Talk(1,"","我无儿无女，只有一个外甥，在唐门学艺")
	end
end;
