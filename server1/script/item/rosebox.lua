IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
	p = random(0,99)
	if (p < 50) then
		AddItem(0,2,28,2,0,0,0)		-- 惊天甲
		Msg2Player("恭喜你得到新江湖情侣套装之惊天甲，祝你天天开心!")
		return 0
	else
		AddItem(0,2,28,5,0,0,0)		-- 泣地裙
		Msg2Player("恭喜你得到新江湖情侣套装之泣地裙，祝你天天开心!")
		return 0
	end
	
end