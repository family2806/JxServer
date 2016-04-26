-- 临安的裁缝，可以买婚礼吉服
-- By: Dan_Deng(2003-12-29)
-- GetTask(67): 第24字位为婚否标记，第1字位为是否已买吉服

function main(sel)
	Uworld67 = GetTask(67)
	if (GetBit(Uworld67,24) == 1) then			-- 已婚
		if (GetBit(Uworld67,1) == 0) then		-- 尚未买过，可以买婚礼服
			if (GetSex() == 0) then					-- 男对话，买男装
				Talk(1,"buy_sale","老板!我听说你做婚礼吉服名满天下，现在卖吗? ")
			else
				Talk(1,"buy_sale","老板! 你的婚礼吉服太好看了，现在还有货吗? ")
			end
		else
			Talk(1,"","之前在本店做的衣服还不错吧?记得和亲戚朋友宣传啊!")
		end
	else
		Talk(1,"","裁缝：不是我夸口，我家的各种吉庆礼服是世上最好的，有什么需要时一定记住光顾啊！")
	end
end

function buy_sale()
	Say("我这里专门缝制结婚礼服，当然深么款式都有，只是现在价钱要贵一点，要88888两. ",2,"我当然是想要买一套. /buy_yes","不必了, 我还不结婚 /no")
end

function buy_yes()
	if (GetCash() >= 88888) then
		Pay(88888)
		if (GetSex() == 0) then
			AddItem(0,2,28,1,random(0,4),0,0)
		else
			AddItem(0,2,28,4,random(0,4),0,0)
		end
		Uworld67 = GetTask(67)
		Uworld67 = SetBit(Uworld67,1,1)
		SetTask(67,Uworld67)
		Talk(1,"","不成问题, 立刻为客官打包, 祝客官百年好合!")
	else
		Talk(1,"","没有钱就不要在这要求这么多。想什么，赚够了钱再来吧!")
	end
end

function no()
end
