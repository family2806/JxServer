--description: 中原南区 襄阳府 药店老板对话 武当派出师任务
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "Hi謓 gi� chi課 trng b謓h d辌h k衞 d礽, xin h醝 c� c竎h n祇 hay kh玭g?", "Mu鑞 tr� ch鱝 b謓h d辌h c莕 5 lo筰 thu鑓: <color=Red> Л琻g Quy, H頿 Hoan, Huy襫 S﹎, Ph遪g K�, Chu Sa <color>.H穣 n <color=Red>Йng Ph鬰 Ng璾 s琻<color>  t譵!")
			SetTask(17, SetByte(GetTask(17),1,5))
			AddNote("Ch� dc 甶誱 (201,202) cho bi誸 c莕 5 lo筰 dc li謚: H頿 Hoan, Huy襫 S﹎, Л琻g Quy, Ph遪g K�, Chu Sa � ph輆 Йng Ph鬰 Ng璾 S琻  ch� thu鑓")
		elseif (UTask_wd60sub == 5) then
			if ( HaveItem(107) == 1 and HaveItem(134) == 1 and HaveItem(135) == 1 and HaveItem(136) == 1 and HaveItem(137) == 1) then
				Talk(2, "", "Ta  t譵  5 lo筰 dc ph萴, nh� 玭g b祇 ch� dc ho祅 a cho quan ph� chuy觧 n chi課 trng!", "Qu鑓 gia l﹎ nguy, l� con d﹏ ph秈 c� tr竎h nhi謒 v韎 t nc.Y猲 t﹎! Ta nh蕋 nh b祇 ch� ngay  k辮 chuy觧 ra ti襫 tuy課!")
				DelItem(107)
				DelItem(134)
				DelItem(135)
				DelItem(136)
				DelItem(137)
				SetTask(17, SetByte(GetTask(17),1,8))
				AddNote("T譵  5 lo筰 dc li謚 giao cho 玭g ch� dc 甶誱, ng╪ ch苙 頲 s� l﹜ lan c馻 d辌h b謓h.")
				Msg2Player("T譵  5 lo筰 dc li謚 giao cho 玭g ch� dc 甶誱, ng╪ ch苙 頲 s� l﹜ lan c馻 d辌h b謓h.")
			else
				Say("Mu鑞 tr� ch鱝 b謓h d辌h c莕 5 lo筰 thu鑓: <color=Red> Л琻g Quy, H頿 Hoan, Huy襫 S﹎, Ph遪g K�, Chu Sa <color>.H穣 n <color=Red>Йng Ph鬰 Ng璾 s琻<color>  t譵!",
					2,
					"Giao d辌h/yes",
					"Kh玭g giao d辌h/no")
			end
		else
			Say("C竎 lo筰 thu鑓 tr�  thng, tr藅 thng, tr祅g thng, v誸 c総, b醤g y  h琻 ch� kh竎, ngi mu鑞 mua thu鑓 g�?",
				3,
				"Giao d辌h/yes",
				"Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine",
				"Kh玭g giao d辌h/no")
		end
	else
		Say("C竎 lo筰 thu鑓 tr�  thng, tr藅 thng, tr祅g thng, v誸 c総, b醤g y  h琻 ch� kh竎, ngi mu鑞 mua thu鑓 g�?",
			3,
			"Giao d辌h/yes",
			"Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine",
			"Kh玭g giao d辌h/no")
	end
end

function yes()
	Sale(12)  			--弹出交易框
end

function no()
end
