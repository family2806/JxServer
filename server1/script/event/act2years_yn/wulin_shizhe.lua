--2007年-越南情义江湖资料片
--——剑网2周年生日活动版
--从2007年06月11日至2007年07月01日
--by fmz
--武林使者,越南2007国庆活动
--modify by 小浪多多

--ACT2YEARS_YN_CELLPAPER_ID = 1436        --玻璃纸的ID
--ACT2YEARS_YN_BOWKNOT_ID = 1437          --蝴蝶结的ID
--ACT2YEARS_YN_ROSE_ID =  1438            --玫瑰花的ID
--ACT2YEARS_YN_WHITEBOX_ID =  1439        --白色礼盒
--ACT2YEARS_YN_BLUEBOX_ID =   1441        --蓝色礼盒
--ACT2YEARS_YN_YELLOWBOX_ID = 1440        --黄色礼盒
--ACT2YEARS_YN_NORMALCAKE_ID =1442        --月饼
--ACT2YEARS_YN_MIDCAKE_ID = 1443          --中型月饼
--ACT2YEARS_YN_SPECIALCAKE_ID = 1444      --特殊月饼
ACT2YEARS_YN_BEGINTIME = 070825     --活动开始日期
ACT2YEARS_YN_ENDTIME = 070909       --活动结束日期
--
--2007越南国庆活动
GUOQING_YN_TASK_DATE = 1831					--记录领取时期,1.时间(年%y),2.时间(月)，3.时间(日),4.领取次数
GUOQING_YN_TASK_COUNT = 0 				--记录领取次数
GUOQING_YN_WUJIAOXING_ID = 1494			--胜利五角星
GUOQING_YN_LiHe_ID = 1495						--国庆礼盒ID
--
function Act2Years2007_CheckInTime()
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > ACT2YEARS_YN_ENDTIME or nDate < ACT2YEARS_YN_BEGINTIME then
        return 0
    else
        return 1
    end
end
--
function main()
    --if Act2Years2007_CheckInTime() == 1 then
        --Say("热烈祝贺武林传奇两周年的生日。<enter>从2007年06月11日至2007年07月11日期间将会在江湖上出现最美丽和芬芳的玫瑰花，如果你能收集到一些，我将有厚礼相赠。",
        --5,"兑换白色礼品盒/WLSZ_ExcWhiteBox","兑换蓝色礼品盒/WLSZ_ExcBlueBox","兑换黄色礼品盒/WLSZ_ExcYellowBox",
        --"详细说明/WLSZ_ExcDetail","结束对话/WLSZ_End")
    if Act2Years2007_CheckInTime() == 1 then
    		Describe("武林使者: 热烈庆祝国庆节. 在接下来的时间里 <color=red>25-08-2007<color> 到 <color=red>09-09-2007<color>, 玩家可以携带10颗 <color=yellow>胜利五角星<color> 和 <color=yellow>15万两<color> 来交换<color=yellow>国庆礼盒<color>.<color=yellow>国庆礼盒中<color> 有国庆徽章和版图. 如果搜集够12张不同的版图将有机会 <color=yellow>打开第3个箱子<color>.",3,
    				"我想兑换国庆礼盒/GuoQing_Give",
    				"兑换国庆礼盒的方法/guoQing_About",
    				"明白了/no"
    			)
    else		
        Say("我正是武林使者.",0)
    end
end
--
function WLSZ_End()    
end
--
function WLSZ_ExcWhiteBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    if nRoseNumber < 10 then
        return Say("需要10朵红玫瑰",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_WHITEBOX_ID,1,0,0 )
    Msg2Player("用10朵红玫瑰换白色礼盒")
    Say("你得到1个 <color=red>白色礼盒<color>, 里面有一些意想不到的礼物.",2,"返回/main","结束对话/WLSZ_End")
end
--
function WLSZ_ExcBlueBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nBOWKNOTNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_BOWKNOT_ID, -1 )
    if nRoseNumber < 10 or nBOWKNOTNumber < 1 then
        return Say("需要10朵红玫瑰和1个红蝴蝶结.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_BOWKNOT_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_BLUEBOX_ID,1,0,0 )
    Msg2Player("用10朵红玫瑰和1个红蝴蝶结换蓝色礼盒.")
    Say("您得到1个<color=red>蓝色礼盒<color>, 里面有一些意想不到的礼物.",2,"返回/main","结束对话/WLSZ_End")
end
--
function WLSZ_ExcYellowBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nCellPaperNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_CELLPAPER_ID, -1 )
    if nRoseNumber < 10 or nCellPaperNumber < 1 then
        return Say("需要10朵红玫瑰和1张玻璃纸.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_CELLPAPER_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_YELLOWBOX_ID,1,0,0 )
    Msg2Player("用10朵红玫瑰和1张玻璃纸换黄色礼盒.")
    Say("您得到1个 <color=red>黄色礼盒<color>, 里面有一些意想不到的礼物.",2,"返回/main","结束对话/WLSZ_End")
end
--
function WLSZ_ExcDetail()
    Say("礼盒兑换规则:  <enter>白色礼盒: 10朵红玫瑰和1个红蝴蝶结 <enter> 黄色礼盒: 10 朵红玫瑰和1张玻璃纸.",2,"返回/main","结束对话/WLSZ_End")
end

--2007越南国庆活动..
function guoQing_About()
	Describe("武林使者: 在接下来的时间里 <color=red>25-08-2007<color> 到 <color=red>09-09-2007<color>, 玩家可以带10颗 <color=yellow>胜利五角星<color> 和 <color=yellow>15万两<color> 用于交换拿1个 <color=yellow>国庆礼包<color>. <color=yellow>胜利五角星<color> 将散落在50级以上的区域. <color=yellow>国庆礼盒里<color> 有国庆徽章和版图.如果集齐编号1到12的版图将有机会<color=yellow>打开第3个箱子<color>.",1,"结束对话/WLSZ_End")
end

function GuoQing_Give()
	local nGuoqingLiHe = CalcEquiproomItemCount( 6,1,GUOQING_YN_WUJIAOXING_ID, -1 )

	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(GUOQING_YN_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetByte(nLibao,4);
	

	if ( nOlddate == nDate and nCount >= 50) then
			Say("武林使者: 真遗憾, 每个人物每天最多只能兑换50个 <color=yellow>国庆礼包<color>, 明天再来吧.",0)
			return 1;
	end
	
	if nGuoqingLiHe < 10 then
		Say("武林使者: 真遗憾, 不够10颗胜利五角星, 不能兑换国庆礼包.",0)
		return 
	end
	
	if GetCash() < 150000 then
		Say("武林使者: 真遗憾, 没带够15万两, 不能兑换国庆礼包.",0)
		return
	end
	if ( CalcFreeItemCellCount() < 2 ) then
		Say("空位不够, 请整理背包.",0);
		return
	end
	if ( nOlddate ~= nDate ) then
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,0));
	end
	Pay(150000)
	nCount = GetByte(GetTask(GUOQING_YN_TASK_DATE),4);
	SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,nCount+1))
	ConsumeEquiproomItem( 10,6,1,GUOQING_YN_WUJIAOXING_ID,-1 )
 	local nidx = AddItem(6,1,GUOQING_YN_LiHe_ID,1,0,0 )
	Msg2Player("祝贺您获得1个<color=yellow>国庆礼盒<color>.")
	WriteLog(format("[WuLinShiZhe]Date:%s\t Account:%s\t Name:%s\t Effect:GetItem %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)))
end
