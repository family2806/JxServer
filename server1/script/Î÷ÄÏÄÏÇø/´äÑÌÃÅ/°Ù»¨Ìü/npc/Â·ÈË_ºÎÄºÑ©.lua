-- 翠烟门 何暮雪 30级任务
-- by：Dan_Deng(2003-07-26)
-- update: Dan_Deng(2003-08-07)
-- update by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(5) == 1 then
		allbrother_0801_FindNpcTaskDialog(5)
		return 0;
	end
	UTask_cy = GetTask(6)
   Uworld121 = GetTask(121)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then
		if (UTask_cy == 30*256+40) and (HaveItem(2) == 1) and (HaveItem(3) == 1) and (HaveItem(4) == 1) then
			L30_prise()
		elseif ((UTask_cy == 30*256) and (GetLevel() >= 30)) then		--30级任务启动
			Talk(1,"L30_get","不久前我机缘巧合，得到了一种叫做“羽衣霓裳”的茶花的种子，这种茶花品种十分珍稀，培育起来也十分困难。如果没有掌握秘诀，是很难成功的，我现在正在犯愁呢! ")
		elseif (UTask_cy > 30*256) and (UTask_cy < 40*256) then
			Talk(1,"","怎么？我爷爷已经告诉你种'羽衣霓裳'的方法了?")
		elseif (UTask_cy >= 40*256) then
			Talk(1,"","羽衣霓裳花开很快，都是后一起看茶花")
		else
			Talk(1,"","爷爷他也喜欢看茶花吗?")
		end
	elseif(Uworld121 == 10) and (HaveItem(373) == 1) then		--判断任务是否启动以及背包中时候有周小泉剪刀
		Talk(8,"Uworld121_lose","何仙子！这里有一把张小泉剪刀","谢谢！","不客气！能看到仙子的容貌是我的荣幸.","(你还要继续说，看见暮雪拿起剪刀，像云秀一样剪了几次)","何姑娘！你做什么？","我和你又不认识，你这么远来给我送剪刀，是他对不对？","他是谁?","……能帮暮雪一个忙吗?")
	elseif(Uworld121 == 10 ) then										--如果接受了任务但没有任务道具剪刀
		Talk(1,"","这把剪刀是我辛苦求张小泉师伯做的，你看看能不能找到他的住处?.")
	elseif (Uworld121 == 20) and (HaveItem(10) == 0) then		-- 头发丢了
		AddEventItem(10)
		Msg2Player("又找到一撮头发")
		Talk(1,"","忘带头发了.")
	elseif (Uworld121 >= 20) and (Uworld121 < 30) then			--在与杨湖对话前
		Talk(1,"","请你传话给暮雪。多谢")
	elseif(Uworld121 == 30) then
		Talk(8,"Uworld121_Step4","何姑娘！不要再说了，我知道了.","何姑娘你误会了，昆仑企图霸王，杨湖是要等所有事情结束了再上翠烟见你.","他真的答应我的要求了吗?",".....这个事情他不会说的.","哈哈哈！何暮雪啊何暮雪，你怎么这么天真啊?","何姑娘.....","他出身是还没有我呢，有我是他已经老了!.....")
	elseif(Uworld121 == 40) and (HaveItem(376) == 0) then
		Talk(1,"","没有拿绣绢，丘英一定不会满意的.")
		AddEventItem(376)
		Msg2Player("夺来绣绢. ")
	else
		Talk(1,"","我最大的梦想就是种出天下最美的茶花")
	end
end;

function L30_get()
	Say("听说大理城有一个姓段的花农，是种茶花的能手，可是他性情古怪，很多人请教他都无功而返",2,"等我想想办法帮你/L30_get_yes","每个人都会遇到阻碍，恐怕我也没有其他办法. /L30_get_no")
end;

function L30_get_yes()
	Talk(1,"","真感谢你!")
	SetTask(6,30*256+10)
	AddNote("在大理见段老农请教种植羽衣霓裳的方法. ")
	Msg2Player("在大理见段老农请教种植羽衣霓裳的方法. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","原来还有这样的秘诀，真是谢谢你了。我升你为一品花使吧")
	SetTask(6,40*256)
	SetRank(34)
	DelItem(2)
	DelItem(3)
	DelItem(4)
--	AddMagic(105)
--	AddMagic(113)
	add_cy(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你！被封为一品花使！学会武功雨打梨花，浮云散雪. ")
	AddNote("夺得种羽衣霓裳的秘诀，完成任务，被封为：一品花使")
end;

function Uworld121_lose()
	Talk(5,"","姑娘直说.","还请你把这头发带给天王帮的右使杨湖，告诉他如果7月之前不来翠烟找我的话从今往后我和他就没有机会再见了.","果然是杨湖！杨右使文才武德只是一时的选择，是人中龙凤，何姑娘休息一下","我也不想帮你，呼....","好吧！我走.")
	DelItem(373)
	AddEventItem(10)
	Msg2Player("替何暮雪带话给杨湖，得到何暮雪的一匹丝绸. ")
	AddNote("帮何暮雪带话给杨湖")
	SetTask(121,20) --任务变量设置为20
end

function Uworld121_Step4()
	Talk(4,"Uworld121_sijin",".....?","虽然你不仁但是我也不能不义。这里有一块绣绢，你带他去找昆仑的丘英.我就帮他最后一次。","我去.....希望仙姑想清楚.","别多说了!")
end

function Uworld121_sijin()
	AddEventItem(376)
	Msg2Player("接受绣绢. ")
	AddNote("拿到何暮雪的绣绢，带着去找昆仑的丘英. ")
	SetTask(121,40) --任务变量设置为40
end
