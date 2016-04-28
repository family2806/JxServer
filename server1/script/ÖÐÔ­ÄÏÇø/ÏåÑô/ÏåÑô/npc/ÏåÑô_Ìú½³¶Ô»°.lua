--description: 中原南区 襄阳府 铁匠对话 武当派出师任务
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>............................................................................."

function main(sel)
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "Nay chi課 s?m苩 tr薾 kh萵 c蕄, quan binh qu﹏ gi韎 l筰 kh玭g , 玭g c?th?mau ch鉵g r蘮 m閠 l?binh kh?cho chi課 trng kh玭g?", "Kh玭g gi蕌 g?ngi, l骳 n祔 ta ng祔 m l祄 vi謈. Nh璶g v?s?lng qu?l韓, n猲 s?kho竛g th筩h trong kho  kh玭g  d飊g!<color=Red>T?Thi誸 Kho竛g, Lng Ng﹏ Kho竛g v?X輈h уng kho竛g<color>u  d飊g h誸. Ngi c?th?n <color=Red>ph輆 T﹜ Nam<color> gi髉 ta t譵 kho竛g th筩h kh玭g?")
			SetTask(17, SetByte(GetTask(17),2,5))
			AddNote("Th?r蘮 (193,201) cho bi誸: mu鑞 ch?t筼 binh kh?c莕 c?3 lo筰 kho竛g th筩h l? X輈h уng Kho竛g, T?Thi誸 Kho竛g, Lng Ng﹏ Kho竛g, c?th?t譵 th蕐 ch髇g ?b猲 ngo礽  r鮪g hng T﹜ Nam  c馻 Tng Dng.")
		elseif (UTask_wd60sub == 5) then 
			if ( HaveItem(138) == 1 and HaveItem(118) == 1 and HaveItem(121) == 1) then
				Talk(2, "", "Ta  t譵 頲 kho竛g th筩h, hy v鋘g nh鱪g kho竛g th筩h n祔 c?th?t筼 ra nh鱪g binh kh?t鑤 nh蕋, gi髉 c竎 binh s?ch鑞g Kim binh", "M鋓 ngi ch?cao nh?n骾, nh蕋 nh s?畊鎖 頲 l?ngo筰 x﹎!")
				DelItem(138)
				DelItem(118)
				DelItem(121)
				SetTask(17, SetByte(GetTask(17),2,8))
				AddNote("T譵  3 lo筰 kho竛g th筩h giao cho th?r蘮 gi秈 quy誸 頲 v蕁  kh玭g  binh kh?ch鑞g Kim.")
				Msg2Player("T譵  3 lo筰 kho竛g th筩h giao cho th?r蘮 gi秈 quy誸 頲 v蕁  kh玭g  binh kh?ch鑞g Kim.")
			else
				tiejiang_city("Kh玭g c?kho竛g th筩h th?ta kh玭g c?c竎h n祇 t筼 v?kh?頲! Ngi c?th?n <color=Red>khu r鮪g ph輆 nam ngo礽 th祅h<color> l蕐 m閠 輙 <color=Red> T?Thi誸 Th筩h, Lng Ng﹏ Kho竛g v?X輈h уng Kho竛g<color>?")
			end
		else
			tiejiang_city()
		end		
	else
		tiejiang_city()
	end
end;

function yes()
	Sale(10);  			--弹出交易框
end;

