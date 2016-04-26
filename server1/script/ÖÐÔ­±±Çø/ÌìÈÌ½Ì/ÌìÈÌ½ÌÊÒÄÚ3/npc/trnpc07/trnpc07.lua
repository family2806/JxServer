--description: 天忍教右护法耶律辟离　天忍40级任务
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-24), 加入重返门派任务
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 40*256) and (GetLevel() >= 40) then		-- 40级任务启动
			Say("根据信报，朝廷重臣太尉<color=Red>廖歧 color> 原来竟是用过的奸细，虽然他已经告老还乡，但决不能让它或者离开金国，据可靠消息，廖歧及其随从准备取道<color=Red>剑阁<color> 回四川，我派你即刻动身前去拦截他，一定要让剑阁蜀道成为他的葬身之地!", 2, "属下遵命/L40_get_yes", "属下恐怕不能担此重任/L40_get_no")
		elseif (UTask_tr == 40*256+20) and (HaveItem(159) == 1) then
			Talk(1,"L40_prise", "这是我在廖歧身上找到的密信")
		elseif (UTask_tr >= 10*256) and (UTask_tr < 40*256) then					--尚未接40级任务
			Talk(1,"","练兵千日，用兵一时，只需要全心全意服务本教，本教不会亏待你!")
		elseif (UTask_tr > 40*256) and (UTask_tr < 50*256) then					--已经接到40级任务，尚未完成
			Talk(1,"","信报<color=Red>廖歧 color>已到<color=Red>剑阁蜀道的锁云洞<color> 剑阁一带地形复杂，你可以花点钱让 <color=Red>乌坛主color> 带你去，速去速回!")
		else							--已经完成40级任务，尚未出师
			Talk(1,"","反叛本教的人，我绝对让他生不如死!")
		end
	elseif (UTask_tr >= 70) then							--已经出师
		Talk(1,"","想好了吗？想留在这里，或者南下中原？")
	else
		Talk(1,"","你是谁？难道你是中原间谍?")
	end
end;

function L40_get_yes()
	Talk(1,"","信报<color=Red>廖歧 color>已到<color=Red>剑阁蜀道的锁云洞<color> 剑阁一带地形复杂，你可以花点钱让 <color=Red>乌坛主<color> 带你去，速去速回!")
	SetTask(4, 40*256+20)
	AddNote("在天忍教第三层见右护法耶律辟离，接任务行刺，到锁云洞刺杀廖歧 ")
	Msg2Player("在天忍教第三层见右护法耶律辟离，接任务行刺，到锁云洞刺杀廖歧")
end;

function L40_get_no()
	Talk(1,"","这个小事也做不好，本教养你来做什么?")
end;

function L40_prise()
	Talk(1, "", "做得好，这次立大功了，我一定会向教主说你的好话")
	SetRank(59)
	DelItem(159)
	SetTask(4, 50*256)
--	AddMagic(364)
--	AddMagic(146)				-- 五行阵
	add_tr(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你被封为：掌奇侍，学到悲苏清风. ")
	AddNote("回去天忍教，把密信交给右护法耶律辟离，完成行刺任务，升级为掌奇侍")
end;
