-------------------------------------------------------------------------
-- FileName		:	enemy_turegirl.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:16:14
-- Desc			:   千宝库关卡的被掳少女脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --调用组队判断
Include("\\script\\task\\tollgate\\killbosshead.lua") --调用定义头像的头文件
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function main()
	if ( GetSex() == 0 ) then
		Describe(DescLink_BeiKunShaoNv..": 英雄终于出现了，我被守护者绑架，请救我!",2,"当然可以，跟我来!/offcouseido","不行。我还有其他事要做!/no")
	else
		Describe(DescLink_BeiKunShaoNv..": 英雄终于出现了，我被守护者绑架，请救我!",2,"当然可以，跟我来!/offcouseido","不行。我还有其他事要做!/no")
	end
end

function offcouseido()
	local Uworld1214 = nt_getTask(1214)
	local Npcindex = GetLastDiagNpc()
	nt_setTask(1214,Uworld1214+1)   --设置被救少女数量
	Msg2Player("你已救出被守护者绑架的少女，如果安全护送她离开关卡，你将获得相应的奖励.")
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 6);
	tongaward_message(30);	--by 小山（帮会周目标贡献度，每个少女3000点）
	DelNpc(Npcindex)
end

function no()
end