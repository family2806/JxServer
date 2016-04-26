-- 江南区 罗宵山 路人_云部鹰主.lua （消灭采花贼任务）
-- By: Dan_Deng(2004-05-28)

function main(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 50) then
		Talk(5,"U43_50","你已经有钥匙了，还要问我什么?","助纣为虐，会被天下人唾骂!","胡说! 什么是正什么是邪？我就喜欢做恶，你能拿我怎么样?","那我就得罪了!","哼!你还没有资格和我斗！让我的山鹰弟子和你玩一会")
	elseif (Uworld43 == 70) then						-- 打完山鹰，来拿钥匙
		Talk(2,"U43_70","快把钥匙交出来!","好小子！主人一定会为雷云二部报仇的")
	elseif (Uworld43 >= 80) and (Uworld43 < 100) and (HaveItem(382) == 0) then				-- 或之后的任一步骤中钥匙丢失
		AddEventItem(382)
		Msg2Player("继续得到云匙. ")
		Talk(1,"","看看你小子可以做什么。钥匙在这，要是你能接我3招就给你")
	elseif (Uworld43 >= 80) and (Uworld43 < 255) and (HaveItem(382) == 1) then
		Talk(1,"","你已经有钥匙了，还要问我什么?")
	elseif (Uworld43 == 60) then		-- 对话完成，打狂狼未完成
		Talk(1,"","哼！你还没有资格和我斗！先让我的山鹰弟子和你玩一下")
	elseif (Uworld43 >= 255) then
		Talk(1,"","你真把少主杀了?")
	else
		Talk(1,"","别乱说！从没看过现在的样子吗?")
	end
end;

function U43_50()
	SetTask(43,60)
	Msg2Player("你真把少主杀了? ")
end

function U43_70()
	SetTask(43,80)
	AddEventItem(382)
	Msg2Player("得到云匙，回到临安交给公差大哥，商量接下来的事情")
end
