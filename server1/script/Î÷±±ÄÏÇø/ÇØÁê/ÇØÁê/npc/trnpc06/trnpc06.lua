--description: 秦陵农夫　天忍30级任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if ((UTask_tr == 30*256+20) and (HaveItem(62) == 0)) then			-- 任务状态对话
		Talk(3, "select", "我昨天在田里挖地的时候，挖到了一块石头，闪闪发光的怪好看，可是既不能吃又不能穿，有什么用？上个月同村的王七挖到了一袋银子，人家挖到的是银子，我却只挖到一块石头，真倒霉!", " (这不是云梦紫吗?!) 大叔，我想买你这块石头，可以吗?", "没听错吧，你真的要买？（我真走运，遇到一个大傻冒），好好好，只要你拿一百两银子来，这个块石头就是你的了")
	elseif (UTask_tr >=30*256+20) then								--执行完30级任务
		Talk(1,"","你还要买什么吗？下次我挖到就便宜卖给你!")
	else						-- 缺省对话
		Talk(1,"","种了一辈子的地，不知道什么时候才挖得到珍宝发大财啊!")
	end
end;

function select()
	if (GetCash() >= 100) then
		Pay(100)
		AddEventItem(62)
		Msg2Player("得到云梦紫宝石")
		AddNote("在秦陵外的田里找到农夫，买到云梦紫宝石")
	else
		Talk(1,"","等钱够了再来找我。")
	end
end;
