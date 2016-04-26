--两湖区 巴陵县 路人10沈九对话
--巴陵县新手任务：阿芳的嫁妆
--suyu
-- Update: Dan_Deng(2003-08-10)
--注意：越南只有一种元宝，相当于我们的银元宝，名称叫金元宝，千万注意，编号用 343

function main()
	UTask_world20 = GetTask(48)
	if (CheckStoreBoxState(1) == 0 and  UTask_world20 == 1) then			-- 符合买箱子的条件，允许购买附加储物箱
		Say("沈九：最近就从大食国进了一批神奇的宝箱，不但能让你在游历江湖时存放更多物品，还可为你提供物品锁定保护。全中原只此一家，绝无分号。不要不要看看？",4,"看看/buy_addibox", "向你打听一下/task_ring","关于扩展箱/box_help", "没兴趣/no")
	elseif (UTask_world20 == 1) then
		task_ring()
	elseif (CheckStoreBoxState(1) == 0) then
		Say("沈九：最近就从大食国进了一批神奇的宝箱，不但能让你在游历江湖时存放更多物品，还可为你提供物品锁定保护。全中原只此一家，绝无分号。不要不要看看？",3,"看看/buy_addibox", "关于扩展箱/box_help", "没兴趣/no")
	else
		other_chat()
	end
end;

function task_ring()
	UTask_world20 = GetTask(48);
	if (UTask_world20 == 1) then
		Say("沈九：你要给姑娘家买嫁妆呀，我这儿的货剩的不多了，这对纯金的耳环就便宜点给您喽，只要纹银二百两",2,"买/yes", "闲聊/other_chat","Kh玭g mua/no")
	end
end

function other_chat()
	Talk(3,"", "沈九：我是从四川来的，这一路上盗匪很多，很不太平。","可没想到自从进了洞庭湖区，就再没遇上什么强盗贼人，你说奇怪不奇怪？","一打听，才知道原来这里真正管事的不是官府，而是一个叫什么“天王帮”的组织，难怪能这么太平呢！")
end

function yes()
	if(GetCash() >= 200)then
		Talk(1,"","沈九：耳环已经给你包好了，货款两讫，你拿好了。")
		Pay(200);
		AddEventItem(181);
		Msg2Player("你得到一对耳环");
		AddNote("你得到一对耳环")
--		SetTask(48, 2);
	else
		Talk(1,"","沈九：您身上的钱不够了，凑足了钱再来吧。")
	end
end;

function buy_addibox()
		local szMsg = 
		{
				"沈九：最近新从大食国进了一批神奇的宝箱，不但能让你在游历江湖时存放更多的物品，还可为你提供物品锁定保护。全中原只此一家，绝无分号。要不要看看？",	--1
				"40铜钱购买扩展箱/#buy_addibox_yes(40)",	--2
				"20铜钱购买扩展箱/#buy_addibox_yes(20)",	--3
				"我没兴趣/no",			--4
		};
		
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		
		if (nDate >= 20080202 and nDate <= 20080302) then	--春节活动期间内
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		else
			--tinhpn 20100803: Patch Request
			--Say(szMsg[1], 2, szMsg[2], szMsg[4]);
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		end;
				
end

function buy_addibox_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","您身上的钱不够了，凑足了钱再来吧。")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: 花费 %d 铜钱, 得到1个扩展箱.",nNedCount),-2,0,0,0);
	OpenStoreBox(1)
	
	UseSilver(1, 2, nNedCount); -- 金元宝兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
	SaveNow(); -- 立即存盘
	  	
	Talk(1,"","购买扩展箱成功，同时获得<color=yellow>装备绑定<color>功能！")
	Msg2Player("请到储物箱设置扩展箱的初始密码。")
end


function box_help()
	str=
	{
	"<#>沈九：一个角色只能购买一个扩展箱。扩展箱可以以提供你终身使用，大小为60格，能和原有的储物箱相同，只是不能存放金钱。",
	"<#>购买扩展向后，你还可以得到一个密码锁，用于原有储物箱、扩展箱和身上装备的锁定保护。",
	"<#>锁定在设定密码后才会起作用。当处于锁定状态时，身上装备不能穿上或卸下，但不会影响原有功能（如PK值过高时仍会掉身上的装备）。",
	"<#>关于设定密码：点击储物箱界面的<color=yellow>设定密码<color>一向，弹出小键盘，上面有0-9应该10个数字。",
	"<#>首次设置密码，点击该项则为设定其初始密码；若已经设置过密码，点击该项则为修改密码。",
	"<#>修改密码前，需要先输入旧密码，再输入两次新设密码，才能确定修改密码成功。密码长度至少为1位数字，最长为9位。",
	};
	Talk(6,"",str[1],str[2], str[3], str[4], str[5], str[6]);
end
	
	
function no()
end;
